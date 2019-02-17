/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class RouteRenderingComponent extends PrimitiveComponent
	native(AI)
	hidecategories(Object)
	editinlinenew;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual FPrimitiveSceneProxy* CreateSceneProxy();
	virtual void UpdateBounds();

}


defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__RouteRenderingComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
