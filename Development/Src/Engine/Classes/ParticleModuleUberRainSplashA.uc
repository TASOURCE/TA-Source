/**
 *	ParticleModuleUberRainSplashA
 *
 *	Uber-module replacing the following classes:
 *		LT  - Lifetime
 *		IS  - Initial Size
 *		COL - Color Over Life
 *
 *	Intended for use in the Rain particle system.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class ParticleModuleUberRainSplashA extends ParticleModuleUberBase
	native(Particle)
	editinlinenew
	collapsecategories
	hidecategories(Object);

//*-----------------------------------------------------------------------------*/
/** Lifetime Module Members														*/
//*-----------------------------------------------------------------------------*/
var(Lifetime)	rawdistributionfloat		Lifetime;

//*-----------------------------------------------------------------------------*/
/** Size Module Members															*/
//*-----------------------------------------------------------------------------*/
var(Size)		rawdistributionvector		StartSize;

//*-----------------------------------------------------------------------------*/
/** MeshRotation Module Members													*/
//*-----------------------------------------------------------------------------*/
var(Rotation)	rawdistributionvector		StartRotation;
var(Rotation)	bool						bInheritParent;

//*-----------------------------------------------------------------------------*/
/** SizeByLife Module Members													*/
//*-----------------------------------------------------------------------------*/
var(Size)		rawdistributionvector		LifeMultiplier;
var(Size)		bool						MultiplyX;
var(Size)		bool						MultiplyY;
var(Size)		bool						MultiplyZ;

//*-----------------------------------------------------------------------------*/
/** ColorOverLife Module Members												*/
//*-----------------------------------------------------------------------------*/
var(Color)		rawdistributionvector		ColorOverLife;
var(Color)		rawdistributionfloat		AlphaOverLife;

//*-----------------------------------------------------------------------------*/
//*-----------------------------------------------------------------------------*/
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

//*-----------------------------------------------------------------------------*/
//*-----------------------------------------------------------------------------*/

cpptext
{
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

	/** Used by derived classes to indicate they could be used on the given emitter.	*/
	virtual	UBOOL	IsCompatible(UParticleEmitter* InputEmitter);
	
	/** Copy the contents of the modules to the UberModule								*/
	virtual	UBOOL	ConvertToUberModule(UParticleEmitter* InputEmitter);

	/**
	 *	Return TRUE if this module impacts rotation of Mesh emitters
	 *	@return	UBOOL		TRUE if the module impacts mesh emitter rotation
	 */
	virtual UBOOL	TouchesMeshRotation() const	{ return TRUE; }

}


defaultproperties
{
   Lifetime=(Distribution=DistributionLifetime,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   StartSize=(Distribution=DistributionStartSize,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   StartRotation=(Distribution=DistributionStartRotation,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=(0.000000,360.000000,0.000000,0.000000,0.000000,360.000000,360.000000,360.000000,0.000000,0.000000,0.000000,360.000000,360.000000,360.000000))
   MultiplyX=True
   MultiplyY=True
   MultiplyZ=True
   LifeMultiplier=(Distribution=DistributionLifeMultiplier,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   ColorOverLife=(Distribution=DistributionColorOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   AlphaOverLife=(Distribution=DistributionAlphaOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(255.899994,255.899994,255.899994,255.899994))
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleUberRainSplashA"
   ObjectArchetype=ParticleModuleUberBase'Engine.Default__ParticleModuleUberBase'
}
