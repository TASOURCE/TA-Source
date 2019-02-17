class GFxTrPage_Main extends GFxTrPage;

struct BundleData
{
    var int LootId;
    var EContentDataType Model;
};

enum EFEATURES
{
    FEA_GOLD,
    FEA_DOTD,
    FEA_BUNDLEA,
    FEA_BUNDLEB,
    FEA_BUNDLEC,
    FEA_MAX
};

var int    NumQuit;
var int    GoldDealId;
var int    ActiveFeature;
var int    FeatureShowTime;
var int    FeatureSwapTime;
var bool   bSwingingCamera;
var bool   bAnimInit;
var string QueueTimer;
var string TabOffset;

var array<BundleData> ActiveBundles;

function Initialize()
{
    if (!User.m_ChoseRegion || !User.m_ChoseRegion2) AddActionPage(Pages.RegionSettingsPage);
    else AddActionPage(Pages.PlayNowPage);

    AddActionPage(Pages.ClassesPage);
    AddActionPage(Pages.TrainingMatchPage);
    AddActionPage(Pages.WatchNowPage);
    AddActionPage(Pages.SocialPage);
    AddActionPage(Pages.StorePage);
    AddActionPage(Pages.SettingsPage);
    AddActionNumber(NumQuit);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionNumber == NumQuit)
    {
        QuitGame();
    }

    if (Action.ActionPage == Pages.RegionSettingsPage)
    {
        Pages.RegionSettingsPage.bForceChoose = true;
    }
}


function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    if (DataList == none)
    {
        return 0;
    }

    super.TakeFocus(ActionIndex, DataList);
    
    ShowModel();
    CheckFeatures(DataList);
    CheckPricing(DataList);

    return 0;
}

function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_PRICE);

    priceObj = FillPricing(DataList);

    obj.SetObject("data", priceObj);
    DataList.SetElementObject(DataCount++, obj);

    return true;
}

function GFxObject FillPricing(GFxObject DataList)
{
    local GFxObject obj;
    
    if (Pages.FocusIndex != 0 || PartyManager.InParty() || QueueManager.bQueued)
    {
        return none;
    }

    obj = CreateObject("Object");
    obj.SetString("actionLabel", Strings.CreateParty);
    obj.SetFloat("bUpgradeType", 3);

    return obj;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    PartyManager.bCreatedParty = true;
    Pages.PartyPage.FillData(DataList);

    return 1;
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex == 0)
    {
        if (PartyManager.InParty())
        {
            Pages.PartyPage.FillData(DataList);
            return 1;
        }
        else if (QueueManager.bQueued && !bInGame)
        {
            QueueManager.LeaveMatchmaking();
            RefreshButtons();
            return 0;
        }
    }
    else if (ActionIndex == GoBack)
    {
        //QuitGame();
    }

    /*if (!bAnimInit)
    {
        ScriptTrace();
        ASC_AnimMenu(TrPlayerController(GetPC()).m_bAnimMenu);
        bAnimInit = true;
    }*/

    return super.TakeAction(ActionIndex, DataList);
}

function FillData(GFxObject DataList)
{
    PageLabelOverride = PageLabel@"("$SettingsManager.KeyBindings.m_MainMenuHotkey$")";

    if (HaveEntry())
    {
        super.FillData(DataList);
    }
    else
    {
        bWaitingForEntry = true;
    }

    ShowModel();

    CheckFeatures(DataList);
}

function CheckFeatures(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject featureObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_FEATURE);

    featureObj = FillFeature();

    if (featureObj != none)
    {
        obj.SetObject("data", featureObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }
}

