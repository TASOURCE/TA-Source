/**********************************************************************

Filename    :   GFxUDKFrontEnd_HostGame.uc
Content     :   GFx-UDK Front End Implementaiton

Copyright   :   (c) 2010 Scaleform Corp. All Rights Reserved.

Notes       :   Implementation of the Host Game view. Logic within this
                class is unique to Instant Action and is not shared with 
                Host Game, which also inherits from LaunchGame.

                Associated Flash content: udk_instant_action.fla

Licensees may use this file in accordance with the valid Scaleform
Commercial License Agreement provided with the software.

This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING 
THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR ANY PURPOSE.

**********************************************************************/
class GFxUDKFrontEnd_InstantAction extends GFxUDKFrontEnd_LaunchGame
    config(UI);


function OnViewActivated()
{
	Super.OnViewActivated();
	class'UIRoot'.static.SetDataStoreStringValue("<Registry:StandaloneGame>", "1");
}

function OnStartGame_Confirm()
{
    local Settings GameSettings;
	local string URL;
	local string GameExec;
	local string Mutators;
	local int OutValue;

	// Play the startgame sound
	//PlayUISound('StartGame');

	// Save scene settings values
	//SaveSceneDataValues(FALSE);

	// Generate settings URL
	GameSettings = SettingsDataStore.GetCurrentGameSettings();
	GameSettings.SetStringSettingValue(CONTEXT_VSBOTS, CONTEXT_VSBOTS_NONE, FALSE);
	GameSettings.BuildURL(URL);

	// Num play needs to be the number of bots + 1 (the player).
	if(GameSettings.GetIntProperty(PROPERTY_NUMBOTS, OutValue))
	{
		URL $= "?NumPlay=" $(OutValue+1);
	}

	// Append any mutators
	Mutators = class'GFxUDKFrontEnd_Mutators'.static.GetEnabledMutators();
	if(Len(Mutators) > 0)
	{
		URL = URL $ "?mutator=" $ Mutators;
	}

	URL = URL $ GetCommonOptionsURL();

	// Start the game.
	GameExec = "open " $ GetStringFromMarkup("<Registry:SelectedMap>") $ "?game=" $ GetStringFromMarkup("<Registry:SelectedGameMode>") $ URL;
	;
	ConsoleCommand(GameExec);
}

defaultproperties
{
   ListOptions(0)=(OptionName="GameMode",OptionLabel="GAME MODE",OptionDesc="Change the game type.")
   ListOptions(1)=(OptionName="MapSelect",OptionLabel="MAP",OptionDesc="Change the field of battle.")
   ListOptions(2)=(OptionName="Settings",OptionLabel="SETTINGS",OptionDesc="Modify the game settings.")
   ListOptions(3)=(OptionName="Mutators",OptionLabel="MUTATORS",OptionDesc="Configure the mutators for this match.")
   ListOptions(4)=(OptionName="StartGame",OptionLabel="START GAME",OptionDesc="Launch the match.")
   ViewTitle="INSTANT ACTION"
   Name="Default__GFxUDKFrontEnd_InstantAction"
   ObjectArchetype=GFxUDKFrontEnd_LaunchGame'UTGame.Default__GFxUDKFrontEnd_LaunchGame'
}
