/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DistributionFloatParticleParameter extends DistributionFloatParameterBase
	native(Particle)
	collapsecategories
	hidecategories(Object)
	editinlinenew;
	
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual UBOOL GetParamValue(UObject* Data, FName ParamName, FLOAT& OutFloat);

}


defaultproperties
{
   Name="Default__DistributionFloatParticleParameter"
   ObjectArchetype=DistributionFloatParameterBase'Engine.Default__DistributionFloatParameterBase'
}