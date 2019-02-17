class GFxTrPage extends GFxObject within GFxTrMenuMoviePlayer;


const MENU_ELEMENT_LOGIN          = 1;
const MENU_ELEMENT_OPTIONS        = 2;
const MENU_ELEMENT_SIDEBAR        = 3;
const MENU_ELEMENT_DESCRIPTION    = 4;
const MENU_ELEMENT_UPGRADES       = 5;
const MENU_ELEMENT_POPUPACQ       = 6;
const MENU_ELEMENT_POPUPALERT     = 7;
const MENU_ELEMENT_POPUPPURCHASE  = 8;
const MENU_ELEMENT_SUMMARYPLAYER  = 9;
const MENU_ELEMENT_SUMMARYTEAM    = 10;
const MENU_ELEMENT_NOUSE          = 11;
const MENU_ELEMENT_PRICE          = 12;
const MENU_ELEMENT_PROFILE        = 13;
const MENU_ELEMENT_FEATURE        = 14;
const MENU_ELEMENT_SERVERBROWSER  = 15;#linenumber 4

const MAX_FRIENDS_DISPLAYED = 150;

var int                     ActiveLoadout;
var int                     GoBack;
var int                     HelpButtonANum;
var int                     HelpButtonBNum;
var int                     HelpButtonXNum;
var int                     HelpButtonYNum;
var int                     ScrollIndex;
var int                     ActiveIndex;
var int                     DataCount;
var int                     OptionCount;
var int                     NewAction;
var int                     LoadoutClassId;
var int                     LoadoutEquipType;
var bool                    bFillingFocus;
var bool                    bModifyOption;
var bool                    bRemoveOption;
var bool                    bEndOfLine;
var bool                    bAllowBack;
var bool                    bActive;
var bool                    bCreated;
var bool                    bHasModifiers;
var bool                    bParentLocked;
var bool                    bShowTribesLogo;
var string                  PageLabelOverride;
var array<string>           OptionTitlesOverride;
var array<string>           OptionSubtextOverride;
var localized string        PageLabel;
var localized string        HelpButtonAKey;
var localized string        HelpButtonBKey;
var localized string        HelpButtonXKey;
var localized string        HelpButtonYKey;
var localized string        HelpButtonALabel;
var localized string        HelpButtonBLabel;
var localized string        HelpButtonXLabel;
var localized string        HelpButtonYLabel;
var localized array<string> OptionTitles;
var localized array<string> OptionSubtext;

struct ResolutionSet
{
    var int Index;
    var PropertyPair Res;
};

var array<GFxTrAction>      PageActions;

function Initialize() { }

function GFxTrAction AddAction()
{
    local GFxTrAction action;

    action = new class'GFxTrAction';
    action.ActionIndex = PageActions.Length;
    PageActions.AddItem(action);
    
    return action;
}

function GFxTrAction AddActionNumber(int ActionNumber)
{
    local GFxTrAction action;

    action = AddAction();
    action.ActionNumber = ActionNumber;
    
    return action;
}

function GFxTrAction AddActionString(string ActionString)
{
    local GFxTrAction action;

    action = AddAction();
    action.ActionString = ActionString;
    
    return action;
}

function GFxTrAction AddActionPage(GFxTrPage ActionPage)
{
    local GFxTrAction action;

    action = AddAction();
    action.ActionPage = ActionPage;

    return action;
}

function GFxTrAction AddActionSet(GFxTrPage ActionPage, optional int ActionNumber = 0, optional string ActionString = "")
{
    local GFxTrAction action;

    action = AddAction();
    action.ActionPage = ActionPage;
    action.ActionNumber = ActionNumber;
    action.ActionString = ActionString;

    return action;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    DataCount = 0;

    Pages.FocusIndex = ActionIndex;

    CheckDescription(DataList);

    return 0;
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    NewAction = 0;
    DataCount = 0;
    
    if (ActionIndex == GoBack || PageActions.Length == 0)
    {
        if (bEndOfLine && bInGame)
        {
            bEndOfLine = false;
            HideMovie();
            return NewAction;
        }

        if (!bAllowBack)
        {
            return NewAction;
        }

        NewAction = -1;
        Pages.PopPage().FillData(DataList);
    }
    
    if (NewAction == 0 && ActionIndex < PageActions.Length && PageActions[ActionIndex] != none)
    {
        SpecialAction(PageActions[ActionIndex]);

        if (NewAction == 0 && PageActions[ActionIndex].ActionPage != none)
        {
            NewAction = 1;
            PageActions[ActionIndex].ActionPage.FillData(DataList);
        }
    }
    
    return NewAction;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
}

