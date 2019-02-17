/**
 * Base class for all sequence actions that are capable of changing the value of a SequenceVariable
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetSequenceVariable extends SequenceAction
	native(Sequence)
	abstract;

defaultproperties
{
   ObjName="Set Variable"
   ObjCategory="Set Variable"
   Name="Default__SeqAct_SetSequenceVariable"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
