/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SeqAct_UpdatePhysBonesFromAnim extends SequenceAction;

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

defaultproperties
{
   InputLinks(0)=(LinkDesc="Update")
   InputLinks(1)=(LinkDesc="Disable Physics")
   InputLinks(2)=(LinkDesc="Enable Physics")
   ObjName="Force Phys Bones To Anim Pose"
   ObjCategory="Physics"
   Name="Default__SeqAct_UpdatePhysBonesFromAnim"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
