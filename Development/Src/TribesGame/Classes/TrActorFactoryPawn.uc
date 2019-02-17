class TrActorFactoryPawn extends UTActorFactoryAI
	config(Editor);

var int NextTeam;
var() float GroundSpeed;
var() class<TrFamilyInfo> FamilyInfo;

simulated event PostCreateActor(Actor NewActor)
{
	local TrBotAIController Bot;
	local TrBotPawn NewPawn;
	local int idx;

	NewPawn = TrBotPawn(NewActor);
	
	if ( NewPawn != None )
	{
		// give the pawn a controller here, since we don't define a ControllerClass
		Bot = TrBotAIController(NewPawn.Controller);
		if ( Bot != None )
		{
			// handle the team assignment
			Bot.SetTeam(TeamIndex);
			// force the controller to possess, etc
			Bot.Possess(newPawn, false);
	
			if (Bot.PlayerReplicationInfo != None && PawnName != "" )
				Bot.PlayerReplicationInfo.SetPlayerName(PawnName);
		}

		// create any inventory
		if (bGiveDefaultInventory && newPawn.WorldInfo.Game != None)
		{
			newPawn.WorldInfo.Game.AddDefaultInventory(newPawn);
		}
		for ( idx=0; idx<InventoryList.Length; idx++ )
		{
			newPawn.CreateInventory( InventoryList[idx], false  );
		}

		NewPawn.SetCharacterClassFromInfo(FamilyInfo, true);
		NewPawn.GroundSpeed = GroundSpeed;
	}
}

defaultproperties
{
   GroundSpeed=400.000000
   FamilyInfo=Class'TribesGame.TrFamilyInfo_Medium_Soldier'
   PawnClass=Class'TribesGame.TrPlayerPawn'
   PawnName="Target Practice"
   bGiveDefaultInventory=True
   TeamIndex=0
   bPlaceable=True
   Name="Default__TrActorFactoryPawn"
   ObjectArchetype=UTActorFactoryAI'UTGame.Default__UTActorFactoryAI'
}
