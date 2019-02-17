class InterpTrackFloatParticleParam extends InterpTrackFloatBase
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
// (cpptext)

/** Name of property in the Emitter which this track mill modify over time. */
var()	name		ParamName;

cpptext
{
	// InterpTrack interface
	virtual INT AddKeyframe(FLOAT Time, UInterpTrackInst* TrInst, EInterpCurveMode InitInterpMode);
	virtual void PreviewUpdateTrack(FLOAT NewPosition, UInterpTrackInst* TrInst);
	virtual void UpdateTrack(FLOAT NewPosition, UInterpTrackInst* TrInst, UBOOL bJump);
	
	//virtual class UMaterial* GetTrackIcon() const;

}


defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstFloatParticleParam'
   TrackTitle="Float Particle Param"
   Name="Default__InterpTrackFloatParticleParam"
   ObjectArchetype=InterpTrackFloatBase'Engine.Default__InterpTrackFloatBase'
}