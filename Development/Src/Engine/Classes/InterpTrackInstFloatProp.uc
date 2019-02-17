/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstFloatProp extends InterpTrackInstProperty
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Pointer to float property in TrackObject. */
var	pointer		FloatProp; 

/** Saved value for restoring state when exiting Matinee. */
var	float		ResetFloat;

cpptext
{
	virtual void SaveActorState(UInterpTrack* Track);
	virtual void RestoreActorState(UInterpTrack* Track);

	virtual void InitTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstFloatProp"
   ObjectArchetype=InterpTrackInstProperty'Engine.Default__InterpTrackInstProperty'
}
