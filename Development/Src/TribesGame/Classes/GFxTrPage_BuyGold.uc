class GFxTrPage_BuyGold extends GFxTrPage;

function FillData(GFxObject DataList)
{
    ClearActions();

    AddAction();
    AddActionPage(Pages.BuyGoldPortalPage);

    super.FillData(DataList);
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex == 0)
    {
        Browser.Gold();
        return 0;
    }
    
    return super.TakeAction(ActionIndex, DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (ActionIndex == 1)
    {
        obj.SetString("itemTitle", Caps(Repl(OptionTitles[1],"\`o",GetPortalCurrencyName())));
        obj.SetString("itemSubTitle", Caps(Repl(OptionSubtext[1],"\`o",GetPortalCurrencyName())));
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
   OptionTitles(0)="BUY ONLINE"
   OptionTitles(1)="USE `o"
   OptionSubtext(0)="USE IN-GAME BROWSER TO PURCHASE"
   OptionSubtext(1)="CONVERT `o TO GOLD"
   Name="Default__GFxTrPage_BuyGold"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
