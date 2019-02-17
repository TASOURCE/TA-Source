/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


/** contains game-specific map data, attached to the WorldInfo */
class MapInfo extends Object
	native
	abstract
	editinlinenew;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
#if WITH_EDITOR
	virtual void CheckForErrors() {}
#endif

}


defaultproperties
{
   Name="Default__MapInfo"
   ObjectArchetype=Object'Core.Default__Object'
}
