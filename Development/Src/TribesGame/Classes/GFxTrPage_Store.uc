class GFxTrPage_Store extends GFxTrPage;

var int XPCost;
var int HZCost;
var int NumDeal;
var int NumGold;
var int PopupNum;
var int ClassIdRequired;
var bool bCurrencyPopup;
var bool bSelectionPopup;
var bool bClassRequiredPopup;
var bool bConfirmationPopup;
var localized string NoNameChangeInGame;

var int ClaimPromotionAction;
var bool bWaitingForClaimPromoPopup;
var localized string PromoPopupTitle;

function Initialize()
{
    AddActionNumber(NumGold);
    AddActionNumber(NumDeal);
    AddActionPage(Pages.BundlesPage);
    AddActionPage(Pages.BuyBoostPage);
    AddActionPage(Pages.NameChangePage);
    AddActionPage(Pages.ClanTagChangePage);
    AddActionNumber(ClaimPromotionAction);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionNumber == NumGold)
    {
        if (!Pages.NavigateGold(true))
        {
            PageActions[Action.ActionIndex].ActionPage = Pages.BuyGoldPage;
        }
    }

    if (Action.ActionNumber == ClaimPromotionAction)
    {
        bWaitingForClaimPromoPopup = true;
        QueuePopup();
    }
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    local int equipId;
    local TrPlayerController TrPC;
    local class<TrSkin> skinClass;
    local class<TrDevice> equipClass;
    local class<TrFamilyInfo> familyClass;

    TrPC = TrPlayerController(GetPC());

    super.TakeFocus(ActionIndex, DataList);

    if (ActionIndex < 0 || ActionIndex >= PageActions.Length)
    {
        return 0;
    }

    if (TrPC != none)
    {
        if (PageActions[ActionIndex].ActionNumber == NumDeal)
        {
            CheckPricing(DataList);
            equipClass = EquipHelper.GetEquipClass(EquipInterface.GetDailyDealItemId());

            if (equipClass == none)
            {
                familyClass = EquipHelper.GetFamilyClass(EquipInterface.GetDailyDealItemId());

                if (familyClass ==  none)
                {
                    skinClass = EquipHelper.GetSkinClass(EquipInterface.GetDailyDealItemId());

                    if (skinClass != none)
                    {
                        familyClass = EquipHelper.GetFamilyClass(EquipInterface.GetDailyDealClass());

                        if (familyClass != none)
                        {
                            equipId = EquipInterface.GetActiveEquipId(familyClass.default.ClassId, EQP_Primary, 0);
                            TrPC.UpdatePaperDoll(familyClass, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
                        }
                    }
                }
                else
                {
                    equipId = EquipInterface.GetActiveEquipId(familyClass.default.ClassId, EQP_Primary, 0);
                    skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(familyClass.default.ClassId, EQP_Skin, 0));

                    TrPC.UpdatePaperDoll(familyClass, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
                }
            }
            else
            {
                TrPC.UpdatePaperDoll_Device(equipClass);
            }
        }
        else if (PageActions[ActionIndex].ActionNumber == NumGold)
        {
            Pages.BuyGoldPage.ShowModel();
        }
        else if (PageActions[ActionIndex].ActionPage != none)
        {
            PageActions[ActionIndex].ActionPage.ShowModel();
        }
    }
    
    CheckDescription(DataList);    

    return NewAction;
}

function FillData(GFxObject DataList)
{
    super.FillData(DataList);

    if (!User.m_SeenNewBundlesMain)
    {
        User.SeenNewBundlesMain();
    }
}

