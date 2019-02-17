class GFxTrPage_ManageProfile extends GFxTrPage;

function Initialize()
{
}

function SpecialAction(GFxTrAction Action)
{
}

function ShowModel()
{
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
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    return obj;
}

defaultproperties
{
   Name="Default__GFxTrPage_ManageProfile"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
