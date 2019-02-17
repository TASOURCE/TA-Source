/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PointLightComponent extends LightComponent
	native(Light)
	hidecategories(Object)
	editinlinenew;

/** used to control when point light shadow mapping goes to a hack mode, the ShadowRadiusMultiplier is multiplied by the radius of object's bounding sphere */
var float	ShadowRadiusMultiplier;

var() interp float	Radius<UIMin=8.0 | UIMax=1024.0>;
/** Controls the radial falloff of the light */
var() interp float	FalloffExponent;
/** falloff for shadow when using LightShadow_Modulate */
var() float ShadowFalloffExponent;
/** The minimum radius at which the point light's shadow begins to attenuate. */
var float MinShadowFalloffRadius;

var   const matrix							CachedParentToWorld; //@todo remove me please
var() const vector							Translation;

/** Plane used for planar shadows on mobile.  */
var const plane ShadowPlane;

var const DrawLightRadiusComponent PreviewLightRadius;

/** The Lightmass settings for this object. */
var(Lightmass) LightmassPointLightSettings LightmassSettings <ScriptOrder=true>;
var const DrawLightRadiusComponent PreviewLightSourceRadius;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native final function k2call SetTranslation(vector NewTranslation);

/** Called from matinee code when LightColor property changes. */
function OnUpdatePropertyLightColor()
{
	UpdateColorAndBrightness();
}

/** Called from matinee code when Brightness property changes. */
function OnUpdatePropertyBrightness()
{
	UpdateColorAndBrightness();
}

cpptext
{
protected:
	/**
	 * Updates the light's PreviewLightRadius.
	 */
	void UpdatePreviewLightRadius();

	// UActorComponent interface.
	virtual void SetParentToWorld(const FMatrix& ParentToWorld);
	virtual void Attach();
	virtual void UpdateTransform();
public:

	// ULightComponent interface.
	virtual FLightSceneInfo* CreateSceneInfo() const;
	virtual UBOOL AffectsBounds(const FBoxSphereBounds& Bounds) const;
	virtual FVector4 GetPosition() const;
	virtual FBox GetBoundingBox() const;
	virtual FLinearColor GetDirectIntensity(const FVector& Point) const;
	virtual ELightComponentType GetLightType() const;

	// update the LocalToWorld matrix
	virtual void SetTransformedToWorld();

	/**
	 * Called after property has changed via e.g. property window or set command.
	 *
	 * @param	PropertyThatChanged	UProperty that has been changed, NULL if unknown
	 */
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	virtual void PostLoad();

	/** Update the PreviewLightSourceRadius */
	virtual void UpdatePreviewLightSourceRadius();

}


defaultproperties
{
   ShadowRadiusMultiplier=1.100000
   Radius=1024.000000
   FalloffExponent=2.000000
   ShadowFalloffExponent=2.000000
   ShadowPlane=(W=0.000000,X=0.000000,Y=0.000000,Z=1.000000)
   LightmassSettings=(LightSourceRadius=100.000000,IndirectLightingScale=1.000000,IndirectLightingSaturation=1.000000,ShadowExponent=2.000000)
   Name="Default__PointLightComponent"
   ObjectArchetype=LightComponent'Engine.Default__LightComponent'
}
