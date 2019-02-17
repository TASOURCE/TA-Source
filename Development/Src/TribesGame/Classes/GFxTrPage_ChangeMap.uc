class GFxTrPage_ChangeMap extends GFxTrPage;

var int  RemoveMapNumber;
var int  CurrentMapId;
var int  CurrentSlotId;
var bool bAllowRemove;

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (ActionIndex >= 0)
    {
        if (PageActions[ActionIndex].ActionNumber == RemoveMapNumber)
        {
            QueueManager.SetPropNumber(CurrentSlotId, 0, SPT_QUEUE);
        }
        else
        {
            QueueManager.SetPropNumber(CurrentSlotId, PageActions[ActionIndex].ActionNumber, SPT_QUEUE);
        }
    }

    Pages.PopPage().FillData(DataList);

    return -1;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    super.TakeFocus(ActionIndex, DataList);

    return 0;
}

function FillData(GFxObject DataList)
{
    local int mapId;
    local bool bStart;

    bStart = true;

    ClearActions();

    while (QueueManager.GetNextMapId(bStart, mapId))
    {
        bStart = false;
        AddActionNumber(mapId);
    }

    if (bAllowRemove)
    {
        AddActionNumber(RemoveMapNumber);
    }

    super.FillData(DataList);

    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);
    
    if (PageActions[ActionIndex].ActionNumber == RemoveMapNumber)
    {
        obj.SetString("itemTitle", Strings.Remove@Strings.Map);
        obj.SetString("itemSubTitle", Strings.SelectTo@Strings.Remove@Strings.Map);
    }
    else
    {
        obj.SetString("itemTitle", Caps(QueueManager.GetMapName(PageActions[ActionIndex].ActionNumber)));
        
        if (PageActions[ActionIndex].ActionNumber == CurrentMapId)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", Strings.Active);
        }
        else
        {
            obj.SetFloat("hasRibbon", 0);
        }
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
   RemoveMapNumber=1
   PageLabel="CHANGE MAP"
   Name="Default__GFxTrPage_ChangeMap"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
