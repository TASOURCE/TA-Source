class GFxTrScene_EULA extends GFxTrScene
    native;

var native string EULA;

native function LoadEULA();
native function AcceptEULA();

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();

    LoadEULA();
    
    bSceneCreated = true;
}

function EULAReponse(bool bAccepted)
{
    if (!bAccepted)
    {
        TrOuter.bCreatingNewPlayer = false;
        TrOuter.QuitGame();
        return;
    }

    AcceptEULA();

    if (TrOuter.bCreatingNewPlayer)
    {
        TrOuter.ASC_GotoState("ALL_OFF");
        TrOuter.PlayerNameFailType = 0;
        TrOuter.bWaitingForPlayerNamePopup = true;
        TrOuter.QueuePopup();
    }
    else
    {
        TrOuter.LoginManager.RetryLogin();
    }
}

defaultproperties
{
   Name="Default__GFxTrScene_EULA"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
