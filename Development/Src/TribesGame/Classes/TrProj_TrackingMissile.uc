/**
 * 
 */
class TrProj_TrackingMissile extends TrProjectile
	native;

enum ETrackingMissileStage
{
	ETrackingMissileStage_JustFired,            // Has recently fired and is going at a slow speed in the fire direction.
	ETrackingMissileStage_AdjustingForGoodLOS,  // Has shot into the air to become level with the target.
	ETrackingMissileStage_HomingInOnTarget,     // Is currently seeking the target.
};

/** Represents what 'Stage' the missile is in. */
var ETrackingMissileStage m_MissileStage;

/** Has the missile bent its trajectory to the target? */
var bool m_bHasBentToTarget;

/** Has the missile lost its ability to home in? */
var transient bool m_bLostTightHoming;

/** Amount of time you can break LOS on target before shooting. */
var float m_fLOSDelay;

/** Amount of time in seconds before the tracking kicks in. */
var float m_fTrackingDelay;

/** After this amount of time, the missile stops tracking. */
var float m_fTrackingTime;

/** Accel rate when the missile is climbing for good LOS. */
var float m_fAdjustingForGoodLOSAccelRate;

/** How much higher to go than the target for a good LOS. */
var float m_fIdealHeightAboveTargetForGoodLOS;

/** How much to climb during stage 2. */
var float m_fMinHeightGainForGoodLOS;

/** Mesh for the projectile. */
var StaticMeshComponent m_ProjectileMesh;

/** Initial location for this projectile. */
var transient float m_fInitialLocationZ;

/** Last known position of the last target. */
var transient Vector m_vLastKnownTargetLocation;

/** The min. distance above the ground that the rocket needs to be during stage 1.*/
var float m_fStage1MinGroundDist;

/** Rotation for the carat marker icon. */
var Rotator m_MissileCaratRotation;

/** Distance from target at which homing strengh loses effectiveness if 180 degrees or more past the target. */
var float m_fLoseTightTrackingDistance;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function PostBeginPlay()
{
	local PlayerController PC;

	// add to local HUD's post-rendered list
	ForEach LocalPlayerControllers(class'PlayerController', PC)
	{
		if ( PC.MyHUD != None )
		{
			PC.MyHUD.AddPostRenderedActor(self);
		}
	}

	m_fInitialLocationZ = Location.Z;
	super.PostBeginPlay();
}

simulated function Init( Vector Direction )
{
	super.Init(Direction);

	m_MissileStage = ETrackingMissileStage_JustFired;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if( Role == ROLE_Authority )
	{
		if( m_MissileStage != ETrackingMissileStage_JustFired )
		{
			Explode( HitLocation, HitNormal );
		}
		else
		{
			// Don't blow up when in the just fired stage. Go immediately to the next stage.
			m_fTrackingDelay = 0.0;
			SetCollision(false, false);
			// Allow the missile to go through the actor it has touched so that it can hopefully enter stage 2 without
			// colliding with anything else.
			SetTimer(0.2, false, 'EnableCollisionTimer');
		}
	}
}

function EnableCollisionTimer()
{
	SetCollision(true, true);
}

simulated function SetSeekTarget(Actor NewSeekTarget)
{
	local TrSeekingMissileManager MissileManager;

	MissileManager = GetSeekingMissileManager();

	// If we have an old seek target, clean up any target effects on him first.
	if( SeekTarget != none && Role == ROLE_Authority )
	{
		if( MissileManager != none )
		{
			MissileManager.RemoveMissile(self);
		}
	}

	SeekTarget = NewSeekTarget;

	if( Role == ROLE_Authority )
	{
		if( MissileManager != none )
		{
			MissileManager.AddMissile(self);
		}
	}
}

event NativeExplode(vector HitLocation, vector HitNormal)
{
	ImpactedActor = SeekTarget;
	Explode(HitLocation, HitNormal);
}

