class GFxTrPage_Loadouts extends GFxTrPage;

var int    GPAmount;
var int    XPAmount;
var int    PopupNum;
var int    ModelEquip;
var bool   bInSelection;
var bool   bClassLocked;
var bool   bCurrencyPopup;
var bool   bSelectionPopup;
var bool   bConfirmationPopup;
var string LoadoutClassName;

function Initialize()
{
    local int i;

    for (i = 0; i < LST_MAX; i++)
    {
        AddAction();
    }
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    local string loadoutName;
    
    NewAction = 0;

    TakeFocus(ActionIndex, DataList);

    if (ActionIndex == GoBack)
    {
        NewAction = -1;
        Pages.PopPage().FillData(DataList);
    }
    else if (!EquipInterface.IsClassOwned(LoadoutClassId) || EquipInterface.IsLoadoutOwned(LoadoutClassId, ActionIndex))
    {    
        if (bInSelection)
        { 
            NewAction = 0;
            MenuSounds.ClassSelected();

            if (bInGame && RequestActiveClass(LoadoutClassId, ActionIndex))
            {
                HideMovie();
            }
        }
        else
        {
            NewAction = 1;

            Pages.ClassPage.ActiveLoadout = ActionIndex;
            Pages.ClassPage.bClassLocked = bClassLocked && EquipInterface.IsLoadoutOwned(LoadoutClassId, ActionIndex);
            Pages.ClassPage.LoadoutClassId = LoadoutClassId;
            loadoutName= EquipInterface.GetLoadoutName(LoadoutClassId, ActionIndex);

            Pages.ClassPage.PageLabelOverride = loadoutName;
            Pages.ClassPage.FillData(DataList);
        }
    }

    return NewAction;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);
    
    CheckPricing(DataList);

    ShowModel();

    return 0;
}

function GFxObject FillOption(int ActionIndex)
{
    local string loadoutName;
    local GFxObject obj;

    obj = CreateObject("Object");

    loadoutName = EquipInterface.GetLoadoutName(LoadoutClassId, ActionIndex);
    loadoutName = (ActionIndex + 1)$"."@loadoutName;

    obj.SetFloat("actionID", ActionIndex);
    obj.SetString("itemTitle", loadoutName);

    if (EquipInterface.IsClassOwned(LoadoutClassId) && EquipInterface.IsLoadoutOwned(LoadoutClassId, ActionIndex))
    {
        obj.SetFloat("bLocked", 0);

        if (bInSelection)
        {
            obj.SetString("itemSubTitle", "SELECT TO EQUIP");
        }
        else
        {
            obj.SetString("itemSubTitle", "SELECT TO MODIFY");
        }
    }
    else
    {
        obj.SetFloat("bLocked", 1);
        obj.SetFloat("bHasPricing", 1);
        obj.SetString("itemSubTitle", "LOCKED");
    }

    return obj;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    local string loadoutName;

    if (EquipInterface.IsLoadoutOwned(LoadoutClassId, ActionIndex))
    {
        NewAction = 1;

        Pages.ClassPage.bClassLocked = false;
        Pages.ClassPage.LoadoutClassId = LoadoutClassId;
        Pages.ClassPage.ActiveLoadout = ActionIndex;
        loadoutName = EquipInterface.GetLoadoutName(LoadoutClassId, ActionIndex);

        Pages.ClassPage.PageLabelOverride = loadoutName;
        Pages.ClassPage.FillData(DataList);
    }
    else
    {
        PopupNum = ActionIndex;
        bSelectionPopup = true;

        NewAction = 0;
        QueuePopup();
    }

    return NewAction;
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

    if (EquipInterface.IsLoadoutOwned(LoadoutClassId, Pages.FocusIndex))
    {
        if (bInSelection)
        {
            obj.SetString("actionLabel", Strings.Modify);
            obj.SetFloat("bUpgradeType", 3);

            return obj;
        }

        return none;
    }

    obj.SetString("actionLabel", Strings.Unlock);
    obj.SetString("orLabel", Strings.Or);

    gpCost = EquipInterface.GetLoadoutPrice(LoadoutClassId, Pages.FocusIndex, 0);
    xpCost = EquipInterface.GetLoadoutPrice(LoadoutClassId, Pages.FocusIndex, 1);

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

function ShowModel()
{
    local int equipId;
    local class<TrSkin> skinClass;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;

    if (LoadoutClassId > 0)
    {
        TrPC = TrPlayerController(GetPC());

        equipId = EquipInterface.GetActiveEquipId(LoadoutClassId, EQP_Primary, Pages.FocusIndex);
        FamilyInfo = EquipHelper.GetFamilyClass(LoadoutClassId);
        skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(LoadoutClassId, EQP_Skin, Pages.FocusIndex));

        if (equipId != ModelEquip)
        {
            ModelEquip = equipId;
            TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
        }
    }
}

