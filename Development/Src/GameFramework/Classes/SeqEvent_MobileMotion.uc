/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileMotion extends SeqEvent_MobileBase
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

var float Roll;
var float Pitch;
var float Yaw;


var float DeltaRoll;
var float DeltaPitch;
var float DeltaYaw;

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Input Active")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Pitch",PropertyName="Pitch",bWriteable=False)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Yaw",PropertyName="Yaw")
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Roll",PropertyName="Roll")
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Delta Pitch",PropertyName="DeltaPitch")
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Delta Yaw",PropertyName="DeltaYaw")
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Delta Roll",PropertyName="DeltaRoll")
   ObjName="Mobile Motion Access"
   ObjCategory="Input"
   Name="Default__SeqEvent_MobileMotion"
   ObjectArchetype=SeqEvent_MobileBase'GameFramework.Default__SeqEvent_MobileBase'
}
