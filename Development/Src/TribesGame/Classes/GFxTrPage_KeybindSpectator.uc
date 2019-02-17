class GFxTrPage_KeybindSpectator extends GFxTrPage;

function Initialize()
{
    AddActionPage(Pages.KeybindSpecMovementPage);
    AddActionPage(Pages.KeybindSpecTargetingPage);
    AddActionPage(Pages.KeybindSpecInterfacePage);
}

defaultproperties
{
   PageLabel="SPECTATOR KEYBINDINGS"
   OptionTitles(0)="MOVEMENT"
   OptionTitles(1)="TARGETING"
   OptionTitles(2)="INTERFACE"
   Name="Default__GFxTrPage_KeybindSpectator"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
