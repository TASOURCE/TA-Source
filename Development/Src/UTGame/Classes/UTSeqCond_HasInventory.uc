/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** activates output depending on whether the given Pawn has the specified inventory item */
class UTSeqCond_HasInventory extends SequenceCondition;

/** player to look for inventory on */
var Actor Target;
/** inventory item to check */
var() class<Inventory> RequiredInventory;
/** whether subclasses of the specified class count */
var() bool bAllowSubclass;
/** whether to check the driver Pawn if the player is in a vehicle */
var() bool bCheckVehicleDriver;

event Activated()
{
	local Pawn P;
	local Vehicle V;
	local bool bHasItem;

	P = GetPawn(Target);
	if (P != None)
	{
		bHasItem = (P.FindInventoryType(RequiredInventory, bAllowSubclass) != None);
		if (!bHasItem && bCheckVehicleDriver)
		{
			V = Vehicle(P);
			if (V != None && V.Driver != None)
			{
				bHasItem = (V.Driver.FindInventoryType(RequiredInventory, bAllowSubclass) != None);
			}
		}

		OutputLinks[bHasItem ? 0 : 1].bHasImpulse = true;
	}
}

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Has Item")
   OutputLinks(1)=(LinkDesc="Doesn't Have Item")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Target",PropertyName="Target",MaxVars=1)
   ObjName="Has Inventory"
   Name="Default__UTSeqCond_HasInventory"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
