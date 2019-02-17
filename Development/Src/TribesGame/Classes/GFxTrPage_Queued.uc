class GFxTrPage_Queued extends GFxTrPage;

function Initialize()
{
    super.Initialize();

    AddActionString("LEAVEQUEUE");
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    super.TakeAction(ActionIndex, DataList);

    if (NewAction == 0 && ActionIndex < PageActions.Length && PageActions[ActionIndex] != none)
    {
        if (PageActions[ActionIndex].ActionString == "LEAVEQUEUE")
        {
            NewAction = 1;
            QueueManager.LeaveMatchmaking();
            Pages.PopPage().FillData(DataList);
        }
    }

    return NewAction;
}

defaultproperties
{
   PageLabel="LOOKING FOR MATCH"
   OptionTitles(0)="LEAVE QUEUE"
   Name="Default__GFxTrPage_Queued"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
