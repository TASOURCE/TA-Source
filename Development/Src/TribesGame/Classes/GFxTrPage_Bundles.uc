class GFxTrPage_Bundles extends GFxTrPage;

var int selectedActionIdx;
var int selectedVendorItemId;
var bool bWaitingForBundleOwnedPopup;
var bool bWaitingForClassRequiredPopup;
var localized string DescriptionLabel;

var int classIdRequired;

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());

    Super.TakeFocus(ActionIndex, DataList);

    if (TrEPC != none)
    {
        switch (PageActions[ActionIndex].ActionNumber)
        {
        case BUNDLE_LOOT_ID_CAD_ASSASSIN:  TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Inf_Asn);   break;
        case BUNDLE_LOOT_ID_CAD_MERCENARY: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Inf_Merc);  break;
        case BUNDLE_LOOT_ID_CAD_PREMIUM:   TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Inf_Prem);  break;
        case BUNDLE_LOOT_ID_CAD_WEAPONS:   TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Inf_Wep);   break;
        /*case BUNDLE_LOOT_ID_RAP_GRIEVER:   TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Rdr_Gvr);   break;
        case BUNDLE_LOOT_ID_RAP_MERCENARY: TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Rdr_Merc);  break;
        case BUNDLE_LOOT_ID_RAP_PREMIUM:   TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Rdr_Prem);  break;
        case BUNDLE_LOOT_ID_RAP_WEAPONS:   TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Rdr_Wep);   break;*/
        case BUNDLE_LOOT_ID_NEWPLAYER:     TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_StarterPack);      break;
        case BUNDLE_LOOT_ID_SHAZBUNDLE:    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_LoG);       break;
        case BUNDLE_LOOT_ID_STAYINALIVE:   TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Brt_Wep);   break;
        case BUNDLE_LOOT_ID_TWINFUSOR:     TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Twinfusor); break;
        case BUNDLE_LOOT_ID_SKINPACK:      TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_SkinPack);  break;
        case BUNDLE_LOOT_ID_SPECIALIST:    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Specialist);break;
        case BUNDLE_LOOT_ID_SENTINEL:      TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_Sentinel);  break;
        default:                           TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_None);             break;
        }
    }

    User.SeenNewBundle(PageActions[ActionIndex].ActionNumber);

    CheckPricing(DataList);
    CheckDescription(DataList);

    return 0;
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
    }

    if (ActionIndex == GoBack)
    {
        NewAction = -1;
        Pages.PopPage().FillData(DataList);
    }

    return NewAction;
}

function SpecialAction(GFxTrAction Action)
{
    local int classId;

    NewAction = 0;
    classId = EquipInterface.GetBundleParent(Action.ActionNumber);

    if (classId > 0 && !EquipInterface.IsClassOwned(classId))
    {
        classIdRequired = classId;
        bWaitingForClassRequiredPopup = true;
        QueuePopup();
    }
    else if (EquipInterface.IsBundleOwned(Action.ActionNumber))
    {
        bWaitingForBundleOwnedPopup = true;
        QueuePopup();
    }
}

function FillData(GFxObject DataList)
{
    local int i;
    local int count;
    local int id;

    for (i = PageActions.Length; i > 0; i--)
    {
        PageActions.Remove(i-1, 1);
    }

    count = EquipInterface.GetVendorSize(SHOP_VENDOR_BUNDLES);

    //not page safe
    for (i=count;i>0;i--)
    {
        id = EquipInterface.GetVendorItemId(SHOP_VENDOR_BUNDLES, i-1);

        if(id > 0)
        {
            AddActionNumber(id);
        }
    }

    super.FillData(DataList);    
}

function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_PRICE);

    if (EquipInterface.IsBundleOwned(PageActions[Pages.FocusIndex].ActionNumber))
    {
        return false;
    }
    
    priceObj = FillPricing(DataList);

    if(priceObj != none)
    {
        obj.SetObject("data",priceObj);        
        if(DataList != none) DataList.SetElementObject(DataCount++, obj);
        return true;
    }

    return false;
}

function GFxObject FillPricing(GFxObject DataList)
{
    local int   gCost;
    local int   xpCost;
    local bool  bHasGoldCost;
    local bool  bHasXPCost;    
    local GFxObject obj;

    obj = None;

    bHasGoldCost = EquipInterface.GetVendorItemPrice(SHOP_VENDOR_BUNDLES,PageActions[Pages.FocusIndex].ActionNumber, 0, gCost);
    bHasXPCost = EquipInterface.GetVendorItemPrice(SHOP_VENDOR_BUNDLES,PageActions[Pages.FocusIndex].ActionNumber, 1, xpCost);
    
    if(bHasGoldCost || bHasXPCost)
    {
        obj = CreateObject("Object");
        obj.SetString("actionLabel", Strings.Buy);
        if(bHasGoldCost && bHasXPCost)
        {            
            obj.SetString("orLabel", Strings.OK);
            obj.SetFloat("bUpgradeType",0);
        }
        else
        {
            obj.SetString("orLabel", "");
            if(bHasGoldCost)
            {
                obj.SetFloat("bUpgradeType",2);
            }
            else
            {
                obj.SetFloat("bUpgradeType",1);
            }
        }

        if(bHasGoldCost)
        {
            obj.SetFloat("gold", gCost);
        }
        else
        {   
            obj.SetFloat("gold", 0);
        }

        if(bHasXPCost)
        {
            obj.SetFloat("xp", xpCost);
        }
        else
        {
            obj.SetFloat("xp",0);
        }
    }
    return obj;
}

