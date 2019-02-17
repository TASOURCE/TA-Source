/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileInput extends SeqEvent_MobileZoneBase
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
var float XAxisValue;
var float YAxisValue;

var float CenterX;
var float CenterY;
var float CurrentX;
var float CurrentY;

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Input Active")
   OutputLinks(1)=(LinkDesc="Input Inactive")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="X-Axis",PropertyName="XAxisValue",bWriteable=False)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Y-Axis",PropertyName="YAxisValue")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Center.X",PropertyName="CenterX")
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Center.Y",PropertyName="CenterY")
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Current.X",PropertyName="CurrentX")
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Current.Y",PropertyName="CurrentY")
   ObjName="Mobile Input Access"
   ObjCategory="Input"
   Name="Default__SeqEvent_MobileInput"
   ObjectArchetype=SeqEvent_MobileZoneBase'GameFramework.Default__SeqEvent_MobileZoneBase'
}
