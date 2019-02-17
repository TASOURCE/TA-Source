/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class LevelGridVolumeRenderingComponent extends PrimitiveComponent
	native
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
// (cpptext)

cpptext
{
	/**
	 * Creates a new scene proxy for the path rendering component.
	 * @return	Pointer to the FPathRenderingSceneProxy
	 */
	virtual FPrimitiveSceneProxy* CreateSceneProxy();

	/** Sets the bounds of this primitive */
	virtual void UpdateBounds();

}


defaultproperties
{
   ReplacementPrimitive=None
   HiddenGame=True
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   Name="Default__LevelGridVolumeRenderingComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
