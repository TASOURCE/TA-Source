class GFxTrPage_GameType extends GFxTrPage;

function Initialize()
{
    AddActionNumber(SERVER_GAMECLASSID_CTF);
    AddActionNumber(SERVER_GAMECLASSID_BTZ);
    AddActionNumber(SERVER_GAMECLASSID_RAB);
    AddActionNumber(SERVER_GAMECLASSID_TDM);
    AddActionNumber(SERVER_GAMECLASSID_ARN);
    AddActionNumber(SERVER_GAMECLASSID_CAH);
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex >= 0)
    {
        if (PageActions[ActionIndex].ActionNumber != QueueManager.GetProfileGameType())
        {
            QueueManager.SetPropNumber(GAME_CONFIG_GAMETYPE, PageActions[ActionIndex].ActionNumber, SPT_QUEUE);
            QueueManager.ResetRotation();
        }
    }

    Pages.PopPage().FillData(DataList);

    return -1;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);

    if (DataList != none)
    {
        FillData(DataList);
    }

    return 0;
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

    if (PageActions[ActionIndex].ActionNumber == QueueManager.GetProfileGameType())
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemRibbonLabel", "ACTIVE");
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
   PageLabel="SELECT GAMETYPE"
   OptionTitles(0)="CAPTURE THE FLAG"
   OptionTitles(1)="CTF BLITZ"
   OptionTitles(2)="RABBIT"
   OptionTitles(3)="TEAM DEATHMATCH"
   OptionTitles(4)="ARENA"
   OptionTitles(5)="CAPTURE AND HOLD"
   OptionSubtext(0)="SELECT TO APPLY"
   OptionSubtext(1)="SELECT TO APPLY"
   OptionSubtext(2)="SELECT TO APPLY"
   OptionSubtext(3)="SELECT TO APPLY"
   OptionSubtext(4)="SELECT TO APPLY"
   OptionSubtext(5)="SELECT TO APPLY"
   Name="Default__GFxTrPage_GameType"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