function GFxObject FillFeature()
{
    local int                 itemId;
    local int                 equipId;
    local int                 classId;
    local string              saleTitle;
    local string              saleDesc;
    local string              ribbonDesc;
    local GFxObject           obj;
    local class<TrSkin>       skinClass;
    local class<TrDevice>     equipClass;
    local class<TrFamilyInfo> familyClass;
    local TrPlayerController  TrPC;

    TrPC = TrPlayerController(GetPC());
    
    obj = CreateObject("Object");

    if (bRefreshingMenu && FeatureShowTime > 0)
    {
        obj.SetFloat("bHideFlash", 1);
    }
    else
    {
        obj.SetFloat("bHideFlash", 0);
    }

    CheckGoldDeal();

    if (ActiveFeature == FEA_GOLD)
    {        
        EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BUNDLES, GoldDealId, saleTitle, saleDesc, ribbonDesc);

        obj = CreateObject("Object");

        obj.SetFloat("bShowImage", 0);
        obj.SetFloat("bBuyNow", 1);
        obj.SetFloat("bPricingBar", 0);
        obj.SetFloat("buyActionID", Pages.NumGold);
        obj.SetFloat("imageIndex", 1);
        obj.SetString("saleTitle", Caps(saleTitle));
        obj.SetString("saleDesc", saleDesc);
        obj.SetString("saleValue", "");
        obj.SetString("xpPrice", ""); 
        obj.SetString("goldPrice", "");
        obj.SetString("moreText", Strings.LearnMore);
    }
    else if (ActiveFeature == FEA_BUNDLEA && ActiveBundles.Length > 0 && !EquipInterface.IsBundleOwned(ActiveBundles[0].LootId))
    {
        EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BUNDLES, ActiveBundles[0].LootId, saleTitle, saleDesc, ribbonDesc);

        obj = CreateObject("Object");

        obj.SetFloat("bShowImage", 0);
        obj.SetFloat("bBuyNow", 1);
        obj.SetFloat("bPricingBar", 0);
        obj.SetFloat("buyActionID", Pages.NumBundle);
        obj.SetFloat("imageIndex", 1);
        obj.SetString("saleTitle", Caps(saleTitle));
        obj.SetString("saleDesc", saleDesc);
        obj.SetString("saleValue", "");
        obj.SetString("xpPrice", ""); 
        obj.SetString("goldPrice", "");
        obj.SetString("moreText", Strings.LearnMore);
    }
    else if (ActiveFeature == FEA_BUNDLEB && ActiveBundles.Length > 1 && !EquipInterface.IsBundleOwned(ActiveBundles[1].LootId))
    {
        EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BUNDLES, ActiveBundles[1].LootId, saleTitle, saleDesc, ribbonDesc);

        obj = CreateObject("Object");

        obj.SetFloat("bShowImage", 0);
        obj.SetFloat("bBuyNow", 1);
        obj.SetFloat("bPricingBar", 0);
        obj.SetFloat("buyActionID", Pages.NumBundle);
        obj.SetFloat("imageIndex", 1);
        obj.SetString("saleTitle", Caps(saleTitle));
        obj.SetString("saleDesc", saleDesc);
        obj.SetString("saleValue", "");
        obj.SetString("xpPrice", ""); 
        obj.SetString("goldPrice", "");
        obj.SetString("moreText", Strings.LearnMore);
    }
    else if (ActiveFeature == FEA_BUNDLEC && ActiveBundles.Length > 2 && !EquipInterface.IsBundleOwned(ActiveBundles[2].LootId))
    {
        EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BUNDLES, ActiveBundles[2].LootId, saleTitle, saleDesc, ribbonDesc);

        obj = CreateObject("Object");

        obj.SetFloat("bShowImage", 0);
        obj.SetFloat("bBuyNow", 1);
        obj.SetFloat("bPricingBar", 0);
        obj.SetFloat("buyActionID", Pages.NumBundle);
        obj.SetFloat("imageIndex", 1);
        obj.SetString("saleTitle", Caps(saleTitle));
        obj.SetString("saleDesc", saleDesc);
        obj.SetString("saleValue", "");
        obj.SetString("xpPrice", ""); 
        obj.SetString("goldPrice", "");
        obj.SetString("moreText", Strings.LearnMore);
    }
    else
    {
        if (EquipInterface.IsDailyDealOwned())
        {
            obj.SetFloat("bShowImage", 0);
            obj.SetFloat("bBuyNow", 1);
            obj.SetFloat("bPricingBar", 0);
            obj.SetFloat("buyActionID", Pages.NumDeal);
            obj.SetFloat("imageIndex", 1);
            obj.SetString("saleTitle", Strings.Your@Strings.DealoftheDay);
            obj.SetString("saleValue", "-"$EquipInterface.GetDailyDealPercentOff()$"%");
            obj.SetString("xpPrice", string(EquipInterface.GetDailyDealOldPrice()));
            obj.SetString("goldPrice", string(EquipInterface.GetDailyDealNewPrice()));
            obj.SetString("saleDesc", TabOffset@"NEXT DEAL"@FormatDealTime());
            obj.SetString("moreText", Strings.LearnMore);

        }
        else
        {
            obj.SetFloat("bShowImage", 0);
            obj.SetFloat("bBuyNow", 1);
            obj.SetFloat("bPricingBar", 1);
            obj.SetFloat("buyActionID", 2000);
            obj.SetFloat("imageIndex", 1);
            obj.SetString("saleTitle", Strings.Your@Strings.DealoftheDay);
            obj.SetString("saleValue", "-"$EquipInterface.GetDailyDealPercentOff()$"%");
            obj.SetString("xpPrice", string(EquipInterface.GetDailyDealOldPrice()));
            obj.SetString("goldPrice", string(EquipInterface.GetDailyDealNewPrice()));
            obj.SetString("moreText", Strings.LearnMore);

            itemId = EquipInterface.GetDailyDealItemId();
            classId = EquipInterface.GetDailyDealClass();
            equipId = EquipInterface.GetActiveEquipId(classId, EQP_Primary, LST_DEFAULT);

            equipClass = EquipHelper.GetEquipClass(itemId);

            if (equipClass == none)
            {
                familyClass = EquipHelper.GetFamilyClass(itemId);

                if (familyClass == none)
                {
                    skinClass = EquipHelper.GetSkinClass(itemId);

                    if (skinClass != none)
                    {
                        equipClass = EquipHelper.GetEquipClass(equipId);
                        familyClass = EquipHelper.GetFamilyClass(classId);
                        TrPC.UpdatePaperDoll(familyClass, equipClass, skinClass, bShowDiamondSword ? 1 : 0);
                        
                        saleDesc = TabOffset@Caps(skinClass.default.ItemName);

                        if (familyClass != none)
                        {
                            saleDesc = saleDesc@"("$GetEquipTypeName(EQP_Skin)@Strings.TrFor@Caps(familyClass.default.FriendlyName)$")";
                        }
                    }
                    else
                    {
                        obj = none;
                    }
                }
                else
                {
                    skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(familyClass.default.ClassId, EQP_Skin, LST_DEFAULT));
                    equipClass = EquipHelper.GetEquipClass(equipId);
                    TrPC.UpdatePaperDoll(familyClass, equipClass, skinClass, bShowDiamondSword ? 1 : 0);

                    saleDesc = TabOffset@Caps(familyClass.default.FriendlyName)@"("$Strings.TrClass$")";
                }
            }
            else
            {
                familyClass = EquipHelper.GetFamilyClass(classId);
                TrPC.UpdatePaperDoll_Device(equipClass);        

                saleDesc = TabOffset@Caps(equipClass.default.ItemName);
                
                if (familyClass != none)
                {
                    saleDesc = saleDesc@"("$GetEquipTypeName(EquipInterface.GetDailyDealType())@Strings.TrFor@Caps(familyClass.default.FriendlyName)$")";
                }
                else
                {
                    saleDesc = saleDesc@"("$GetEquipTypeName(EquipInterface.GetDailyDealType())$")";
                }
            }
            
            saleDesc = saleDesc$"\n"$TabOffset@"DEAL EXPIRES"@FormatDealTime();
            obj.SetString("saleDesc", saleDesc);
        }
    }

    return obj;
}

