/**
 * SceneCaptureReflectActor
 *
 * Place this actor in a level to capture the reflected/clipped scene
 * to a texture target using a SceneCaptureReflectComponent
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SceneCaptureReflectActor extends SceneCaptureActor
	native
	placeable;

/** draws the face using a static mesh */
var() const StaticMeshComponent StaticMesh;

/** material instance used to apply the target texture to the static mesh */
var transient MaterialInstanceConstant ReflectMaterialInst;

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
      StaticMesh=StaticMesh'EditorMeshes.TexPropPlane'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      bAcceptsLights=False
      CollideActors=False
      Scale3D=(X=4.000000,Y=4.000000,Z=4.000000)
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   StaticMesh=StaticMeshComponent0
   Begin Object Class=SceneCaptureReflectComponent Name=SceneCaptureReflectComponent0
      bSkipUpdateIfTextureUsersOccluded=True
      Name="SceneCaptureReflectComponent0"
      ObjectArchetype=SceneCaptureReflectComponent'Engine.Default__SceneCaptureReflectComponent'
   End Object
   SceneCapture=SceneCaptureReflectComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__SceneCaptureActor:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SceneCaptureActor:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=SceneCaptureReflectComponent0
   Components(2)=StaticMeshComponent0
   Rotation=(Pitch=16384,Yaw=0,Roll=0)
   Name="Default__SceneCaptureReflectActor"
   ObjectArchetype=SceneCaptureActor'Engine.Default__SceneCaptureActor'
}
