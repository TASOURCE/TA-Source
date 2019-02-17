/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ShadowMapTexture2D extends Texture2D
	native
	noexport
	hidecategories(Object);

/** Bit-field of EShadowmapFlags. */
var int ShadowmapFlags;

defaultproperties
{
   LODGroup=TEXTUREGROUP_Shadowmap
   Name="Default__ShadowMapTexture2D"
   ObjectArchetype=Texture2D'Engine.Default__Texture2D'
}
