/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackSkelControlScale extends InterpTrackFloatBase
	native(Interpolation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Name of property in Group Actor which this track mill modify over time. */
var()	name	SkelControlName;

cpptext
{
	// InterpTrack interface
	virtual INT AddKeyframe(FLOAT Time, UInterpTrackInst* TrInst, EInterpCurveMode InitInterpMode);
	virtual void PreviewUpdateTrack(FLOAT NewPosition, UInterpTrackInst* TrInst);
	virtual void UpdateTrack(FLOAT NewPosition, UInterpTrackInst* TrInst, UBOOL bJump);

}


defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstSkelControlScale'
   TrackTitle="SkelControl Scale"
   bIsAnimControlTrack=True
   Name="Default__InterpTrackSkelControlScale"
   ObjectArchetype=InterpTrackFloatBase'Engine.Default__InterpTrackFloatBase'
}
