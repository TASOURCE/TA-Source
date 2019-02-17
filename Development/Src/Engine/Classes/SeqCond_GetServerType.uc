/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqCond_GetServerType extends SequenceCondition
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	virtual void Activated();

}


defaultproperties
{
   OutputLinks(0)=(LinkDesc="Standalone")
   OutputLinks(1)=(LinkDesc="Dedicated Server")
   OutputLinks(2)=(LinkDesc="Listen Server")
   OutputLinks(3)=(LinkDesc="Client")
   ObjName="Server Type"
   Name="Default__SeqCond_GetServerType"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
