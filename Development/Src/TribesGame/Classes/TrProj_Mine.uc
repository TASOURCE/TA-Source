/**
 * Mine projectiles.
 */
class TrProj_Mine extends TrProjectile
	native;

/** The sound played when the wall is impacted. */
var(Projectile) SoundCue WallImpactSound;

/** Is the mine armed? */
var bool	m_bArmed;

/** Time to deploy the mine once it has hit the ground in its final resting point. */
var float	m_fDeploySeconds;

/** Defines the cylinder for the detonation proxy. */
var float	m_fDetonationRadius;
var float	m_fDetonationHeight;

/** Detonation proxy. */
var bool m_bUsesDetonationProxy;
var TrMineCollisionProxy m_CollisionProxy;

/** Anything in this array are pawns that are targets but do not have line of sight. */
var array<Pawn> m_PotentialTargets;

/** Max floor Z this mine can deploy onto (otherwise it bounces off). */
var float m_fMaxFloorZ;

/** Number of bounces. */
var transient int m_nNumBounces;

/** If the mine bounces more than this many times, just destroy it. */
var int m_nNumBouncesBeforeDetonateObsolete;

/** Screen name. */
var localized string m_sScreenName;
var bool m_bDrawOwnerName;

/** Last time trace test check for drawing postrender beacon was performed */
var float LastPostRenderTraceTime;

/** true is last trace test check for drawing postrender beacon succeeded */
var bool bPostRenderTraceSucceeded;

/** Show the objective name tag until this time. */
var float m_fShowHeaderUntil;

/** Height adjustment of where to show marker.*/
var int m_nMarkerOffset;

/** PRI of the owner. */
var repnotify PlayerReplicationInfo r_OwnerPRI;

/** MIC used for the HUD marker */
var transient MaterialInstanceConstant m_MarkerMIC;

/** Icon ID for the HUD */
var int m_nIconStackId;

/** Are we post rendered */
var bool m_bIsPostRendered;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if(bNetDirty && Role == ROLE_Authority)
		r_OwnerPRI;
}

simulated event ReplicatedEvent( name VarName )
{
	super.ReplicatedEvent(VarName);

	if (VarName == 'r_OwnerPRI')
	{
		OnPRIReplicated();
	}
}

simulated function OnPRIReplicated()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(GetALocalPlayerController());
	if (TrPC != none)
	{
		TrHUD(TrPC.myHUD).MineReplicated(self);
	}
}

simulated function bool IsAliveAndWell()
{
	return !bShuttingDown;
}

/**
 * Set the initial velocity and cook time
 */
simulated function PostBeginPlay()
{
	local PlayerController PC;

	Super.PostBeginPlay();

	if (Role==ROLE_Authority)
	{
		// don't explode when our instigator dies
		SetOwner(None);
		if( Instigator != none )
		{
			r_OwnerPRI = InstigatorController.PlayerReplicationInfo;
		}
	}

	if (Role == ROLE_Authority && WorldInfo.NetMode != NM_DedicatedServer)
	{
		OnPRIReplicated();
	}

	// Add to local HUD's post-rendered list
	ForEach LocalPlayerControllers(class'PlayerController', PC)
	{
		if ( m_bIsPostRendered && PC.MyHUD != None )
		{
			PC.MyHUD.AddPostRenderedActor(self);
		}
	}
}

/** Called when the mine wishes to become armed. */
simulated function ArmedTimer()
{
	local Vector SpawnLocation;

	bBlockedByInstigator = true;
	m_bArmed = true;

	if (m_bUsesDetonationProxy)
	{
		// Spawn collision proxy
		SpawnLocation = Location;
		SpawnLocation.Z += m_fDetonationHeight;
		m_CollisionProxy = Spawn(class'TrMineCollisionProxy', self,,SpawnLocation,,,true);
		m_CollisionProxy.SetBase(self);
		m_CollisionProxy.m_BoxComponent.SetBoxSize(m_fDetonationHeight, m_fDetonationRadius, m_fDetonationRadius);
		m_CollisionProxy.ForceProximityScan(m_fDetonationRadius);
	}
}

/**
 * Stick
 */
simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	local Vector Translation;

	// check to make sure we didn't hit a pawn
	if ( Pawn(Wall) == none )
	{
		if( HitNormal.Z >= m_fMaxFloorZ )
		{
			// We hit a valid surface. Begin the deploy process.
			Velocity *= 0;
			ImpactedActor = Wall;
			SetPhysics(PHYS_None);

			// For some reason our collision cylinder is getting reset to 0, so set it back to the default.
			SetCollisionSize(CylinderComponent.default.CollisionRadius,CylinderComponent.default.CollisionHeight);
			Translation.Z = CylinderComponent.default.CollisionHeight;
			CylinderComponent.SetTranslation(Translation);

			OrientToSlope(HitNormal);

			if ( WorldInfo.NetMode != NM_DedicatedServer )
			{
				PlaySound(ImpactSound, true);
			}

			SetTimer(m_fDeploySeconds,false,'ArmedTimer');
		}
		else
		{
			if ( WorldInfo.NetMode != NM_DedicatedServer )
			{
				PlaySound(WallImpactSound, true);
			}

			// We can't deploy on this wall, bounce off.
			Bounce(Wall, HitNormal);
		}
	}
}

/*
* explode when shot
*/
simulated function TakeRadiusDamage
(
	Controller			EventInstigator,
	float				BaseDamage,
	float				InDamageRadius,
	class<DamageType>	DamageType,
	float				Momentum,
	vector				HurtOrigin,
	bool				bFullDamage,
	Actor               DamageCauser,
	optional float      DamageFalloffExponent=1.f
)
{
	local TrProjectile Projectile;

	Projectile = TrProjectile(DamageCauser);
	if (Projectile != none)
	{
		// Projectile hit a force field? Only damage pawns on the side that the projectile exploded on.
		if( Projectile.ImpactedActor != none && Projectile.ImpactedActor.IsA('TrDeployable_ForceField') )
		{
			if( Normal(Projectile.Velocity) dot Normal(Projectile.Location - Location) < 0.0 )
			{
				return;
			}
		}
		// Projectile can't be blocked by a blocker.
		else if( Projectile.IsBlockedByBlocker(DamageCauser, self,, false, Projectile.m_bIsBullet ? HurtOrigin : vect(0,0,0)) )
		{
			return;
		}
	}

	super.TakeRadiusDamage(EventInstigator, BaseDamage, InDamageRadius, DamageType, Momentum, HurtOrigin, bFullDamage, DamageCauser, DamageFalloffExponent);
}

event TakeDamage(int damageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	// Mines can only be exploded by enemy fire (unless friendly fire is on) or other mines around them.
	if ((WorldInfo.GRI.r_bFriendlyFire || EventInstigator.GetTeamNum() != GetTeamNum() || DamageCauser.IsA('TrProj_Mine')) && damageAmount > 0)
	{
		DetonateObsolete(!DamageCauser.IsA('TrProj_Mine'));
	}
}

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
    Super.InitProjectile(Direction, ClassToInherit);

	Velocity = (Speed * Direction) + (Instigator.Velocity * m_fProjInheritVelocityPct);

	TossZ = TossZ + (FRand() * TossZ / 2.0) - (TossZ / 4.0);
	Velocity.Z += TossZ;
	Acceleration = AccelRate * Normal(Velocity);

	// Do not inherit the rotation of our velocity like many other projectiles.
	SetRotation(rot(0,0,0));
}

/** A pawn has entered the detonation area. */
function PawnEnteredDetonationArea(Pawn Other)
{
	// Not a pawn we really care about.
	if (Other==None || (!Other.IsA('TrPawn') && !Other.IsA('TrVehicle')))
	{
		return;
	}

	// We only care if we are armed, are not on the same team, and are on a valid team.
	if( m_bArmed && Other.GetTeamNum() != GetTeamNum() && Other.GetTeamNum() != 255 )
	{
		if( !IsBlockedByBlocker(self, Other) && MeetsDetonationRequirements(Other) )
		{
			ImpactedActor = Other;
			Explode(Location, vect(0,0,1));	
		}
		else
		{
			// Add the target to our 'watch list'. Explode if he no longer is blocked.
			m_PotentialTargets.AddItem(Other);
		}
	}
}

event bool MeetsDetonationRequirements(Pawn Other)
{
	return true;
}

