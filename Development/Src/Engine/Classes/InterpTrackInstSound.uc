/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstSound extends InterpTrackInst
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var	float						LastUpdatePosition; 
var	transient AudioComponent	PlayAudioComp;

cpptext
{
	virtual void InitTrackInst(UInterpTrack* Track);
	virtual void TermTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstSound"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
