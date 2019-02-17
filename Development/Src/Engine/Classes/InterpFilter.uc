/** 
 * InterpFilter.uc: Filter class for filtering matinee groups.  
 * By default no groups are filtered.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class InterpFilter extends Object
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Caption for this filter. */
var string Caption;

cpptext
{
	/** 
	 * Given a interpdata object, updates visibility of groups and tracks based on the filter settings
	 *
	 * @param InData			Data to filter.
	 */
	virtual void FilterData(class USeqAct_Interp* InData);

}


defaultproperties
{
   Name="Default__InterpFilter"
   ObjectArchetype=Object'Core.Default__Object'
}
