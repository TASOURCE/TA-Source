/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetBlockRigidBody extends SequenceAction
	native(Sequence);

defaultproperties
{
   InputLinks(0)=(LinkDesc="Turn On")
   InputLinks(1)=(LinkDesc="Turn Off")
   ObjName="Set BlockRigidBody"
   ObjCategory="Physics"
   Name="Default__SeqAct_SetBlockRigidBody"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