/** A pawn has left the detonation area. */
function PawnLeftDetonationArea(Pawn Other)
{
	m_PotentialTargets.RemoveItem(Other);
}

// Made this an event so native can call it.
simulated event NativeExplode(vector HitLocation, vector HitNormal)
{
	Explode(HitLocation, HitNormal);
}

// Don't use ProcessTouch for detonation. Projectiles typically use this to termine if they should explode.
// We use the proxy instead. We still need to process touching though when being thrown so that we can bounce
// off things that HitWall does not normally catch.
simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if( !m_bArmed )
	{
		Bounce(Other, HitNormal);
	}
}

simulated function Bounce(Actor Other, Vector WallNormal)
{
	super.Bounce(Other, WallNormal);

	// Prevent bouncing forever by detonating if we've crossed a bounce threshold.
	m_nNumBounces++;
	if( m_nNumBounces > m_nNumBouncesBeforeDetonateObsolete )
	{
		DetonateObsolete();
	}
}

simulated function Shutdown()
{
	if( m_CollisionProxy != none )
	{
		m_CollisionProxy.Destroy();
	}
	super.Shutdown();
}

simulated function Texture2D GetMarker()
{
	return class'TrHud'.default.DeployableMine;
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local bool bIsFriendly, bDetectTraps;
	local float maxOffset, projectedHeight;
	local Texture2D marker;
	local TrDevice TrDev;
	local TrHUD HUD;
	local vector screenLoc, screenLocBot, vMarkerOffset, NameLoc;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local string PlayerNameString;
	local byte TeamNumber;

	// We aren't post rendered.
	if (!m_bIsPostRendered)
	{
		return;
	}

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	// If hud is disabled while spectating, don't draw anything.
	if( PC.IsSpectating() )
	{
		if( !TrPlayerController(PC).m_bShowSpectatorHUD )
		{
			return;
		}
	}

	// Do not draw if we aren't facing the objective.
	if ((CameraDir dot (Location - CameraPosition)) <= 0.f)
		return;

	// Calculate positions.
	vMarkerOffset = m_nMarkerOffset * vect(0,0,1);
	screenLoc = Canvas.Project(Location + vMarkerOffset);
	screenLocBot = Canvas.Project(Location);
	projectedHeight = abs(screenLoc.Y - screenLocBot.Y);

	// If we are clipped out, don't draw.
	if (screenLoc.X < 0 || screenLoc.X >= Canvas.ClipX || screenLoc.Y < 0 || screenLoc.Y >= Canvas.ClipY)
		return;

	if (m_markerMIC == none)
	{
		m_MarkerMIC = new(self) class'MaterialInstanceConstant';
		m_MarkerMIC.SetParent(class'TrHUD'.default.MarkerBaseMIC);
	}

	TeamNumber = r_OwnerPRI == none ? GetTeamNum() : r_OwnerPRI.GetTeamNum();

	bIsFriendly = PC.IsSpectating() ? TeamNumber == 1 : PC.GetTeamNum() == TeamNumber;

	// Don't draw anything for an enemy unless they have a skill/perk to override.
	if( !bIsFriendly )
	{
		TrPRI = TrPlayerReplicationInfo(PC.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				bDetectTraps = VM.m_bCanDetectTraps;
			}
		}

		if( !bDetectTraps )
		{
			return;
		}
	}

	// Make sure we are visible.
    if (WorldInfo.TimeSeconds - LastPostRenderTraceTime > 0.5)
    {
        LastPostRenderTraceTime = WorldInfo.TimeSeconds + 0.2*FRand();
        bPostRenderTraceSucceeded = (FastTrace(Location, CameraPosition) || FastTrace(Location + vMarkerOffset, CameraPosition));
    }

	// Calculate distance 
	screenLoc.Z = VSize(CameraPosition - Location);
	
	if( TrPlayerController(PC).GetZoomedState() == ZST_NotZoomed )
	{
		MaxOffset = (100 / (ScreenLoc.Z * 2));
		MaxOffset *= 2;
	}
	else
	{
		MaxOffset = 0.5;
	}

	// Where is the crosshair?
	if( Abs(screenLoc.X - Canvas.ClipX * 0.5) < MaxOffset * 0.5 * Canvas.ClipX
		&& Abs((screenLoc.Y + projectedHeight) - Canvas.ClipY * 0.5) < MaxOffset * Canvas.ClipY )
	{
        HUD.bCrosshairOnFriendly = true;
        m_fShowHeaderUntil = WorldInfo.TimeSeconds + 1.0;
    }

	// Don't render behind weapon.
	if (TrPawn(PC.Pawn) != None)
	{
		TrDev = TrDevice(TrPawn(PC.Pawn).Weapon);

		if (TrDev != none && TrDev.CoversScreenSpace(screenLoc, Canvas))
			return;
	}

	marker = GetMarker();
	m_MarkerMIC.SetVectorParameterValue('HudItem_Color', bIsFriendly ? class'TrHUD'.default.MarkerColorFriendly : class'TrHUD'.default.MarkerColorEnemy);
	m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', marker);

	// Draw the UI elements.
	if( bIsFriendly && m_fShowHeaderUntil > WorldInfo.TimeSeconds && bPostRenderTraceSucceeded)
	{
		// Draw the name of the projectile.
		NameLoc = screenLoc;
		NameLoc.X += HUD.m_fMineNamePlacementX;
		NameLoc.Y += HUD.m_fMineNamePlacementY;
		HUD.DrawMarkerText(m_sScreenName, bIsFriendly, NameLoc, Canvas);

		// Draw the instigator's name.
		if( m_bDrawOwnerName && bIsFriendly && r_OwnerPRI != none && r_OwnerPRI != none )
		{
			NameLoc = screenLoc;
			NameLoc.X += HUD.m_fMineDeployerNamePlacementX;
			NameLoc.Y += HUD.m_fMineDeployerNamePlacementY;
			PlayerNameString = r_OwnerPRI.PlayerName;
			if( Right(PlayerNameString,1) ~= "s" )
			{
				PlayerNameString = PlayerNameString$"'";
			}
			else
			{
				PlayerNameString = PlayerNameString$"'s";
			}
			HUD.DrawMarkerText(PlayerNameString, bIsFriendly, NameLoc, Canvas);
		}

		// Draw the marker.
		if( marker != none )
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(marker.SizeX, marker.SizeY));
		}

	}
	// Are we drawing the marker?
	else if( HUD.bShowObjectives || (screenLoc.Z < Class'TrPawn'.default.m_fShowObjectThreshold) )
	{		
		if (marker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(marker.SizeX, marker.SizeY));
		}
	}
}

