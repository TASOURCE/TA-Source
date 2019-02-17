/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * UT specific search result that exposes some extra fields to the server browser.
 */
class UDKUIDataProvider_SearchResult extends UIDataProvider_Settings
	native;

/** data field tags - cached for faster lookup */
var	const	name	PlayerRatioTag;
var	const	name	GameModeFriendlyNameTag;
var	const	name	ServerFlagsTag;
var	const	name	MapNameTag;

/** the path name to the font containing the icons used to display the server flags */
var	const	string	IconFontPathName;

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

	/**
	 * @return	TRUE if server corresponding to this search result is password protected.
	 */
native function bool IsPrivateServer();

defaultproperties
{
   PlayerRatioTag="PlayerRatio"
   GameModeFriendlyNameTag="GameModeFriendlyName"
   ServerFlagsTag="ServerFlags"
   MapNameTag="CustomMapName"
   Name="Default__UDKUIDataProvider_SearchResult"
   ObjectArchetype=UIDataProvider_Settings'Engine.Default__UIDataProvider_Settings'
}