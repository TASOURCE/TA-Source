/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ForceGarbageCollection extends SeqAct_Latent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Activated();
	virtual UBOOL UpdateOp(FLOAT DeltaTime);

}


defaultproperties
{
   ObjName="Force Garbage Collection"
   ObjCategory="Misc"
   Name="Default__SeqAct_ForceGarbageCollection"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
