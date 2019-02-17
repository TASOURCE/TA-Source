/**
 *	ParticleModuleUberLTISIVCLILIRSSBLIRR
 *
 *	Uber-module replacing the following classes:
 *		LT   - Lifetime
 *		IS   - Initial Size
 *		IV   - Initial Velocity
 *		CL   - Color over Life
 *      IL   - Initial Location
 *		IR   - Initial Rotation
 *		SSBL - Scale Size By Life
 *		IRR  - Initial Rotation Rate
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class ParticleModuleUberLTISIVCLILIRSSBLIRR extends ParticleModuleUberBase
	native(Particle)
	editinlinenew
	collapsecategories
	hidecategories(Object);

//------------------------------------------------------------------------------------------------
// Members
//------------------------------------------------------------------------------------------------
/** Lifetime - Gives the lifetime of the particles												*/
var(Lifetime)	export noclear		rawdistributionfloat		Lifetime;	

/** Size - Gives the size of the particles														*/
var(Size)		export noclear		rawdistributionvector		StartSize;

/** StartVelociy - Gives the start velocity of the particles									*/
var(Velocity)	export noclear		rawdistributionvector		StartVelocity;
/** StartRadialVelociy - Gives the start radial velocity of the particles						*/
var(Velocity)	export noclear		rawdistributionfloat		StartVelocityRadial;

/** ColorOverLife - Gives the color to apply to the particles									*/
var(Color)		export noclear		rawdistributionvector		ColorOverLife;
/** AlphaOverLife - Gives the alpha to apply to the particles									*/
var(Color)		export noclear		rawdistributionfloat		AlphaOverLife;

/** StartLocation - Gives the start location of particles										*/
var(Location)	export noclear		rawdistributionvector		StartLocation;

/** StartRotation - Gives the rotation of particles in turns (1 = 360 degrees)					*/
var(Rotation)	export noclear		rawdistributionfloat		StartRotation;

/** SizeLifeMultiplier - Size scale factor														*/
var(Size)		export noclear		rawdistributionvector		SizeLifeMultiplier;
/** MultiplyX - If TRUE, scale along the X size axis											*/
var(Size)							bool					SizeMultiplyX;
/** MultiplyY - If TRUE, scale along the Y size axis											*/
var(Size)							bool					SizeMultiplyY;
/** MultiplyZ - If TRUE, scale along the Z size axis											*/
var(Size)							bool					SizeMultiplyZ;

/** StartRotationRate - Gives the rotation rate of particles in turns per second				*/
var(Rotation)	export noclear		rawdistributionfloat		StartRotationRate;

//------------------------------------------------------------------------------------------------
// C++ Text
//------------------------------------------------------------------------------------------------
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

//------------------------------------------------------------------------------------------------
// Default Properties
//------------------------------------------------------------------------------------------------

cpptext
{
	/** Copy the contents of the modules to the UberModule								*/
	virtual	UBOOL				ConvertToUberModule(UParticleEmitter* InputEmitter);

	/** Spawn - called when spawning particles											*/
	virtual void				Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);
	/** Update - called when updating particles											*/
	virtual void				Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

}


defaultproperties
{
   Lifetime=(Distribution=DistributionLifetime,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1.000000,1.000000,1.000000,1.000000))
   StartSize=(Distribution=DistributionStartSize,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   StartVelocity=(Distribution=DistributionStartVelocity,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=(0.000000,10.000000,0.000000,0.000000,0.000000,0.000000,0.000000,10.000000,0.000000,0.000000,0.000000,0.000000,0.000000,10.000000))
   StartVelocityRadial=(Distribution=DistributionStartVelocityRadial,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   ColorOverLife=(Distribution=DistributionColorOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   AlphaOverLife=(Distribution=DistributionAlphaOverLife,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(255.899994,255.899994,255.899994,255.899994))
   StartLocation=(Distribution=DistributionStartLocation,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   StartRotation=(Distribution=DistributionStartRotation,Op=2,LookupTableNumElements=2,LookupTableChunkSize=2,LookupTable=(0.000000,1.000000,0.000000,1.000000,0.000000,1.000000))
   SizeLifeMultiplier=(Distribution=DistributionLifeMultiplier,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000))
   SizeMultiplyX=True
   SizeMultiplyY=True
   SizeMultiplyZ=True
   StartRotationRate=(Distribution=DistributionStartRotationRate,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   RequiredModules(0)="ParticleModuleLifetime"
   RequiredModules(1)="ParticleModuleSize"
   RequiredModules(2)="ParticleModuleVelocity"
   RequiredModules(3)="ParticleModuleColorOverLife"
   RequiredModules(4)="ParticleModuleLocation"
   RequiredModules(5)="ParticleModuleRotation"
   RequiredModules(6)="ParticleModuleSizeMultiplyLife"
   RequiredModules(7)="ParticleModuleRotationRate"
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleUberLTISIVCLILIRSSBLIRR"
   ObjectArchetype=ParticleModuleUberBase'Engine.Default__ParticleModuleUberBase'
}
