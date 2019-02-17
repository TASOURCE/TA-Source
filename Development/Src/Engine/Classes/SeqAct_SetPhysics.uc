/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetPhysics extends SequenceAction
	native(Sequence);

/** Action for changing the physics mode of an Actor. */

/** Physics mode to change the Actor to. */
var()	Actor.EPhysics	NewPhysics<autocomment=true>;

defaultproperties
{
   ObjName="Set Physics"
   ObjCategory="Physics"
   bSuppressAutoComment=False
   Name="Default__SeqAct_SetPhysics"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
