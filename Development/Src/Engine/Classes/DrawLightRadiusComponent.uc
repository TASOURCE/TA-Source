/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DrawLightRadiusComponent extends DrawSphereComponent
	native(Light)
	noexport
	hidecategories(Physics,Collision,PrimitiveComponent,Rendering);

defaultproperties
{
   SphereColor=(B=231,G=239,R=173,A=255)
   SphereSides=32
   ReplacementPrimitive=None
   AlwaysLoadOnClient=False
   AlwaysLoadOnServer=False
   AbsoluteScale=True
   Name="Default__DrawLightRadiusComponent"
   ObjectArchetype=DrawSphereComponent'Engine.Default__DrawSphereComponent'
}