class GFxTrPage_KeybindSpecMovement extends GFxTrPage_KeybindAction;

function Initialize()
{
    AddActionNumber(ESL_SPECTATE_MOVEFORWARD);
    AddActionNumber(ESL_SPECTATE_MOVEBACKWARD);
    AddActionNumber(ESL_SPECTATE_MOVEUP);
    AddActionNumber(ESL_SPECTATE_MOVEDOWN);
    AddActionNumber(ESL_SPECTATE_TURNLEFT);
    AddActionNumber(ESL_SPECTATE_TURNRIGHT);
    AddActionNumber(ESL_SPECTATE_STRAFELEFT);
    AddActionNumber(ESL_SPECTATE_STRAFERIGHT);
    AddActionNumber(ESL_SPECTATE_CAMERAX);
    AddActionNumber(ESL_SPECTATE_CAMERAY);
    AddActionNumber(ESL_SPECTATE_SPEEDINCREASE);
    AddActionNumber(ESL_SPECTATE_SPEEDDECREASE);
}

defaultproperties
{
   PageLabel="SPEC. MOVEMENT KEYS"
   OptionTitles(0)="MOVE FORWARD"
   OptionTitles(1)="MOVE BACKWARD"
   OptionTitles(2)="MOVE UP"
   OptionTitles(3)="MOVE DOWN"
   OptionTitles(4)="TURN LEFT"
   OptionTitles(5)="TURN RIGHT"
   OptionTitles(6)="STRAFE LEFT"
   OptionTitles(7)="STRAFE RIGHT"
   OptionTitles(8)="CAMERA X"
   OptionTitles(9)="CAMERA Y"
   OptionTitles(10)="SPEED INCREASE"
   OptionTitles(11)="SPEED DECREASE"
   Name="Default__GFxTrPage_KeybindSpecMovement"
   ObjectArchetype=GFxTrPage_KeybindAction'TribesGame.Default__GFxTrPage_KeybindAction'
}
