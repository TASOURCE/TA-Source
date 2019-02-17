/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKSkeletalMeshComponent extends SkeletalMeshComponent
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** This changes the FOV used for rendering the skeletal mesh component. A value of 0 means to use the default. */
var() const float FOV;

/** whether textures are currently forced loaded */
var		bool		bForceLoadTextures;

/** when to clear forced streaming */
var		float		ClearStreamingTime;

/**
  * Force streamed textures to be loaded.  Used to get MIPS streamed in before weapon comes up
  * @PARAM bForcePreload if true causes streamed textures to be force loaded, if false, clears force loading
  */
simulated event PreloadTextures(bool bForcePreload, float ClearTime)
{
	local int idx;

	bForceLoadTextures = bForcePreload;
	ClearStreamingTime = ClearTime;

	for (Idx = 0; Idx < Materials.Length; Idx++)
	{
		if (Materials[Idx] != None)
		{
			Materials[Idx].SetForceMipLevelsToBeResident(true, bForcePreload, -1.0f);
		}
	}
}

/** changes the value of FOV */
native final function SetFOV(float NewFOV);

defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__UDKSkeletalMeshComponent"
   ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
}
