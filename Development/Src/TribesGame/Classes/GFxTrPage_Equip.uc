class GFxTrPage_Equip extends GFxTrPage;

var int  XPPrice;
var int  GoldPrice;
var int  ViewedEquip;
var int  FocusedEquip;
var int  PurchasingEquip;
var int  PurchasingUpgrade;
var int  ReticuleIndex;
var bool bUpgradePurchase;
var bool bReticulesOpen;

function SpecialAction(GFxTrAction Action)
{
    local class<TrPlayerVoice> voiceClass;

    NewAction = 0;

    if (Action.ActionNumber != EquipInterface.GetActiveEquipId(LoadoutClassId, LoadoutEquipType, ActiveLoadout))
    {
        if (bReticulesOpen)
        {
            ReticuleIndex = INDEX_NONE;
            bReticulesOpen = false;
            ASC_HideReticuleBuilder();
        }

        SetActiveEquip(Action.ActionNumber, true);
    }
    
    voiceClass = class<TrPlayerVoice>(EquipHelper.GetEquipClass(FocusedEquip));
    
    if (voiceClass != none)
    {
        TrPlayerController(GetPC()).SampleVoice(voiceClass);
    }
}

function ShowReticule(int Index)
{
    local GFxObject data;
    local class<TrDevice> equipClass;

    if (ReticuleIndex != INDEX_NONE)
    {
        HideReticule();
        RefreshPage();
    }
    else
    {
        data = CreateObject("Object");

        data.SetFloat("reticule", EquipInterface.GetReticuleValue(FocusedEquip, RDT_TYPE));
        data.SetFloat("opacity", EquipInterface.GetReticuleValue(FocusedEquip, RDT_OPACITY));
        data.SetString("color", EquipInterface.GetReticuleString(FocusedEquip, RDT_COLOR));

        equipClass = EquipHelper.GetEquipClass(FocusedEquip);

        if (equipClass != none)
        {
            data.SetString("title", Strings.CustomReticule@"-"@Caps(equipClass.default.ItemName));
        }

        ReticuleIndex = Index;
        bReticulesOpen = true;
        RefreshPage();

        ASC_ShowReticuleBuilder(data);
    }
}

function HideReticule()
{
    ReticuleIndex = INDEX_NONE;
    bReticulesOpen = false;
    ASC_HideReticuleBuilder();
}

function OnPurchaseSuccess()
{
    if (PurchasingEquip > 0)
    {
        SetActiveEquip(PurchasingEquip);
    }

    PurchasingEquip = 0;
}

function SetActiveEquip(int EquipId, optional bool bShowStatus = false)
{
    local TrPlayerController TrPC;
    local class<TrDevice> equipClass;

    TrPC = TrPlayerController(GetPC());
    
    if (!EquipInterface.SetActiveEquipId(LoadoutClassId, LoadoutEquipType, ActiveLoadout, EquipId))
    {
        if (TrPC != none)
        {
            TrPC.TestTrainingSlot(TR_EQUIP_POINT(LoadoutEquipType), EquipId);
        }

        return;
    }

    if (User.m_ClassId == LoadoutClassId)
    {
        TrPC = TrPlayerController(GetPC());
        
        if (TrPC != none)
        {
            TrPC.TestSlot(TR_EQUIP_POINT(LoadoutEquipType), EquipId);
        }
    }
        
    equipClass = EquipHelper.GetEquipClass(EquipId);

    if (equipClass != none && bShowStatus)
    {
        UpdateStatus(Caps(equipClass.default.ItemName@"EQUIPPED"));
    }

    RefreshButtons();
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (PageActions.Length == 0)
    {
        ActionIndex = GoBack;
    }
    else if (ActionIndex != GoBack)
    {
        SpecialAction(PageActions[ActionIndex]);
        TakeFocus(ActionIndex, DataList);
    }

    if (ActionIndex == GoBack)
    {
        if (bReticulesOpen)
        {
            HideReticule();
        }

        NewAction = -1;
        Pages.PopPage().FillData(DataList);
    }

    return NewAction;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    local int equipId;
    local class<TrSkin> skinClass;
    local class<TrDevice> equipClass;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;

    if (bReticulesOpen)
    {
        return 0;
    }

    super.TakeFocus(ActionIndex, DataList);
    
    TrPC = TrPlayerController(GetPC());

    if (TrPC != none && LoadoutClassId > 0)
    {
        equipId = EquipInterface.GetEquipId(LoadoutClassId, LoadoutEquipType, ActionIndex);

        if (equipId != FocusedEquip)
        {
            FocusedEquip = equipId;
            equipClass = EquipHelper.GetEquipClass(equipId);

            if (equipClass == none)
            {
                skinClass = EquipHelper.GetSkinClass(equipId);
                equipId = EquipInterface.GetActiveEquipId(LoadoutClassId, EQP_Primary, ActiveLoadout);
                FamilyInfo = EquipHelper.GetFamilyClass(LoadoutClassId);

                TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
            }
            else if (class<TrPlayerVoice>(equipClass) != none)
            {
                TrPC.SampleVoice(class<TrPlayerVoice>(equipClass));
            }
            else if (class<TrArmorMod>(equipClass) == none)
            {
                TrPC.UpdatePaperDoll_Device(equipClass);
            }
        }
    }

    CheckUpgrades(DataList);
    CheckPricing(DataList);
    CheckDescription(DataList);

    return 0;
}

