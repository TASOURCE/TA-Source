/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class FogVolumeConeDensityComponent extends FogVolumeDensityComponent
	native(FogVolume)
	collapsecategories
	hidecategories(Object)
	editinlinenew;

/** This is the density at the center of the cone, which will be the maximum. */
var()	interp	float	MaxDensity;

/** The cone's vertex in world space. */
var()	interp	vector	ConeVertex;

/** The cone's radius. */
var()	interp	float	ConeRadius;

/** Direction of the cone */
var()	interp	vector	ConeAxis;

/** Angle from the axis that limits the cone's volume */
var()	interp	float	ConeMaxAngle;

/** A preview component for visualizing the cone in the editor. */
var const DrawLightConeComponent PreviewCone;

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
// (cpptext)

cpptext
{
protected:
	// ActorComponent interface.
	virtual void SetParentToWorld(const FMatrix& ParentToWorld);
	virtual void Attach();

public:
	// FogVolumeDensityComponent interface.
	virtual class FFogVolumeDensitySceneInfo* CreateFogVolumeDensityInfo(const UPrimitiveComponent* MeshComponent) const;

}


defaultproperties
{
   MaxDensity=0.002000
   ConeRadius=600.000000
   ConeAxis=(X=0.000000,Y=0.000000,Z=-1.000000)
   ConeMaxAngle=30.000000
   Name="Default__FogVolumeConeDensityComponent"
   ObjectArchetype=FogVolumeDensityComponent'Engine.Default__FogVolumeDensityComponent'
}
