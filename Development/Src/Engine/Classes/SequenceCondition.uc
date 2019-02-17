/**
 * Base class of any sequence operation that acts as a conditional statement, such as simple boolean expression.
 * When a SequenceCondition is activated, the values for each variable linked to this conditional are retrieved.
 * The appropriate output link (which is specific to each conditional type) is then activated based on the value of the
 * those variables.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SequenceCondition extends SequenceOp
	native(Sequence)
	abstract;

defaultproperties
{
   bAutoActivateOutputLinks=False
   ObjName="Undefined Condition"
   ObjColor=(B=255,G=0,R=0,A=255)
   Name="Default__SequenceCondition"
   ObjectArchetype=SequenceOp'Engine.Default__SequenceOp'
}