function FillData(GFxObject DataList)
{
    local int equipId;
    local class<TrSkin> skinClass;
    local class<TrDevice> equipClass;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;
    
    ViewedEquip = 0;

    TrPC = TrPlayerController(GetPC());

    if (User.NeedsToSeeNewItemsType(LoadoutClassId, LoadoutEquipType))
    {
        User.SeenNewItemsType(LoadoutClassId, LoadoutEquipType);
    }

    super.FillData(DataList);

    if (TrPC != none)
    {
        FocusedEquip = EquipInterface.GetEquipId(LoadoutClassId, LoadoutEquipType, Pages.FocusIndex);

        if (FocusedEquip == 0)
        {
            FocusedEquip = EquipInterface.GetActiveEquipId(LoadoutClassId, LoadoutEquipType, ActiveLoadout);
        }

        equipClass = EquipHelper.GetEquipClass(FocusedEquip);

        if (equipClass == none)
        {
            skinClass = EquipHelper.GetSkinClass(FocusedEquip);
            equipId = EquipInterface.GetActiveEquipId(LoadoutClassId, EQP_Primary, ActiveLoadout);
            FamilyInfo = EquipHelper.GetFamilyClass(LoadoutClassId);

            TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
        }
        else
        {
            TrPC.UpdatePaperDoll_Device(equipClass);
        }
    }
}

