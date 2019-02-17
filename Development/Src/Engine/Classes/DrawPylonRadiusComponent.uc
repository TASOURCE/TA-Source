/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DrawPylonRadiusComponent extends DrawSphereComponent
	native
	hidecategories(Physics,Collision,PrimitiveComponent,Rendering);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	FPrimitiveSceneProxy* CreateSceneProxy();
	void UpdateBounds();
	void Attach();

}


defaultproperties
{
   SphereColor=(B=231,G=239,R=173,A=255)
   SphereSides=32
   ReplacementPrimitive=None
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   AbsoluteScale=True
   Name="Default__DrawPylonRadiusComponent"
   ObjectArchetype=DrawSphereComponent'Engine.Default__DrawSphereComponent'
}
