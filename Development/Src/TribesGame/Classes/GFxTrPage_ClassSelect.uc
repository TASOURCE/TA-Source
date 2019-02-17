class GFxTrPage_ClassSelect extends GFxTrPage;

var int  FocusedClass;
var int  PurchasingClass;
var int  GPAmount;
var int  XPAmount;
var bool bClassDeniedPopup;

function Initialize()
{
    RefreshClassList();
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    local int classId;
    super.TakeFocus(ActionIndex, DataList);
    
    classId = EquipInterface.GetClassId(ActionIndex);
    
    MenuSounds.ClassRollover();

    FocusedClass = classId;

    CheckPricing(DataList);

    return 0;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    local int classId;
    local int equipId;
    local string className;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    classId = PageActions[ActionIndex].ActionNumber;

    if (EquipInterface.IsClassOwned(classId))
    {
        FamilyInfo = EquipHelper.GetFamilyClass(classId);
        className = FamilyInfo.default.FriendlyName;

        NewAction = 1;

        Pages.ClassPage.bClassLocked = false;
        Pages.ClassPage.LoadoutClassId = classId;
        Pages.ClassPage.PageLabelOverride = CAPS(className)@"LOADOUTS";
        
        equipId = EquipInterface.GetActiveEquipId(classId, EQP_Primary, ActiveLoadout);
        TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId));

        Pages.ClassPage.FillData(DataList);
    }
    else
    {
        PurchasingClass = PageActions[ActionIndex].ActionNumber;
        bWaitingForSelectionPopup = true;

        NewAction = 0;
        QueuePopup();
    }

    return NewAction;
}

function RefreshClassList()
{
    local int i;
    local int classId;

    for (i = PageActions.Length; i > 0; i--)
    {
        PageActions.Remove(i-1, 1);
    }

    classId = EquipInterface.GetFirstClassId();

    while (classId > 0)
    {
        AddActionNumber(classId);
        classId = EquipInterface.GetNextClassId(classId);
    }
}

function FillData(GFxObject DataList)
{
    PageLabelOverride = PageLabel@"("$SettingsManager.KeyBindings.m_ClassSelectKeybind$")";

    bModifyOption = true;

    super.FillData(DataList);
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    local int classId;
    local TrPlayerController TrPC;

    NewAction = 0;
    
    if (!PlayerNeedsClass())
    {
        super.TakeAction(ActionIndex, DataList);
    }
    
    TrPC = TrPlayerController(GetPC());
    
    if (NewAction == 0 && ActionIndex >= 0 && ActionIndex < PageActions.Length && PageActions[ActionIndex] != none)
    {
        NewAction = 1;
        classId = PageActions[ActionIndex].ActionNumber;

        if (!EquipInterface.IsClassOwned(classId) && !TrPC.InTraining())
        {
            NewAction = 0;
            MenuSounds.ClassLocked();
        }
        else
        {
            Pages.LoadoutsPage.bInSelection = true;
            Pages.LoadoutsPage.bClassLocked = !EquipInterface.IsClassOwned(classId);
            Pages.LoadoutsPage.LoadoutClassId = classId;
            Pages.LoadoutsPage.PageLabelOverride = "SELECT LOADOUT";
            Pages.LoadoutsPage.FillData(DataList);
        }
        
        /*MenuSounds.ClassSelected();

        if (RequestActiveClass(classId, LST_DEFAULT))
        {
            if (bInGame)
            {
                HideMovie();
            }
        }
        else
        {
            PurchasingClass = classId;
            bClassDeniedPopup = true;
            QueuePopup();

            return NewAction;
        }*/
    }

    if (NewAction == 0)
    {
        if (PlayerNeedsClass())
        {
            NewAction = -1;
            Pages.GamePage.FillData(DataList);
        }
        else if (bInGame)
        {
            HideMovie();
        }
    }

    if (NewAction == GoBack && bMovieIsOpen)
    {
        TrPC.OnMenuMovieOpened();

        if (Pages.GetActivePage() == Pages.GamePage)
        {
            Pages.GamePage.PushModel();
        }
    }

    return NewAction;
}

