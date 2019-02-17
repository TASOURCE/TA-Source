class GFxTrPage_Vehicle extends GFxTrPage;

var int PlayerCredits;

struct VehicleOption
{
    var int    Cost;
    var int    Icon;
    var int    Count;
    var int    MaxCount;
    var string ClassName;
    var string DisplayName;
};

var array<VehicleOption> VehicleOptions;

function Initialize()
{
}

function SpecialAction(GFxTrAction Action)
{
    local TrPlayerController TrPC;
    
    TrPC = TrPlayerController(GetPC());
        
    if (TrPC != none && (PlayerCredits >= VehicleOptions[Action.ActionIndex].Cost) &&
        (VehicleOptions[Action.ActionIndex].Count < VehicleOptions[Action.ActionIndex].MaxCount))
    {
        TrPC.RequestBuyVehicle(VehicleOptions[Action.ActionIndex].ClassName);
        NewAction = -1;
        HideMovie();
    }
}

function ClearActions()
{
    local int i;

    for (i = VehicleOptions.Length; i > 0; i--)
    {
        VehicleOptions.Remove(i-1, 1);
    }

    super.ClearActions();
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    return super.TakeAction(ActionIndex, DataList);
}

function AddOption(string ClassName, string DisplayName, int Cost, int Icon, int Count, int MaxCount)
{
    local VehicleOption vOption;

    vOption.Cost = Cost;
    vOption.Icon = Icon;
    vOption.Count = Count;
    vOption.MaxCount = MaxCount;
    vOption.ClassName = ClassName;
    vOption.DisplayName = DisplayName;

    VehicleOptions.AddItem(vOption);

    AddAction();
}

function FillData(GFxObject DataList)
{
    bEndOfLine = true;

    super.FillData(DataList);
}

function GFxObject FillOptions(GFxObject DataList)
{
    local int i;
    local GFxObject obj;
    
    obj = CreateObject("Object");
    obj.SetFloat("showTribesLogo", bShowTribesLogo ? 1 : 0);
    obj.SetFloat("focusIndex", Pages.FocusIndex);
    obj.SetString("menuTitle", PageLabel);
    obj.SetFloat("bShowPageUp", 0);
    obj.SetFloat("bShowPageDown", 0);
    obj.SetFloat("buttonLength", PageActions.Length + 1);

    for (i = 0; i < PageActions.Length; i++)
    {
        obj.SetObject("buttonItem"$i+1, FillOption(i));
    }
    
    return obj;
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;
    
    obj = CreateObject("Object");
    
    obj.SetFloat("actionID", ActionIndex);
    
    obj.SetString("itemTitle", Caps(VehicleOptions[ActionIndex].DisplayName));
    obj.SetString("itemSubTitle", VehicleOptions[ActionIndex].Cost@Strings.Credits);

    if ((PlayerCredits < VehicleOptions[ActionIndex].Cost) ||
        VehicleOptions[ActionIndex].Count == VehicleOptions[ActionIndex].MaxCount)
    {
        obj.SetFloat("bLocked", 1);
    }
    
    if ( VehicleOptions[ActionIndex].Count > 0)
    {
        obj.SetString("itemRibbonLabel", VehicleOptions[ActionIndex].Count@Strings.Of@VehicleOptions[ActionIndex].MaxCount);
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("bItemSelected", 1);

        if (VehicleOptions[ActionIndex].Count == VehicleOptions[ActionIndex].MaxCount) obj.SetFloat("ribbonType", 1);
        else obj.SetFloat("ribbonType", 3);
    }

    return obj;
}

function ShowModel()
{
}

defaultproperties
{
   PageLabel="VEHICLE STATION"
   Name="Default__GFxTrPage_Vehicle"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
