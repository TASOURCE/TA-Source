/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class GFxImportCommandlet extends Commandlet
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * A utility that imports and/or re-imports SWF assets
 *
 * @param Params the string containing the parameters for the commandlet
 */
event int Main(string Params);

defaultproperties
{
   HelpDescription="Imports or reimports swf movie files."
   HelpUsage="gamename gfximport [optional_list_of_paths]"
   HelpWebLink="https://udn.epicgames.com/Three/ScaleformImport"
   HelpParamNames(0)="optional_list_of_paths"
   HelpParamDescriptions(0)="The relative paths to .swf files that you want to import.  These files must exist within the <GameDir>/Flash directory.  In order to re-import files that are already imported into UE3, simply run the commandlet with no arguments.  The commandlet will reimport all SwfMovies for which the .swf file on disk is newer that the one imported."
   Name="Default__GFxImportCommandlet"
   ObjectArchetype=Commandlet'Core.Default__Commandlet'
}
