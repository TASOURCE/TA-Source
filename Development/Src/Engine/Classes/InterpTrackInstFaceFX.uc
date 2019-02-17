class InterpTrackInstFaceFX extends InterpTrackInst
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

var	transient bool	bFirstUpdate;
var	float			LastUpdatePosition;

cpptext
{
	virtual void InitTrackInst(UInterpTrack* Track);
	virtual void TermTrackInst(UInterpTrack* Track);
	virtual void SaveActorState(UInterpTrack* Track);
	virtual void RestoreActorState(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstFaceFX"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
