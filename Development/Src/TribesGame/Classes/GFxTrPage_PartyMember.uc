class GFxTrPage_PartyMember extends GFxTrPage;

function FillData(GFxObject DataList)
{
    local int i;

    ClearActions();

    for (i = 0; i < PartyManager.GetMemberCount(); i++)
    {
        AddAction();
    }

    super.FillData(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("actionID", ActionIndex);

    if (ActionIndex == 0 && PartyManager.bCreatedParty)
    {
        obj.SetString("itemTitle", PlayerProfile.PlayerName);
    }
    else
    {
        obj.SetString("itemTitle", PartyManager.GetMemberName(ActionIndex));
    }

    if (ActionIndex == 0)
    {
        obj.SetString("itemSubTitle", OptionSubtext[0]);
    }
    else if (PartyManager.ActiveMember(ActionIndex))
    {
        obj.SetString("itemSubTitle", "");
    }
    else
    {
        obj.SetString("itemSubTitle", Strings.PendingInvite);
    }

    return obj;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);

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

    if (bFillingFocus)
    {
        return none;
    }

    if (PartyManager.GetMemberCount() < 2)
    {
        return none;
    }

    if (PartyManager.GetMemberId(Pages.FocusIndex) == PlayerProfile.PlayerId)
    {
        return none;
    }

    obj = CreateObject("Object");

    obj.SetString("actionLabel", Caps(Strings.Actions));
    obj.SetFloat("bUpgradeType", 3);

    return obj;
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    Pages.PartyActionPage.MemberName = PartyManager.GetMemberName(ActionIndex);
    Pages.PartyActionPage.FillData(DataList);  

    return 1;
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_JoinGame);
}

defaultproperties
{
   PageLabel="PARTY MEMBERS"
   OptionSubtext(0)="Party Leader"
   Name="Default__GFxTrPage_PartyMember"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
