/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


/** this action sets the flag that tells bots whether or not they must complete a given objective to proceed */
class UTSeqAct_SetBotsMustComplete extends SequenceAction;

defaultproperties
{
   InputLinks(0)=(LinkDesc="Turn On")
   InputLinks(1)=(LinkDesc="Turn Off")
   ObjName="Set Bots Must Complete"
   ObjCategory="Objective"
   Name="Default__UTSeqAct_SetBotsMustComplete"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
