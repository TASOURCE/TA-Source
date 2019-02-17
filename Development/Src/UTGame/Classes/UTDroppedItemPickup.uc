/**
 *  base class of dropped pickups for items that don't actually have an Inventory class (e.g. armor)
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTDroppedItemPickup extends UTDroppedPickup;

var float MaxDesireability;
var SoundCue PickupSound;

function float BotDesireability(Pawn Bot, Controller C);

simulated event SetPickupMesh(PrimitiveComponent NewPickupMesh);

event PostBeginPlay()
{
	// spawn an instance of the fake item for AI queries
	Inventory = Spawn(InventoryClass);

	Super.PostBeginPlay();
}

event Destroyed()
{
	Super.Destroyed();

	if (Inventory != None)
	{
		Inventory.Destroy();
	}
}

/** initialize pickup from Pawn that dropped it */
function DroppedFrom(Pawn P);

function PickedUpBy(Pawn P)
{
	PlaySound(PickupSound);

	Super.PickedUpBy(P);
}

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=DroppedPickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTDroppedPickup:DroppedPickupLightEnvironment'
      AmbientGlow=(R=0.200000,G=0.200000,B=0.200000,A=1.000000)
      bCastShadows=False
      bDynamic=False
      Name="DroppedPickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTDroppedPickup:DroppedPickupLightEnvironment'
   End Object
   MyLightEnvironment=DroppedPickupLightEnvironment
   InventoryClass=Class'UTGame.UTPickupInventory'
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTDroppedPickup:Sprite'
      Sprite=Texture2D'EditorResources.S_Inventory'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTDroppedPickup:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTDroppedPickup:CollisionCylinder'
      CollisionHeight=20.000000
      CollisionRadius=30.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTDroppedPickup:CollisionCylinder'
   End Object
   Components(1)=CollisionCylinder
   Components(2)=DroppedPickupLightEnvironment
   CollisionComponent=CollisionCylinder
   Name="Default__UTDroppedItemPickup"
   ObjectArchetype=UTDroppedPickup'UTGame.Default__UTDroppedPickup'
}
