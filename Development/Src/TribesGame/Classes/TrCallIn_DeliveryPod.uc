class TrCallIn_DeliveryPod extends Actor
	native;

/** The MITV to use for the impact decal */
var MaterialInstanceTimeVarying PodHitDecal;

/** The width and height of the hit decal */
var float HitDecalHeight;
var float HitDecalWidth;

/** The time delay before the decal dissolves */
var float DecalDissolveTime;

/** The particle system to play when the delivery pod is on the way */
var ParticleSystem DeliveryPodParticleTemplate;
var ParticleSystemComponent	DeliveryPodParticleEffects;

/** The particle system to play when the delivery pod lands */
var ParticleSystem DeliveryPodImpactTemplate;

/** The sound to play upon impact */
var AudioComponent FallingSoundComponent;
var SoundCue FallingSound;

/** The sound to play while flying */
var SoundCue ImpactSound;

/** The amount of time to stay alive after impact */
var float LifeAfterImpact;

/** The initial and maximum speed of the delivery pod */
var float Speed;

/** The target normal we are going to hit */
var vector TargetHitNormal;

/** The target point we are going to hit */
var vector TargetImpactPoint;

/** Light Environment */
var DynamicLightEnvironmentComponent m_LightEnvironment;

native function float GetTerminalVelocity();

simulated function Init(TrCallIn_CrashLandInfo CrashInfo)
{
	if (CrashInfo == none)
		return;

	// Setup the initial velocity and impact point.
	TargetImpactPoint = CrashInfo.r_CrashLandPoint;
	TargetHitNormal = CrashInfo.r_CrashLandNormal;
	Velocity = Speed * CrashInfo.r_CrashLandNormal;

	SetRotation(rotator(CrashInfo.r_CrashLandNormal));

	// Set the time to break apart on the client.
	SetTimer(CrashInfo.r_fCrashLandTime, false, 'BreakApart');
}

simulated function BreakApart()
{
	local MaterialInstanceTimeVarying DecalMat;

	// Play the impact explosion effect.
	if (WorldInfo.NetMode != NM_DedicatedServer && DeliveryPodImpactTemplate != none)
	{
		WorldInfo.MyEmitterPool.SpawnEmitter(DeliveryPodImpactTemplate, Location);
	}

	// Stop the falling sound.
	if (FallingSoundComponent != none)
	{
		FallingSoundComponent.FadeOut(0.1f, 0.0f);
	}

	// Play the impact sound.
	if (ImpactSound != none)
	{
		PlaySound(ImpactSound, true);
	}

	// Place the hit decal.
	if (PodHitDecal != none)
	{
		DecalMat = new(Outer) class'MaterialInstanceTimeVarying';
		DecalMat.SetParent(PodHitDecal);

		WorldInfo.MyDecalManager.SpawnDecal(DecalMat, TargetImpactPoint, rotator(-TargetHitNormal), HitDecalWidth, HitDecalHeight, 50, false, , , true, false);

		DecalMat.SetScalarStartTime('DissolveAmount', DecalDissolveTime);
	}

	// Spawn the cracked-open egg shell.
	Spawn(class'TrCallIn_OpenDeliveryPod', , , TargetImpactPoint + vect(0,0,160), Rotation);

	// Hide our mesh until the particle system notifies us that it is finished.
	DeliveryPodParticleEffects.DeactivateSystem();
	HideMesh();
}

simulated function HideMesh()
{
	local MeshComponent ComponentIt;

    //hide mesh as well psc etc
	foreach ComponentList(class'MeshComponent',ComponentIt)
	{
		ComponentIt.SetHidden(true);
	}
}

simulated function ParticleSystemFinished(ParticleSystemComponent PSC)
{
	Destroy();
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	// Play the falling sound, if there is one.
	if (FallingSound != none)
	{
		FallingSoundComponent = CreateAudioComponent(FallingSound, true, true);
		if (FallingSoundComponent != none)
		{
			FallingSoundComponent.bShouldRemainActiveIfDropped = true;
		}
	}

	// Start the flight particle system.
	if (WorldInfo.NetMode != NM_DedicatedServer && DeliveryPodParticleTemplate != None)
	{
		DeliveryPodParticleEffects = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(DeliveryPodParticleTemplate);
		DeliveryPodParticleEffects.SetAbsolute(false, false, false);
		DeliveryPodParticleEffects.SetLODLevel(WorldInfo.bDropDetail ? 1 : 0);
		DeliveryPodParticleEffects.bUpdateComponentInTick = true;
		DeliveryPodParticleEffects.OnSystemFinished = ParticleSystemFinished;
		AttachComponent(DeliveryPodParticleEffects);
	}
}

simulated event Destroyed()
{
	DetachComponent(DeliveryPodParticleEffects);
	DeliveryPodParticleEffects = none;

	super.Destroyed();
}

defaultproperties
{
   HitDecalHeight=250.000000
   HitDecalWidth=250.000000
   DecalDissolveTime=15.000000
   LifeAfterImpact=3.000000
   Speed=5000.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Components(0)=MyLightEnvironment
   Begin Object Class=StaticMeshComponent Name=DeliveryMesh
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenEditor=True
      bCastHiddenShadow=True
      BlockActors=False
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      BlockRigidBody=False
      bDisableAllRigidBody=True
      Name="DeliveryMesh"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(1)=DeliveryMesh
   Physics=PHYS_Falling
   CollisionType=COLLIDE_CustomDefault
   bOnlyDirtyReplication=True
   bCollideActors=True
   bCollideWorld=True
   bCollideComplex=True
   bProjTarget=True
   CollisionComponent=DeliveryMesh
   Name="Default__TrCallIn_DeliveryPod"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
