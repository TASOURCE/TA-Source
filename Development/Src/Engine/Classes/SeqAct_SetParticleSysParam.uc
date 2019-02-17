/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class SeqAct_SetParticleSysParam extends SequenceAction;

var() editinline array<ParticleSystemComponent.ParticleSysParam>	InstanceParameters;

/** Should ScalarValue override any entries to InstanceParameters? */
var() bool bOverrideScalar;

/** Override scalar value */
var() float ScalarValue;

defaultproperties
{
   bOverrideScalar=True
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Scalar Value",PropertyName="ScalarValue")
   ObjName="Set Particle Param"
   ObjCategory="Particles"
   Name="Default__SeqAct_SetParticleSysParam"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