function GFxObject FillOption(int ActionIndex)
{
    local int level;
    local int equipId;
    local GFxObject obj;
    local class<TrDevice> equip;

    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    equipId = PageActions[ActionIndex].ActionNumber;
    equip = EquipHelper.GetEquipClass(equipId);

    if (equip == none)
    {
        return FillSkin(ActionIndex);
    }

    if (bParentLocked || !EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, equipId))
    {
        obj.SetFloat("bLocked", 1);
    }
    else
    {
        obj.SetFloat("bLocked", 0);
    }
    
    if (equip == none)
    {
        obj.SetString("itemTitle", OptionSubtext[ActionIndex]);
    }
    else
    {
        obj.SetString("itemTitle", CAPS(equip.default.ItemName));
    }

    if (EquipInterface.GetActiveEquipId(LoadoutClassId, LoadoutEquipType, ActiveLoadout) == equipId)
    {
        obj.SetFloat("bItemSelected", 2);
    }
    else
    {
        obj.SetFloat("bItemSelected", 1);
    }

    if (class<TrPlayerVoice>(equip) == none && EquipInterface.IsEquipMaxed(LoadoutClassId, LoadoutEquipType, equipId))
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetString("itemSubTitle", Strings.Mastered);
    }
    else if (EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, equipId))
    {
        if (class<TrPlayerVoice>(equip) == none)
        {
            level = EquipInterface.GetEquipLevel(LoadoutClassId, LoadoutEquipType, equipId);

            if (level > 0) obj.SetString("itemSubTitle", Strings.Upgrade@Strings.Lvl@level);
            else obj.SetString("itemSubTitle", Strings.Base@Strings.Lvl);

           obj.SetFloat("skillIconsIndex", float(equip.default.Upgrades[level].IconId));
        }
        else
        {
            obj.SetString("itemSubTitle", Strings.Owned);
        }
    }
    else
    {
        obj.SetFloat("bItemSelected", 0);
        obj.SetString("itemSubTitle", Strings.Locked);
    }

    obj.SetString("itemRibbonLabel", "");
    obj.SetFloat("ribbonType", 0);
    obj.SetFloat("hasRibbon", 0);
    
    if (!EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, equipId))
    {
        if (User.NeedsToSeeNewItem(equipId))
        {
            obj.SetString("itemRibbonLabel", Strings.TrNew$"!");
            obj.SetFloat("ribbonType", 3);
            obj.SetFloat("hasRibbon", 1);
        }
        else if (EquipInterface.GetDailyDealItemId() == equipId)
        {
            obj.SetString("itemRibbonLabel", EquipInterface.GetDailyDealPercentOff()$"% OFF (GOLD)");
            obj.SetFloat("ribbonType", 3);
            obj.SetFloat("hasRibbon", 1);
        }
    }
    else
    {
        if (EquipInterface.HasReticule(equipId))
        {
            obj.SetFloat("bReticule", 1);
        }

        switch (RibbonManager.GetEquipRibbon(equipId))
        {
        case 1:  obj.SetString("itemRibbonLabel", Strings.Unlocked);  obj.SetFloat("ribbonType", 2); obj.SetFloat("hasRibbon", 1); break;
        case 3:  obj.SetString("itemRibbonLabel", Strings.Upgrade); obj.SetFloat("ribbonType", 1); obj.SetFloat("hasRibbon", 1); break;
        default: obj.SetFloat("hasRibbon", 0); break;
        }
    }

    return obj;
}

function GFxObject FillSkin(int ActionIndex)
{
    local int skinId;
    local GFxObject obj;
    local class<TrSkin> skinClass;
    
    skinId = PageActions[ActionIndex].ActionNumber;
    skinClass = EquipHelper.GetSkinClass(skinId);

    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    if (bParentLocked || !EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, skinId)) obj.SetFloat("bLocked", 1);
    
    if (skinClass == none)
    {
        obj.SetString("itemTitle", OptionSubtext[ActionIndex]);
    }
    else
    {
        obj.SetString("itemTitle", CAPS(skinClass.default.ItemName));
    }

    if (EquipInterface.GetActiveEquipId(LoadoutClassId, LoadoutEquipType, ActiveLoadout) == skinId)
    {
        obj.SetFloat("bItemSelected", 2);
    }
    else
    {
        obj.SetFloat("bItemSelected", 1);
    }

    if (EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, skinId))
    {
        obj.SetString("itemSubTitle", "");
    }
    else
    {
        obj.SetFloat("bItemSelected", 0);
        obj.SetString("itemSubTitle", Strings.Locked);
    }
    
    if (!EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, skinId) && User.NeedsToSeeNewItem(skinId))
    {
        obj.SetString("itemRibbonLabel", Strings.TrNew$"!");
        obj.SetFloat("ribbonType", 3);
        obj.SetFloat("hasRibbon", 1);
    }
    else
    {
        switch (RibbonManager.GetEquipRibbon(skinId))
        {
        case 1:  obj.SetString("itemRibbonLabel", Strings.Unlock);  obj.SetFloat("ribbonType", 2); obj.SetFloat("hasRibbon", 1); break;
        case 3:  obj.SetString("itemRibbonLabel", Strings.Upgrade); obj.SetFloat("ribbonType", 1); obj.SetFloat("hasRibbon", 1); break;
        default: obj.SetFloat("hasRibbon", 0); break;
        }
    }

    return obj;
}