/** Called from exploded and from destroyed to make sure things are cleaned up when the missile explodes. */
simulated function OnExploded()
{
	local TrSeekingMissileManager MissileManager;

	if( Role == ROLE_Authority )
	{
		MissileManager = GetSeekingMissileManager();

		if( MissileManager != none )
		{
			MissileManager.RemoveMissile(self);
		}
	}

	ClearTimer('SpawnFlightEffectsTimer');
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	OnExploded();

	super.Explode(HitLocation, HitNormal);
}

simulated event Destroyed()
{
	// In case for some reason the projectile never exploded, make sure we stop any effects on the target.
	if (!bShuttingDown)
	{
		OnExploded();
	}

	super.Destroyed();
}

/** Authoritative. Returns a pointer to the seeking missile manager. */
function TrSeekingMissileManager GetSeekingMissileManager()
{
	local TrGame TrG;

	TrG = TrGame(WorldInfo.Game);
	if( TrG != none && TrG.m_SeekingMissileManager != none )
	{
		return TrG.m_SeekingMissileManager;
	}

	return none;
}

/**
 * Spawns any effects needed for the flight of this projectile
 */
simulated function SpawnFlightEffects()
{
	SetTimer(m_fTrackingDelay, false, 'SpawnFlightEffectsTimer');
}

simulated function SpawnFlightEffectsTimer()
{
	local ParticleSystemComponent BurstPSC;

	if (WorldInfo.NetMode != NM_DedicatedServer && ProjFlightTemplate != None)
	{
		// The rocket trail.
		ProjEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(ProjFlightTemplate);
		ProjEffects.SetAbsolute(false, false, false);
		ProjEffects.SetLODLevel(WorldInfo.bDropDetail ? 1 : 0);
		ProjEffects.OnSystemFinished = MyOnParticleSystemFinished;
		ProjEffects.bUpdateComponentInTick = true;
		AttachComponent(ProjEffects);

		// The explosion and shell popping off.
		BurstPSC = WorldInfo.MyEmitterPool.SpawnEmitter(ParticleSystem'WEP_RocketLauncher_3p.Effects.P_MissileIgnite', Location);
		BurstPSC.SetDepthPriorityGroup(SDPG_World);
		BurstPSC.SetTickGroup(TG_PostUpdateWork);

		// Swap the mesh for the eposed versions with fins.
		m_ProjectileMesh.SetStaticMesh(StaticMesh'WEP_RocketLauncher_3p.Effects.ASE_Sabre_Projectile_Missle', true);

		//PlaySound( SoundCue'AUD_WEP_SaberLauncher.Fire.A_CUE_WEP_SaberLauncher_Fire_1' );
		AmbientComponent = CreateAudioComponent(SoundCue'AUD_WEP_SaberLauncher.Projectile_Loop.A_CUE_WEP_SaberLauncher_Projectile_Loop_1', false, true);
		if ( AmbientComponent != None )
		{
			AmbientComponent.FadeIn(m_fAmbientSoundFadeIn, 1.0f);
			AmbientComponent.bShouldRemainActiveIfDropped = true;
		}
	}
}

event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local Pawn VictimTrP;
	local TrPlayerController VictimTrPC, TrEventInstigator, InstigatorPC;

	if( !WorldInfo.GRI.OnSameTeam(EventInstigator, Instigator) && !bSuppressExplosionFX )
	{
		VictimTrP = Pawn(SeekTarget);
		if( VictimTrP != none )
		{
			VictimTrPC = TrPlayerController(VictimTrP.Controller);
			if( VictimTrPC != none )
			{
				// Tell the victim that the missile was intercepted.
				VictimTrPC.OnMissileIntercepted();

				// If the person who intercepted the missile was not the victim, tell them too.
				if( EventInstigator != VictimTrPC )
				{
					TrEventInstigator = TrPlayerController(EventInstigator);
					if( TrEventInstigator != none )
					{
						TrEventInstigator.OnMissileIntercepted();
					}
				}
			}
		}

		// Tell the intigator that his missile was intercepted.
		InstigatorPC = TrPlayerController(Instigator.Controller);
		if( InstigatorPC != none )
		{
			InstigatorPC.OnMissileIntercepted();
		}

		if( !bShuttingDown )
		{
			Explode(Location, vect(0,0,1));
		}
	}
}

