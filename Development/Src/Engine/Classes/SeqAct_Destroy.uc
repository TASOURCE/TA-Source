/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Destroy extends SequenceAction;

var() bool bDestroyBasedActors;
var() array< class<Actor> > IgnoreBasedClasses;

defaultproperties
{
   ObjName="Destroy"
   ObjCategory="Actor"
   Name="Default__SeqAct_Destroy"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
