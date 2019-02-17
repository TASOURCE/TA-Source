/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTSeqAct_AIStartFireAt extends SequenceAction;

var() byte ForcedFireMode;

defaultproperties
{
   ForcedFireMode=255
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Fire At",MaxVars=1)
   ObjName="Start Firing At"
   ObjCategory="AI"
   Name="Default__UTSeqAct_AIStartFireAt"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