//overrides base "what's in the element"
function GFxObject FillOption(int ActionIndex)
{
    local int classId;
    local GFxObject obj;
    local class<TrFamilyInfo> FamilyInfo;
    local string itemName, itemDesc, ribbonDesc;

    obj = CreateObject("Object");
    obj.SetFloat("actionID",ActionIndex);

    EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BUNDLES, PageActions[ActionIndex].ActionNumber, itemName, itemDesc, ribbonDesc);

    obj.SetString("itemTitle",Caps(itemName));
    obj.SetString("itemSubTitle",Strings.BundlePack);

    if (User.NeedToSeeNewBundle(PageActions[ActionIndex].ActionNumber))
    {
        obj.SetString("itemRibbonLabel", Strings.TrNew@Strings.Bundle);
        obj.SetFloat("ribbonType", 3);
        obj.SetFloat("hasRibbon", 1);
    }
    
    classId = EquipInterface.GetBundleParent(PageActions[ActionIndex].ActionNumber);

    if (classId > 0 && !EquipInterface.IsClassOwned(classId))
    {
        FamilyInfo = EquipHelper.GetFamilyClass(classId);
        obj.SetString("itemSubTitle", Strings.Requires@Caps(FamilyInfo.default.FriendlyName));
        obj.SetFloat("bLocked", 0);
    }
    else if (EquipInterface.IsBundleOwned(PageActions[ActionIndex].ActionNumber))
    {
        obj.SetString("itemSubTitle",Strings.AllItemsOwned);
        obj.SetFloat("bLocked", 1);
    }
    else
    {
        obj.SetFloat("bLocked", 0);
    } 
    
    return obj;
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
    local GFxObject obj;
    local string itemName, itemDesc, ribbonDesc;

    if (PageActions[Pages.FocusIndex].ActionNumber > 0)
    {
        EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BUNDLES, PageActions[Pages.FocusIndex].ActionNumber, itemName, itemDesc, ribbonDesc);

        obj = CreateObject("Object");
        obj.SetFloat("bBundle", 1);
        obj.SetString("descTitle", Caps(itemName));
        obj.SetString("description", itemDesc);

        return obj;
    }
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Bundle_SkinPack);
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    local int classId;

    SelectedVendorItemId = PageActions[ActionIndex].ActionNumber;
    classId = EquipInterface.GetBundleParent(SelectedVendorItemId);

    if (classId > 0 && !EquipInterface.IsClassOwned(classId))
    {
        classIdRequired = classId;
        bWaitingForClassRequiredPopup = true;
        QueuePopup();
    }
    else if (!EquipInterface.IsBundleOwned(SelectedVendorItemId))
    {
        bWaitingForCurrencyPopup = true;
        QueuePopup();
    }

    return 0;
}

function PopupData(GFxObject Obj)
{
    local bool bHasGoldCost;
    local int GPAmount;
    local string itemName;
    local string itemDesc;
    local string ribbonDesc;
    local class<TrFamilyInfo> FamilyInfo;

    if (Obj == none) return;

    if (bWaitingForClassRequiredPopup)
    {
        FamilyInfo = EquipHelper.GetFamilyClass(classIdRequired);

        Obj.SetFloat("type", 0);
        Obj.SetString("popupTitle", Strings.Requires@Caps(FamilyInfo.default.FriendlyName)@Strings.TrClass);
        Obj.SetString("popupBody", Strings.BundleRequiresBody@Caps(FamilyInfo.default.FriendlyName)@Strings.TrClass);
        Obj.SetString("popupBody", Strings.VisitClassPage);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);

    }
    else if (bWaitingForBundleOwnedPopup)
    {
        bWaitingForBundleOwnedPopup = false;

        Obj.SetString("popupTitle", Strings.Bundle@Strings.Owned);
        Obj.SetString("popupBody", Strings.BundleOwnedBody);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetFloat("type", 0);
    }
    else if(bWaitingForCurrencyPopup)
    {
        bHasGoldCost = EquipInterface.GetVendorItemPrice(SHOP_VENDOR_BUNDLES,SelectedVendorItemId, 0, GPAmount);
        EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BUNDLES, SelectedVendorItemId, itemName, itemDesc, ribbonDesc);
        if(!bHasGoldCost)
            bWaitingForCurrencyPopup = false; //hack

        UnlockIconType = AT_USEDGOLD;
        Obj.SetFloat("type", 0);
        Obj.SetString("popupTitle", Caps(itemName));
        Obj.SetString("popupBody", Strings.Purchase@Strings.TrFor@GPAmount@Strings.Gold$"?");
        //Obj.SetString("buttonLabel1", "ADD GOLD");
        Obj.SetString("buttonLabel2", Strings.Purchase);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);             
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (bWaitingForClassRequiredPopup)
    {
        bWaitingForClassRequiredPopup = false;

        if (Action == 1)
        {
            Pages.TravelToClasses();
        }
    }
    else if(bWaitingForCurrencyPopup)
    {
        bWaitingForCurrencyPopup = false;
        
        /*if(Action == 0)
        {
            Pages.PushPage(Pages.BuyGoldPage);
            bOpeningMenu = true;
            StartMainMenu();
        }
        else */if(Action == 1)
        {
            //TAG=CURRENTLY_GOLD_ONLY
            EquipInterface.RequestPurchaseGeneral(SHOP_VENDOR_BUNDLES,SelectedVendorItemId,0,"");
        }
    }    
}

defaultproperties
{
   DescriptionLabel="Bundle packs give a lot for less."
   PageLabel="BUNDLE PACKS"
   Name="Default__GFxTrPage_Bundles"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
