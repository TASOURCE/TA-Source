/**
 * SceneCapturePortalActor
 *
 * Place this actor in a level to capture the scene
 * to a texture target using a SceneCapturePortalComponent
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SceneCapturePortalActor extends SceneCaptureReflectActor
	native
	placeable;


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
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent2
      StaticMesh=StaticMesh'EditorMeshes.TexPropPlane'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="StaticMeshComponent2"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   StaticMesh=StaticMeshComponent2
   Begin Object Class=SceneCapturePortalComponent Name=SceneCapturePortalComponent0
      Name="SceneCapturePortalComponent0"
      ObjectArchetype=SceneCapturePortalComponent'Engine.Default__SceneCapturePortalComponent'
   End Object
   SceneCapture=SceneCapturePortalComponent0
   Components(0)=SceneCapturePortalComponent0
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent1
      StaticMesh=StaticMesh'EditorMeshes.MatineeCam_SM'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale3D=(X=-1.000000,Y=1.000000,Z=1.000000)
      Name="StaticMeshComponent1"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(1)=StaticMeshComponent1
   Components(2)=StaticMeshComponent2
   Rotation=(Pitch=0,Yaw=0,Roll=0)
   Name="Default__SceneCapturePortalActor"
   ObjectArchetype=SceneCaptureReflectActor'Engine.Default__SceneCaptureReflectActor'
}