function ModifyFocus(int ActionIndex)
{
}

function HelpButton(int ActionIndex)
{
    if (bBlockHotkey) return;

    switch (ActionIndex)
    {
    case HelpButtonANum:
        Pages.bPopBack = true;
        Pages.PopBack();
        break;
    case HelpButtonBNum:
        Pages.bPopBack = true;
        Pages.TravelToMain();
        break;
    case HelpButtonYNum:
        Pages.NavigateGold();
        break;
    }
}

function SpecialAction(GFxTrAction Action)
{
}

function PopupData(GFxObject Obj)
{
}

function PopupComplete(int Action, string TextInput)
{
}

function FillData(GFxObject DataList)
{
    local GFxObject obj;
    local TrPlayerController TrPC;
    
    TrPC = TrPlayerController(GetPC());

    if (TrPC != none && !bRefreshingMenu)
    {
        TrPC.ClearMainMenuPaperDoll();
    }

    if (!bRefreshingMenu) ScrollIndex = 0;

    DataCount       = 0;
    bHasModifiers   = false;
    bShowTribesLogo = bInGame ? false : true;

    Pages.PushPage(self);
    
    if (!bRefreshingMenu && (Pages.FocusIndex >= PageActions.Length)) Pages.FocusIndex = 0;

    bFillingFocus = true;
    TakeFocus(Pages.FocusIndex, none);
    bFillingFocus = false;

    ShowModel();
    
    obj = CreateObject("Object");

    CheckUpgrades(DataList);
    CheckPricing(DataList);
    CheckDescription(DataList);

    obj.SetFloat("elementId", MENU_ELEMENT_OPTIONS);
    obj.SetObject("data", FillOptions(DataList));

    DataList.SetElementObject(DataCount++, obj);
}

function GFxObject FillOptions(GFxObject DataList)
{
    local int i;
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("showTribesLogo", bShowTribesLogo ? 1 : 0);
    obj.SetFloat("focusIndex", Pages.FocusIndex);

    if (PageLabelOverride == "")
    {
        obj.SetString("menuTitle", PageLabel);
    }
    else
    {
        obj.SetString("menuTitle", PageLabelOverride);
    }
        
    obj.SetFloat("helpButtonYisGold", 1);

    if (self != Pages.MainPage)
    {
        if (self == Pages.GamePage)
        {
            obj.SetString("helpButtonAKey", HelpButtonAKey);
            obj.SetString("helpButtonALabel", Strings.BackToGame);
            if (HelpButtonYKey != "") obj.SetString("helpButtonYKey", HelpButtonYKey);
            if (HelpButtonYLabel != "") obj.SetString("helpButtonYLabel", HelpButtonYLabel);
        }
        else
        {
            obj.SetString("helpButtonAKey", HelpButtonAKey);
            obj.SetString("helpButtonBKey", SettingsManager.KeyBindings.m_MainMenuHotkey);
            obj.SetString("helpButtonALabel", HelpButtonALabel);
            obj.SetString("helpButtonBLabel", HelpButtonBLabel);

            if (HelpButtonXLabel != "") obj.SetString("helpButtonXLabel", HelpButtonXLabel);
	        if (HelpButtonYLabel != "") obj.SetString("helpButtonYLabel", HelpButtonYLabel);
            if (HelpButtonXKey != "") obj.SetString("helpButtonXKey", HelpButtonXKey);
            if (HelpButtonYKey != "") obj.SetString("helpButtonYKey", HelpButtonYKey);
        }
    }
    else
    {
        if (HelpButtonXKey != "") obj.SetString("helpButtonXKey", HelpButtonXKey);
        if (HelpButtonYKey != "") obj.SetString("helpButtonYKey", HelpButtonYKey);
        if (HelpButtonYLabel != "") obj.SetString("helpButtonYLabel", HelpButtonYLabel);
        if (HelpButtonXLabel != "") obj.SetString("helpButtonXLabel", HelpButtonXLabel);
    }

    if (PageActions.Length > 0)
    {
        obj.SetFloat("bShowPageUp", 0);
        obj.SetFloat("bShowPageDown", 0);
        obj.SetFloat("buttonLength", PageActions.Length + 1);

        if (PageActions.Length > 9)
        {
            obj.SetFloat("bShowPageDown", 1);
        }

        for (i = 0; i < PageActions.Length; i++)
        {
            obj.SetObject("buttonItem"$i+1, FillOption(i));
        }
    }
    else
    {
        obj.SetFloat("buttonLength", 2);
        obj.SetObject("buttonItem1", FillDefault());
    }

    return obj;
}

