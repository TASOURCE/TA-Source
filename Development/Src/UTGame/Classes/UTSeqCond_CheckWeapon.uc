/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTSeqCond_CheckWeapon extends SequenceCondition;

var Actor Target;
var() class<UTWeapon> TestForWeaponClass;

event Activated()
{
	local UTPawn P;
	local UTPlayerController PC;
	local bool Results;

	PC = UTPlayerController(Target);
	if ( PC != none )
	{
		P = UTPawn(PC.Pawn);
		if ( P != none  )
		{
			Results = P.Weapon.Class == TestForWeaponClass;
		}
	}

	OutputLinks[ Results ? 0 : 1].bHasImpulse = true;
}

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Weapon Equipped")
   OutputLinks(1)=(LinkDesc="Weapon Not Equipped")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Target",PropertyName="Target",MaxVars=1)
   ObjName="UTWeaponTest"
   Name="Default__UTSeqCond_CheckWeapon"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
