/* epic ===============================================
* class BookMark
*
* A camera position the current level.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class BookMark extends Object
	hidecategories(Object)
	native;

/** Camera position/rotation */
var() vector	Location;
var() rotator	Rotation;

// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__BookMark"
   ObjectArchetype=Object'Core.Default__Object'
}
