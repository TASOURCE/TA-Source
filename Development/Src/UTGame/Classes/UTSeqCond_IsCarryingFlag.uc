/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTSeqCond_IsCarryingFlag extends SequenceCondition;

var Actor Target;
var() UTGameObjective FlagBase;

event Activated()
{
	local UTPlayerReplicationInfo PRI;
	local Pawn P;
	local Controller C;
	local UTCarriedObject Flag;
	
	P = Pawn(Target);
	if (P != None)
	{
		PRI = UTPlayerReplicationInfo(P.PlayerReplicationInfo);
	}
	else
	{
		C = Controller(Target);
		if (C != None)
		{
			PRI = UTPlayerReplicationInfo(C.PlayerReplicationInfo);
		}
	}
	if (PRI == None)
	{
		ScriptLog("Invalid target specified for" @ self);
	}
	else
	{
		if (FlagBase != None)
		{
			Flag = FlagBase.GetFlag();
		}

		OutputLinks[(PRI.bHasFlag && (Flag == None || PRI.GetFlag() == Flag)) ? 0 : 1].bHasImpulse = true;
	}
}

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Has Flag")
   OutputLinks(1)=(LinkDesc="No Flag")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Target",PropertyName="Target",MaxVars=1)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Flag Base (Optional)",PropertyName="FlagBase",MaxVars=1)
   ObjName="Is Carrying Flag"
   Name="Default__UTSeqCond_IsCarryingFlag"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
