class InterpTrackColorScale extends InterpTrackVectorBase
	native(Interpolation);

/** 
 * InterpTrackColorScale
 *
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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// InterpTrack interface
	virtual INT AddKeyframe(FLOAT Time, UInterpTrackInst* TrInst, EInterpCurveMode InitInterpMode);
	virtual void UpdateKeyframe(INT KeyIndex, UInterpTrackInst* TrInst);
	virtual void PreviewUpdateTrack(FLOAT NewPosition, UInterpTrackInst* TrInst);
	virtual void UpdateTrack(FLOAT NewPosition, UInterpTrackInst* TrInst, UBOOL bJump);
	virtual void SetTrackToSensibleDefault();

	virtual class UMaterial* GetTrackIcon() const;

	// InterpTrackColorScale interface
	FVector GetColorScaleAtTime(FLOAT Time);

}


defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstColorScale'
   TrackTitle="Color Scale"
   bOnePerGroup=True
   bDirGroupOnly=True
   Name="Default__InterpTrackColorScale"
   ObjectArchetype=InterpTrackVectorBase'Engine.Default__InterpTrackVectorBase'
}
