/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class CoverGroupRenderingComponent extends PrimitiveComponent
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual FPrimitiveSceneProxy* CreateSceneProxy();
	virtual void UpdateBounds();
	virtual UBOOL ShouldRecreateProxyOnUpdateTransform() const;

}


defaultproperties
{
   ReplacementPrimitive=None
   HiddenGame=True
   Name="Default__CoverGroupRenderingComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
