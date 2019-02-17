class GFxTrPage_KeybindVehicle extends GFxTrPage_KeybindAction;

function Initialize()
{
    AddActionNumber(ESL_HORN);
    AddActionNumber(ESL_SWITCH_SEAT_ONE);
    AddActionNumber(ESL_SWITCH_SEAT_TWO);
    AddActionNumber(ESL_SWITCH_SEAT_THREE);
    AddActionNumber(ESL_SWITCH_SEAT_FOUR);
    AddActionNumber(ESL_SWITCH_SEAT_FIVE);
    AddActionNumber(ESL_SWITCH_SEAT_SIX);
}

defaultproperties
{
   PageLabel="VEHICLE KEYS"
   OptionTitles(0)="HORN"
   OptionTitles(1)="SWITCH TO SEAT 1"
   OptionTitles(2)="SWITCH TO SEAT 2"
   OptionTitles(3)="SWITCH TO SEAT 3"
   OptionTitles(4)="SWITCH TO SEAT 4"
   OptionTitles(5)="SWITCH TO SEAT 5"
   OptionTitles(6)="SWITCH TO SEAT 6"
   Name="Default__GFxTrPage_KeybindVehicle"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