function string FormatDealTime()
{
    local int secs;
    local int mins;
    local int hours;
    local string format;

    secs = EquipInterface.GetDailyDealSecsLeft();

    if (secs > 0)
    {
        mins = secs / 60;
        hours = mins / 60;
        mins -= hours * 60;
        secs -= (mins * 60) + (hours * 3600);

        format = "IN";

        if (hours == 1)
        {
            format = format@hours@Strings.TrHour;
        }
        else
        {
            format = format@hours@Strings.TrHours;
        }

        if (mins == 1)
        {
            format = format@mins@Strings.TrMinute;
        }
        else
        {
            format = format@mins@Strings.TrMinutes;
        }

        if (secs == 1)
        {
            format = format@secs@Strings.TrSecond;
        }
        else
        {
            format = format@secs@Strings.TrSeconds;
        }
    }
    else
    {
        format = "SOON!";
    }

    return format;
}

function GFxObject FillOption(int ActionIndex)
{
    local int count;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionPage == Pages.ClassesPage)
    {
        if (User.NeedToSeeAnyNewItem() && !User.m_SeenNewItemsMain)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 3);
            obj.SetString("itemRibbonLabel", Strings.TrNew@Strings.Items);
        }
        else if (RibbonManager.bHaveUnlocks && RibbonManager.bOnlyUnlocks)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", Strings.Unlocks@Strings.Available);
        }
        else if (RibbonManager.bHaveUpgrades && RibbonManager.bOnlyUpgrades)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 1);
            obj.SetString("itemRibbonLabel", Strings.Upgrades@Strings.Available);
        }
        else if (RibbonManager.bHaveUnlocks || RibbonManager.bHaveUpgrades)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", Strings.Unlocks@Strings.Available);
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.SocialPage)
    {
        count = Friends.GetOnlineFriendCount();

        if (count > 0)
        {
            obj.SetFloat("hasRibbon", 1);
            if(count == 1)
            {
                obj.SetString("itemRibbonLabel", count@Strings.Friend@Strings.Online);
            }
            else
            {
                obj.SetString("itemRibbonLabel", count@Strings.Friends@Strings.Online);
            }
        }
        else
        {
            count = Friends.GetOnlineFollowerCount();

            if (count > 0)
            {
                obj.SetFloat("hasRibbon", 1);
                if(count == 1)
               { 
                    obj.SetString("itemRibbonLabel", count@Strings.Follower@Strings.Online);
                }
                else
                {
                    obj.SetString("itemRibbonLabel", count@Strings.Followers@Strings.Online);
                }
            }
            else
            {
                obj.SetFloat("hasRibbon", 0);            
                obj.SetString("itemRibbonLabel", "");
            }
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.TrainingMatchPage)
    {
        if (!User.m_DidLogin)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", Strings.Recommended);
        }
        else
        {
            obj.SetFloat("hasRibbon", 0);
            obj.SetString("itemRibbonLabel", "");
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.StorePage)
    {
        if (User.NeedsToSeeClanTags())
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 3);
            obj.SetString("itemRibbonLabel", Strings.ClanTags);
        }
        else if (!EquipInterface.IsDailyDealOwned())
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 3);
            obj.SetString("itemRibbonLabel", Strings.TrNew@"DEAL");
        }
        else if (User.NeedToSeeNewBundle() && !User.m_SeenNewBundlesMain)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 3);
            obj.SetString("itemRibbonLabel", Strings.TrNew@Strings.Items);
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.WatchNowPage)
    {
        if (StreamManager.HaveFeature())
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 3);
            obj.SetString("itemRibbonLabel", StreamManager.GetFeatureName());
        }
    }
    else if (ActionIndex == 0)
    {
        if (PartyManager.InParty())
        {
            obj.SetString("itemTitle", Strings.Party);
            obj.SetString("itemSubTitle", "");
        }
        else if (QueueManager.bQueued && !bInGame)
        {
            if (QueueTimer == "") QueueTimer = ".";
            else if (QueueTimer == ".") QueueTimer = "..";
            else if (QueueTimer == "..") QueueTimer = "...";
            else if (QueueTimer == "...") QueueTimer = "";

            obj.SetString("itemTitle", Strings.Leave@Strings.Queue);
            obj.SetString("itemSubTitle", Strings.SearchingForAMatch@QueueTimer);
        }
        else if (User.m_DidLogin && PlayerProfile.XPLevel < 1350)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", Strings.Recommended);
        }
        else if (false)//!User.m_SeenNewGametype)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 3);
            obj.SetString("itemRibbonLabel", Strings.TrNew$"!");
        }
        else
        {
            obj.SetString("itemTitle", OptionTitles[0]);
            obj.SetString("itemSubTitle", OptionSubtext[0]);
            count = Friends.GetInGameFriendCount();
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            if(count == 0)
            {
                obj.SetString("itemRibbonLabel","");
                obj.SetFloat("hasRibbon",0);                
            }
            else if (count == 1)
            {
                obj.SetString("itemRibbonLabel", count@Strings.Friend@InGameLabel);
            }
            else
            {
                obj.SetString("itemRibbonLabel", count@Strings.Friends@InGameLabel);
            }                 
        }
    }

    return obj;
}

