/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DistributionVectorParticleParameter extends DistributionVectorParameterBase
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
	virtual UBOOL GetParamValue(UObject* Data, FName ParamName, FVector& OutVector);

}


defaultproperties
{
   Name="Default__DistributionVectorParticleParameter"
   ObjectArchetype=DistributionVectorParameterBase'Engine.Default__DistributionVectorParameterBase'
}
