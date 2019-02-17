/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstEvent extends InterpTrackInst
	native(Interpolation);


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** 
 *	Position we were in last time we evaluated Events. 
 *	During UpdateTrack, events between this time and the current time will be fired. 
 */
var	float LastUpdatePosition;

cpptext
{
	/** 
	 * This will initialise LastUpdatePosition to whatever position the SeqAct_Interp is in, 
	 * so we don't play a bunch of events straight away! 
	 */
	virtual void InitTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstEvent"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}