class TrDeployableHologram_BaseTurret extends TrDeployableHologram;

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployableHologram:SkeletalMeshComponent0'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrDeployableHologram:SkeletalMeshComponent0.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrDeployableHologram:SkeletalMeshComponent0.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployableHologram_BaseTurret:SkeletalMeshComponent0.AnimNodeSeq0'
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployableHologram_BaseTurret:MyLightEnvironment'
      RBChannel=RBCC_GameplayPhysics
      MotionBlurScale=0.000000
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployableHologram:SkeletalMeshComponent0'
   End Object
   SkeletalMeshComponent=SkeletalMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployableHologram:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployableHologram:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   Begin Object Class=AudioComponent Name=FaceAudioComponent Archetype=AudioComponent'TribesGame.Default__TrDeployableHologram:FaceAudioComponent'
      Name="FaceAudioComponent"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployableHologram:FaceAudioComponent'
   End Object
   FacialAudioComp=FaceAudioComponent
   Components(0)=MyLightEnvironment
   Components(1)=SkeletalMeshComponent0
   Components(2)=FaceAudioComponent
   CollisionComponent=SkeletalMeshComponent0
   Name="Default__TrDeployableHologram_BaseTurret"
   ObjectArchetype=TrDeployableHologram'TribesGame.Default__TrDeployableHologram'
}
