class TrActorFactoryVehicle extends ActorFactoryVehicle;

/** the number of the team that may use this vehicle */
var() byte TeamNum;

/** 
  * Initialize factory created vehicle
  */
simulated event PostCreateActor(Actor NewActor)
{
	local TrVehicle NewVehicle;
	
	NewVehicle = TrVehicle(NewActor);
	if ( NewVehicle != None )
	{
		NewVehicle.SetTeamNum(TeamNum);
		NewVehicle.bTeamLocked = true;

		// actor factories could spawn the vehicle anywhere, so make sure it's awake so it doesn't end up floating or something
		if ( NewVehicle.Mesh != None)
		{
			NewVehicle.Mesh.WakeRigidBody();
		}
	}
}

defaultproperties
{
   Name="Default__TrActorFactoryVehicle"
   ObjectArchetype=ActorFactoryVehicle'Engine.Default__ActorFactoryVehicle'
}
