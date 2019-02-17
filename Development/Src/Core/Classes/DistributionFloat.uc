/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DistributionFloat extends Component
	inherits(FCurveEdInterface)
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew
	abstract;

struct native RawDistributionFloat extends RawDistribution
{
	structcpptext
	{
	#if !CONSOLE
		/**
		 * Initialize a raw distribution from the original Unreal distribution
		 */
		void Initialize();
	#endif
		 	
		/**
		 * Gets a pointer to the raw distribution if you can just call FRawDistribution::GetValue1 on it, otherwise NULL 
		 */
		const FRawDistribution* GetFastRawDistribution();

		/**
		 * Get the value at the specified F
		 */
		FLOAT GetValue(FLOAT F=0.0f, UObject* Data=NULL, class FRandomStream* InRandomStream = NULL);

		/**
		 * Get the min and max values
		 */
		void GetOutRange(FLOAT& MinOut, FLOAT& MaxOut);

		/**
		 * Is this distribution a uniform type? (ie, does it have two values per entry?)
		 */
		inline UBOOL IsUniform() { return LookupTableNumElements == 2; }
	}

	var() export noclear DistributionFloat Distribution;
};

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



/** Can this variable be baked out to a FRawDistribution? Should be TRUE 99% of the time*/
var(Baked) bool bCanBeBaked;

/** Set internally when the distribution is updated so that that FRawDistribution can know to update itself*/
var bool bIsDirty;

/** Script-accessible way to query a float distribution */
native function float GetFloatValue(optional float F = 0.0);

defaultproperties
{
   bCanBeBaked=True
   bIsDirty=True
   Name="Default__DistributionFloat"
   ObjectArchetype=Component'Core.Default__Component'
}