function bool IsOwned(int Index)
{
    return false;
}

function bool CheckPurchasable()
{
    return false;
}

function bool IsEquipMaxed(int Index)
{
    return true;
}
    
function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = CreateObject("Object");
    
    if (bParentLocked) obj.SetFloat("bLocked", 1);
    
    obj.SetFloat("actionID", ActionIndex);
    
    if (ActionIndex < OptionTitlesOverride.Length)
    {
        obj.SetString("itemTitle", OptionTitlesOverride[ActionIndex]);
    }
    else if (ActionIndex < OptionTitles.Length)
    {
        obj.SetString("itemTitle", OptionTitles[ActionIndex]);
    }
    else
    {
        obj.SetString("itemTitle", Strings.Error);
    }
    
    if (ActionIndex < OptionSubtextOverride.Length)
    {
        obj.SetString("itemSubTitle", OptionSubtextOverride[ActionIndex]);
    }
    else if (ActionIndex < OptionSubtext.Length)
    {
        obj.SetString("itemSubTitle", OptionSubtext[ActionIndex]);
    }
    else
    {
        obj.SetString("itemSubTitle", "");
    }

    return obj;
}

function GFxObject FillDefault()
{
    local GFxObject obj;

    obj = CreateObject("Object");

    obj.SetFloat("actionID", 0);
    obj.SetString("itemTitle", Strings.Back);
    obj.SetString("itemSubTitle", "");

    return obj;
}

function bool CheckUpgrades(GFxObject DataList)
{
    return false;
}

function bool CheckPricing(GFxObject DataList)
{
    return false;
}

function GFxObject FillUpgrades(GFxObject DataList)
{
}

function GFxObject FillPricing(GFxObject DataList)
{
}

function CheckDescription(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject descObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_DESCRIPTION);

    descObj = FillDescription(DataList);

    if (descObj != none)
    {
        obj.SetObject("data", descObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }
}

function GFxObject FillDescription(GFxObject DataList)
{
    return none;
}

function FillPage(GFxObject DataList)
{
}

function ClearActions()
{
    local int i;

    if (PageActions.Length > 0)
    {
        for (i = PageActions.Length; i > 0; i--)
        {
            PageActions.Remove(i-1, 1);
        }
    }

    if (OptionTitlesOverride.Length > 0)
    {
        for (i = OptionTitlesOverride.Length; i > 0; i--)
        {
            OptionTitlesOverride.Remove(i-1, 1);
        }
    }

    if (OptionSubtextOverride.Length > 0)
    {
        for (i = OptionSubtextOverride.Length; i > 0; i--)
        {
            OptionSubtextOverride.Remove(i-1, 1);
        }
    }
}

function ShowModel()
{
}

