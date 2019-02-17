/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Warfare specific datastore for TDM game creation
 */
class UTDataStore_GameSettingsDM extends UIDataStore_OnlineGameSettings;

defaultproperties
{
   GameSettingsCfgList(0)=(GameSettingsClass=Class'UTGame.UTGameSettingsDM',SettingsName="UTGameSettingsDM")
   GameSettingsCfgList(1)=(GameSettingsClass=Class'UTGame.UTGameSettingsTDM',SettingsName="UTGameSettingsTDM")
   GameSettingsCfgList(2)=(GameSettingsClass=Class'UTGame.UTGameSettingsCTF',SettingsName="UTGameSettingsCTF")
   GameSettingsCfgList(3)=(GameSettingsClass=Class'UTGame.UTGameSettingsVCTF',SettingsName="UTGameSettingsVCTF")
   Tag="UTGameSettings"
   Name="Default__UTDataStore_GameSettingsDM"
   ObjectArchetype=UIDataStore_OnlineGameSettings'Engine.Default__UIDataStore_OnlineGameSettings'
}
