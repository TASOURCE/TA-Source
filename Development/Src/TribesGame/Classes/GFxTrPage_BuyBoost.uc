class GFxTrPage_BuyBoost extends GFxTrPage;

var int selectedActionIdx;
var int selectedVendorItemId;
var localized string DescriptionLabel;

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    Super.TakeFocus(ActionIndex, DataList);
    CheckPricing(DataList);
    return 0;
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

    count = EquipInterface.GetVendorSize(SHOP_VENDOR_BOOSTERS);

    //not page safe
    for (i=0;i<count;i++)
    {
        id = EquipInterface.GetVendorItemId(SHOP_VENDOR_BOOSTERS, i);
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

    bHasGoldCost = EquipInterface.GetVendorItemPrice(SHOP_VENDOR_BOOSTERS,PageActions[Pages.FocusIndex].ActionNumber, 0, gCost);
    bHasXPCost = EquipInterface.GetVendorItemPrice(SHOP_VENDOR_BOOSTERS,PageActions[Pages.FocusIndex].ActionNumber, 1, xpCost);
    
    if(bHasGoldCost || bHasXPCost)
    {
        obj = CreateObject("Object");
        obj.SetString("actionLabel", Strings.Buy);
        if(bHasGoldCost && bHasXPCost)
        {            
            obj.SetString("orLabel", Strings.Or);
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
    local GFxObject obj;
    local string itemName, itemDesc, ribbonDesc;

    obj = CreateObject("Object");
    obj.SetFloat("actionID",ActionIndex);

    EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BOOSTERS, PageActions[ActionIndex].ActionNumber, itemName, itemDesc, ribbonDesc);

    obj.SetString("itemTitle",Caps(itemName));
    obj.SetString("itemSubTitle","");//Caps(itemDesc));
    if(ribbonDesc != "")
    {
        obj.SetString("itemRibbonLabel", Caps(ribbonDesc));
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 1);
    }
    else
    {
        obj.SetFloat("hasRibbon", 0);
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
    obj = CreateObject("Object");    
    obj.SetString("descTitle", Caps(PageLabel));
    obj.SetString("description", Caps(DescriptionLabel));
    return obj;
}


function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_BuyBoost);
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    SelectedVendorItemId = PageActions[ActionIndex].ActionNumber;
    bWaitingForCurrencyPopup = true;
    QueuePopup();

    return 0;
}

function PopupData(GFxObject Obj)
{
    local bool bHasGoldCost;
    local int GPAmount;
    local string itemName;
    local string itemDesc;
    local string ribbonDesc;

    //TAG=CURRENTLY_GOLD_ONLY
    if(bWaitingForCurrencyPopup)
    {
        bHasGoldCost = EquipInterface.GetVendorItemPrice(SHOP_VENDOR_BOOSTERS,SelectedVendorItemId, 0, GPAmount);
        EquipInterface.GetVendorItemInfo(SHOP_VENDOR_BOOSTERS, SelectedVendorItemId, itemName, itemDesc, ribbonDesc);
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
    if(bWaitingForCurrencyPopup)
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
            EquipInterface.RequestPurchaseGeneral(SHOP_VENDOR_BOOSTERS,SelectedVendorItemId,0,"");
        }
    }    
}


//function ShowActivePurchase(int ItemIndexId, optional bool bShowStatus = false){}

defaultproperties
{
   DescriptionLabel="- Doubles all XP earned in game\n- Rewards 1200 XP each day it is active\n  regardless of play time"
   PageLabel="XP BOOSTERS"
   OptionTitles(0)="10 DAY BOOSTER"
   OptionTitles(1)="30 DAY BOOSTER"
   OptionTitles(2)="90 DAY BOOSTER"
   OptionSubtext(0)="DOUBLE ALL XP GAIN FOR 10 DAYS"
   OptionSubtext(1)="DOUBLE ALL XP GAIN FOR 30 DAYS"
   OptionSubtext(2)="DOUBLE ALL XP GAIN FOR 90 DAYS"
   Name="Default__GFxTrPage_BuyBoost"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
