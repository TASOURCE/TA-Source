class GFxTrPage_KeybindHotkeys extends GFxTrPage_KeybindAction;
        
function Initialize()
{
    AddActionNumber(ESL_QUICKCLASSES);
    AddActionNumber(ESL_HOTKEY1);
    AddActionNumber(ESL_HOTKEY2);
    AddActionNumber(ESL_HOTKEY3);
    AddActionNumber(ESL_HOTKEY4);
    AddActionNumber(ESL_HOTKEY5);
    AddActionNumber(ESL_HOTKEY6);
    AddActionNumber(ESL_HOTKEY7);
    AddActionNumber(ESL_HOTKEY8);
    AddActionNumber(ESL_HOTKEY9);
}

defaultproperties
{
   PageLabel="HOTKEYS"
   OptionTitles(0)="QUICK CLASSES"
   OptionTitles(1)="PATHFINDER"
   OptionTitles(2)="SENTINEL"
   OptionTitles(3)="INFILTRATOR"
   OptionTitles(4)="SOLDIER"
   OptionTitles(5)="RAIDER"
   OptionTitles(6)="TECHNICIAN"
   OptionTitles(7)="JUGGERNAUT"
   OptionTitles(8)="DOOMBRINGER"
   OptionTitles(9)="BRUTE"
   Name="Default__GFxTrPage_KeybindHotkeys"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
