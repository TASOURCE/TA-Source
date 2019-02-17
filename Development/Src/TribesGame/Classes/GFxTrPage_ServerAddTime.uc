class GFxTrPage_ServerAddTime extends GFxTrPage;

var int FocusIndex;
var int PurchaseIndex;

function Initialize() {}

function SpecialAction(GFxTrAction Action)
{
    PurchaseIndex = Action.ActionIndex;
    QueuePopup();
}

function int ModifyAction(int ActionIndex, GFxObject DataList)
{
    PurchaseIndex = ActionIndex;
    QueuePopup();

    return 0;
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    FocusIndex = ActionIndex;

    super.TakeFocus(ActionIndex, DataList);

    CheckPricing(DataList);

    return 0;
}

function PopupData(GFxObject Obj)
{
    if (Obj == none) return;
    
    if (PurchaseIndex >= 0)
    {
        Obj.SetString("popupTitle", Strings.Add@Strings.Time);
        Obj.SetString("popupBody", Strings.AreYouSureYouWantTo@Strings.Purchase@"'"$QueueManager.RentalItems[PurchaseIndex].RentalName$"'"@Strings.TrFor@QueueManager.RentalItems[PurchaseIndex].Price@Strings.Gold$"?");
        Obj.SetString("buttonLabel2", Strings.OK);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 0);
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (PurchaseIndex >= 0)
    {
        if (Action == 1)
        {
            QueueManager.AddCustomServerTime(QueueManager.RentalItems[PurchaseIndex].LootId);
        }
    }
    
    PurchaseIndex = -1;
}

function FillData(GFxObject DataList)
{
    local int i;
    
    ClearActions();

    for (i = 0; i < QueueManager.RentalItems.Length; i++)
    {
        AddActionNumber(i+1);
    }

    super.FillData(DataList);

    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    obj.SetString("itemTitle", QueueManager.RentalItems[ActionIndex].RentalName);
    obj.SetString("itemSubTitle", Strings.AddRentalTimeToThisServer);
    
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


function bool CheckPricing(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject priceObj;

    if (bFillingFocus)
    {
        return false;
    }

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_PRICE);

    priceObj = FillPricing(DataList);

    if (priceObj != none)
    {
        obj.SetObject("data", priceObj);

        if (DataList != none)
        {
            DataList.SetElementObject(DataCount++, obj);
            return true;
        }
    }

    return false;
}

function GFxObject FillPricing(GFxObject DataList)
{
    local GFxObject obj;

    obj = CreateObject("Object");

    obj.SetString("actionLabel", Strings.Add@Strings.Time);
    obj.SetString("orLabel", "");
    obj.SetFloat("bUpgradeType", 0);
    obj.SetFloat("gold", QueueManager.RentalItems[FocusIndex].Price);

    return obj;
}

defaultproperties
{
   PurchaseIndex=-1
   PageLabel="RENTAL TIME"
   Name="Default__GFxTrPage_ServerAddTime"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
