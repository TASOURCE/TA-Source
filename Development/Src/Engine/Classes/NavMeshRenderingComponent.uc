/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshRenderingComponent extends PrimitiveComponent
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
	 * @return	Pointer to the FNavMeshRenderingSceneProxy
	 */
	virtual FPrimitiveSceneProxy* CreateSceneProxy();

	virtual void UpdateBounds();

}


defaultproperties
{
   ReplacementPrimitive=None
   HiddenGame=True
   bSelectable=False
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   Name="Default__NavMeshRenderingComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
