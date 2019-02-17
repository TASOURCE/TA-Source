class GFxTrPage_KeybindCommunication extends GFxTrPage_KeybindAction;
        
function Initialize()
{
    AddActionNumber(ESL_TALK);
    AddActionNumber(ESL_TALK_TEAM);
    AddActionNumber(ESL_TALK_REPLY);
    AddActionNumber(ESL_BEGIN_VGS);
    AddActionNumber(ESL_SPOT_TARGET);
}

defaultproperties
{
   PageLabel="COMMUNICATION KEYS"
   OptionTitles(0)="CHAT"
   OptionTitles(1)="TEAM CHAT"
   OptionTitles(2)="REPLY TO TELL"
   OptionTitles(3)="BEGIN VGS"
   OptionTitles(4)="SPOT TARGET"
   Name="Default__GFxTrPage_KeybindCommunication"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