function bool CheckUpgrades(GFxObject DataList)
{
    local bool bHaveUpgrades;
    local GFxObject obj;
    local GFxObject upgradeObj;
    
    bHaveUpgrades = true;

    if (bHaveUpgrades)
    {
        obj = CreateObject("Object");

        obj.SetFloat("elementId", MENU_ELEMENT_UPGRADES);

        upgradeObj = FillUpgrades(DataList);

        if (upgradeObj != none)
        {
            obj.SetObject("data", upgradeObj);

            if (DataList != none) DataList.SetElementObject(DataCount++, obj);
        }

        return true;
    }

    return false;
}

function GFxObject FillUpgrades(GFxObject DataList)
{
    local int i;
    local int total;
    local int tierXP;
    local int currentXP;
    local int currentLevel;
    local int upgradeCount;
    local float percent;
    local string progressText;
    local GFxObject obj;
    local class<TrDevice> equip;
    local array<float> XPTiers;

    if (bReticulesOpen)
    {
        return none;
    }

    equip = EquipHelper.GetEquipClass(FocusedEquip);

    if (equip == none) return none;

    if (class<TrPlayerVoice>(equip) != none) return none;

    upgradeCount = equip.default.Upgrades.Length;
    
    if (upgradeCount == 0) return none;

    currentLevel = EquipInterface.GetEquipLevel(LoadoutClassId, LoadoutEquipType, FocusedEquip);
    
    obj = CreateObject("Object");
    obj.SetFloat("RankLength", upgradeCount);
    obj.SetString("upgradeTitle", Strings.Upgrades);
    obj.SetString("upgradeDesc", Strings.UpgradeDesc);

    if (EquipInterface.IsClassOwned(LoadoutClassId) && EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, FocusedEquip))
    {
        obj.SetFloat("currentRank", currentLevel);
    }
    else
    {
        obj.SetFloat("currentRank", -1);
    }

    total = 0;

    for (i = 0; i < upgradeCount; i++)
    {
        obj.SetFloat("iconIndex"$i+1, float(equip.default.Upgrades[i].IconId));
        obj.SetString("itemDesc"$i+1, equip.default.UpgradeDescription[i]);

        tierXP = GetEquipmentTierXP(equip.default.DBXPActivityId, i);
        XPTiers.AddItem(tierXP);
        total = tierXP;

        if (currentLevel > i)
        {
            obj.SetString("itemLabel"$i+1, Strings.Owned);
        }
        else if (tierXP > 0)
        {
            obj.SetString("itemLabel"$i+1, string(tierXP));
        }
        else
        {
            obj.SetString("itemLabel"$i+1, Strings.Error);
        }        
    }

    if (total == 0)
    {
        total = 1;
    }

    for (i = 0; i < upgradeCount; i++)
    {
        percent = XPTiers[i]/float(total)*100;

        if (percent == 0 || percent >= 100)
        {
            percent = 1;
        }
        else if (percent < 3)
        {
            percent = 3;
        }

        obj.SetFloat("progressTick"$i+1, percent);
    }
    
    currentXP = GetEquipmentXP(equip.default.DBXPActivityId);

    if (!EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, FocusedEquip))
    {
        obj.SetFloat("bMastered", 1);
        obj.SetFloat("progressPercent", 2);
        obj.SetString("progressLabel", Strings.Locked);
    }
    else if (currentXP >= total || EquipInterface.IsEquipMaxed(LoadoutClassId, LoadoutEquipType, FocusedEquip))
    {
        obj.SetFloat("bMastered", 1);
        obj.SetFloat("progressPercent", 100);
        obj.SetString("progressLabel", Strings.Mastered);
    }
    else
    {
        percent = int((float(currentXP)/float(total))*100);
        progressText = currentXP@"/"@total;

        if (percent == 0 )
        {
            percent = 2;
        }
        else if (percent < 3)
        {
            percent = 3;
        }

        obj.SetFloat("bMastered", 0);
        obj.SetString("MasteryLabel", Strings.Mastery);
        obj.SetString("MasteryPrice", string(EquipInterface.GetMasteryPrice(LoadoutClassId, LoadoutEquipType, FocusedEquip)));
        obj.SetFloat("progressPercent", percent);
        obj.SetString("progressLabel", progressText);
    }

    return obj;
}