function GFxObject FillClass(int ClassId, int ActionIndex, optional bool bShowActive = false)
{
    local int gpPrice;
    local int xpPrice;
    local int classCount;
    local int unlockedPct;
    local bool bLocked;
    local string classUseString;
    local GFxObject obj;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;
    local TrGameReplicationInfo TrGRI;

    FamilyInfo = EquipHelper.GetFamilyClass(ClassId);
    TrPC = TrPlayerController(GetPC());

    bModifyOption = false;

    if (FamilyInfo != none)
    {
        obj = CreateObject("Object");

        obj.SetFloat("actionID", ActionIndex);
        obj.SetString("itemRibbonLabel", "");
        obj.SetFloat("hasRibbon", 0);
        obj.SetFloat("ribbonType", 0);
        obj.SetFloat("bItemSelected", 1);

        if (bShowActive)
        {
            classCount = TrPC.GetTeamClassCount(FamilyInfo.default.ClassId);

            obj.SetFloat("bLocked", 0);

            if (classCount > 0)
            {
                classUseString = string(classCount)@Strings.Teammate;

                if (classCount > 1) classUseString = classUseString$"S";
                
                obj.SetString("itemRibbonLabel", classUseString);
                obj.SetFloat("hasRibbon", 1);
                obj.SetFloat("ribbonType", 3);
                obj.SetFloat("bItemSelected", 1);
            }

            if (TrPC.GetActiveClassId() != ClassId)
            {
                TrGRI = TrGameReplicationInfo(GetPC().WorldInfo.GRI);
                
	            if (TrGRI != none && !TrGRI.IsClassAllowed(TrPC.m_RequestedTeam, FamilyInfo))
	            {
                    bLocked = true;
	                obj.SetFloat("bLocked", 1);

                    if (TrGRI.r_ServerConfig.GetClassCount(FamilyInfo.default.ClassType) > 0)
                    {
                        obj.SetString("itemSubTitle", Strings.Limit@Strings.Reached);
                    }
                    else
                    {
                        obj.SetString("itemSubTitle", Strings.TrClassBanned);
                    }
	            }
            }
        }

        if (EquipInterface.IsClassOwned(classId))
        {
            unlockedPct = EquipInterface.GetClassUnlockPercent(classId);

            obj.SetFloat("hasPricing", 0);

            if (!bLocked)
            {
                if (unlockedPct >= 100) obj.SetString("itemSubTitle", Strings.Mastered);
                else obj.SetString("itemSubTitle", unlockedPct$"%"@Strings.Complete);
            }

            if (bInGame)
            {
                //bModifyOption = true;

                if (TrPC.GetActiveClassId() == ClassId)
                {
                    if (bShowActive)
                    {
                        if (classCount > 0) obj.SetString("itemRibbonLabel", Strings.Active@"("$classCount$")");
                        else obj.SetString("itemRibbonLabel", Strings.Active);

                        obj.SetFloat("hasRibbon", 1);
                        obj.SetFloat("ribbonType", 1);
                    }

                    obj.SetFloat("bItemSelected", 2);
                }
            }
            else
            {
                obj.SetFloat("bItemSelected", 0);
            }
        }
        else
        {
            obj.SetFloat("bItemSelected", 0);

            gpPrice = EquipInterface.GetClassPrice(classId, 0);
            xpPrice = EquipInterface.GetClassPrice(classId, 1);

            obj.SetFloat("bLocked", 1);
            obj.SetFloat("hasPricing", 1);
            obj.SetFloat("goldPrice", gpPrice);
            obj.SetFloat("xpPrice", xpPrice);
            obj.SetString("itemSubTitle", Strings.Locked);
        }

        if (!EquipInterface.IsClassOwned(classId) && EquipInterface.GetDailyDealItemId() == classId)
        {
            obj.SetString("itemRibbonLabel", EquipInterface.GetDailyDealPercentOff()$"% OFF (GOLD)");
            obj.SetFloat("ribbonType", 3);
            obj.SetFloat("hasRibbon", 1);
        }
        else if (!bShowActive)
        {
            if (User.NeedsToSeeNewItemsClass(ClassId))
            {
                obj.SetString("itemRibbonLabel", Strings.TrNew@Strings.Items);
                obj.SetFloat("ribbonType", 3);
                obj.SetFloat("hasRibbon", 1);
            }
            else
            {
                switch (RibbonManager.GetClassRibbon(ClassId))
                {
                case 1:  obj.SetString("itemRibbonLabel", Strings.Unlock);                    obj.SetFloat("ribbonType", 2); obj.SetFloat("hasRibbon", 1); break;
                case 2:  obj.SetString("itemRibbonLabel", Strings.Unlock@Strings.Available);  obj.SetFloat("ribbonType", 2); obj.SetFloat("hasRibbon", 1); break;
                case 3:  obj.SetString("itemRibbonLabel", Strings.Upgrade@Strings.Available); obj.SetFloat("ribbonType", 1); obj.SetFloat("hasRibbon", 1); break;
                default: obj.SetFloat("hasRibbon", 0); break;
                }
            }
        }

        obj.SetString("itemTitle", Caps(FamilyInfo.default.FriendlyName));
    }

    return obj;
}

