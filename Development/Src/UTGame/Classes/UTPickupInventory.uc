/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// UTPickupInventory:
// This class is used to redirect
// queries normally made to an inventory class to the associated UTItemPickupFactory
//=============================================================================
class UTPickupInventory extends UTInventory;


static function float BotDesireability(Actor PickupHolder, Pawn P, Controller C)
{
	local UTItemPickupFactory F;
	local UTDroppedItemPickup D;

	F = UTItemPickupFactory(PickupHolder);

	if (F != None)
	{
		return F.BotDesireability(P, C);
	}
	else
	{
		D = UTDroppedItemPickup(PickupHolder);
		if (D != None)
		{
			return D.BotDesireability(P, C);
		}
		else
		{
			return 0.0;
		}
	}
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTInventory:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTInventory:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__UTPickupInventory"
   ObjectArchetype=UTInventory'UTGame.Default__UTInventory'
}
