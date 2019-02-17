/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class TargetPoint extends KeyPoint
	native;

//Texture to display in the editor when this point is being used as a spawn point
var transient editoronly Texture2D SpawnSpriteTexture;

//Amount of objects that are using this target point as a spawn point
var transient int SpawnRefCount;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/** Increment the number of spawning systems referencing this target point */
	void IncrementSpawnRef();
	/** Decrement the number of spawning systems referencing this target point */
	void DecrementSpawnRef();

}


defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
      Sprite=Texture2D'EditorMaterials.TargetIcon'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.350000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=ArrowComponent Name=Arrow
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(1)=Arrow
   bStatic=False
   bNoDelete=True
   Name="Default__TargetPoint"
   ObjectArchetype=Keypoint'Engine.Default__Keypoint'
}