function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;

    if (bFillingFocus)
    {
        return false;
    }

    if (!EquipInterface.IsClassOwned(LoadoutClassId) || !EquipInterface.IsLoadoutOwned(LoadoutClassId, ActiveLoadout))
    {
        return false;
    }

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_PRICE);

    priceObj = FillPricing(DataList);

    if (priceObj != none)
    {
        obj.SetObject("data", priceObj);

        if (DataList != none)
        {
            DataList.SetElementObject(DataCount++, obj);
            return true;
        }
    }

    return false;
}

function GFxObject FillPricing(GFxObject DataList)
{
    local int gpCost;
    local int xpCost;
    local bool bHavePrice;
    local GFxObject obj;
    local class<TrDevice> equip;

    equip = EquipHelper.GetEquipClass(FocusedEquip);

    if (equip == none)
    {
        return FillPricingSkin(DataList);
    }
    else if (!EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, FocusedEquip))
    {
        obj = CreateObject("Object");

        obj.SetString("actionLabel", Strings.Unlock);
        obj.SetFloat("bUpgradeType", 0);
        
        gpCost = EquipInterface.GetEquipPrice(LoadoutClassId, LoadoutEquipType, FocusedEquip, 0);
        xpCost = EquipInterface.GetEquipPrice(LoadoutClassId, LoadoutEquipType, FocusedEquip, 1);   

        if (xpCost > 0 && gpCost > 0)
        {
            obj.SetString("orLabel", Strings.Or);
        }
        else
        {
            obj.SetString("orLabel", "");
        }

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
    }

    if (bHavePrice)
    {
        return obj;
    }

    return none;
}

