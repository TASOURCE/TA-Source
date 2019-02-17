class GFxTrPage_BuyGoldPortal extends GFxTrPage;

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionIndex == GoBack)
    {
        return;
    }

    if (Action.ActionIndex < GoldItemList.Length)
    {
        PortalPurchase = GoldItemList[Action.ActionIndex];

        m_PopupType = PUT_PORTAL_CONFIRM;
        QueuePopup();
    }
}

function FillData(GFxObject DataList)
{
    local int i;

    for (i = GoldItemList.Length; i > 0; i--)
    {
        GoldItemList.Remove(i-1, 1);
    }

    ClearActions();
    GetGoldItemInfo();

    for (i = 0; i < GoldItemList.Length; i++)
    {
        AddAction();
    }

    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    obj.SetString("itemTitle", GoldItemList[ActionIndex].Title);
    obj.SetString("itemSubTitle", string(GoldItemList[ActionIndex].Price)@GetPortalCurrencyName());

    if (GoldItemList[ActionIndex].Description != "")
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 3);
        obj.SetString("itemRibbonLabel", GoldItemList[ActionIndex].Description);
    }

    return obj;
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_BuyGold);
}

defaultproperties
{
   PageLabel="BUY GOLD"
   OptionTitles(0)="800 TRIBES GOLD"
   OptionTitles(1)="1800 TRIBES GOLD"
   OptionTitles(2)="3000 TRIBES GOLD"
   OptionTitles(3)="5500 TRIBES GOLD"
   OptionSubtext(0)="700 GOLD + 100 BONUS GOLD (INCLUDES VIP)"
   OptionSubtext(1)="1400 GOLD + 400 BONUS GOLD (INCLUDES VIP)"
   OptionSubtext(2)="2100 GOLD + 900 BONUS GOLD (INCLUDES VIP)"
   OptionSubtext(3)="3500 GOLD + 2000 BONUS GOLD (INCLUDES VIP)"
   Name="Default__GFxTrPage_BuyGoldPortal"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
