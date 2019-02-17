/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetRigidBodyIgnoreVehicles extends SequenceAction
	native(Sequence);

defaultproperties
{
   InputLinks(0)=(LinkDesc="Turn On")
   InputLinks(1)=(LinkDesc="Turn Off")
   ObjName="Set RigidBodyIgnoreVehicles"
   ObjCategory="Physics"
   Name="Default__SeqAct_SetRigidBodyIgnoreVehicles"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