function GFxObject FillOption(int ActionIndex)
{
    local int classId;

    classId = PageActions[ActionIndex].ActionNumber;

    return FillClass(classId, ActionIndex, true);
}

function ShowModel()
{
    TrPlayerController(GetPC()).UpdatePaperDoll(none, none);
}

function bool RequestActiveClass(int ClassId, int Loadout)
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());
    
    if (TrPC != none)
    {
        if (TrPC.RegisterPendingClass(ClassId, Loadout))
        {
            User.SaveClassId(ClassId);
            SendProfileData();
            return true;
        }
    }

    return false;
}

function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;

    if (bFillingFocus)
    {
        return false;
    }

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_PRICE);

    priceObj = FillPricing(DataList);

    if (priceObj != none)
    {
        obj.SetObject("data", priceObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }

    return true;
}

function GFxObject FillPricing(GFxObject DataList)
{
    local int xpCost;
    local int gpCost;
    local bool bHavePrice;
    local GFxObject obj;

    obj = CreateObject("Object");

    if (EquipInterface.IsClassOwned(FocusedClass))
    {
        return none;
        /*obj.SetString("actionLabel", Strings.Modify);
        obj.SetFloat("bUpgradeType", 3);

        return obj;*/
    }
    
    obj.SetString("actionLabel", Strings.Unlock);
    obj.SetString("orLabel", Strings.Or);

    gpCost = EquipInterface.GetClassPrice(FocusedClass, 0);
	xpCost = EquipInterface.GetClassPrice(FocusedClass, 1);

    if (xpCost > 0)
    {
		bHavePrice = true;
        obj.SetFloat("xp", xpCost);
    }

    if (gpCost > 0)
    {
        bHavePrice = true;
        obj.SetFloat("gold", gpCost);
    }

    if (bHavePrice)
    {
        return obj;
    }

    return none;
}

function OnPurchaseSuccess()
{
    if (PurchasingClass > 0)
    {
        //RequestActiveClass(PurchasingClass, LST_DEFAULT);
    }

    PurchasingClass = 0;
}

