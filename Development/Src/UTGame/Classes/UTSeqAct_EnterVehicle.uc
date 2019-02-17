/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTSeqAct_EnterVehicle extends SequenceAction;

/** index of the seat of the vehicle the bot should use, or -1 for auto-select */
var() int SeatIndex;

event Activated()
{
	local SeqVar_Object ObjVar;
	local Pawn Target;
	local UTVehicle TheVehicle;
	local UTVehicleFactory Factory;

	foreach LinkedVariables(class'SeqVar_Object', ObjVar, "Vehicle/Vehicle Factory")
	{
		TheVehicle = UTVehicle(ObjVar.GetObjectValue());
		if (TheVehicle == None)
		{
			Factory = UTVehicleFactory(ObjVar.GetObjectValue());
			if (Factory != None)
			{
				TheVehicle = UTVehicle(Factory.ChildVehicle);
			}
		}
		if (TheVehicle != None)
		{
			break;
		}
	}
	if (TheVehicle == None)
	{
		ScriptLog("WARNING: Vehicle variable for" @ self @ "is empty");
	}
	else
	{
		// get the pawn(s) that should enter the vehicle
		foreach LinkedVariables(class'SeqVar_Object', ObjVar, "Target")
		{
			Target = GetPawn(Actor(ObjVar.GetObjectValue()));
			if (Target != None)
			{
				// use selected seat if valid and empty, otherwise use main driver if empty, and finally use the first available seat
				if ((SeatIndex <= 0 || SeatIndex >= TheVehicle.Seats.length) && TheVehicle.Driver == None)
				{
					TheVehicle.DriverEnter(Target);
				}
				else if (SeatIndex > 0 && SeatIndex < TheVehicle.Seats.length && TheVehicle.SeatAvailable(SeatIndex))
				{
					TheVehicle.PassengerEnter(Target, SeatIndex);
				}
				else if (TheVehicle.Driver == None)
				{
					TheVehicle.DriverEnter(Target);
				}
				else
				{
					TheVehicle.PassengerEnter(Target, TheVehicle.GetFirstAvailableSeat());
				}
			}
		}
	}
}

defaultproperties
{
   SeatIndex=-1
   bCallHandler=False
   VariableLinks(0)=(MaxVars=1)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Vehicle/Vehicle Factory",MaxVars=1)
   ObjName="Enter Vehicle"
   ObjCategory="Pawn"
   Name="Default__UTSeqAct_EnterVehicle"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
