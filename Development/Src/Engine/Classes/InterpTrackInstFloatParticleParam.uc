/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstFloatParticleParam extends InterpTrackInst
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Saved value for restoring state when exiting Matinee. */
var	float		ResetFloat;

cpptext
{
	virtual void SaveActorState(UInterpTrack* Track);
	virtual void RestoreActorState(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstFloatParticleParam"
   ObjectArchetype=InterpTrackInst'Engine.Default__InterpTrackInst'
}
