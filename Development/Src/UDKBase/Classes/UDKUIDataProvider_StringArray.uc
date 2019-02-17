/**
 * Dataprovider that provides an array of strings.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKUIDataProvider_StringArray extends UDKUIDataProvider_SimpleElementProvider
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

/** Strings being provided by this provider. */
var array<string> Strings;

/** @return Returns the number of elements(rows) provided. */
native function int GetElementCount();

defaultproperties
{
   Name="Default__UDKUIDataProvider_StringArray"
   ObjectArchetype=UDKUIDataProvider_SimpleElementProvider'UDKBase.Default__UDKUIDataProvider_SimpleElementProvider'
}
