class TrCTFBase_DiamondSword extends TrCTFBase
	placeable;

simulated function string GetSpectatorName()
{
	return "Diamond Sword Flag Stand";
}

defaultproperties
{
   Begin Object Class=SkeletalMeshComponent Name=FlagStand Archetype=SkeletalMeshComponent'TribesGame.Default__TrCTFBase:FlagStand'
      AnimSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrCTFBase_DiamondSword:FlagBaseLightEnvironment'
      MaxDrawDistance=7000.000000
      CachedMaxDrawDistance=7000.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      LightingChannels=(Dynamic=True)
      Translation=(X=0.000000,Y=0.000000,Z=-60.000000)
      Name="FlagStand"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrCTFBase:FlagStand'
   End Object
   m_FlagStandMesh=FlagStand
   FlagType=Class'TribesGame.TrFlagCTF_DiamondSword'
   DefenderTeamIndex=1
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrCTFBase:CollisionCylinder'
      CollisionHeight=60.000000
      CollisionRadius=60.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrCTFBase:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrCTFBase:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrCTFBase:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrCTFBase:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrCTFBase:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Begin Object Class=DynamicLightEnvironmentComponent Name=FlagBaseLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrCTFBase:FlagBaseLightEnvironment'
      bCastShadows=False
      bDynamic=False
      Name="FlagBaseLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrCTFBase:FlagBaseLightEnvironment'
   End Object
   Components(3)=FlagBaseLightEnvironment
   Components(4)=FlagStand
   CollisionComponent=CollisionCylinder
   Name="Default__TrCTFBase_DiamondSword"
   ObjectArchetype=TrCTFBase'TribesGame.Default__TrCTFBase'
}
