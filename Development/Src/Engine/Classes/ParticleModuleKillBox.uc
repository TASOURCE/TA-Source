/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleKillBox extends ParticleModuleKillBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

/** The lower left corner of the box. */
var(Kill)		rawdistributionvector	LowerLeftCorner;

/** The upper right corner of the box. */
var(Kill)		rawdistributionvector	UpperRightCorner;

/** If TRUE, the box coordinates are in world space./ */
var(Kill)		bool					bAbsolute;

/**
 *	If TRUE, particles INSIDE the box will be killed. 
 *	If FALSE (the default), particles OUTSIDE the box will be killed.
 */
var(Kill)		bool					bKillInside;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);
	virtual void	Render3DPreview(FParticleEmitterInstance* Owner, const FSceneView* View,FPrimitiveDrawInterface* PDI);

}


defaultproperties
{
   LowerLeftCorner=(Distribution=DistributionLowerLeftCorner,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   UpperRightCorner=(Distribution=DistributionUpperRightCorner,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   bUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleKillBox"
   ObjectArchetype=ParticleModuleKillBase'Engine.Default__ParticleModuleKillBase'
}
