/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstDirector extends InterpTrackInst
	native(Interpolation);


var	Actor	OldViewTarget;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/** Initialise this Track instance. Called in-game before doing any interpolation. */
	virtual void InitTrackInst(UInterpTrack* Track);
	/** Called when interpolation is done. Should not do anything else with this TrackInst after this. */
	virtual void TermTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstDirector"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
