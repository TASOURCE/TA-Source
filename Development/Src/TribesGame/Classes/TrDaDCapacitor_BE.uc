class TrDaDCapacitor_BE extends TrDaDCapacitor
    placeable;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0 Archetype=StaticMeshComponent'TribesGame.Default__TrDaDCapacitor:StaticMeshComponent0'
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrDaDCapacitor:StaticMeshComponent0'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDaDCapacitor:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDaDCapacitor:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDaDCapacitor:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrDaDCapacitor:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrDaDCapacitor:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDaDCapacitor_BE:ObjectiveMesh.AnimNodeSeq0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDaDCapacitor_BE:MyLightEnvironment'
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDaDCapacitor:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDaDCapacitor:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDaDCapacitor:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDaDCapacitor:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   DefenderTeamIndex=0
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrDaDCapacitor:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrDaDCapacitor:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrDaDCapacitor:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrDaDCapacitor:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrDaDCapacitor:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrDaDCapacitor:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=OnlineSound
   Components(5)=CriticalSound
   Components(6)=ShieldHitSound
   Components(7)=PowerDownSound
   Components(8)=DestroyedSound
   Components(9)=StaticMeshComponent0
   CollisionComponent=StaticMeshComponent0
   Name="Default__TrDaDCapacitor_BE"
   ObjectArchetype=TrDaDCapacitor'TribesGame.Default__TrDaDCapacitor'
}
