class GFxTrPage_GameRules extends GFxTrPage;

function Initialize()
{
    AddActionPage(Pages.ServerTimePage);
    AddActionPage(Pages.ServerScoringPage);
    AddActionPage(Pages.ServerPlayerPage);
    AddActionPage(Pages.ServerTeamPage);
    AddActionPage(Pages.ServerBasePage);
    AddActionPage(Pages.ServerVehiclePage);
    AddActionPage(Pages.ServerCallinPage);
    AddActionPage(Pages.ServerFFPage);
}

function FillData(GFxObject DataList)
{
    super.FillData(DataList);

    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    return obj;
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

    obj = CreateObject("Object");
    obj.SetString("descTitle", QueueManager.GetProfileName());
    obj.SetString("description", QueueManager.GetProfileDesc());

    return obj;
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_PrivateServer);
}

defaultproperties
{
   PageLabel="GAME SETTINGS"
   OptionTitles(0)="TIME SETTINGS"
   OptionTitles(1)="SCORE SETTINGS"
   OptionTitles(2)="PLAYER SETTINGS"
   OptionTitles(3)="TEAM SETTINGS"
   OptionTitles(4)="BASE SETTINGS"
   OptionTitles(5)="VEHICLE SETTINGS"
   OptionTitles(6)="CALL-IN SETTINGS"
   OptionTitles(7)="FRIENDLY FIRE SETTINGS"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   OptionSubtext(5)="SELECT TO CHANGE"
   OptionSubtext(6)="SELECT TO CHANGE"
   OptionSubtext(7)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_GameRules"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
