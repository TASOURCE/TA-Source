/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstAudioMaster extends InterpTrackInst
	native(Interpolation);


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// InterpTrackInst interface
	virtual void InitTrackInst(UInterpTrack* Track);
	virtual void TermTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstAudioMaster"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
