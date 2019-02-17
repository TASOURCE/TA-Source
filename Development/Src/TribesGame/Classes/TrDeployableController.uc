class TrDeployableController extends AIController;

var TrPlayerController m_SpawnedFromController;

function bool CanFireWeapon( Weapon Wpn, byte FireModeNum ) { return TRUE; }

simulated event byte ScriptGetTeamNum()
{
	// Use the controller that spawned us as the guide.
	if (m_SpawnedFromController != none)
	{
		return m_SpawnedFromController.GetTeamNum();
	}

	return Pawn != none ? Pawn.GetTeamNum() : 255;
}

defaultproperties
{
   Name="Default__TrDeployableController"
   ObjectArchetype=AIController'Engine.Default__AIController'
}