function GFxObject FillOption(int ActionIndex)
{
    //local int classId;
    local string itemName;
    local GFxObject obj;
    local class<TrSkin> skinClass;
    local class<TrDevice> equipClass;
    local class<TrFamilyInfo> familyClass;

    obj = super.FillOption(ActionIndex);    

    if (PageActions[ActionIndex].ActionNumber == NumDeal)
    {
        if (EquipInterface.IsDailyDealOwned())
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemSubTitle", Strings.Owned);
            obj.SetFloat("bLocked", 1);
        }
        else
        {            
            equipClass = EquipHelper.GetEquipClass(EquipInterface.GetDailyDealItemId());

            if (equipClass == none)
            {
                familyClass = EquipHelper.GetFamilyClass(EquipInterface.GetDailyDealItemId());

                if (familyClass == none)
                {
                    skinClass = EquipHelper.GetSkinClass(EquipInterface.GetDailyDealItemId());

                    if (skinClass != none)
                    {
                        itemName = skinClass.default.ItemName;
                    }
                }
                else
                {
                    itemName = familyClass.default.FriendlyName;
                }
            }
            else
            {
                itemName = equipClass.default.ItemName;
            }

            obj.SetString("itemRibbonLabel", EquipInterface.GetDailyDealPercentOff()$"% OFF (GOLD)");
            obj.SetString("itemSubTitle", Caps(itemName));
            obj.SetFloat("ribbonType", 3);
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("bLocked", 0);
        }
    }
    
    if (PageActions[ActionIndex].ActionPage == Pages.ClanTagChangePage)
    {
        if (User.NeedsToSeeClanTags())
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 3);
            obj.SetString("itemRibbonLabel", Strings.ClanTags);
        }

        if (!HaveClanTag())
        {
            obj.SetString("itemTitle", Strings.AddClanTag);
        }
    }
    
    if (PageActions[ActionIndex].ActionPage == Pages.BundlesPage &&
        User.NeedToSeeNewBundle())
    {
        obj.SetString("itemRibbonLabel", Strings.TrNew@Strings.Bundles);
        obj.SetFloat("ribbonType", 3);
        obj.SetFloat("hasRibbon", 1);
    }

    if (bInGame && PageActions[ActionIndex].ActionPage == Pages.NameChangePage)        
    {
        obj.SetFloat("bLocked", 1);
        obj.SetString("itemSubTitle",Caps(NoNameChangeInGame));
    }

    return obj;
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex >= 0 && ActionIndex < PageActions.Length)
    {
        if (bInGame && PageActions[ActionIndex].ActionPage == Pages.NameChangePage)
        {
            return 0;
        }

        if (PageActions[ActionIndex].ActionNumber == NumDeal)
        {
            return ModifyAction(ActionIndex, DataList);
        }
    }

    return super.TakeAction(ActionIndex, DataList);
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
    local string desc;
    local GFxObject obj;
    local class<TrSkin> skinClass;
    local class<TrDevice> equipClass;
    local class<TrFamilyInfo> familyClass;

    if (Pages.FocusIndex < 0 || Pages.FocusIndex >= PageActions.Length)
    {
        return none;
    }

    if (PageActions[Pages.FocusIndex].ActionNumber != NumDeal)
    {
        return none;
    }

    equipClass = EquipHelper.GetEquipClass(EquipInterface.GetDailyDealItemId());

    if (equipClass == none)
    {
        familyClass = EquipHelper.GetFamilyClass(EquipInterface.GetDailyDealItemId());

        if (familyClass == none)
        {
            skinClass = EquipHelper.GetSkinClass(EquipInterface.GetDailyDealItemId());

            if (skinClass != none)
            {
                obj = CreateObject("Object");
                obj.SetString("descTitle", Caps(skinClass.default.ItemName));
                desc = skinClass.default.InfoPanelDescription;

                familyClass = EquipHelper.GetFamilyClass(EquipInterface.GetDailyDealClass());

                if (familyClass != none)
                {
                    desc = desc@"("$Strings.TrFor@Caps(familyClass.default.FriendlyName$")");
                }

                obj.SetString("description", desc);
            }
        }
        else
        {
            obj = CreateObject("Object");
            obj.SetString("descTitle", Caps(familyClass.default.FriendlyName));
            obj.SetString("description", Caps(familyClass.default.ClassDescription));
        }
    }
    else
    {
        obj = CreateObject("Object");
        obj.SetString("descTitle", Caps(equipClass.default.ItemName));
        desc = Caps(equipClass.default.InfoPanelDescription);

        familyClass = EquipHelper.GetFamilyClass(EquipInterface.GetDailyDealClass());

        if (familyClass != none)
        {
            desc = desc@"("$Strings.TrFor@Caps(familyClass.default.FriendlyName$")");
        }

        obj.SetString("description", desc);

        obj.SetString("ratingsTitle", Strings.Ratings);
        obj.SetString("ratingsLabel1", Strings.Damage);
        obj.SetString("ratingsLabel2", Strings.Radius);
        obj.SetString("ratingsLabel3", Strings.FireRate);
        obj.SetString("ratingsLabel4", Strings.ClipSize);

        if (equipClass.default.InfoPanelDamage > 0) obj.SetFloat("ratingsFrame1", equipClass.default.InfoPanelDamage+1);
        else obj.SetFloat("ratingsFrame1", 0);
        
        if (equipClass.default.InfoPanelRadius > 0) obj.SetFloat("ratingsFrame2", equipClass.default.InfoPanelRadius+1);
        else obj.SetFloat("ratingsFrame2", 0);
        
        if (equipClass.default.InfoPanelFireRate > 0) obj.SetFloat("ratingsFrame3", equipClass.default.InfoPanelFireRate+1);
        else obj.SetFloat("ratingsFrame3", 0);
        
        if (equipClass.default.InfoPanelClipSize > 0) obj.SetFloat("ratingsFrame4", equipClass.default.InfoPanelClipSize+1);
        else obj.SetFloat("ratingsFrame4", 0);
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

    if (Pages.FocusIndex == 1 && EquipInterface.IsDailyDealOwned())
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
    local int gpPrice;
    local int xpPrice;
    local GFxObject obj;

    obj = CreateObject("Object");

    obj.SetString("actionLabel", Strings.Unlock);
    obj.SetFloat("bUpgradeType", 0);
    
    if (Pages.FocusIndex == 1)
    {
        gpPrice = EquipInterface.GetDailyDealNewPrice();
        xpPrice = EquipInterface.GetDailyDealXPPrice();
        
        if (xpPrice > 0 && gpPrice > 0)
        {
            obj.SetString("orLabel", Strings.Or);
        }
        else
        {
            obj.SetString("orLabel", "");
        }

        if (xpPrice > 0)
        {
            obj.SetFloat("xp", xpPrice);
        }

        if (gpPrice > 0)
        {
            obj.SetFloat("gold", gpPrice);
        }
    }

    return obj;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    PopupNum = PageActions[ActionIndex].ActionNumber;

    if (PopupNum == NumDeal)
    {
        if (!EquipInterface.IsDailyDealOwned())
        {
            bSelectionPopup = true;
            QueuePopup();
        }
    }

    return 0;
}

