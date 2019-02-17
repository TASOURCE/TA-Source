/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTSeqEvent_VehicleFactory extends SequenceEvent;

/** reference to the vehicle spawned by the factory */
var UTVehicle SpawnedVehicle;

event Activated()
{
	if (UTVehicleFactory(Originator) != None)
	{
		SpawnedVehicle = UTVehicle(UTVehicleFactory(Originator).ChildVehicle);
	}
}

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   OutputLinks(0)=(LinkDesc="Spawned")
   OutputLinks(1)=(LinkDesc="Taken")
   OutputLinks(2)=(LinkDesc="Destroyed")
   OutputLinks(3)=(LinkDesc="VehicleEntered")
   OutputLinks(4)=(LinkDesc="VehicleLeft")
   VariableLinks(0)=(LinkDesc="Spawned Vehicle",PropertyName="SpawnedVehicle")
   ObjName="Vehicle Factory Event"
   Name="Default__UTSeqEvent_VehicleFactory"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
