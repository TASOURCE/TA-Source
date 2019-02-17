/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileButton extends SeqEvent_MobileZoneBase
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

/** TRUE if the zone was active last frame (for tracking edges) */
var bool bWasActiveLastFrame;

/** If TRUE, the Input Pressed output will only trigger when a touch first happens, not every frame */
var () bool bSendPressedOnlyOnTouchDown;

/** If TRUE, the Input Pressed output will only trigger when a touch ends, not every frame. MAKE SURE RETRIGGER DELAY IS 0!!! */
var () bool bSendPressedOnlyOnTouchUp;

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Input Pressed")
   OutputLinks(1)=(LinkDesc="Input Not Pressed")
   ObjName="Mobile Button Access"
   ObjCategory="Input"
   Name="Default__SeqEvent_MobileButton"
   ObjectArchetype=SeqEvent_MobileZoneBase'GameFramework.Default__SeqEvent_MobileZoneBase'
}
