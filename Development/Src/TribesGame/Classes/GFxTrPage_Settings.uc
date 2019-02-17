class GFxTrPage_Settings extends GFxTrPage;

var int CheatCodeAction;
var bool bWaitingForCheatCodePopup;
var string C1P1;
var string C1P2;
var string C1P3;

function Initialize()
{
    super.Initialize();
    
    C1P1="GOTTA"; C1P2="GO"; C1P3="FAST";

    AddActionPage(Pages.VideoSettingsPage);
    AddActionPage(Pages.AudioSettingsPage);
    AddActionPage(Pages.ControlSettingsPage);
    AddActionPage(Pages.HUDSettingsPage);
    AddActionPage(Pages.KeybindSettingsPage);
    AddActionPage(Pages.NotificationSettingsPage);
    AddActionPage(Pages.RegionSettingsPage);
    AddActionNumber(CheatCodeAction);   
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex == -1)
    {
        SettingsManager.KeyBindings.FlushSettings();
    }

    return super.TakeAction(ActionIndex, DataList);
}

function FillData(GFxObject DataList)
{
    PageLabelOverride = PageLabel@"("$SettingsManager.KeyBindings.m_SettingsHotkey$")";

    super.FillData(DataList);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionPage == Pages.RegionSettingsPage)
    {
        Pages.RegionSettingsPage.bForceChoose = false;
    }
    else if (Action.ActionNumber == CheatCodeAction)
    {
        bWaitingForCheatCodePopup = true;
        QueuePopup();
    }

    super.SpecialAction(Action);
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    
    if (TrEPC != none) TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Settings);
}

function PopupData(GFxObject Obj)
{
    if (bWaitingForCheatCodePopup)
    {
        Obj.SetFloat("type", 2);
        Obj.SetString("popupTitle", Strings.EnterCode$":");
        Obj.SetString("popupBody", "");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);   
        Obj.SetFloat("enterKeyIndex", 1);             
    }    
}

function PopupComplete(int Action, string TextInput)
{
    local string cheat;

    if (bWaitingForCheatCodePopup)
    {
        if (Action == 1) 
        {
            cheat = C1P1$C1P2$C1P3;

            if (TextInput == cheat)
            {
                UpdateStatus(Strings.CodeAccepted);
                MatchSummaryScene.bUseSNS=true;
                PlayerSummaryScene.bUseSNS=true;
            }
        }
    }  
}

defaultproperties
{
   CheatCodeAction=1
   PageLabel="SETTINGS"
   OptionTitles(0)="VIDEO"
   OptionTitles(1)="AUDIO"
   OptionTitles(2)="GAMEPLAY"
   OptionTitles(3)="HUD"
   OptionTitles(4)="KEYBINDINGS"
   OptionTitles(5)="NOTIFICATIONS"
   OptionTitles(6)="REGIONS"
   OptionTitles(7)="ENTER SECRET CODE"
   OptionSubtext(0)="CHANGE GRAPHICS, RESOLUTION. ETC."
   OptionSubtext(1)="CHANGE AUDIO LEVELS"
   OptionSubtext(2)="CHANGE MOUSE AND GAMEPLAY SETTINGS"
   OptionSubtext(3)="CHANGE HUD VISIBILITY"
   OptionSubtext(4)="CHANGE KEYBINDING CONTROLS"
   OptionSubtext(5)="CHANGE NOTIFICATION SETTINGS"
   OptionSubtext(6)="CHANGE SERVER REGION"
   Name="Default__GFxTrPage_Settings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