function GFxObject FillPricingSkin(GFxObject DataList)
{
    local int gpCost;
    local int xpCost;
    local bool bHavePrice;
    local GFxObject obj;

    if (!EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, FocusedEquip))
    {
        obj = CreateObject("Object");
        obj.SetString("actionLabel", Strings.Unlock);
        obj.SetFloat("bUpgradeType", 0);
        
        gpCost = EquipInterface.GetEquipPrice(LoadoutClassId, LoadoutEquipType, FocusedEquip, 0);
        xpCost = EquipInterface.GetEquipPrice(LoadoutClassId, LoadoutEquipType, FocusedEquip, 1);   

        if (xpCost > 0 && gpCost > 0)
        {
            obj.SetString("orLabel", Strings.Or);
        }
        else
        {
            obj.SetString("orLabel", "");
        }

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

    descObj = FillDescription(DataList);

    if (descObj != none)
    {
        obj.SetObject("data", descObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }
}

function GFxObject FillDescription(GFxObject DataList)
{
    local GFxObject obj;
    local class<TrSkin> skinClass;
    local class<TrDevice> equip;

    if (bReticulesOpen)
    {
        return none;
    }

    equip = EquipHelper.GetEquipClass(FocusedEquip);

    if (equip == none)
    {
        skinClass = EquipHelper.GetSkinClass(FocusedEquip);

        if (skinClass == none)
        {
            return none;
        }

        obj = CreateObject("Object");
        obj.SetString("descTitle", Caps(skinClass.default.ItemName));
        obj.SetString("description", skinClass.default.InfoPanelDescription);

        return obj;
    }

    obj = CreateObject("Object");
    obj.SetString("descTitle", Caps(equip.default.ItemName));
    obj.SetString("description", Caps(equip.default.InfoPanelDescription));

    if (LoadoutEquipType == EQP_Armor || LoadoutEquipType == EQP_Pack || 
        LoadoutEquipType == EQP_PerkA || LoadoutEquipType == EQP_PerkB)
    {
        return obj;
    }

    obj.SetString("ratingsTitle", Strings.Ratings);

    obj.SetFloat("ratingsFrame1", equip.default.InfoPanelDamage == 0 ? float(0) : abs(equip.default.InfoPanelDamage)+1);
    obj.SetFloat("ratingsFrame2", equip.default.InfoPanelRadius == 0 ? float(0) : abs(equip.default.InfoPanelRadius)+1);
    obj.SetFloat("ratingsFrame3", equip.default.InfoPanelFireRate == 0 ? float(0) : abs(equip.default.InfoPanelFireRate)+1);
    obj.SetFloat("ratingsFrame4", equip.default.InfoPanelClipSize == 0 ? float(0) : abs(equip.default.InfoPanelClipSize)+1);
    
    obj.SetString("ratingsLabel1", Strings.Damage);
    obj.SetString("ratingsLabel3", Strings.FireRate);

    if (equip.default.InfoPanelRadius > 0)
    {
        obj.SetString("ratingsLabel2", Strings.Radius);
    }
    else if (equip.default.InfoPanelRadius <= 0)
    {
        obj.SetString("ratingsLabel2", Strings.Range);
    }    
    
    if (equip.default.InfoPanelClipSize >= 0) 
    {
        obj.SetString("ratingsLabel4", Strings.ClipSize);
    }
    else if (equip.default.InfoPanelClipSize < 0)
    {
        obj.SetString("ratingsLabel4", Strings.Ammo);
    }

    return obj;
}

function bool CheckPurchasable()
{
    return true;
}

function bool IsEquipMaxed(int Index)
{
    local int equipId;

    equipId = EquipInterface.GetEquipId(LoadoutClassId, LoadoutEquipType, Index);

    return EquipInterface.IsEquipMaxed(LoadoutClassId, LoadoutEquipType, equipId);
}

function bool IsOwned(int Index)
{
    local int equipId;

    equipId = EquipInterface.GetEquipId(LoadoutClassId, LoadoutEquipType, Index);

    return EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, equipId);
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    if (!IsOwned(ActionIndex) || !IsEquipMaxed(ActionIndex))
    {
        PurchasingEquip = EquipInterface.GetEquipId(LoadoutClassId, LoadoutEquipType, ActionIndex);

        if (PurchasingEquip > 0)
        {
            bWaitingForSelectionPopup = true;
            QueuePopup();
        }
    }

    return 0;
}

