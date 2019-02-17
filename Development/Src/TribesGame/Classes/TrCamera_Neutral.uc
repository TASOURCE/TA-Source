/**
 * 
 */
class TrCamera_Neutral extends CameraActor
	ClassGroup(Common)
	placeable;

defaultproperties
{
   Begin Object Class=DrawFrustumComponent Name=DrawFrust0 Archetype=DrawFrustumComponent'Engine.Default__CameraActor:DrawFrust0'
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="DrawFrust0"
      ObjectArchetype=DrawFrustumComponent'Engine.Default__CameraActor:DrawFrust0'
   End Object
   DrawFrustum=DrawFrust0
   Begin Object Class=StaticMeshComponent Name=CamMesh0 Archetype=StaticMeshComponent'Engine.Default__CameraActor:CamMesh0'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="CamMesh0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__CameraActor:CamMesh0'
   End Object
   MeshComp=CamMesh0
   Components(0)=CamMesh0
   Components(1)=DrawFrust0
   Name="Default__TrCamera_Neutral"
   ObjectArchetype=CameraActor'Engine.Default__CameraActor'
}