defaultproperties
{
   m_bUsesDetonationProxy=True
   m_bDrawOwnerName=True
   m_bIsPostRendered=True
   m_fDeploySeconds=2.000000
   m_fDetonationRadius=200.000000
   m_fDetonationHeight=80.000000
   m_fMaxFloorZ=0.200000
   m_nNumBouncesBeforeDetonateObsolete=5
   m_sScreenName="Mine"
   m_nMarkerOffset=20
   m_nIconStackId=40
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Mine:MyLightEnvironment'
      bUseAsOccluder=False
      bAcceptsStaticDecals=False
      bAcceptsDynamicDecals=False
      bCastDynamicShadow=False
      CollideActors=False
      BlockActors=False
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      BlockRigidBody=False
      bDisableAllRigidBody=True
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_bAuthoritativeExploding=False
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_nPerPlayerMaxDeployed=3
   m_fBounceDampingPercent=0.200000
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=256.000000
   DecalHeight=256.000000
   TossZ=45.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   CheckRadius=42.000000
   Speed=300.000000
   MaxSpeed=300.000000
   bSwitchToZeroCollision=False
   Damage=700.000000
   DamageRadius=400.000000
   MomentumTransfer=85000.000000
   MyDamageType=Class'TribesGame.TrDmgType_Mine'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProjectile:CollisionCylinder'
      CollisionHeight=5.000000
      CollisionRadius=15.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   Physics=PHYS_Falling
   CollisionType=COLLIDE_BlockWeapons
   bOrientOnSlope=True
   bPushedByEncroachers=False
   bUpdateSimulatedPosition=True
   bProjTarget=True
   bBounce=True
   LifeSpan=0.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_Mine"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
