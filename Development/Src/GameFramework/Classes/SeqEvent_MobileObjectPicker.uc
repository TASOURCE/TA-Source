/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileObjectPicker extends SeqEvent_MobileRawInput
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var(mobile) float TraceDistance;

var vector FinalTouchLocation;
var vector FinalTouchNormal;
var object FinalTouchObject;

/** List of objects that we are looking for touches on */
var() array<Object> Targets;

defaultproperties
{
   TraceDistance=20480.000000
   OutputLinks(0)=(LinkDesc="Success")
   OutputLinks(1)=(LinkDesc="Fail")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Target",PropertyName="Targets")
   ObjName="Mobile Object Picker"
   Name="Default__SeqEvent_MobileObjectPicker"
   ObjectArchetype=SeqEvent_MobileRawInput'GameFramework.Default__SeqEvent_MobileRawInput'
}
