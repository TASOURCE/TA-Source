class InterpTrackInstAnimControl extends InterpTrackInst
	native(Interpolation);
	
/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var	float			LastUpdatePosition;

cpptext
{
	/** Initialise this Track instance. Called in-game before doing any interpolation. */
	virtual void InitTrackInst(UInterpTrack* Track);

	/** Called when interpolation is done. Should not do anything else with this TrackInst after this. */
	virtual void TermTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstAnimControl"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
