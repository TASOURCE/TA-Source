/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InterpTrackSlomo extends InterpTrackFloatBase
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

cpptext
{
	// InterpTrack interface
	virtual INT AddKeyframe(FLOAT Time, UInterpTrackInst* TrInst, EInterpCurveMode InitInterpMode);
	virtual void UpdateKeyframe(INT KeyIndex, UInterpTrackInst* TrInst);
	virtual void PreviewUpdateTrack(FLOAT NewPosition, UInterpTrackInst* TrInst);
	virtual void UpdateTrack(FLOAT NewPosition, UInterpTrackInst* TrInst, UBOOL bJump);
	virtual void SetTrackToSensibleDefault();

	virtual class UMaterial* GetTrackIcon() const;

	// InterpTrackSlomo interface
	FLOAT GetSlomoFactorAtTime(FLOAT Time);

}


defaultproperties
{
   TrackInstClass=Class'Engine.InterpTrackInstSlomo'
   TrackTitle="Slomo"
   bOnePerGroup=True
   bDirGroupOnly=True
   Name="Default__InterpTrackSlomo"
   ObjectArchetype=InterpTrackFloatBase'Engine.Default__InterpTrackFloatBase'
}
