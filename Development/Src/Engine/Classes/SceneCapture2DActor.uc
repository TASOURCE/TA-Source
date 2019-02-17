/**
 * SceneCapture2DActor
 *
 * Place this actor in the level to capture it to a render target texture.
 * Uses a 2D scene capture component
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SceneCapture2DActor extends SceneCaptureActor
	native
	placeable;

/** used to draw the frustum lines and the texture surface */
var const DrawFrustumComponent DrawFrustum;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// SceneCaptureActor interface

	/** 
	* Update any components used by this actor
	*/
	virtual void SyncComponents();

}


defaultproperties
{
   Begin Object Class=DrawFrustumComponent Name=DrawFrust0
      FrustumColor=(B=255,G=255,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawFrust0"
      ObjectArchetype=DrawFrustumComponent'Engine.Default__DrawFrustumComponent'
   End Object
   DrawFrustum=DrawFrust0
   Begin Object Class=SceneCapture2DComponent Name=SceneCapture2DComponent0
      Name="SceneCapture2DComponent0"
      ObjectArchetype=SceneCapture2DComponent'Engine.Default__SceneCapture2DComponent'
   End Object
   SceneCapture=SceneCapture2DComponent0
   Components(0)=SceneCapture2DComponent0
   Begin Object Class=StaticMeshComponent Name=CamMesh0
      StaticMesh=StaticMesh'EditorMeshes.MatineeCam_SM'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="CamMesh0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(1)=CamMesh0
   Components(2)=DrawFrust0
   Name="Default__SceneCapture2DActor"
   ObjectArchetype=SceneCaptureActor'Engine.Default__SceneCaptureActor'
}
