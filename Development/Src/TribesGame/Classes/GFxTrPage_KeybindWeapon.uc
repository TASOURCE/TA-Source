class GFxTrPage_KeybindWeapon extends GFxTrPage_KeybindAction;

function Initialize()
{
    AddActionNumber(ESL_FIRE_WEAPON);
    AddActionNumber(ESL_ACTIVATE_MELEE);
    AddActionNumber(ESL_ACTIVATE_PACK);
    AddActionNumber(ESL_ACTIVATE_BELT);
    AddActionNumber(ESL_RELOAD);
    AddActionNumber(ESL_USE);
    AddActionNumber(ESL_DO_ZOOM);
    AddActionNumber(ESL_WEAPON_SWITCH_FILTER);
    AddActionNumber(ESL_WEAPON_SWITCH_FILTER2);
    AddActionNumber(ESL_CALLIN_ONE);
    AddActionNumber(ESL_CALLIN_TWO);
    AddActionNumber(ESL_CALLIN_THREE);
    AddActionNumber(ESL_NEXT_WEAPON);
    AddActionNumber(ESL_WEAPON_PRIMARY);
    AddActionNumber(ESL_WEAPON_SECONDARY);
}

defaultproperties
{
   PageLabel="WEAPON KEYS"
   OptionTitles(0)="FIRE"
   OptionTitles(1)="MELEE"
   OptionTitles(2)="USE PACK"
   OptionTitles(3)="USE BELT"
   OptionTitles(4)="RELOAD"
   OptionTitles(5)="INTERACT"
   OptionTitles(6)="ZOOM"
   OptionTitles(7)="PREVIOUS WEAPON"
   OptionTitles(8)="NEXT WEAPON"
   OptionTitles(9)="CALL-IN 1"
   OptionTitles(10)="CALL-IN 2"
   OptionTitles(11)="CALL-IN 3"
   OptionTitles(12)="SWAP WEAPON"
   OptionTitles(13)="SWAP TO PRIMARY"
   OptionTitles(14)="SWAP TO SECONDARY"
   Name="Default__GFxTrPage_KeybindWeapon"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
