/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class FogVolumeLinearHalfspaceDensityComponent extends FogVolumeDensityComponent
	native(FogVolume)
	collapsecategories
	hidecategories(Object)
	editinlinenew;

/** The linear distance based density coefficient */
var()	interp	float	PlaneDistanceFactor;

/** The plane that defines the fogged halfspace.  The normal of this plane faces away from the fogged halfspace. */
var		interp	plane	HalfspacePlane;

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
protected:
	// ActorComponent interface.
	virtual void SetParentToWorld(const FMatrix& ParentToWorld);

public:
	// FogVolumeDensityComponent interface.
	virtual class FFogVolumeDensitySceneInfo* CreateFogVolumeDensityInfo(const UPrimitiveComponent* MeshComponent) const;

}


defaultproperties
{
   PlaneDistanceFactor=0.100000
   HalfspacePlane=(W=-300.000000,X=0.000000,Y=0.000000,Z=1.000000)
   Name="Default__FogVolumeLinearHalfspaceDensityComponent"
   ObjectArchetype=FogVolumeDensityComponent'Engine.Default__FogVolumeDensityComponent'
}
