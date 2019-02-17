/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * InterpData
 *
 *
 * Actual interpolation data, containing keyframe tracks, event tracks etc.
 * This does not contain any Actor references or state, so can safely be stored in
 * packages, shared between multiple Actors/SeqAct_Interps etc.
 */

class InterpData extends SequenceVariable
	native(Sequence);



/** Duration of interpolation sequence - in seconds. */
var float				InterpLength;

/** Position in Interp to move things to for path-building in editor. */
var float				PathBuildTime;

/** Actual interpolation data. Groups of InterpTracks. */
var	export array<InterpGroup>	InterpGroups;

/** Used for curve editor to remember curve-editing setup. Only loaded in editor. */
var	export InterpCurveEdSetup	CurveEdSetup;

/** Used for filtering which tracks are currently visible. */
var editoronly array<InterpFilter>	InterpFilters;

/** The currently selected filter. */
var editoronly InterpFilter			SelectedFilter;

/** Array of default filters. */
var editoronly transient array<InterpFilter> DefaultFilters;

/** Used in editor for defining sections to loop, stretch etc. */
var	float				EdSectionStart;

/** Used in editor for defining sections to loop, stretch etc. */
var	float				EdSectionEnd;

/** If TRUE, then the matinee should be baked and pruned at cook time. */
var() bool bShouldBakeAndPrune;

struct native AnimSetBakeAndPruneStatus
{
	/** Name of the anim set referenced in Matinee */
	var() editconst string	AnimSetName;
	/** If TRUE, the animation is in a GroupAnimSets array, but is unused */
	var() editconst	bool	bReferencedButUnused;
	/** If TRUE, skip BakeAndPrune on this anim set during cooking */
	var() bool				bSkipBakeAndPrune;
};

/** AnimSets referenced by this matinee, and whether to allow bake and prune on them during cooking. */
var() editfixedsize array<AnimSetBakeAndPruneStatus> BakeAndPruneStatus;

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

cpptext
{
	// UObject interface
	/**
	 * This function is being called after all objects referenced by this object have been serialized.
	 */
	virtual void PostLoad(void);

	// SequenceVariable interface
	virtual FString GetValueStr();

	/** Search through all InterpGroups in this InterpData to find a group whose GroupName matches the given name. Returns INDEX_NONE if group not found. */
	INT FindGroupByName( FName GroupName );
	INT FindGroupByName( const FString& InGroupName );

	void FindTracksByClass(UClass* TrackClass, TArray<class UInterpTrack*>& OutputTracks);
	class UInterpGroupDirector* FindDirectorGroup();
	void GetAllEventNames(TArray<FName>& OutEventNames);

#if WITH_EDITOR
	void UpdateBakeAndPruneStatus();
#endif

}


defaultproperties
{
   InterpLength=5.000000
   EdSectionEnd=1.000000
   ObjName="Matinee Data"
   ObjColor=(B=0,G=128,R=255,A=255)
   Name="Default__InterpData"
   ObjectArchetype=SequenceVariable'Engine.Default__SequenceVariable'
}
