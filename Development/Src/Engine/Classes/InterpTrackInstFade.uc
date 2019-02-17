/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstFade extends InterpTrackInst
	native(Interpolation);


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// InterpTrackInst interface
	virtual void TermTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstFade"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
