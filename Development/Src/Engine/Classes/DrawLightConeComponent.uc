/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DrawLightConeComponent extends DrawConeComponent
	native(Light)
	hidecategories(Physics,Collision,PrimitiveComponent,Rendering);

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
	 * Creates a proxy to represent the primitive to the scene manager in the rendering thread.
	 * @return The proxy object.
	 */
	virtual FPrimitiveSceneProxy* CreateSceneProxy();

}


defaultproperties
{
   ReplacementPrimitive=None
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   AbsoluteScale=True
   Name="Default__DrawLightConeComponent"
   ObjectArchetype=DrawConeComponent'Engine.Default__DrawConeComponent'
}
