class GFxTrPage_KeybindSpecInterface extends GFxTrPage_KeybindAction;
        
function Initialize()
{
    AddActionNumber(ESL_SPECTATE_SHOWCONTROLS);
    AddActionNumber(ESL_SPECTATE_SHOWHUD);
    AddActionNumber(ESL_SPECTATE_SHOWSCORES);
    AddActionNumber(ESL_SPECTATE_TYPE_KEY);
    AddActionNumber(ESL_SPECTATE_CHANGETEAM);
    AddActionNumber(ESL_SPECTATE_VEHICLES);
    AddActionNumber(ESL_SPECTATE_OBJECTIVES);
}

defaultproperties
{
   PageLabel="SPEC. INTERFACE KEYS"
   OptionTitles(0)="SHOW CONTROLS"
   OptionTitles(1)="SHOW HUD"
   OptionTitles(2)="SHOW SCORES"
   OptionTitles(3)="QUICK CONSOLE"
   OptionTitles(4)="CHOOSE TEAM"
   OptionTitles(5)="SHOW VEHICLE TAB"
   OptionTitles(6)="SHOW OBJECTIVE TAB"
   Name="Default__GFxTrPage_KeybindSpecInterface"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
