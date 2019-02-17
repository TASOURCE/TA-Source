class TrCallIn_OpenDeliveryPod extends Actor;

/** The time to destroy the cracked egg shell */
var float TimeToDelete;

/** The time to destroy the cracked egg shell */
var float TimeToFade;

/** The MITV to use for the fade effect */
var MaterialInstanceTimeVarying PodFadeMaterial;

/** The skeletal mesh */
var SkeletalMeshComponent m_Mesh;

simulated function PostBeginPlay()
{
	local MaterialInstanceTimeVarying FadeMaterial;

	super.PostBeginPlay();

	if (m_Mesh != none)
	{
		m_Mesh.AddRadialImpulse(Location + vect(0,0,120), 1000, 1000, RIF_Constant);

		// Create the fade material.
		FadeMaterial = new (m_Mesh.Outer) class'MaterialInstanceTimeVarying';
		FadeMaterial.SetParent(PodFadeMaterial);
		FadeMaterial.SetScalarStartTime('DissolveAmount', TimeToFade);

		// Set the fade material to the mesh.
		m_Mesh.SetMaterial(0, FadeMaterial);
	}

	SetTimer(TimeToDelete, false, 'RemovePod');
}

simulated function RemovePod()
{
	Destroy();
}

defaultproperties
{
   TimeToDelete=10.000000
   TimeToFade=5.000000
   Begin Object Class=SkeletalMeshComponent Name=CrackedEggShell
      PhysicsWeight=1.000000
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      MotionBlurScale=0.000000
      HiddenEditor=True
      bCastHiddenShadow=True
      CollideActors=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True)
      Name="CrackedEggShell"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   m_Mesh=CrackedEggShell
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
   End Object
   Components(0)=MyLightEnvironment
   Components(1)=CrackedEggShell
   Physics=PHYS_RigidBody
   CollisionType=COLLIDE_CustomDefault
   TickGroup=TG_PostAsyncWork
   bCollideActors=True
   bProjTarget=True
   CollisionComponent=CrackedEggShell
   Name="Default__TrCallIn_OpenDeliveryPod"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
