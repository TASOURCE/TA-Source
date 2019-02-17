/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstVisibility extends InterpTrackInst
	native(Interpolation);

var()	EVisibilityTrackAction	Action;
/** 
 *	Position we were in last time we evaluated.
 *	During UpdateTrack, events between this time and the current time will be processed.
 */
var		float				LastUpdatePosition; 

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/** 
	 */
	virtual void InitTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstVisibility"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
