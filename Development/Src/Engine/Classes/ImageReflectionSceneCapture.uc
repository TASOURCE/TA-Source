/**
 * An actor which specifies a reflection primitive used by materials that use image based reflections.
 * This actor also captures the scene in a texture at lighting build time and uses that texture for image reflections.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ImageReflectionSceneCapture extends ImageReflection
	showcategories(Movement)
	AutoExpandCategories(ImageReflectionSceneCapture)
	AutoExpandCategories(ImageBasedReflectionComponent)
	native(Mesh)
	placeable;

/** 
 * Distance in world units from the image plane that defines the depth range that will be captured.  
 * Anything outside of the depth range will be clipped away. 
 * Changes will be propagated on the next lighting build.
 */
var() float DepthRange;

/** Maximum linear space color value that will be stored in the generated texture. */
var() float ColorRange;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
protected:
	virtual void PostDuplicate();

}


defaultproperties
{
   DepthRange=200.000000
   ColorRange=4.000000
   Begin Object Class=ImageBasedReflectionComponent Name=ReflectionComponent0 Archetype=ImageBasedReflectionComponent'Engine.Default__ImageReflection:ReflectionComponent0'
      ReplacementPrimitive=None
      Name="ReflectionComponent0"
      ObjectArchetype=ImageBasedReflectionComponent'Engine.Default__ImageReflection:ReflectionComponent0'
   End Object
   ImageReflectionComponent=ReflectionComponent0
   Components(0)=ReflectionComponent0
   Name="Default__ImageReflectionSceneCapture"
   ObjectArchetype=ImageReflection'Engine.Default__ImageReflection'
}