function PopupData(GFxObject Obj)
{
    local class<TrDevice> equipClass;

    if (Obj == none) return;
    
    equipClass = EquipHelper.GetEquipClass(PurchasingEquip);

    if (equipClass == none)
    {
        PopupDataSkin(Obj);
        return;
    }
    
    if (bWaitingForSelectionPopup)
    {
        bWaitingForCurrencyPopup = true;
        bWaitingForSelectionPopup = false;

        if (equipClass == none)
        {
            Obj.SetString("popupTitle", Strings.Error);
            Obj.SetString("popupBody", Strings.NoInfoFound);
            Obj.SetString("buttonLabel2", Strings.OK);
            Obj.SetFloat("enterKeyIndex", 1);
            Obj.SetFloat("type", 0);
            return;
        }

        if (EquipInterface.IsEquipOwned(LoadoutClassId, LoadoutEquipType, PurchasingEquip))
        {
            bUpgradePurchase = true;

            /*level = EquipInterface.GetEquipLevel(LoadoutClassId, LoadoutEquipType, PurchasingEquip);

            PurchasingUpgrade = equipClass.default.Upgrades[level].DatabaseItemId;

            //UnlockIconId   = equipClass.default.Upgrades[level].IconId;
            UnlockItemName = equipClass.default.ItemName;
            UnlockTypeName = "UPGRADED";*/

            GoldPrice = 0;
            XPPrice = EquipInterface.GetMasteryPrice(LoadoutClassId, LoadoutEquipType, PurchasingEquip);

            if (XPPrice <= 0)
            {
                Obj.SetString("popupTitle", Strings.Error);
                Obj.SetString("popupBody", Strings.NoInfoFound);
                Obj.SetString("buttonLabel2", Strings.OK);
                Obj.SetFloat("type", 0);
                return;
            }

            if (GoldPrice > 0 && XPPrice > 0)
            {
                Obj.SetString("popupTitle", Strings.Upgrade@Caps(equipClass.default.ItemName));
                Obj.SetFloat("type", 1);
                Obj.SetString("orLabel", Strings.Or);
                Obj.SetString("goldCopy", Strings.Use@Strings.Gold);
                Obj.SetString("goldCost", string(GoldPrice));
                Obj.SetString("xpCopy", Strings.Use@Strings.XP);
                Obj.SetString("xpCost", string(XPPrice));
                Obj.SetString("buttonLabel2", Strings.Cancel);
                Obj.SetFloat("enterKeyIndex", -1);

                return;
            }
        
            if (GoldPrice > 0)
            {
                PurchasingCurrency = 0;
            }
            else if (XPPrice > 0)
            {
                PurchasingCurrency = 1;
            }
        }
        else
        {
            bUpgradePurchase = false;

            GoldPrice = EquipInterface.GetEquipPrice(LoadoutClassId, LoadoutEquipType, PurchasingEquip, 0);
            XPPrice = EquipInterface.GetEquipPrice(LoadoutClassId, LoadoutEquipType, PurchasingEquip, 1);

            //UnlockIconId   = 52;
            UnlockItemName = equipClass.default.ItemName;
            UnlockTypeName = Strings.Unlocked;

            if (GoldPrice > 0 && XPPrice > 0)
            {
                Obj.SetString("popupTitle", Strings.Unlock@Caps(equipClass.default.ItemName));
                Obj.SetFloat("type", 1);
                Obj.SetString("orLabel", Strings.Or);
                Obj.SetString("goldCopy", Strings.Use@Strings.Gold);
                Obj.SetString("goldCost", string(GoldPrice));
                Obj.SetString("xpCopy", Strings.Use@Strings.XP);
                Obj.SetString("xpCost", string(XPPrice));
                Obj.SetString("buttonLabel2", Strings.Cancel);
                Obj.SetFloat("enterKeyIndex", -1);

                return;
            }
        
            if (GoldPrice > 0)
            {
                PurchasingCurrency = 0;
            }
            else if (XPPrice > 0)
            {
                PurchasingCurrency = 1;
            }
        }
    }

    if (bWaitingForCurrencyPopup)
    {
        Obj.SetFloat("type", 0);
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);

        if (bUpgradePurchase)
        {
            Obj.SetString("popupTitle", Strings.Upgrade@Caps(equipClass.default.ItemName));

            if (PurchasingCurrency == 0)
            {
                UnlockIconType = AT_USEDGOLD;
                Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Upgrade@Caps(equipClass.default.ItemName)@Strings.TrFor@GoldPrice@Strings.Gold$"?");
            }
            else
            {
                UnlockIconType = AT_USEDXP;
                Obj.SetString("popupBody", Strings.AreYouSureYouWantToUnlockAllUpgradesForXX@XPPrice@Strings.XP$"?");
            }
        }
        else
        {
            Obj.SetString("popupTitle", Strings.Unlock@Caps(equipClass.default.ItemName));

            if (PurchasingCurrency == 0)
            {
                UnlockIconType = AT_USEDGOLD;
                Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(equipClass.default.ItemName)@Strings.TrFor@GoldPrice@Strings.Gold$"?");
            }
            else
            {
                UnlockIconType = AT_USEDXP;
                Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(equipClass.default.ItemName)@Strings.TrFor@XPPrice@Strings.XP$"?");
            }
        }

        bWaitingForCurrencyPopup = false;
        bWaitingForConfirmationPopup = true;
    }
}

