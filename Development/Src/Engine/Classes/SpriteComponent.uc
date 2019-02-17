/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SpriteComponent extends PrimitiveComponent
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew;

var() Texture2D	Sprite;
var() bool		bIsScreenSizeScaled;
var() float		ScreenSize;
var() float     U, UL, V, VL;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Change the sprite texture used by this component */
simulated native function SetSprite(Texture2D NewSprite);

/** Change the UVs used by this component */
simulated native function SetUV(int NewU, int NewUL, int NewV, int NewVL);

/** Change the sprite texture and UVs used by this component */
simulated native function SetSpriteAndUV(Texture2D NewSprite, int NewU, int NewUL, int NewV, int NewVL);

cpptext
{
	virtual FPrimitiveSceneProxy* CreateSceneProxy();
	virtual void UpdateBounds();

}


defaultproperties
{
   Sprite=Texture2D'EditorResources.S_Actor'
   ScreenSize=0.100000
   ReplacementPrimitive=None
   Name="Default__SpriteComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
