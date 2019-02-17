class GFxTrPage_KeybindSpecTargeting extends GFxTrPage_KeybindAction;
 
function Initialize()
{
    AddActionNumber(ESL_SPECTATE_VIEWSELF);
    AddActionNumber(ESL_SPECTATE_VIEWPREVPLAYER);
    AddActionNumber(ESL_SPECTATE_VIEWNEXTPLAYER);
    AddActionNumber(ESL_SPECTATE_VIEWBOOKMARKS);
    AddActionNumber(ESL_SPECTATE_VIEWGENERATORS);
    AddActionNumber(ESL_SPECTATE_VIEWSTANDS);
    AddActionNumber(ESL_SPECTATE_VIEWFLAGS);
    AddActionNumber(ESL_SPECTATE_FASTESTPLAYER);
    AddActionNumber(ESL_SPECTATE_LOCKVIEW);
}

defaultproperties
{
   PageLabel="SPEC. TARGETING KEYS"
   OptionTitles(0)="VIEW SELF"
   OptionTitles(1)="VIEW PREV PLAYER"
   OptionTitles(2)="VIEW NEXT PLAYER"
   OptionTitles(3)="VIEW BOOKMARKS"
   OptionTitles(4)="VIEW GENERATORS"
   OptionTitles(5)="VIEW FLAG STANDS"
   OptionTitles(6)="VIEW FLAGS"
   OptionTitles(7)="VIEW FASTEST PLAYER"
   OptionTitles(8)="LOCK VIEW TO PLAYER"
   Name="Default__GFxTrPage_KeybindSpecTargeting"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
