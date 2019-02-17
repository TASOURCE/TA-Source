/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstColorProp extends InterpTrackInstProperty
	native(Interpolation);


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Pointer to color property in TrackObject. */
var	pointer		ColorProp; 

/** Saved value for restoring state when exiting Matinee. */
var	color		ResetColor;

cpptext
{
	virtual void SaveActorState(UInterpTrack* Track);
	virtual void RestoreActorState(UInterpTrack* Track);

	virtual void InitTrackInst(UInterpTrack* Track);

}


defaultproperties
{
   Name="Default__InterpTrackInstColorProp"
   ObjectArchetype=InterpTrackInstProperty'Engine.Default__InterpTrackInstProperty'
}
