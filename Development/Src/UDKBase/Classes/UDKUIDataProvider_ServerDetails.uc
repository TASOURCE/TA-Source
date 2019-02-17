/**
 * Dataprovider that gives a key/value list of details for a server given its search result row.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKUIDataProvider_ServerDetails extends UDKUIDataProvider_SimpleElementProvider
	native;

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

/** Provider that has server information. */
var transient int	SearchResultsRow;

/** @return Returns a reference to the search results provider that is used to generate data for this class. */
native function UIDataProvider_Settings GetSearchResultsProvider();

/** Returns the number of elements in the list. */
native function int GetElementCount();

defaultproperties
{
   Name="Default__UDKUIDataProvider_ServerDetails"
   ObjectArchetype=UDKUIDataProvider_SimpleElementProvider'UDKBase.Default__UDKUIDataProvider_SimpleElementProvider'
}
