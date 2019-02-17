/**
 * Copyright 1998-2010 Epic Games, Inc. All Rights Reserved.
 */

class TrInventory extends UTInventory
	abstract;

var float m_fMaxPickupSpeed;

function DropFrom(vector StartLocation, vector StartVelocity)
{
	local vector NewVelocity;

	// Limit our max dropped pickup velocity if necessary.
	if (VSizeSq(StartVelocity) > m_fMaxPickupSpeed * m_fMaxPickupSpeed)
		NewVelocity = Normal(StartVelocity) * m_fMaxPickupSpeed;
	else
		NewVelocity = StartVelocity;

	super.DropFrom(StartLocation, NewVelocity);
}

defaultproperties
{
   m_fMaxPickupSpeed=500.000000
   DroppedPickupClass=Class'TribesGame.TrDroppedPickup'
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTInventory:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTInventory:Sprite'
   End Object
   Components(0)=Sprite
   Name="Default__TrInventory"
   ObjectArchetype=UTInventory'UTGame.Default__UTInventory'
}
