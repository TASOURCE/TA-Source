/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Simple class to represent bookmarks in Kismet.
 */
class KismetBookMark extends BookMark2D
	hidecategories(Object)
	native;

/** Name of the sequence the bookmark applies to */
var string	BookMarkSequencePathName;

// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__KismetBookMark"
   ObjectArchetype=BookMark2D'Engine.Default__BookMark2D'
}
