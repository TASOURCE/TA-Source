class GFxTrPage_GameMapSetup extends GFxTrPage;

function Initialize()
{
    AddActionPage(Pages.GameTypePage);
    AddActionPage(Pages.RotationTypePage);
    AddActionPage(Pages.MapRotationPage);
}

function FillData(GFxObject DataList)
{
    QueueManager.GameTypeId = QueueManager.GetProfileGameType();

    super.FillData(DataList);
    
    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionPage == Pages.GameTypePage)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemRibbonLabel", QueueManager.GetServerGameTypeName());
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.RotationTypePage)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemRibbonLabel", QueueManager.GetServerRotationName());
    }

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

defaultproperties
{
   PageLabel="GAMETYPE AND MAPS"
   OptionTitles(0)="GAMETYPE"
   OptionTitles(1)="ROTATION TYPE"
   OptionTitles(2)="MAP ROTATION"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_GameMapSetup"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
