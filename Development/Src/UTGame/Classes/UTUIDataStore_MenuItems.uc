/**
 * Inherited version of the game resource datastore that has UT specific dataproviders.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTUIDataStore_MenuItems extends UDKUIDataStore_MenuItems
	Config(Game);

defaultproperties
{
   MapInfoDataProviderClass=Class'UTGame.UTUIDataProvider_MapInfo'
   ElementProviderTypes(0)=(ProviderTag="MultiplayerMenu",ProviderClassName="UTGame.UTUIDataProvider_MultiplayerMenuItem")
   ElementProviderTypes(1)=(ProviderTag="GameModes",ProviderClassName="UTGame.UTUIDataProvider_GameModeInfo")
   ElementProviderTypes(2)=(ProviderTag="Maps",ProviderClassName="UTGame.UTUIDataProvider_MapInfo")
   ElementProviderTypes(3)=(ProviderTag="TrMaps",ProviderClassName="TribesGame.TrUIDataProvider_MapInfo")
   ElementProviderTypes(4)=(ProviderTag="Mutators",ProviderClassName="UTGame.UTUIDataProvider_Mutator")
   ElementProviderTypes(5)=(ProviderTag="Weapons",ProviderClassName="UTGame.UTUIDataProvider_Weapon")
   ElementProviderTypes(6)=(ProviderTag="DropDownWeapons",ProviderClassName="UTGame.UTUIDataProvider_Weapon")
   Tag="UTMenuItems"
   Name="Default__UTUIDataStore_MenuItems"
   ObjectArchetype=UDKUIDataStore_MenuItems'UDKBase.Default__UDKUIDataStore_MenuItems'
}
