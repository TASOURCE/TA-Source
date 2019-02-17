class GFxTrPage_KeybindGameplay extends GFxTrPage_KeybindAction;

function Initialize()
{
    AddActionNumber(ESL_TEAM_SELECT);
    AddActionNumber(ESL_THIRD_PERSON);
    AddActionNumber(ESL_DROP_FLAG);
    AddActionNumber(ESL_SUICIDE);
}

defaultproperties
{
   PageLabel="GAMEPLAY KEYS"
   OptionTitles(0)="CHANGE TEAM"
   OptionTitles(1)="THIRD-PERSON CAM"
   OptionTitles(2)="DROP FLAG"
   OptionTitles(3)="SUICIDE"
   Name="Default__GFxTrPage_KeybindGameplay"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
