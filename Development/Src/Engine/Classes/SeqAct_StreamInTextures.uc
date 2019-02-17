/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_StreamInTextures extends SeqAct_Latent
	native(Sequence);

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

/** Whether we should stream in textures based on location or usage. If TRUE, textures surrounding the attached actors will start to stream in. If FALSE, textures used by the attached actors will start to stream in. */
var	deprecated bool	bLocationBased;

/** Number of seconds to force the streaming system to stream in all of the target's textures or enforce bForceMiplevelsToBeResident */
var()	float	Seconds;

/** Is this streaming currently active? */
var const bool	bStreamingActive;

/** Timestamp for when we should stop the forced texture streaming. */
var const float StopTimestamp;

/** Textures surrounding the LocationActors will begin to stream in */
var() array<Object> LocationActors;

/** Array of Materials to set bForceMiplevelsToBeResident on their textures for the duration of this action. */
var() array<MaterialInterface> ForceMaterials;

/** Texture groups that will use extra (higher resolution) mip-levels. */
var(CinematicMipLevels) const TextureGroupContainer	CinematicTextureGroups;

/** Internal bitfield representing the selection in CinematicTextureGropus. */
var native private transient const int		SelectedCinematicTextureGroups;


static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	void Activated();
	UBOOL UpdateOp(FLOAT deltaTime);
	void DeActivated();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void PostLoad();
	virtual void UpdateObject();

	virtual void ApplyForceMipSettings( UBOOL bEnable, FLOAT Duration );

}


defaultproperties
{
   Seconds=15.000000
   InputLinks(0)=(LinkDesc="Start")
   InputLinks(1)=(LinkDesc="Stop")
   VariableLinks(0)=(LinkDesc="Actor")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Location",PropertyName="LocationActors")
   ObjName="Stream In Textures"
   ObjCategory="Actor"
   Name="Default__SeqAct_StreamInTextures"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