function PopupData(GFxObject Obj)
{
    local int gpPrice;
    local int xpPrice;
    local class<TrFamilyInfo> FamilyInfo;

    if (Obj == none) return;
    
    FamilyInfo = EquipHelper.GetFamilyClass(LoadoutClassId);
    
    if (bSelectionPopup)
    {
        bCurrencyPopup = true;
        bSelectionPopup = false;

        if (FamilyInfo == none)
        {
            Obj.SetString("popupTitle", Strings.Error);
            Obj.SetString("popupBody", Strings.NoInfoFound);
            Obj.SetString("buttonLabel2", Strings.OK);
            Obj.SetFloat("enterKeyIndex", 1);
            Obj.SetFloat("type", 0);
            return;
        }

        UnlockItemName = Caps(FamilyInfo.default.FriendlyName)@"LOADOUT";
        UnlockTypeName = Strings.Unlocked;

        gpPrice = EquipInterface.GetLoadoutPrice(LoadoutClassId, PopupNum, 0);
        xpPrice = EquipInterface.GetLoadoutPrice(LoadoutClassId, PopupNum, 1);

        GPAmount = gpPrice;
        XPAmount = xpPrice;

        if (gpPrice > 0 && xpPrice > 0)
        {
            Obj.SetString("popupTitle", Strings.Unlock@Caps(FamilyInfo.default.FriendlyName)@"LOADOUT"@(PopupNum+1));
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

    if (bCurrencyPopup)
    {
        Obj.SetString("popupTitle", Strings.Unlock@Caps(FamilyInfo.default.FriendlyName)@"LOADOUT"@(PopupNum+1));
        Obj.SetFloat("type", 0);
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);

        if (PurchasingCurrency == 0)
        {
            UnlockIconType = AT_USEDGOLD;
            Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(FamilyInfo.default.FriendlyName)@"LOADOUT"@(PopupNum+1)@Strings.TrFor@GPAmount@Strings.Gold$"?");
        }
        else
        {
            UnlockIconType = AT_USEDXP;
            Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(FamilyInfo.default.FriendlyName)@"LOADOUT"@(PopupNum+1)@Strings.TrFor@XPAmount@Strings.XP$"?");
        }

        bCurrencyPopup = false;
        bConfirmationPopup = true;
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (bCurrencyPopup)
    {
        if (Action == 3)
        {
            bConfirmationPopup = true;
            PurchasingCurrency = 0;
            QueuePopup();
        }
        else if (Action == 4)
        {
            bConfirmationPopup = true;
            PurchasingCurrency = 1;
            QueuePopup();
        }

        bCurrencyPopup = false;
    }
    else if (bConfirmationPopup)
    {
        if (Action == 1)
        {
            EquipInterface.RequestPurchaseLoadout(LoadoutClassId, PopupNum, PurchasingCurrency);
        }

        PopupNum = INDEX_NONE;
        bConfirmationPopup = false;
    }
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
    local string loadout;
    local GFxObject obj;
    local class<TrFamilyInfo> FamilyInfo;

    FamilyInfo = EquipHelper.GetFamilyClass(LoadoutClassId);

    if (FamilyInfo == none) return none;

    obj = CreateObject("Object");

    obj.SetString("descTitle", Caps(FamilyInfo.default.FriendlyName));
    obj.SetString("description", Caps(FamilyInfo.default.ClassDescription));

    obj.SetString("loadoutTitle", Strings.Loadout);
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

    obj.SetString("loadout", loadout);

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

    equipId = EquipInterface.GetActiveEquipId(LoadoutClassId, EquipType, Pages.FocusIndex);

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
   PopupNum=-1
   HelpButtonBLabel="ALL CLASSES"
   OptionTitles(0)="SET ACTIVE"
   OptionTitles(1)="EDIT LOADOUT"
   Name="Default__GFxTrPage_Loadouts"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
