/**
 * Claymore projectile. Direction based mine.
 */
class TrProj_RepairDeployable extends TrProj_Mine
	native;

var float m_fCheckNearbyActorsFrequency;
var float m_fRepairRadius;
var transient float m_fRepairBuff;
var float m_fRepairPercentage;
var float m_fVehicleRepairPercentage;
var transient array<Actor> ActorsToRepair;
var transient array<ParticleSystemComponent> RepairBeams;
var SoundCue RepairBeamSound;
var AudioComponent RepairBeamAC;;
var transient float m_fTimeSinceLastTick;
var transient float m_fTickFrequency;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	// Set its Ambient Sound
	if (RepairBeamSound != None && WorldInfo.NetMode != NM_DedicatedServer && !bSuppressSounds)
	{
		RepairBeamAC = CreateAudioComponent(RepairBeamSound, false, true);
		if ( RepairBeamAC != None )
		{
			RepairBeamAC.bShouldRemainActiveIfDropped = true;
		}
	}
}

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	if( Role == ROLE_Authority )
	{
		TrPRI = TrPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				m_fRepairBuff = VM.m_fRepairDeployableRateBuffPct;
			}
		}
	}

	Super.InitProjectile(Direction, ClassToInherit);
}

simulated function ArmedTimer()
{
	CheckRepair();
}

simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	local vector MeshTranslation;
	Super.HitWall(HitNormal, Wall, WallComp);

	// Really hacky, but TrProj_Mine does funky logic to place the mine, so undo that here.
	CylinderComponent.SetTranslation(vect(0,0,0));

	MeshTranslation.Z -= CylinderComponent.CollisionHeight;
	m_ProjMesh.SetTranslation(MeshTranslation);
}

simulated function CheckRepair()
{
	local Actor A;
	local TrVehicle V;
	local TrGameObjective O;
	local int AddedIndex;
	local vector Start;

	ActorsToRepair.Remove(0, ActorsToRepair.Length);
	foreach OverlappingActors(class'Actor', A, m_fRepairRadius)
	{
		O = TrGameObjective(A);
		if( O != none )
		{
			if( O.m_bIsRepairable && O.GetHealthAmount() < 1.0 && (O.GetHealthAmount() > 0.0 || O.m_bIsRepairableAfterDeath ) && O.DefenderTeamIndex == Instigator.GetTeamNum() )
			{
				if( O.RequiresLOSForRepairDeployable() )
				{
					Start = Location;
					Start.Z += CylinderComponent.CollisionHeight;
					if( !FastTrace(O.Location, Start,,true) )
					{
						// No LOS to the objective.
						continue;
					}
				}

				AddedIndex = ActorsToRepair.AddItem(O);

				// Spawn in a repair beam if a corresponding beam at this index does not yet exist.
				if( WorldInfo.NetMode != NM_DedicatedServer && AddedIndex == RepairBeams.Length )
				{
					RepairBeams.AddItem(Worldinfo.MyEmitterPool.SpawnEmitterMeshAttachment(ParticleSystem'WEP_RepairPack_1p.ALT_Yellow.P_Beam', SkeletalMeshComponent(m_ProjMesh), 'WSO_Emit_01', true,,));
					RepairBeams[AddedIndex].SetTickGroup(TG_EffectsUpdateWork);
				}
			}
		}
		else
		{
			V = TrVehicle(A);
			if( V != none )
			{
				if( V.GetTeamNum() == Instigator.GetTeamNum() && V.Health < V.HealthMax )
				{
					AddedIndex = ActorsToRepair.AddItem(V);

					// Spawn in a repair beam if a corresponding beam at this index does not yet exist.
					if( WorldInfo.NetMode != NM_DedicatedServer && AddedIndex == RepairBeams.Length )
					{
						RepairBeams.AddItem(Worldinfo.MyEmitterPool.SpawnEmitterMeshAttachment(ParticleSystem'WEP_RepairPack_1p.ALT_Yellow.P_Beam', SkeletalMeshComponent(m_ProjMesh), 'WSO_Emit_01', true,,));
						RepairBeams[AddedIndex].SetTickGroup(TG_EffectsUpdateWork);
					}
				}
			}
		}
	}

	// Remove any beam effects that are no longer relevant.
	if( WorldInfo.NetMode != NM_DedicatedServer && RepairBeams.Length > ActorsToRepair.Length )
	{
		while( RepairBeams.Length > ActorsToRepair.Length )
		{
			RepairBeams[RepairBeams.Length - 1].DeactivateSystem();
			RepairBeams[RepairBeams.Length - 1] = none;
			RepairBeams.Remove(RepairBeams.Length - 1, RepairBeams.Length);
		}
	}

	if( RepairBeamAC != none )
	{
		if( RepairBeams.Length > 0 && !RepairBeamAC.IsPlaying() )
		{
			RepairBeamAC.Play();
		}
		else if( RepairBeams.Length == 0 && RepairBeamAC.IsPlaying() )
		{
			RepairBeamAC.Stop();
		}
	}

	SetTimer(m_fCheckNearbyActorsFrequency, false, 'CheckRepair');
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	ClearTimer('CheckRepair');
	ActorsToRepair.Remove(0, ActorsToRepair.Length);
	RepairBeams.Remove(0, RepairBeams.Length);

	super.Explode(HitLocation, HitNormal);
}

function DetonateObsolete(optional bool bDetonateFromDamage)
{
	if (!bDetonateFromDamage)
	{
		Damage=0;
	}

	Explode(Location, vect(0,0,1));	
}

defaultproperties
{
   m_fCheckNearbyActorsFrequency=2.000000
   m_fRepairRadius=300.000000
   m_fRepairPercentage=0.015000
   m_fVehicleRepairPercentage=0.003000
   m_bUsesDetonationProxy=False
   m_fDeploySeconds=0.100000
   m_fDetonationRadius=300.000000
   m_fDetonationHeight=200.000000
   m_sScreenName="Repair Kit"
   m_nIconStackId=39
   Begin Object Class=SkeletalMeshComponent Name=RepairMesh
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_RepairDeployable:MyLightEnvironment'
      Scale=1.700000
      Name="RepairMesh"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   m_ProjMesh=RepairMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Mine:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Mine:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fAmbientSoundFadeIn=0.100000
   m_fAmbientSoundFadeOut=0.200000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProj_Mine:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProj_Mine:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   bCheckProjectileLight=True
   Damage=10.000000
   DamageRadius=520.000000
   MomentumTransfer=1000.000000
   MyDamageType=Class'TribesGame.TrDmgType_RepairDeployable'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProj_Mine:CollisionCylinder'
      CollisionHeight=15.000000
      CollisionRadius=15.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProj_Mine:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=RepairMesh
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_RepairDeployable"
   ObjectArchetype=TrProj_Mine'TribesGame.Default__TrProj_Mine'
}
