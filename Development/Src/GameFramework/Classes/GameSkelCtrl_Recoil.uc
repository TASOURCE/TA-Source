/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Weapon recoil bone controller.
 * Add a small recoil to a bone (similar to camera shakes).
 */
class GameSkelCtrl_Recoil extends SkelControlBase
	native(Anim);

/** Recoil Start-up */
enum ERecoilStart
{
	ERS_Zero,		// Start with random offset (default)
	ERS_Random,		// Start with zero offset
};

/** Recoil params */
struct native RecoilParams
{
	var() ERecoilStart	X, Y, Z;

	var transient const byte Padding;
};

/** Recoil definition */
struct native RecoilDef
{
	/** Time in seconds to go until current recoil finished */
	var		transient	float			TimeToGo;
	/** Duration in seconds of current recoil shake */
	var()				float			TimeDuration;

	/** Rotation amplitude */
	var()				vector			RotAmplitude;
	/** Rotation frequency */
	var()				vector			RotFrequency;
	/** Rotation Sine offset */
	var					vector			RotSinOffset;
	/** Rotation parameters */
	var()				RecoilParams	RotParams;
	/** Internal, Rotation offset for this frame. */
	var		transient	Rotator			RotOffset;

	/** Loc offset amplitude */
	var()				vector			LocAmplitude;
	/** Loc offset frequency */
	var()				vector			LocFrequency;
	/** Loc offset Sine offset */
	var					vector			LocSinOffset;
	/** Loc parameters */
	var()				RecoilParams	LocParams;
	/** Internal, Location offset for this frame. */
	var		transient	Vector			LocOffset;

	structdefaultproperties
	{
		TimeDuration=0.33f
	}
};

/** If TRUE, Aim is ignored, and recoil is just applied in the local bone space. */
var()	bool				bBoneSpaceRecoil;

/** Recoil Information */
var()	RecoilDef			Recoil;

var()	Vector2D			Aim;

/** variable to play recoil */
var()	transient	bool	bPlayRecoil;
var		transient	bool	bOldPlayRecoil;

/** Internal, evaluates recoil is doing an effect and needs to be applied */
var		transient	bool	bApplyControl;

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

defaultproperties
{
   Recoil=(TimeDuration=0.330000)
   CategoryDesc="Recoil"
   Name="Default__GameSkelCtrl_Recoil"
   ObjectArchetype=SkelControlBase'Engine.Default__SkelControlBase'
}
