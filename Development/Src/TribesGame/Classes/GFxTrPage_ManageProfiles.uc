class GFxTrPage_ManageProfiles extends GFxTrPage;

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

defaultproperties
{
   Name="Default__GFxTrPage_ManageProfiles"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
