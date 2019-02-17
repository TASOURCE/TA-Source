/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DistributionVectorParameterBase extends DistributionVectorConstant
	abstract
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew;
	
var()	name	ParameterName;
var()	vector	MinInput;
var()	vector	MaxInput;
var()	vector	MinOutput;
var()	vector	MaxOutput;
var()	DistributionFloatParameterBase.DistributionParamMode ParamModes[3];

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
	virtual FVector GetValue(FLOAT F = 0.f, UObject* Data = NULL, INT Extreme = 0, class FRandomStream* InRandomStream = NULL);
	
	virtual UBOOL GetParamValue(UObject* Data, FName ParamName, FVector& OutVector) { return false; }

	/**
	 * Return whether or not this distribution can be baked into a FRawDistribution lookup table
	 */
	virtual UBOOL CanBeBaked() const { return FALSE; }

}


defaultproperties
{
   MaxInput=(X=1.000000,Y=1.000000,Z=1.000000)
   MaxOutput=(X=1.000000,Y=1.000000,Z=1.000000)
   Name="Default__DistributionVectorParameterBase"
   ObjectArchetype=DistributionVectorConstant'Engine.Default__DistributionVectorConstant'
}
