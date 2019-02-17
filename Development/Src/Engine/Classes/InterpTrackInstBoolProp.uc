/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackInstBoolProp extends InterpTrackInstProperty
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Pointer to boolean property in TrackObject. */
var	pointer		BoolProp; 

/** Saved value for restoring state when exiting Matinee. */
var	bool		ResetBool;

cpptext
{
	/** 
	 * Initialize the track instance.
	 *
	 * @param	Track	The track associated to this instance.
	 */
	virtual void InitTrackInst( UInterpTrack* Track );

	/** 
	 * Save any variables from the actor that will be modified by this instance.
	 *
	 * @param	Track	The track associated to this instance.
	 */
	virtual void SaveActorState( UInterpTrack* Track );
	
	/** 
	 * Restores any variables modified on the actor by this instance.
	 *
	 * @param	Track	The track associated to this instance.
	 */
	virtual void RestoreActorState( UInterpTrack* Track );

}


defaultproperties
{
   Name="Default__InterpTrackInstBoolProp"
   ObjectArchetype=InterpTrackInstProperty'Engine.Default__InterpTrackInstProperty'
}
