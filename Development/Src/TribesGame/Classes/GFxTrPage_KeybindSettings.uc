class GFxTrPage_KeybindSettings extends GFxTrPage;

var bool bWaitingForResetConfirmation;

function Initialize()
{
    AddActionPage(Pages.KeybindMovementPage);
    AddActionPage(Pages.KeybindGameplayPage);
    AddActionPage(Pages.KeybindWeaponPage);
    AddActionPage(Pages.KeybindVehiclePage);
    AddActionPage(Pages.KeybindCommunicationPage);
    AddActionPage(Pages.KeybindInterfacePage);
    AddActionPage(Pages.KeybindHotkeysPage);
    AddActionPage(Pages.KeybindSpectatorPage);
    AddActionString("RESET ALL");
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex != GoBack)
    {
        if (PageActions[ActionIndex].ActionString == "RESET ALL")
        {
            bWaitingForResetConfirmation = true;
            QueuePopup();

            return 0;
        }
    }

    super.TakeAction(ActionIndex, DataList);

    return NewAction;
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionString == "RESET ALL")
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetString("itemRibbonLabel", Strings.ResetAllToDefault);
    }

    return obj;
}

function PopupData(GFxObject Obj)
{
    if (bWaitingForResetConfirmation)
    {
        Obj.SetString("popupTitle", "RESET ALL");
        Obj.SetString("popupBody", "ARE YOU SURE YOU WANT TO RESET ALL KEYBINDINGS?");
        Obj.SetString("buttonLabel2", "ACCEPT");
        Obj.SetString("buttonLabel3", "CANCEL");
        Obj.SetFloat("type", 0);
        Obj.SetFloat("enterKeyIndex", 1);
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (bWaitingForResetConfirmation)
    {
        bWaitingForResetConfirmation = false;

        if (Action == 1)
        {
            SettingsManager.KeyBindings.ApplyDefaultSettings();
        }
    }
}

defaultproperties
{
   PageLabel="KEYBINDINGS"
   OptionTitles(0)="MOVEMENT"
   OptionTitles(1)="GAMEPLAY"
   OptionTitles(2)="WEAPONS"
   OptionTitles(3)="VEHICLES"
   OptionTitles(4)="COMMUNICATION"
   OptionTitles(5)="INTERFACE"
   OptionTitles(6)="HOTKEYS"
   OptionTitles(7)="SPECTATOR"
   OptionTitles(8)="RESET ALL"
   Name="Default__GFxTrPage_KeybindSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
