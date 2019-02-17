/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class SeqAct_ActorFactoryEx extends SeqAct_ActorFactory
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void UpdateDynamicLinks();
	virtual void Spawned(UObject *NewSpawn);

}


defaultproperties
{
   OutputLinks(2)=(LinkDesc="Spawned 1")
   VariableLinks(1)=(LinkDesc="Spawned 1",MinVars=1)
   ObjName="Actor Factory Ex"
   Name="Default__SeqAct_ActorFactoryEx"
   ObjectArchetype=SeqAct_ActorFactory'Engine.Default__SeqAct_ActorFactory'
}
