/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileLook extends SeqEvent_MobileZoneBase
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


/** Holds the current axis values for the device */
var float Yaw;
var float StickStrength;
var vector RotationVector;

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Input Active")
   OutputLinks(1)=(LinkDesc="Input Inactive")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Yaw",PropertyName="Yaw",bWriteable=False)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Strength",PropertyName="StickStrength")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Vector',LinkDesc="Rotation Vector",PropertyName="RotationVector")
   ObjName="Mobile Look"
   ObjCategory="Input"
   Name="Default__SeqEvent_MobileLook"
   ObjectArchetype=SeqEvent_MobileZoneBase'GameFramework.Default__SeqEvent_MobileZoneBase'
}
