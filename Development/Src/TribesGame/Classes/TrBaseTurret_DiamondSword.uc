class TrBaseTurret_DiamondSword extends TrDeployable_BaseTurret
    placeable;

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_BaseTurret:XRayMesh'
      Materials(0)=None
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Scale=3.250000
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_BaseTurret:XRayMesh'
   End Object
   m_XRayMesh=XRayMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_BaseTurret:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_BaseTurret:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_BaseTurret:ObjectiveMesh'
      PhysicsWeight=1.000000
      AnimSets(0)=None
      bHasPhysicsAssetInstance=True
      bUpdateJointsFromAnimation=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrBaseTurret_DiamondSword:MyLightEnvironment'
      RBChannel=RBCC_EffectPhysics
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Scale=3.250000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_BaseTurret:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_BaseTurret:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_BaseTurret:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_bIsRepairableAfterDeath=True
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_BaseTurret:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   DefenderTeamIndex=1
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrDeployable_BaseTurret:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=60.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockRigidBody=True
      Translation=(X=0.000000,Y=0.000000,Z=50.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrDeployable_BaseTurret:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrDeployable_BaseTurret:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrDeployable_BaseTurret:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrDeployable_BaseTurret:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrDeployable_BaseTurret:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Components(5)=ShieldMesh
   Components(6)=OnlineSound
   Components(7)=CriticalSound
   Components(8)=ShieldHitSound
   Components(9)=PowerDownSound
   Components(10)=DestroyedSound
   CollisionComponent=CollisionCylinder
   Name="Default__TrBaseTurret_DiamondSword"
   ObjectArchetype=TrDeployable_BaseTurret'TribesGame.Default__TrDeployable_BaseTurret'
}