simulated event Tick(float DeltaTime)
{
	Super.Tick(DeltaTime);

	m_MissileCaratRotation.Yaw += 50000.0 * DeltaTime;
	Normalize(m_MissileCaratRotation);
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local bool bLocalPCIsTarget;
	local Pawn TargetPawn;
	local vector ScreenLoc;
	local TrHUD HUD;
	local TrPawn SelfTrPawn;
	local TrPlayerController SelfTrPC;
	local TrWeaponPawn SelfTrWeaponPawn;

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

	// We are shutting down, don't render.
	if (bShuttingDown)
	{
		return;
	}

	// We aren't seeking anyone apparently.
	TargetPawn = Pawn(SeekTarget);
	if (TargetPawn == none)
	{
		return;
	}

	// Are we the target's controller?
	if (TargetPawn.Controller == PC)
	{
		bLocalPCIsTarget = true;
	}

	// Is a vehicle the target?
	if (!bLocalPCIsTarget && TargetPawn.IsA('TrVehicle'))
	{
		SelfTrPC = TrPlayerController(PC);
		if (SelfTrPC != none)
		{
			// Are we a rdiing passenger on the vehicle?
			SelfTrPawn = TrPawn(SelfTrPC.Pawn);
			if (SelfTrPawn != none && SelfTrPawn.DrivenWeaponPawn.BaseVehicle == TargetPawn)
			{
				bLocalPCIsTarget = true;
			}

			// Are we piloting a weapon seat on the vehicle?
			SelfTrWeaponPawn = TrWeaponPawn(SelfTrPC.Pawn);
			if (SelfTrWeaponPawn != none && SelfTrWeaponPawn.MyVehicle == TargetPawn)
			{
				bLocalPCIsTarget = true;
			}
		}
	}

	if (bLocalPCIsTarget)
	{
		Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, Location, ScreenLoc);
		ScreenLoc.Z = VSize(CameraPosition - Location);
		TrHUD(PC.myHUD).DrawRotatedMarker(class'TrHUD'.default.HUDMarkerMissileIncoming, ScreenLoc, m_MissileCaratRotation,Canvas,,,1.0, 0.2);
	}
}

defaultproperties
{
   m_fLOSDelay=1.000000
   m_fTrackingDelay=0.600000
   m_fTrackingTime=20.000000
   m_fAdjustingForGoodLOSAccelRate=200.000000
   m_fIdealHeightAboveTargetForGoodLOS=700.000000
   m_fMinHeightGainForGoodLOS=1000.000000
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_TrackingMissile:MyLightEnvironment'
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
   m_ProjectileMesh=ProjectileMeshComp
   m_fStage1MinGroundDist=-55.000000
   m_fLoseTightTrackingDistance=200.000000
   m_ProjMesh=ProjectileMeshComp
   m_fProjInheritVelocityPct=1.000000
   m_fProjInheritVelocityPctZ=1.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fAmbientSoundFadeIn=0.200000
   bWaitForEffects=True
   bAttachExplosionToVehicles=False
   DecalWidth=768.000000
   DecalHeight=768.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      Brightness=7.000000
      LightColor=(B=77,G=199,R=255,A=255)
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   bCheckProjectileLight=True
   CheckRadius=42.000000
   BaseTrackingStrength=1000.000000
   HomingTrackingStrength=1000.000000
   CustomGravityScaling=0.400000
   Speed=650.000000
   MaxSpeed=2800.000000
   Damage=1000.000000
   DamageRadius=220.000000
   MomentumTransfer=85000.000000
   MyDamageType=Class'TribesGame.TrDmgType_TrackingMissile'
   NetCullDistanceSquared=2500000000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProjectile:CollisionCylinder'
      CollisionHeight=16.000000
      CollisionRadius=16.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   bAlwaysRelevant=True
   bUpdateSimulatedPosition=True
   bPostRenderIfNotVisible=True
   bProjTarget=True
   NetPriority=2.000000
   LifeSpan=20.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrProj_TrackingMissile"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