function GFxObject FillEquipTypes(int EquipId, int ActionIndex)
{
    local GFxObject obj;
    local class<TrSkin> skinClass;
    local class<TrDevice> equipClass;
    
    obj = CreateObject("Object");

    obj.SetFloat("actionID", ActionIndex);

    equipClass = EquipHelper.GetEquipClass(equipId);

    if (!EquipInterface.IsClassOwned(LoadoutClassId) || !EquipInterface.IsLoadoutOwned(LoadoutClassId, ActiveLoadout)) obj.SetFloat("bLocked", 1);
    
    if (equipClass == none)
    {
        skinClass = EquipHelper.GetSkinClass(equipId);

        if (skinClass == none)
        {
            obj.SetString("itemSubTitle", OptionSubtext[ActionIndex]);
            ;
        }
        else
        {
            obj.SetString("itemSubTitle", Caps(skinClass.default.ItemName));
        }
    }
    else
    {
        obj.SetString("itemSubTitle", Caps(equipClass.default.ItemName));
    }

    if (User.NeedsToSeeNewItemsType(LoadoutClassId, PageActions[ActionIndex].ActionNumber))
    {
        obj.SetString("itemRibbonLabel", Strings.TrNew@Strings.Items);
        obj.SetFloat("ribbonType", 3);
        obj.SetFloat("hasRibbon", 1);
    }
    else
    {
        switch (RibbonManager.GetTypeRibbon(LoadoutClassId, PageActions[ActionIndex].ActionNumber))
        {
        case 2:  obj.SetString("itemRibbonLabel", Strings.Unlock@Strings.Available);  obj.SetFloat("ribbonType", 2); obj.SetFloat("hasRibbon", 1); break;
        case 3:  obj.SetString("itemRibbonLabel", Strings.Upgrade@Strings.Available); obj.SetFloat("ribbonType", 1); obj.SetFloat("hasRibbon", 1); break;
        default: obj.SetFloat("hasRibbon", 0); break;
        }
    }

    obj.SetString("itemTitle", OptionSubtext[ActionIndex]);

    return obj;

}

function bool NewClassEquip(int ClassId)
{

}

function bool NewClassUpgrade(int ClassId)
{

}

function bool NewEquipUpgrade(int EquipId)
{

}

function RevertSetting()
{
}

function OnPurchaseSuccess()
{
}

function ActionUp()
{
    ScrollIndex--;

    RefreshButtons();
}

function ActionDown()
{
    ScrollIndex++;

    RefreshButtons();
}

function RefreshButtons()
{
    local int i;
    local int buttonIndex;
    local GFxObject obj;

    obj = CreateObject("Object");
    
    obj.SetFloat("bShowPageUp", 0);
    obj.SetFloat("bShowPageDown", 0);

    if (ScrollIndex <= 0)
    {
        ScrollIndex = 0;
    }
    else if (ScrollIndex > PageActions.Length - 9)
    {
        obj.SetFloat("bShowPageUp", 1);
        ScrollIndex = PageActions.Length - 9;
    }
    else
    {
        obj.SetFloat("bShowPageUp", 1);
    }

    if (PageActions.Length > 9)
    {
        obj.SetFloat("buttonLength", 10);
    }
    else
    {
        obj.SetFloat("buttonLength", PageActions.Length + 1);
    }

    if ((PageActions.Length - ScrollIndex) > 9)
    {
        obj.SetFloat("bShowPageDown", 1);
    }

    buttonIndex = 1;

    for (i = 0; i < PageActions.Length; i++)
    {
        if (i >= ScrollIndex)
        {
            obj.SetObject("buttonItem"$buttonIndex, FillOption(i));
            buttonIndex++;
        }
        else
        {
            FillOption(i);
        }
    }

    UpdateButton(obj);
}

function KeyEvent();

function UpdateDealTimer();

function UpdateQueueTimer();

function ProfileUp(int ActionIndex);

function ProfileDown(int ActionIndex);

function ResetRunaway()
{
    local TrPlayerController TrPC;
    TrPC = TrPlayerController(GetPC());
    TrPC.ResetRunaway(); //better would be to not instantiate more than a subset at once
}

function ShowReticule(int Index) {}

function SaveReticule(GFxObject Data) {}

function OnClose() {}

defaultproperties
{
   GoBack=-1
   HelpButtonANum=1
   HelpButtonBNum=2
   HelpButtonXNum=4
   HelpButtonYNum=3
   bAllowBack=True
   bShowTribesLogo=True
   HelpButtonAKey="Esc"
   HelpButtonYKey="+"
   HelpButtonALabel="GO BACK"
   HelpButtonBLabel="MAIN MENU"
   HelpButtonYLabel="ADD GOLD"
   Name="Default__GFxTrPage"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
