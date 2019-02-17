/**
 * SceneCaptureCubeMapActor
 *
 * Place this actor in the level iot capture it to a cube map render target texture.
 * Uses a Cube map scene capture component
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SceneCaptureCubeMapActor extends SceneCaptureActor
	native
	placeable;

/** for visualizing the cube capture */
var const StaticMeshComponent StaticMesh;

/** material instance used to apply the target texture to the static mesh */
var transient MaterialInstanceConstant CubeMaterialInst;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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

	// AActor interface

	virtual void Spawned();

	// UObject interface

	virtual void FinishDestroy();
	virtual void PostLoad();

private:

	/**
	* Init the helper components 
	*/
	virtual void Init();

}


defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      StaticMesh=StaticMesh'EditorMeshes.TexPropSphere'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      bAcceptsLights=False
      CollideActors=False
      Scale3D=(X=0.600000,Y=0.600000,Z=0.600000)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   StaticMesh=StaticMeshComponent0
   Begin Object Class=SceneCaptureCubeMapComponent Name=SceneCaptureCubeMapComponent0
      Name="SceneCaptureCubeMapComponent0"
      ObjectArchetype=SceneCaptureCubeMapComponent'Engine.Default__SceneCaptureCubeMapComponent'
   End Object
   SceneCapture=SceneCaptureCubeMapComponent0
   Components(0)=SceneCaptureCubeMapComponent0
   Components(1)=StaticMeshComponent0
   Name="Default__SceneCaptureCubeMapActor"
   ObjectArchetype=SceneCaptureActor'Engine.Default__SceneCaptureActor'
}
