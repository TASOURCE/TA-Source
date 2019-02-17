class GFxTrPage_KeybindMovement extends GFxTrPage_KeybindAction;

function Initialize()
{
    AddActionNumber(ESL_MOVE_FORWARD);
    AddActionNumber(ESL_MOVE_BACKWARD);
    AddActionNumber(ESL_STRAFE_LEFT);
    AddActionNumber(ESL_STRAFE_RIGHT);
    AddActionNumber(ESL_DO_SKI);
    AddActionNumber(ESL_DO_JUMP);
    AddActionNumber(ESL_DO_JETPACK);
    AddActionNumber(ESL_DO_JUMPJETPACK);
    AddActionNumber(ESL_DO_JUMPSKI);
    AddActionNumber(ESL_TOGGLE_SKI);
}

defaultproperties
{
   PageLabel="MOVEMENT KEYS"
   OptionTitles(0)="MOVE FORWARD"
   OptionTitles(1)="MOVE BACKWARD"
   OptionTitles(2)="STRAFE LEFT"
   OptionTitles(3)="STRAFE RIGHT"
   OptionTitles(4)="SKI"
   OptionTitles(5)="JUMP"
   OptionTitles(6)="JETPACK"
   OptionTitles(7)="JUMP/JETPACK"
   OptionTitles(8)="JUMP/SKI"
   OptionTitles(9)="TOGGLE SKI"
   Name="Default__GFxTrPage_KeybindMovement"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