function ShowModel()
{
    local int equipId;
    local TrPlayerController TrPC;
    local TrEntryPlayerController TrEPC;
    local class<TrSkin> skinClass;
    local class<TrDevice> equipClass;
    local class<TrFamilyInfo> familyClass;

    TrPC = TrPlayerController(GetPC());
    TrEPC = TrEntryPlayerController(GetPC());

    CheckGoldDeal();

    if (ActiveFeature == FEA_GOLD)
    {
        TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_BuyGold);
        return;
    }
    else if (ActiveFeature == FEA_BUNDLEA && ActiveBundles.Length > 0 && !EquipInterface.IsBundleOwned(ActiveBundles[0].LootId))
    {
        TrEPC.UpdateMainMenuPaperDoll_Mesh(ActiveBundles[0].Model);
        return;
    }
    else if (ActiveFeature == FEA_BUNDLEB && ActiveBundles.Length > 1 && !EquipInterface.IsBundleOwned(ActiveBundles[1].LootId))
    {
        TrEPC.UpdateMainMenuPaperDoll_Mesh(ActiveBundles[1].Model);
        return;
    }
    else if (ActiveFeature == FEA_BUNDLEC && ActiveBundles.Length > 2 && !EquipInterface.IsBundleOwned(ActiveBundles[2].LootId))
    {
        TrEPC.UpdateMainMenuPaperDoll_Mesh(ActiveBundles[2].Model);
        return;
    }
    
    if (!EquipInterface.IsDailyDealOwned())
    {
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
                        TrPC.ClearMainMenuPaperDoll();
                        TrPC.UpdatePaperDoll(familyClass, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
                    }
                }
            }
            else
            {
                equipId = EquipInterface.GetActiveEquipId(familyClass.default.ClassId, EQP_Primary, 0);
                skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(familyClass.default.ClassId, EQP_Skin, 0));

                TrPC.ClearMainMenuPaperDoll();
                TrPC.UpdatePaperDoll(familyClass, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
            }
        }
        else
        {
            TrPC.ClearMainMenuPaperDoll();
            TrPC.UpdatePaperDoll_Device(equipClass);
        }

        return;
    }

    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_MainMenu);
}

