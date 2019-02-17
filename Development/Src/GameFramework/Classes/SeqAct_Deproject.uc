/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SeqAct_Deproject extends SequenceAction
	native;

/** The X location you wish to trace out from */
var() float ScreenX;

/** The Y location you wish to trace out from */
var() float ScreenY;

/** How far out should we trace */
var() float TraceDistance;

/** The object that was hit */
var object HitObject;

/** The location where the hit occured */
var vector HitLocation;

/** The hit normal */
var vector HitNormal;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   TraceDistance=20480.000000
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="X",PropertyName="ScreenX",bWriteable=True)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Y",PropertyName="ScreenY",bWriteable=True)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Hit Object",PropertyName="HitObject",bWriteable=True)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Hit Location",PropertyName="HitLocation",bWriteable=True)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Hit Normal",PropertyName="HitNormal",bWriteable=True)
   ObjName="Deproject"
   ObjCategory="Level"
   Name="Default__SeqAct_Deproject"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
