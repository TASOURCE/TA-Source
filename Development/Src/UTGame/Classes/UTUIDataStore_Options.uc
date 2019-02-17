/**
 * Inherited version of the game resource datastore that exposes sets of options to the UI.
 * These option sets are then used to autogenerate widgets.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTUIDataStore_Options extends UDKUIDataStore_Options;

defaultproperties
{
   ElementProviderTypes(0)=(ProviderTag="OptionSets",ProviderClassName="UTGame.UTUIDataProvider_MenuOption")
   Name="Default__UTUIDataStore_Options"
   ObjectArchetype=UDKUIDataStore_Options'UDKBase.Default__UDKUIDataStore_Options'
}