function UpdateQueueTimer()
{
    RefreshButtons();
}

function StartDealTimer()
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        TrPC.DealTimer();
    }
}

function UpdateDealTimer()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());

    FeatureShowTime++;

    if (bSwingingCamera)
    {
        bSwingingCamera = false;

        if (TrEPC != none)
        {
            TrEPC.SwingCameraBack();
        }
    }

    if (NeedFeatureUpdate() && FeatureShowTime > FeatureSwapTime)
    {
        ActiveFeature++;
        FeatureShowTime = 0;

        CheckGoldDeal();

        // Special code for Start Pack
        if (ActiveFeature == FEA_BUNDLEA)
        {
            if (PlayerProfile.Rank > 9)
            {
                ActiveFeature++;
            }
        }
        
        if (NeedFeatureUpdate() && TrEPC != none)
        {
            bSwingingCamera = true;
            TrEPC.SwingCamera(182,-23000,0);
        }

        if (ActiveFeature >= FEA_MAX)
        {
            ActiveFeature = FEA_GOLD;
        }
    }
    
    if (!bSwingingCamera)
    {
        RefreshPage();
    }
}

function CheckGoldDeal()
{
    local string title;
    local string temp1;
    local string temp2;

    if (ActiveFeature != FEA_GOLD)
    {
        return;
    }

    if (EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BUNDLES, GoldDealId, title, temp1, temp2) || title == "")
    {
        ActiveFeature++;
    }
}

function bool NeedFeatureUpdate()
{
    if (PlayerProfile.Rank > 9 || EquipInterface.IsBundleOwned(ActiveBundles[0].LootId))
    {
        if (ActiveBundles.Length > 0 && EquipInterface.IsBundleOwned(ActiveBundles[1].LootId))
        {
            return false;
        }
    }

    return true;
}

function string GetEquipTypeName(int Type)
{
    switch (Type)
    {
    case EQP_Primary:   return "PRIMARY WEAPON";
    case EQP_Secondary: return "SECONDARY WEAPON";
    case EQP_Belt:      return "BELT ITEM";
    case EQP_Pack:      return "PACK";
    case EQP_PerkA:     return "PRIMARY PERK";
    case EQP_PerkB:     return "SECONDARY PERK";
    case EQP_Skin:      return "SKIN";
    default:            break;
    }

    return "ITEM";
}

defaultproperties
{
   NumQuit=1
   GoldDealId=9515
   FeatureSwapTime=9
   TabOffset="    -"
   ActiveBundles(0)=(LootId=9214,Model=CDT_StarterPack)
   ActiveBundles(1)=(LootId=9510,Model=CDT_Bundle_Sentinel)
   bAllowBack=False
   PageLabel="MAIN MENU"
   OptionTitles(0)="PLAY NOW"
   OptionTitles(1)="CLASSES"
   OptionTitles(2)="TRAINING"
   OptionTitles(3)="WATCH NOW"
   OptionTitles(4)="SOCIAL"
   OptionTitles(5)="STORE"
   OptionTitles(6)="SETTINGS"
   OptionTitles(7)="QUIT GAME"
   OptionSubtext(0)=
   OptionSubtext(1)=
   OptionSubtext(2)=
   OptionSubtext(3)=
   OptionSubtext(4)=
   OptionSubtext(5)=
   OptionSubtext(6)=
   OptionSubtext(7)=
   Name="Default__GFxTrPage_Main"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
