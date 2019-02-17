class GFxTrPage_MapRotation extends GFxTrPage;

var int AddMapNumber;

function Initialize()
{
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex == 0) Pages.ChangeMapPage.bAllowRemove = false;
    else Pages.ChangeMapPage.bAllowRemove = true;

    if (ActionIndex >= 0)
    {
        Pages.ChangeMapPage.CurrentMapId = PageActions[ActionIndex].ActionNumber;
        Pages.ChangeMapPage.CurrentSlotId = QueueManager.MapSlots[ActionIndex];
    }

    return super.TakeAction(ActionIndex, DataList);
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
    local int i;

    ClearActions();
    
    for (i = 0; i < 8; i++)
    {
        AddActionSet(Pages.ChangeMapPage, QueueManager.GetPropNumber(QueueManager.MapSlots[i], SPT_QUEUE));
    }

    super.FillData(DataList);
    
    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    obj.SetString("itemTitle", Caps(QueueManager.GetMapName(PageActions[ActionIndex].ActionNumber)));

    if (PageActions[ActionIndex].ActionNumber == 0)
    {
        obj.SetString("itemSubTitle", Strings.SelectToAddMap);
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
   AddMapNumber=1
   PageLabel="SET MAP ROTATION"
   OptionSubtext(0)="SELECT TO CHANGE MAP"
   OptionSubtext(1)="SELECT TO CHANGE OR REMOVE MAP"
   OptionSubtext(2)="SELECT TO CHANGE OR REMOVE MAP"
   OptionSubtext(3)="SELECT TO CHANGE OR REMOVE MAP"
   OptionSubtext(4)="SELECT TO CHANGE OR REMOVE MAP"
   OptionSubtext(5)="SELECT TO CHANGE OR REMOVE MAP"
   OptionSubtext(6)="SELECT TO CHANGE OR REMOVE MAP"
   OptionSubtext(7)="SELECT TO CHANGE OR REMOVE MAP"
   Name="Default__GFxTrPage_MapRotation"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
