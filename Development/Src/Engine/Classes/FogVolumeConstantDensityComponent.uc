/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class FogVolumeConstantDensityComponent extends FogVolumeDensityComponent
	native(FogVolume)
	collapsecategories
	hidecategories(Object)
	editinlinenew;

/** The constant density coefficient */
var()	interp	float	Density;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
public:
	// FogVolumeDensityComponent interface.
	virtual class FFogVolumeDensitySceneInfo* CreateFogVolumeDensityInfo(const UPrimitiveComponent* MeshComponent) const;

}


defaultproperties
{
   Density=0.000500
   Name="Default__FogVolumeConstantDensityComponent"
   ObjectArchetype=FogVolumeDensityComponent'Engine.Default__FogVolumeDensityComponent'
}