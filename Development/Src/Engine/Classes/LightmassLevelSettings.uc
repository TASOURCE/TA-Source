/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
/** 
 *	Persistent level settings for Lightmass
 */
class LightmassLevelSettings extends Object	
	hidecategories(Object)
	deprecated
	native;	

/** 
 * Number of times light is allowed to bounce off of surfaces, starting from the light source. 
 * 0 is direct lighting only, 1 is one bounce, etc. 
 * Bounce 1 takes the most time to calculate, followed by bounce 2.  Successive bounces are nearly free.
 */
var(General)	int			NumIndirectLightingBounces;
/** 
 *	Color that rays which miss the scene will pick up.
 */
var(General)	color		EnvironmentColor;
var(General)	float		EnvironmentIntensity;
/** Scales the emissive contribution of all materials in the scene. */
var(General)	float		EmissiveBoost <UIMin=0.0 | UIMax=4.0>;
/** Scales the diffuse contribution of all materials in the scene. */
var(General)	float		DiffuseBoost <UIMin=0.0 | UIMax=4.0>;
/** Scales the specular contribution of all materials in the scene. */
var				float		SpecularBoost <UIMin=0.0 | UIMax=4.0>;
/** If TRUE, AmbientOcclusion will be enabled. */
var(Occlusion)	bool		bUseAmbientOcclusion;
/** If TRUE, override normal direct and indirect lighting with just the AO term. */
var(Occlusion)	bool		bVisualizeAmbientOcclusion;
/** How much of the AO to apply to direct lighting. */
var(Occlusion)	float		DirectIlluminationOcclusionFraction;
/** How much of the AO to apply to indirect lighting. */
var(Occlusion)	float		IndirectIlluminationOcclusionFraction;
/** Higher exponents increase contrast. */
var(Occlusion)	float		OcclusionExponent;
/** Fraction of samples taken that must be occluded in order to reach full occlusion. */
var(Occlusion)	float		FullyOccludedSamplesFraction;
/** Maximum distance for an object to cause occlusion on another object. */
var(Occlusion)	float		MaxOcclusionDistance;

defaultproperties
{
   NumIndirectLightingBounces=3
   EnvironmentIntensity=1.000000
   EmissiveBoost=1.000000
   DiffuseBoost=5.000000
   SpecularBoost=1.000000
   DirectIlluminationOcclusionFraction=0.500000
   IndirectIlluminationOcclusionFraction=1.000000
   OcclusionExponent=1.000000
   FullyOccludedSamplesFraction=1.000000
   MaxOcclusionDistance=200.000000
   Name="Default__LightmassLevelSettings"
   ObjectArchetype=Object'Core.Default__Object'
}
