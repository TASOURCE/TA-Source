class GFxTrPage_RotationType extends GFxTrPage;

function Initialize()
{
    AddActionNumber(SERVER_RT_METHOD_RANDOM);
    AddActionNumber(SERVER_RT_METHOD_LINEAR);
    AddActionNumber(SERVER_RT_METHOD_LINEAR2);
    AddActionNumber(SERVER_RT_METHOD_LINEAR4);
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex >= 0)
    {
        QueueManager.SetPropNumber(QUEUE_CONFIG_MAPROTATIONTYPE, PageActions[ActionIndex].ActionNumber, SPT_QUEUE);
        EquipInterface.SaveProfile();
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

    if (PageActions[ActionIndex].ActionNumber == QueueManager.GetProfileRotation())
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);
        obj.SetString("itemRibbonLabel", Strings.Active);
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
   PageLabel="SELECT ROTATION TYPE"
   OptionTitles(0)="RANDOM"
   OptionTitles(1)="SINGLE MATCH"
   OptionTitles(2)="DOUBLE MATCH"
   OptionTitles(3)="QUAD MATCH"
   OptionSubtext(0)="SELECT TO APPLY"
   OptionSubtext(1)="SELECT TO APPLY"
   OptionSubtext(2)="SELECT TO APPLY"
   OptionSubtext(3)="SELECT TO APPLY"
   Name="Default__GFxTrPage_RotationType"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
