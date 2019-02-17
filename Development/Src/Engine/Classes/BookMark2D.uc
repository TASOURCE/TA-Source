/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Simple class to store 2D camera information.
 */
class BookMark2D extends Object
	hidecategories(Object)
	native;

/** Zoom of the camera */
var() float		Zoom2D;

/** Location of the camera */
var() intpoint	Location;

// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__BookMark2D"
   ObjectArchetype=Object'Core.Default__Object'
}
