/**
 * 
 */
class TrProj_Lacerator extends TrProjectile
	native;

/** # of times they can bounce */
var int Bounces;

/** How fast damage is reduced per second from when the chunk is fired */
var float DamageAttenuation;

var float ShrinkTimer;

var ParticleSystem BounceTemplate;
var ParticleSystem RockSmokeTemplate;

/** reference to impact effect we created; we wait for this before being destroyed */
var ParticleSystemComponent LastImpactEffect;

var MaterialSoundEffect DefaultHitSound;
var SoundCue HitPawnSound;

/** if set, play camera anim for killer when kill at very short range (set to false for shards spawned by alt shell) */
var bool bCheckShortRangeKill;
/** the camera anim to play */
var CameraAnim ShortRangeKillAnim;

/* if true, shard is fading out */
var bool bShrinking;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
	Super.InitProjectile(Direction, ClassToInherit);

	if (PhysicsVolume.bWaterVolume)
	{
		Velocity *= 0.65;
	}

	SetRotation(RotRand());
}

simulated function SpawnFlightEffects()
{
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (WorldInfo.IsConsoleBuild())
		{
			// spawning all those shards at once is expensive so we delay the flight effects a tick to spread out the work a little
			SetTimer(WorldInfo.DeltaSeconds + 0.01, false, 'InternalSpawnFlightEffects');
		}
		else
		{
			Super.SpawnFlightEffects();
		}
	}
}

simulated function InternalSpawnFlightEffects()
{
	if (!bShuttingDown)
	{
		Super.SpawnFlightEffects();
	}
}

/**
  * Attenuate shard damage at long range
  */
simulated function float GetDamage(Actor Other, vector HitLocation)
{
	return Max(5, Damage - DamageAttenuation * FMax(0.f, (default.Lifespan - LifeSpan - 1)));
}

simulated function float GetMomentumTransfer()
{
	return MomentumTransfer;
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	local Vehicle V;
	local UTPlayerController PC;

	if ( (TrProj_Lacerator(Other) == none) && (Physics == PHYS_Falling || Other != Instigator) )
	{
		speed = VSize(Velocity);
		if (Speed > 400)
		{
			Other.TakeDamage(GetDamage(Other, HitLocation), InstigatorController, HitLocation, GetMomentumTransfer() * Normal(Velocity), MyDamageType,, self);
			if ( Role == ROLE_Authority )
			{
				V = Vehicle(Other);
				if ( V != None)
				{
					if ( PlayerController(V.Controller) != None )
					{
						PlayerController(V.Controller).ClientPlaySound(DefaultHitSound.Sound);
					}
					bWaitForEffects = SpawnImpactEffect(HitLocation, HitNormal);
				}
				else if (Pawn(Other) != None)
				{
					PlaySound(HitPawnSound, true);

					// play camera anim if short range kill
					if ( bCheckShortRangeKill && Pawn(Other).Health < 0 && Physics == PHYS_Projectile && Instigator != None &&
						VSize(Instigator.Location - Other.Location) < 150.0 )
					{
						PC = UTPlayerController(InstigatorController);
						if (PC != None)
						{
							PC.ClientPlayCameraAnim(ShortRangeKillAnim);
						}
					}
				}
				else if ( TrDeployable(Other) != None )
				{
					bWaitForEffects = SpawnImpactEffect(HitLocation, HitNormal);
				}
			}
		}
		Shutdown();
	}
}

simulated function Landed(vector HitNormal, Actor FloorActor)
{
	HitWall(HitNormal, FloorActor, None);
}

simulated function bool SpawnImpactEffect(vector HitLocation, vector HitNormal)
{
	if (EffectIsRelevant(HitLocation, false, MaxEffectDistance))
	{
		LastImpactEffect = new(Outer) class'UTParticleSystemComponent';
		LastImpactEffect.SetAbsolute(true, true, true);
		LastImpactEffect.SetTranslation(HitLocation);
		LastImpactEffect.SetRotation(rotator(HitNormal));
		LastImpactEffect.SetTemplate((Bounces > 0) ? BounceTemplate : RockSmokeTemplate);
		LastImpactEffect.OnSystemFinished = MyOnParticleSystemFinished;
		AttachComponent(LastImpactEffect);
		return true;
	}
	return false;
}

simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	local audioComponent HitSoundComp;
	local bool bSpawnedImpactEffect;

	bBlockedByInstigator = true;
	bSpawnedImpactEffect = SpawnImpactEffect(Location, HitNormal);

	if ( !Wall.bStatic && !Wall.bWorldGeometry && Wall.bProjTarget )
	{
		Wall.TakeDamage(GetDamage(Wall, Location), InstigatorController, Location, GetMomentumTransfer() * Normal(Velocity), MyDamageType,, self);
		bWaitForEffects = bSpawnedImpactEffect;
		Shutdown();
	}
	else
	{
		ImpactSound = DefaultHitSound.Sound;
		SetPhysics(PHYS_Falling);
		if (Bounces > 0)
		{
			if ( Bounces == 1 )
			{
				LifeSpan += 0.5;
			}
			if (!WorldInfo.bDropDetail && FRand() < 0.4)
			{

				HitSoundComp = CreateAudioComponent( ImpactSound, false, false, true, location );
				if(HitSoundComp != none)
				{
					HitSoundComp.VolumeMultiplier = (Bounces > 1) ? 1.0 : 0.5;
					HitSoundComp.Play();
				}

			}

			Velocity = 0.6 * (Velocity - 2.0 * HitNormal * (Velocity dot HitNormal));
			Bounces = Bounces - 1;
		}
		else
		{
			if (ProjEffects != None)
			{
				ProjEffects.DeactivateSystem();
			}
			bBounce = false;
			SetPhysics(PHYS_None);
			SetTimer(0.5 * FRand(), false, 'StartToShrink');
		}
	}
}

simulated function StartToShrink()
{
	RemoteRole = ROLE_None;
	bShrinking = true;
	ShrinkTimer = FMin(LifeSpan,0.75);
	if ( WorldInfo.NetMode == NM_DedicatedServer )
	{
		Destroy();
	}
	else if ( !bWaitForEffects )
	{
		LifeSpan = ShrinkTimer;
	}
}

simulated function MyOnParticleSystemFinished(ParticleSystemComponent PSC)
{
	if ( bWaitForEffects && (PSC == LastImpactEffect) )
	{
		Destroy();
	}
	else
	{
		if ( PSC == LastImpactEffect )
		{
			LastImpactEffect = None;
		}
		DetachComponent(PSC);
	}
}

defaultproperties
{
   Bounces=2
   DamageAttenuation=5.000000
   bCheckShortRangeKill=True
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp Archetype=StaticMeshComponent'TribesGame.Default__TrProjectile:ProjectileMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProj_Lacerator:MyLightEnvironment'
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
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   MaxEffectDistance=5000.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight Archetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'TribesGame.Default__TrProjectile:ProjectilePointLight'
   End Object
   ProjectileLight=ProjectilePointLight
   CheckRadius=20.000000
   Speed=3500.000000
   MaxSpeed=3500.000000
   Damage=18.000000
   MomentumTransfer=14000.000000
   MyDamageType=Class'TribesGame.TrDmgType_Lacerator'
   NetCullDistanceSquared=49000000.000000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   bUpdateSimulatedPosition=True
   bBounce=True
   LifeSpan=2.000000
   CollisionComponent=CollisionCylinder
   RotationRate=(Pitch=0,Yaw=0,Roll=50000)
   Name="Default__TrProj_Lacerator"
   ObjectArchetype=TrProjectile'TribesGame.Default__TrProjectile'
}
