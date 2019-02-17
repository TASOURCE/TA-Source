/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
/** 
 *	Primitive settings for Lightmass
 */
class LightmassPrimitiveSettingsObject extends Object	
	hidecategories(Object)
	dependson(EngineTypes)
	editinlinenew
	native;	

var(Lightmass) LightmassPrimitiveSettings	LightmassSettings;

defaultproperties
{
   LightmassSettings=(EmissiveLightFalloffExponent=2.000000,EmissiveBoost=1.000000,DiffuseBoost=1.000000,SpecularBoost=1.000000,FullyOccludedSamplesFraction=1.000000)
   Name="Default__LightmassPrimitiveSettingsObject"
   ObjectArchetype=Object'Core.Default__Object'
}
