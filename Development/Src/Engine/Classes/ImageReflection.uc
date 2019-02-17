/**
 * An actor which specifies a reflection primitive used by materials that use image based reflections.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ImageReflection extends Actor
	showcategories(Movement)
	AutoExpandCategories(ImageReflection)
	AutoExpandCategories(ImageBasedReflectionComponent)
	native(Mesh)
	placeable;

/** Image reflection component */
var deprecated ImageReflectionComponent ReflectionComponent;

/** Image reflection component */
var() ImageBasedReflectionComponent ImageReflectionComponent;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
protected:
	virtual void PostLoad();

}


defaultproperties
{
   Begin Object Class=ImageBasedReflectionComponent Name=ReflectionComponent0
      ReplacementPrimitive=None
      Name="ReflectionComponent0"
      ObjectArchetype=ImageBasedReflectionComponent'Engine.Default__ImageBasedReflectionComponent'
   End Object
   ImageReflectionComponent=ReflectionComponent0
   Components(0)=ReflectionComponent0
   CollisionType=COLLIDE_CustomDefault
   bNoDelete=True
   bSkipActorPropertyReplication=True
   bOnlyDirtyReplication=True
   NetUpdateFrequency=10.000000
   Name="Default__ImageReflection"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
