class GFxTrPage_KeybindInterface extends GFxTrPage_KeybindAction;
        
function Initialize()
{
    AddActionNumber(ESL_MAINMENU);
    AddActionNumber(ESL_TOGGLE_MENU_CLASS);
    AddActionNumber(ESL_FRIENDS);
    AddActionNumber(ESL_SETTINGS);
    AddActionNumber(ESL_SHOW_SCORES);
    AddActionNumber(ESL_SHOW_OBJECTIVES);
    AddActionNumber(ESL_TYPE_KEY);
    AddActionNumber(ESL_FREE_LOOK);
    AddActionNumber(ESL_SUPPRESS_HELP);
    AddActionNumber(ESL_CHAT);
}

defaultproperties
{
   PageLabel="INTERFACE KEYS"
   OptionTitles(0)="MAIN/GAME MENU"
   OptionTitles(1)="CLASS SELECT"
   OptionTitles(2)="FRIENDS"
   OptionTitles(3)="SETTINGS"
   OptionTitles(4)="TOGGLE SCOREBOARD"
   OptionTitles(5)="TOGGLE OBJECTIVES"
   OptionTitles(6)="QUICK CONSOLE"
   OptionTitles(7)="FREE LOOK"
   OptionTitles(8)="SUPPRESS HELP MSG"
   OptionTitles(9)="CHAT CONSOLE"
   Name="Default__GFxTrPage_KeybindInterface"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
