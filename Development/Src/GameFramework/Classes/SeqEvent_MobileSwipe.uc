/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_MobileSwipe extends SeqEvent_MobileRawInput
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


/** How much tolerance should we give the weak axis in order to consider it a swipe */
var (swipe) float Tolerance;

/** How far does the touch need to travel in order to be consider a swipe */
var (swipe) float MinDistance;

var vector2D InitialTouch;

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Swipe Left")
   OutputLinks(1)=(LinkDesc="Swipe Right")
   OutputLinks(2)=(LinkDesc="Swipe Up")
   OutputLinks(3)=(LinkDesc="Swipe Down")
   ObjName="Mobile Simple Swipes"
   Name="Default__SeqEvent_MobileSwipe"
   ObjectArchetype=SeqEvent_MobileRawInput'GameFramework.Default__SeqEvent_MobileRawInput'
}