function PopupData(GFxObject Obj)
{
    local int gpPrice;
    local int xpPrice;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;

    if (Obj == none) return;
    
    FamilyInfo = EquipHelper.GetFamilyClass(PurchasingClass);

    if (bClassDeniedPopup)
    {
        TrPC = TrPlayerController(GetPC());

        if (TrPC != none && TrPC.GetAllowedClassCount(FamilyInfo.default.ClassType) > 0)
        {
            Obj.SetString("popupBody", Strings.SpawnLimitReached);
        }
        else
        {
            Obj.SetString("popupBody", Strings.TrClassBanned);
        }

        Obj.SetString("popupTitle", Caps(FamilyInfo.default.FriendlyName)@Strings.Denied);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 0);
        return;
    }
    
    if (bWaitingForSelectionPopup)
    {
        bWaitingForCurrencyPopup = true;
        bWaitingForSelectionPopup = false;

        if (FamilyInfo == none)
        {
            Obj.SetString("popupTitle", Strings.Error);
            Obj.SetString("popupBody", Strings.NoInfoFound);
            Obj.SetString("buttonLabel2", Strings.OK);
            Obj.SetFloat("enterKeyIndex", 1);
            Obj.SetFloat("type", 0);
            return;
        }

        //UnlockIconId   = FamilyInfo.default.m_IconId;
        UnlockItemName = FamilyInfo.default.FriendlyName;
        UnlockTypeName = Strings.Unlocked;

        gpPrice = EquipInterface.GetClassPrice(PurchasingClass, 0);
        xpPrice = EquipInterface.GetClassPrice(PurchasingClass, 1);

        GPAmount = gpPrice;
        XPAmount = xpPrice;

        if (gpPrice > 0 && xpPrice > 0)
        {
            Obj.SetString("popupTitle", Strings.Unlock@Caps(FamilyInfo.default.FriendlyName));
            Obj.SetFloat("type", 1);
            Obj.SetString("orLabel", Strings.Or);
            Obj.SetString("goldCopy", Strings.Use@Strings.Gold);
            Obj.SetString("goldCost", string(gpPrice));
            Obj.SetString("xpCopy", Strings.Use@Strings.XP);
            Obj.SetString("xpCost", string(xpPrice));
            Obj.SetString("buttonLabel2", Strings.Cancel);
            Obj.SetFloat("enterKeyIndex", -1);

            return;
        }
    
        if (gpPrice > 0)
        {
            PurchasingCurrency = 0;
        }
        else if (xpPrice > 0)
        {
            PurchasingCurrency = 1;
        }
    }

    if (bWaitingForCurrencyPopup)
    {
        Obj.SetString("popupTitle", Strings.Unlock@Caps(FamilyInfo.default.FriendlyName));
        Obj.SetFloat("type", 0);
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);

        if (PurchasingCurrency == 0)
        {
            UnlockIconType = AT_USEDGOLD;
            Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(FamilyInfo.default.FriendlyName)@Strings.TrFor@GPAmount@Strings.Gold$"?");
        }
        else
        {
            UnlockIconType = AT_USEDXP;
            Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(FamilyInfo.default.FriendlyName)@Strings.TrFor@XPAmount@Strings.XP$"?");
        }

        bWaitingForCurrencyPopup = false;
        bWaitingForConfirmationPopup = true;
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (bClassDeniedPopup)
    {
        bClassDeniedPopup = false;
    }
    else if (bWaitingForCurrencyPopup)
    {
        if (Action == 3)
        {
            bWaitingForConfirmationPopup = true;
            PurchasingCurrency = 0;
            QueuePopup();
        }
        else if (Action == 4)
        {
            bWaitingForConfirmationPopup = true;
            PurchasingCurrency = 1;
            QueuePopup();
        }

        bWaitingForCurrencyPopup = false;
    }
    else if (bWaitingForConfirmationPopup)
    {
        if (Action == 1)
        {
            EquipInterface.RequestPurchaseClass(PurchasingClass, PurchasingCurrency);
        }

        bWaitingForConfirmationPopup = false;
    }
}

function CheckDescription(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject descObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_DESCRIPTION);
    obj.SetObject("data", FillDescription(DataList));
    
    descObj = FillDescription(DataList);

    if (descObj != none)
    {
        obj.SetObject("data", descObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }
}

function GFxObject FillDescription(GFxObject DataList)
{
    //local string loadout;
    local GFxObject obj;
    local class<TrFamilyInfo> FamilyInfo;

    FamilyInfo = EquipHelper.GetFamilyClass(FocusedClass);

    if (FamilyInfo == none) return none;

    obj = CreateObject("Object");


    /*obj.SetString("loadoutTitle", Strings.Loadout);
    obj.SetString("type", Strings.Primary$"\n"$Strings.Secondary$"\n"$Strings.Belt$"\n"$Strings.Pack$"\n\n"$Strings.Perk@"1\n"$Strings.Perk@"2");
    
    loadout = loadout$GetEquipName(EQP_Primary);
    loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_Secondary);
    loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_Belt);
    loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_Pack);
    loadout = loadout$"\n\n";
    loadout = loadout$GetEquipName(EQP_PerkA);
    loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_PerkB);

    obj.SetString("loadout", loadout);*/

    return obj;
}

function string GetEquipName(int EquipType)
{
    local int equipId;
    local class<TrDevice> equip;

    equipId = EquipInterface.GetActiveEquipId(FocusedClass, EquipType, ActiveLoadout);

    if (equipId > 0)
    {
        equip = EquipHelper.GetEquipClass(equipId);

        if (equip != none)
        {
            return Caps(equip.default.ItemName);
        }
    }

    return "";
}

defaultproperties
{
   PageLabel="SELECT SPAWN CLASS"
   Name="Default__GFxTrPage_ClassSelect"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
