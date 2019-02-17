/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTSeqAct_GetTeamNum extends SequenceAction;

var int TeamNum;

event Activated()
{
	local Actor A;

	if (Targets.length == 0)
	{
		ScriptLog("WARNING: Missing Target for Get Team Number");
	}
	else
	{
		A = Actor(Targets[0]);
	}

	TeamNum = (A != None) ? int(A.GetTeamNum()) : 255;
}

defaultproperties
{
   bCallHandler=False
   VariableLinks(0)=(MaxVars=1)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Team Number",PropertyName="TeamNum",bWriteable=True,MaxVars=1)
   ObjName="Get Team Number"
   ObjCategory="Team"
   Name="Default__UTSeqAct_GetTeamNum"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
