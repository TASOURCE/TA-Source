class GFxTrPage_Classes extends GFxTrPage;

var int FocusedClass;
var int PurchasingClass;
var int GPAmount;
var int XPAmount;

function Initialize()
{
    RefreshClassList();
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

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);

    ShowModel();
    CheckPricing(DataList);

    return 0;
}

function ShowModel()
{
    local int classId;
    local int equipId;
    local class<TrSkin> skinClass;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;
    
    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        classId = EquipInterface.GetClassId(Pages.FocusIndex);

        if (classId > 0)
        {
            equipId = EquipInterface.GetActiveEquipId(classId, EQP_Primary, ActiveLoadout);
            FamilyInfo = EquipHelper.GetFamilyClass(classId);
            skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(classId, EQP_Skin, ActiveLoadout));

            TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
        }

        FocusedClass = classId;
    }

}

function FillData(GFxObject DataList)
{
    local int classId;
    local int equipId;
    local class<TrSkin> skinClass;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;

    super.FillData(DataList);

    if (User.NeedToSeeAnyNewItem() && !User.m_SeenNewItemsMain)
    {
        User.SeenNewItemsMain();
    }
    
    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        classId = EquipInterface.GetClassId(Pages.FocusIndex);

        if (classId > 0)
        {
            equipId = EquipInterface.GetActiveEquipId(classId, EQP_Primary, ActiveLoadout);
            FamilyInfo = EquipHelper.GetFamilyClass(classId);
            skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(classId, EQP_Skin, ActiveLoadout));

            TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
        }
    }
}

function OnPurchaseSuccess()
{
    if (PurchasingClass > 0)
    {
        //RequestActiveClass(PurchasingClass, LST_DEFAULT);
    }    

    PurchasingClass = 0;
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    local int classId;
    local class<TrFamilyInfo> FamilyInfo;
	local TrPlayerController TrPC;

    super.TakeAction(ActionIndex, DataList);

	TrPC = TrPlayerController(GetPC());

    if (NewAction == 0 && ActionIndex < PageActions.Length && PageActions[ActionIndex] != none)
    {
        NewAction = 1;
        classId = PageActions[ActionIndex].ActionNumber;
        FamilyInfo = EquipHelper.GetFamilyClass(classId);

        Pages.LoadoutsPage.bInSelection = false;
        Pages.LoadoutsPage.bClassLocked = !EquipInterface.IsClassOwned(classId);
        Pages.LoadoutsPage.LoadoutClassId = classId;
        Pages.LoadoutsPage.PageLabelOverride = CAPS(FamilyInfo.default.FriendlyName)@"LOADOUTS";
        Pages.LoadoutsPage.FillData(DataList);

        /*Pages.ClassPage.bClassLocked = !EquipInterface.IsClassOwned(classId);
        Pages.ClassPage.LoadoutClassId = classId;
        Pages.ClassPage.PageLabelOverride = CAPS(FamilyInfo.default.FriendlyName);
        Pages.ClassPage.FillData(DataList);*/

		if( TrPC != none )
		{
			TrPC.OnClassSelectedMainMenu();
		}
    }            

    return NewAction;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    if (!IsOwned(ActionIndex))
    {
        PurchasingClass = PageActions[ActionIndex].ActionNumber;
        bWaitingForSelectionPopup = true;

        QueuePopup();
    }

    return 0;
}

function PopupData(GFxObject Obj)
{
    local int gpPrice;
    local int xpPrice;
    local class<TrFamilyInfo> FamilyInfo;

    if (Obj == none) return;
    
    FamilyInfo = EquipHelper.GetFamilyClass(PurchasingClass);
    
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
        UnlockTypeName = "UNLOCKED";

        gpPrice = EquipInterface.GetClassPrice(PurchasingClass, 0);
        xpPrice = EquipInterface.GetClassPrice(PurchasingClass, 1);

        GPAmount = gpPrice;
        XPAmount = xpPrice;

        if (gpPrice > 0 && xpPrice > 0)
        {
            Obj.SetString("popupTitle", Strings.Unlock@Caps(FamilyInfo.default.FriendlyName));
            Obj.SetFloat("type", 1);
            Obj.SetString("orLabel", Strings.OK);
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
            Obj.SetString("popupBody", Strings.AreyouSureYouWantTo@Strings.Unlock@Caps(FamilyInfo.default.FriendlyName)@Strings.TrFor@XPAmount@Strings.XP$"?");
        }

        bWaitingForCurrencyPopup = false;
        bWaitingForConfirmationPopup = true;
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (bWaitingForCurrencyPopup)
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

function GFxObject FillOption(int ActionIndex)
{
    local int classId;

    classId = PageActions[ActionIndex].ActionNumber;

    return FillClass(classId, ActionIndex);
}

function bool CheckPurchasable()
{
    return true;
}

function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;

    if (bFillingFocus)
    {
        return false;
    }

    if (!EquipInterface.IsClassOwned(FocusedClass))
    {
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

    return false;
}

function GFxObject FillPricing(GFxObject DataList)
{
    local int xpCost;
    local int gpCost;
    local bool bHavePrice;
    local GFxObject obj;

    obj = CreateObject("Object");

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
    obj.SetString("descTitle", Caps(FamilyInfo.default.FriendlyName));
    obj.SetString("description", Caps(FamilyInfo.default.ClassDescription));

    /*obj.SetString("loadoutTitle", Strings.Loadout);
    obj.SetString("type", Strings.Primary$"\n"$Strings.Secondary$"\n"$Strings.Belt$"\n"$Strings.Pack$"\n\n"$Strings.Perk@"1\n"$Strings.Perk@"2");
    
    /*loadout = GetArmorName(FamilyInfo);
    loadout = loadout$"\n";*/
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
    /*loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_Skin);*/

    obj.SetString("loadout", loadout);*/

    return obj;
}

function string GetArmorName(class<TrFamilyInfo> FamilyInfo)
{
    if (class<TrFamilyInfo_Heavy>(FamilyInfo) != none)
    {
        return "- HEAVY -";
    }
    else if (class<TrFamilyInfo_Light>(FamilyInfo) != none)
    {
        return "- LIGHT -";
    }

    return "- MEDIUM -";
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

function bool IsOwned(int Index)
{
    local int classId;

    classId = PageActions[Index].ActionNumber;

    return EquipInterface.IsClassOwned(classId);
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
        }
    }

    return true;
}

function HelpButton(int ActionIndex)
{
    if (bBlockHotkey) return;

    switch (ActionIndex)
    {
    case HelpButtonXNum:
        bShowDiamondSword = !bShowDiamondSword;
        TakeFocus(Pages.FocusIndex, none);
        return;
    }

    super.HelpButton(ActionIndex);
}

defaultproperties
{
   PageLabel="MODIFY CLASSES"
   HelpButtonXKey="*"
   HelpButtonXLabel="CHANGE TRIBE"
   Name="Default__GFxTrPage_Classes"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