function PopupData(GFxObject Obj)
{
    local string itemTitle;
    //local string ribbon;
    local string itemName;
    local class<TrSkin> skinClass;
    local class<TrDevice> equipClass;
    local class<TrFamilyInfo> familyClass;

    if (Obj == none)
    {
        return;
    }

    if (bClassRequiredPopup)
    {
        familyClass = EquipHelper.GetFamilyClass(ClassIdRequired);

        Obj.SetFloat("type", 0);
        Obj.SetString("popupTitle", Strings.Requires@Caps(familyClass.default.FriendlyName)@Strings.TrClass);
        Obj.SetString("popupBody", Strings.VisitClassPage);
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);

        return;
    }
    
    if (bWaitingForClaimPromoPopup)
    {
        Obj.SetFloat("type", 2);
        Obj.SetString("popupTitle", PromoPopupTitle);
        Obj.SetString("popupBody", "");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);   
        Obj.SetFloat("enterKeyIndex", 1);

        return;
    }

    if (PopupNum == NumDeal)
    {
        equipClass = EquipHelper.GetEquipClass(EquipInterface.GetDailyDealItemId());
        familyClass = EquipHelper.GetFamilyClass(EquipInterface.GetDailyDealClass());

        if (equipClass == none)
        {
            familyClass = EquipHelper.GetFamilyClass(EquipInterface.GetDailyDealItemId());

            if (familyClass == none)
            {
                skinClass = EquipHelper.GetSkinClass(EquipInterface.GetDailyDealItemId());

                if (skinClass == none)
                {
                    Obj.SetString("popupTitle", Strings.Error);
                    Obj.SetString("popupBody", Strings.NoInfoFound);
                    Obj.SetString("buttonLabel2", Strings.OK);
                    Obj.SetFloat("enterKeyIndex", 1);
                    Obj.SetFloat("type", 0);
                    return;
                }
                else
                {
                    itemName = Caps(skinClass.default.ItemName);
                    itemTitle = itemName;

                    if (familyClass != none)
                    {
                        itemName = itemName@"("$Strings.TrFor@Caps(familyClass.default.FriendlyName)$")";
                    }
                }
            }
            else
            {
                itemName = Caps(familyClass.default.FriendlyName);
            }
        }
        else
        {
            itemName = Caps(equipClass.default.ItemName);
            itemTitle = itemName;

            if (familyClass != none)
            {
                itemName = itemName@"("$Strings.TrFor@Caps(familyClass.default.FriendlyName)$")";
            }
        }
    }
    
    if (bSelectionPopup)
    {
        bSelectionPopup = false;
        bCurrencyPopup = true;

        if (PopupNum == NumDeal)
        {
            XPCost = EquipInterface.GetDailyDealXPPrice();
            HZCost = EquipInterface.GetDailyDealNewPrice();
            UnlockItemName = equipClass.default.ItemName;
        }

        UnlockTypeName = Strings.Unlocked;

        if (HZCost > 0 && XPCost > 0)
        {
            Obj.SetString("popupTitle", Strings.Unlock@itemTitle);
            Obj.SetFloat("type", 1);
            Obj.SetString("orLabel", Strings.Or);
            Obj.SetString("goldCopy", Strings.Use@Strings.Gold);
            Obj.SetString("goldCost", string(HZCost));
            Obj.SetString("xpCopy", Strings.Use@Strings.XP);
            Obj.SetString("xpCost", string(XPCost));
            Obj.SetString("buttonLabel2", Strings.Cancel);
            Obj.SetFloat("enterKeyIndex", -1);

            return;
        }
    
        if (HZCost > 0)
        {
            PurchasingCurrency = 0;
        }
        else if (XPCost > 0)
        {
            PurchasingCurrency = 1;
        }
    }

    if (bCurrencyPopup)
    {
        bCurrencyPopup = false;
        bConfirmationPopup = true;

        Obj.SetFloat("type", 0);
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);

        Obj.SetString("popupTitle", Strings.Unlock@Caps(itemTitle));

        if (PurchasingCurrency == 0)
        {
            UnlockIconType = AT_USEDGOLD;
            Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(itemName)@Strings.TrFor@HZCost@Strings.Gold$"?");
        }
        else
        {
            UnlockIconType = AT_USEDXP;
            Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Unlock@Caps(itemName)@Strings.TrFor@XPCost@Strings.XP$"?");
        }
    }
}


