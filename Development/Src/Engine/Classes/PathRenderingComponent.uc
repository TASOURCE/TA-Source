/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PathRenderingComponent extends PrimitiveComponent
	native(AI)
	hidecategories(Object)
	editinlinenew;

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
	/**
	 * Creates a new scene proxy for the path rendering component.
	 * @return	Pointer to the FPathRenderingSceneProxy
	 */
	virtual FPrimitiveSceneProxy* CreateSceneProxy();

	virtual void UpdateBounds();

}


defaultproperties
{
   ReplacementPrimitive=None
   HiddenGame=True
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   Name="Default__PathRenderingComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
