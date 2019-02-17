/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DistributionVector extends Component
	inherits(FCurveEdInterface)
	native
	collapsecategories
	hidecategories(Object)
	editinlinenew
	abstract;

enum EDistributionVectorLockFlags
{
    EDVLF_None,
    EDVLF_XY,
    EDVLF_XZ,
    EDVLF_YZ,
    EDVLF_XYZ
};

enum EDistributionVectorMirrorFlags
{
	EDVMF_Same,
	EDVMF_Different,
	EDVMF_Mirror
};

struct native RawDistributionVector extends RawDistribution
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
 		 * Gets a pointer to the raw distribution if you can just call FRawDistribution::GetValue3 on it, otherwise NULL 
 		 */
 		const FRawDistribution *GetFastRawDistribution();

		/**
		 * Get the value at the specified F
		 */
		FVector GetValue(FLOAT F=0.0f, UObject* Data=NULL, INT LastExtreme=0, class FRandomStream* InRandomStream = NULL);

		/**
		 * Get the min and max values
		 */
		void GetOutRange(FLOAT& MinOut, FLOAT& MaxOut);

		/**
		 * Is this distribution a uniform type? (ie, does it have two values per entry?)
		 */
		inline UBOOL IsUniform() { return LookupTableNumElements == 2; }
	}

	var() export noclear DistributionVector Distribution;
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

/** Script-accessible way to query a vector distribution */
native function vector GetVectorValue(optional float F = 0.0, optional INT LastExtreme = 0);

defaultproperties
{
   bCanBeBaked=True
   bIsDirty=True
   Name="Default__DistributionVector"
   ObjectArchetype=Component'Core.Default__Component'
}
