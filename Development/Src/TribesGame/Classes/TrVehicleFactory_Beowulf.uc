class TrVehicleFactory_Beowulf extends UTVehicleFactory;

defaultproperties
{
   VehicleClassPath="TribesGame.TrVehicle_Beowulf"
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTVehicleFactory:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTVehicleFactory:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'UTGame.Default__UTVehicleFactory:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'UTGame.Default__UTVehicleFactory:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'UTGame.Default__UTVehicleFactory:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'UTGame.Default__UTVehicleFactory:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTVehicleFactory:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTVehicleFactory:MyLightEnvironment'
   End Object
   Components(3)=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'UTGame.Default__UTVehicleFactory:SVehicleMesh'
      bUpdateSkelWhenNotRendered=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicleFactory_Beowulf:MyLightEnvironment'
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Translation=(X=0.000000,Y=0.000000,Z=-70.000000)
      Name="SVehicleMesh"
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTVehicleFactory:SVehicleMesh'
   End Object
   Components(4)=SVehicleMesh
   CollisionComponent=CollisionCylinder
   Name="Default__TrVehicleFactory_Beowulf"
   ObjectArchetype=UTVehicleFactory'UTGame.Default__UTVehicleFactory'
}
