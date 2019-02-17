/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleTypeDataBeam extends ParticleModuleTypeDataBase
	native(Particle)
	editinlinenew
	collapsecategories
	hidecategories(Object);

enum EBeamMethod
{
	PEBM_Distance,
    PEBM_EndPoints,
    PEBM_EndPoints_Interpolated,
    PEBM_UserSet_EndPoints,
    PEBM_UserSet_EndPoints_Interpolated
};
var(Beam)					EBeamMethod				BeamMethod;

// Distance is only used if BeamMethod is Distance
var(Beam)					rawdistributionfloat	Distance;
// Default end-point to use...
var(Beam)					rawdistributionvector	EndPoint;
var(Beam)					int						TessellationFactor;
var(Beam)					rawdistributionfloat	EmitterStrength;
var(Beam)					rawdistributionfloat	TargetStrength;

enum EBeamEndPointMethod
{
	PEBEPM_Calculated,
	PEBEPM_Distribution,
	PEBEPM_Distribution_Constant
};
var(Beam)					EBeamEndPointMethod		EndPointMethod;
var(Beam)					rawdistributionvector	EndPointDirection;

// Texture settings
var(Beam)					int						TextureTile;

//@todo. Remove these once finialized - START
var(Beam)					bool					RenderGeometry;
var(Beam)					bool					RenderDirectLine;
var(Beam)					bool					RenderLines;
var(Beam)					bool					RenderTessellation;
//@todo. Remove these once finialized - END

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
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);
	virtual void	PreUpdate(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

	FVector			DetermineEndPointPosition(FParticleEmitterInstance* Owner, FLOAT DeltaTime);
	FVector			DetermineParticlePosition(FParticleEmitterInstance* Owner, FBaseParticle* pkParticle, FLOAT DeltaTime);

	virtual UINT	RequiredBytes(FParticleEmitterInstance* Owner = NULL);

	virtual FParticleEmitterInstance* CreateInstance(UParticleEmitter* InEmitterParent, UParticleSystemComponent* InComponent);

	virtual void	PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   Distance=(Distribution=DistributionDistance,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(0.000000,0.000000,0.000000,0.000000))
   EndPoint=(Distribution=DistributionEndPoint,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000))
   TessellationFactor=1
   EmitterStrength=(Distribution=DistributionEmitterStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1000.000000,1000.000000,1000.000000,1000.000000))
   TargetStrength=(Distribution=DistributionTargetStrength,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=(1000.000000,1000.000000,1000.000000,1000.000000))
   EndPointDirection=(Distribution=DistributionEndPointDirection,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=(0.000000,1.000000,1.000000,0.000000,0.000000,1.000000,0.000000,0.000000))
   RenderGeometry=True
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleTypeDataBeam"
   ObjectArchetype=ParticleModuleTypeDataBase'Engine.Default__ParticleModuleTypeDataBase'
}
