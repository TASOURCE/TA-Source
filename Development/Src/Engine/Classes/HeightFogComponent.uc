/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class HeightFogComponent extends ActorComponent
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew;

/** True if the fog is enabled. */
var()	const			bool	bEnabled;
/** z-height for the fog plane - updated by the owning actor */
var		const			float	Height;
/** affects the scale for the fog layer's thickness */
var()	const	interp	float	Density;
/** affects the inscattering color */
var()	const	interp	float	LightBrightness;
/** Fog color to blend with the scene */
var()	const	interp	color	LightColor;
/** The distance at which light passing through the fog is 100% extinguished. */
var()	const	interp	float	ExtinctionDistance;
/** distance at which fog starts affecting the scene */
var()	const	interp	float	StartDistance;

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

/**
 * Changes the enabled state of the height fog component.
 * @param bSetEnabled - The new value for bEnabled.
 */
final native function SetEnabled(bool bSetEnabled);

cpptext
{
protected:
	// ActorComponent interface.
	virtual void SetParentToWorld(const FMatrix& ParentToWorld);
	virtual void Attach();
	virtual void UpdateTransform();
	virtual void Detach( UBOOL bWillReattach = FALSE );
public:

}


defaultproperties
{
   bEnabled=True
   Density=0.000050
   LightBrightness=0.100000
   LightColor=(B=255,G=255,R=255,A=0)
   ExtinctionDistance=100000000.000000
   Name="Default__HeightFogComponent"
   ObjectArchetype=ActorComponent'Engine.Default__ActorComponent'
}
