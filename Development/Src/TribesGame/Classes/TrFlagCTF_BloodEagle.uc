/**
* TrFlagCTF_DiamondSword
*/
class TrFlagCTF_BloodEagle extends TrFlagCTF
    placeable;

simulated function string GetSpectatorName()
{
	return "Blood Eagle Flag";
}

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=FlagLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagCTF:FlagLightEnvironment'
      bDynamic=False
      Name="FlagLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagCTF:FlagLightEnvironment'
   End Object
   LightEnvironment=FlagLightEnvironment
   PickUpWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrFlagCTF_BloodEagle:ForceFeedbackWaveformPickUp'
   Begin Object Class=SkeletalMeshComponent Name=TheFlagSkelMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrFlagCTF:TheFlagSkelMesh'
      AnimSets(0)=None
      bUpdateSkelWhenNotRendered=False
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bEnableClothSimulation=True
      ClothWind=(X=20.000000,Y=10.000000,Z=0.000000)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagCTF_BloodEagle:FlagLightEnvironment'
      RBChannel=RBCC_Nothing
      BlockRigidBody=True
      RBCollideWithChannels=(Vehicle=True,Cloth=True)
      Translation=(X=0.000000,Y=0.000000,Z=-40.000000)
      Name="TheFlagSkelMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrFlagCTF:TheFlagSkelMesh'
   End Object
   SkelMesh=TheFlagSkelMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrFlagCTF:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Translation=(X=0.000000,Y=0.000000,Z=35.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrFlagCTF:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   Components(1)=FlagLightEnvironment
   Components(2)=TheFlagSkelMesh
   CollisionComponent=CollisionCylinder
   Name="Default__TrFlagCTF_BloodEagle"
   ObjectArchetype=TrFlagCTF'TribesGame.Default__TrFlagCTF'
}
