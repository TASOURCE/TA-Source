/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetSkelControlTarget extends SequenceAction;

/** Name of SkelControl to set target of */
var()	name			SkelControlName;
/** List of objects to call the handler function on */
var()	array<Object>	TargetActors;

defaultproperties
{
   VariableLinks(0)=(LinkDesc="SkelMesh")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="TargetActor",PropertyName="TargetActors")
   ObjName="Set SkelControl Target"
   ObjCategory="Actor"
   Name="Default__SeqAct_SetSkelControlTarget"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
