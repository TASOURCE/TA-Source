/** 
 * sets who gets credit for damage caused by the Target Actor
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_SetDamageInstigator extends SequenceAction;

var Actor DamageInstigator;

defaultproperties
{
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Damage Instigator",PropertyName="DamageInstigator",MaxVars=1)
   ObjName="Set Damage Instigator"
   ObjCategory="Actor"
   Name="Default__SeqAct_SetDamageInstigator"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
