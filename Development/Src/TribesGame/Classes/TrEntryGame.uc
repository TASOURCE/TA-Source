class TrEntryGame extends UTEntryGame
    native;

native function SendMenuEngineLoaded();

static event class<GameInfo> SetGameType(string MapName, string Options, string Portal)
{
	if (MapName ~= "TribesMainEntry")
	{
		return class'TribesGame.TrEntryGame';
	}

    return (super.SetGameType(MapName, Options, Portal));
}

event OnEngineHasLoaded()
{
    SendMenuEngineLoaded();
}

defaultproperties
{
   HUDType=Class'TribesGame.TrEntryHUD'
   PlayerControllerClass=Class'TribesGame.TrEntryPlayerController'
   Name="Default__TrEntryGame"
   ObjectArchetype=UTEntryGame'UTGame.Default__UTEntryGame'
}