function PopupDataSkin(GFxObject Obj)
{
    local class<TrSkin> skinClass;
    
    skinClass = EquipHelper.GetSkinClass(PurchasingEquip);

    if (skinClass == none)
    {
        return;
    }
    
    if (bWaitingForSelectionPopup)
    {
        bWaitingForCurrencyPopup = true;
        bWaitingForSelectionPopup = false;

        if (skinClass == none)
        {
            Obj.SetString("popupTitle", Strings.Error);
            Obj.SetString("popupBody", Strings.NoInfoFound);
            Obj.SetString("buttonLabel2", Strings.OK);
            Obj.SetFloat("enterKeyIndex", 1);
            Obj.SetFloat("type", 0);
            return;
        }

        bUpgradePurchase = false;

        GoldPrice = EquipInterface.GetEquipPrice(LoadoutClassId, LoadoutEquipType, PurchasingEquip, 0);
        XPPrice = EquipInterface.GetEquipPrice(LoadoutClassId, LoadoutEquipType, PurchasingEquip, 1);

        //UnlockIconId   = 52;
        UnlockItemName = skinClass.default.ItemName;
        UnlockTypeName = Strings.Unlocked;

        if (GoldPrice > 0 && XPPrice > 0)
        {
            Obj.SetString("popupTitle", Strings.Unlock@Caps(skinClass.default.ItemName));
            Obj.SetFloat("type", 1);
            Obj.SetString("orLabel", Strings.Or);
            Obj.SetString("goldCopy", Strings.Use@Strings.Gold);
            Obj.SetString("goldCost", string(GoldPrice));
            Obj.SetString("xpCopy", Strings.Use@Strings.XP);
            Obj.SetString("xpCost", string(XPPrice));
            Obj.SetString("buttonLabel2", Strings.Cancel);
            Obj.SetFloat("enterKeyIndex", -1);

            return;
        }
    
        if (GoldPrice > 0)
        {
            PurchasingCurrency = 0;
        }
        else if (XPPrice > 0)
        {
            PurchasingCurrency = 1;
        }
    }

    if (bWaitingForCurrencyPopup)
    {
        Obj.SetFloat("type", 0);
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);

        Obj.SetString("popupTitle", Strings.Unlock@Caps(skinClass.default.ItemName));

        if (PurchasingCurrency == 0)
        {
            UnlockIconType = AT_USEDGOLD;
            Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(skinClass.default.ItemName)@Strings.TrFor@GoldPrice@Strings.Gold$"?");
        }
        else
        {
            UnlockIconType = AT_USEDXP;
            Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(skinClass.default.ItemName)@Strings.TrFor@XPPrice@Strings.XP$"?");
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
            if (bUpgradePurchase)
            {
                //EquipInterface.RequestPurchaseUpgrade(LoadoutClassId, LoadoutEquipType, PurchasingEquip, PurchasingUpgrade, PurchasingCurrency);
                EquipInterface.RequestPurchaseMastery(LoadoutClassId, LoadoutEquipType, PurchasingEquip);
            }
            else
            {
                EquipInterface.RequestPurchaseEquip(LoadoutClassId, LoadoutEquipType, PurchasingEquip, PurchasingCurrency);
            }
        }

        bWaitingForConfirmationPopup = false;
    }
}

function SaveReticule(GFxObject Data)
{
    if (Data != none)
    {
        EquipInterface.SetReticuleValue(FocusedEquip, RDT_TYPE,    Data.GetFloat("reticuleId"));
        EquipInterface.SetReticuleValue(FocusedEquip, RDT_OPACITY, Data.GetFloat("opacity"));
        EquipInterface.SetReticuleString(FocusedEquip, RDT_COLOR,  Data.GetString("colorId"));
    }
}

function OnClose()
{
    if (bReticulesOpen)
    {
        HideReticule();
    }
}

defaultproperties
{
   ReticuleIndex=-1
   PageLabel="EQUIPMENT"
   Name="Default__GFxTrPage_Equip"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
