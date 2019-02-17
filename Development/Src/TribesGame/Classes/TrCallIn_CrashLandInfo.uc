class TrCallIn_CrashLandInfo extends Info;

/** The game objective to deploy */
var class<TrGameObjective> m_ItemToDeploy;

/** The owner of the final point */
var Controller m_Owner;

/** Whether the platform has landed */
var bool r_bPodLanded;

/** The time at which we will land (not delta, absolute) */
var repnotify float r_fCrashLandTime;

/** The location at which we will crash land */
var vector r_CrashLandPoint;

/** The normal from the crash land point we will travel along */
var vector r_CrashLandNormal;

/** The damage type to use for applying AOE */
var class<TrDmgType_Base> DamageTypeClass;

/** The damage radius to use for applying AOE */
var float DamageRadius;

/** The damage to use for applying AOE */
var float Damage;

/** The momentum to apply to people affected by AOE */
var float MomentumTransfer;

replication
{
	if ((bNetInitial || bNetDirty) && Role == ROLE_Authority)
		r_fCrashLandTime, r_CrashLandPoint, r_CrashLandNormal, r_bPodLanded;
}

static function bool SpawnCrashLandInfo(Controller Initializer, float CrashLandTime, vector CrashLandPoint, vector CrashLandNormal, class<TrGameObjective> ItemInDeliveryPod)
{
	local TrCallIn_CrashLandInfo CrashInfo;

	CrashInfo = Initializer.Spawn(class'TrCallIn_CrashLandInfo');
	if (CrashInfo == none)
		return false;

	// Setup the crash info.
	CrashInfo.m_ItemToDeploy = ItemInDeliveryPod;
	CrashInfo.m_Owner = Initializer;
	CrashInfo.r_fCrashLandTime = CrashLandTime;
	CrashInfo.r_CrashLandPoint = CrashLandPoint;
	CrashInfo.r_CrashLandNormal = CrashLandNormal;
	CrashInfo.bNetDirty = true;

	return true;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	if (r_fCrashLandTime == 0.0f)
	{
		SetTimer(0.1, false, 'InitTimer');
	}
	else
	{
		InitTimer();
	}
}

simulated function InitTimer()
{
	local TrCallIn_DeliveryPod DeliveryPod;
	local vector SpawnLocation;

	// The pod has already landed, new client connecting.
	if (r_bPodLanded)
		return;

	// Has the crash time been replicated down yet?
	if (r_fCrashLandTime == 0.0f)
	{
		SetTimer(0.1, false, 'InitTimer');
		return;
	}

	// Destroy the crash info when necessary.
	if (Role == ROLE_Authority)
	{
		SetTimer(r_fCrashLandTime, false, 'DeliveryPodLanded');

		if (WorldInfo.NetMode == NM_DedicatedServer)
		{
			return;
		}
	}

	// Calculate values.
	SpawnLocation = r_CrashLandPoint + class'TrCallIn_DeliveryPod'.default.Speed * r_fCrashLandTime * vect(0,0,1);
	r_CrashLandNormal = Normal(r_CrashLandPoint - SpawnLocation);

	// Spawn in the delivery pod.
	DeliveryPod = Spawn(class'TrCallIn_DeliveryPod', , , SpawnLocation, Rotator(r_CrashLandNormal));
	if (DeliveryPod != none)
	{
		DeliveryPod.Init(self);
	}
}

function DeliveryPodLanded()
{
	local TrCallIn_SupportItemPlatform ItemPlatform;

	r_bPodLanded = true;
	bNetDirty = true;

	PerformLandingDamage();

	ItemPlatform = Spawn(class'TrCallIn_SupportItemPlatform', m_Owner, , r_CrashLandPoint, Rotator(r_CrashLandNormal), , true);
	if (ItemPlatform == none)
		return;

	ItemPlatform.Init(m_Owner, m_ItemToDeploy);
}

function MoveSameTeamPawn(TrPawn PawnToMove)
{
	local float MoveDist;
	local vector HitLoc, HitNorm;
	local vector MoveDir;

	// Don't move the owner, he'll just have to die.
	if (PawnToMove == none || PawnToMove.Controller == m_Owner)
	{
		return;
	}

	// Calculate which direction to move the pawn and the distance.
	MoveDist = 118.0f;
	MoveDir = vector(PawnToMove.Rotation);
	MoveDir.Z = 0;
	MoveDir = Normal(MoveDir);

	// Can we move them in the direction they are looking?
	if (PawnToMove.Trace(HitLoc, HitNorm, MoveDir * MoveDist, PawnToMove.Location, , PawnToMove.GetCollisionExtent(), , TRACEFLAG_Blocking) == none)
	{
		// Apparently not, so just move them up.
		MoveDist = 32.0f;
		MoveDir = vect(0,0,1);
	}

	PawnToMove.Move(MoveDir * MoveDist);
}

function PerformLandingDamage()
{
	local Actor	Victim;
	local TraceHitInfo HitInfo;
	local StaticMeshComponent HitComponent;
	local KActorFromStatic NewKActor;
	local vector HurtOrigin, AltHurtOrigin;

	// Calculate the hurt points.
	HurtOrigin = r_CrashLandPoint;
	AltHurtOrigin = r_CrashLandPoint + vect(0,0,50);

	// Loop through actors in the damage area.
	foreach VisibleCollidingExtentActors(class'Actor', Victim, DamageRadius, HurtOrigin, AltHurtOrigin,,,,, HitInfo)
	{
		if (Victim.bWorldGeometry)
		{
			// check if it can become dynamic
			// @TODO note that if using StaticMeshCollectionActor (e.g. on Consoles), only one component is returned.  Would need to do additional octree radius check to find more components, if desired
			HitComponent = StaticMeshComponent(HitInfo.HitComponent);
			if (HitComponent != none && HitComponent.CanBecomeDynamic())
			{
				NewKActor = class'KActorFromStatic'.Static.MakeDynamic(HitComponent);
				if (NewKActor != None)
				{
					Victim = NewKActor;
				}
			}
		}

		// Friendlies won't be able to take damage, so move them out of the way.
		if (!WorldInfo.GRI.r_bFriendlyFire && Victim.IsA('TrPawn') && Victim.GetTeamNum() == m_Owner.GetTeamNum())
		{
			MoveSameTeamPawn(TrPawn(Victim));
		}

		if (!Victim.bWorldGeometry && (Victim != self) && (Victim.bCanBeDamaged || Victim.bProjTarget))
		{
			Victim.TakeRadiusDamage(m_Owner, Damage, DamageRadius, DamageTypeClass, MomentumTransfer, HurtOrigin, false, none);
		}
	}
}

defaultproperties
{
   DamageTypeClass=Class'TribesGame.TrDmgType_DeliveryPod'
   DamageRadius=100.000000
   Damage=16000.000000
   MomentumTransfer=85000.000000
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bAlwaysRelevant=True
   Name="Default__TrCallIn_CrashLandInfo"
   ObjectArchetype=Info'Engine.Default__Info'
}