function PopupComplete(int Action, string TextInput)
{
    local TrPlayerController TrPC;

    if (bClassRequiredPopup)
    {
        bClassRequiredPopup = false;

        if (Action == 1)
        {
            Pages.TravelToClasses();
        }
    }
    else if (bWaitingForClaimPromoPopup)
    {
        bWaitingForClaimPromoPopup = false;        
        
        if (Action == 1) 
        {
            if(TextInput == "")
            {

            }
            else
            {
                TrPC = TrPlayerController(GetPC());
                if(TrPC != None) 
                {   
                    TrPC.ClaimPromotion(TextInput);
                }
            }
        }
    }    
    else if (bCurrencyPopup)
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
            if (PopupNum == NumDeal)
            {
                EquipInterface.RequestPurchaseDeal(PurchasingCurrency);
            }
        }

        bConfirmationPopup = false;
    }
}

defaultproperties
{
   NumDeal=1
   NumGold=2
   NoNameChangeInGame="UNAVAILABLE IN-GAME"
   ClaimPromotionAction=3
   PromoPopupTitle="ENTER PROMOTION CODE"
   PageLabel="STORE"
   OptionTitles(0)="ADD GOLD"
   OptionTitles(1)="YOUR DEAL OF THE DAY"
   OptionTitles(2)="BUNDLE PACKS"
   OptionTitles(3)="XP BOOSTERS"
   OptionTitles(4)="CHANGE GAMER NAME"
   OptionTitles(5)="CHANGE CLAN TAG"
   OptionTitles(6)="REDEEM PROMOTION"
   OptionSubtext(0)="BROWSE GOLD PACKS"
   OptionSubtext(1)=
   OptionSubtext(2)="GET MORE FOR LESS"
   OptionSubtext(3)="EARN UNLOCKS TWICE AS FAST"
   OptionSubtext(4)="RENAME YOUR PLAYER"
   OptionSubtext(5)="MARK YOUR TERRITORY"
   Name="Default__GFxTrPage_Store"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
