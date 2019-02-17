/*=============================================================================
	ParticleModuleTypeDataMeshPhysX.uc: PhysX Emitter Source.
	Copyright 2007-2008 AGEIA Technologies.
=============================================================================*/

class ParticleModuleTypeDataMeshPhysX extends ParticleModuleTypeDataMesh
	native(Particle)
	dependson(ParticleModuleTypeDataPhysX)
	editinlinenew
	collapsecategories
	hidecategories(Object);

/** Actual wrapper for NxFluid PhsyX SDK object */
var(PhysXEmitter) PhysXParticleSystem PhysXParSys<DisplayName="PhysX Par Sys">;

/** 
Methods for simulating the rotation of small differently 
shaped objects using particles. 
*/ 
enum EPhysXMeshRotationMethod
{
	PMRM_Disabled,
	PMRM_Spherical,
	PMRM_Box,
	PMRM_LongBox,
	PMRM_FlatBox,
	PMRM_Velocity 
};

var(PhysXEmitter) EPhysXMeshRotationMethod PhysXRotationMethod<DisplayName="PhysX Mesh Rotation Method">;
var(PhysXEmitter) float FluidRotationCoefficient;

/** 
Non-exposed reference to emitter instance used for fast rendering. 
Supports combined, instanced rendering for all emitter instances 
sharing this module.
*/
var native pointer RenderInstance {class FPhysXMeshInstance};

/** Parameters for Vertical LOD: See ParticleModuleTypeDataPhysX.uc */
var(PhysXEmitter) PhysXEmitterVerticalLodProperties VerticalLod;

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

cpptext
{
	virtual FParticleEmitterInstance *CreateInstance(UParticleEmitter *InEmitterParent, UParticleSystemComponent *InComponent);
	virtual void SetToSensibleDefaults(UParticleEmitter* Owner);
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void PreEditChange(UProperty* PropertyAboutToChange);
	virtual void FinishDestroy();

 	virtual UBOOL	SupportsSubUV() const	{ return TRUE; }
	virtual UBOOL	IsAMeshEmitter() const	{ return TRUE; }

#if WITH_NOVODEX
	void TryCreateRenderInstance(UParticleEmitter *InEmitterParent, FParticleMeshPhysXEmitterInstance *InSpawnEmitterInstance);
    void TryRemoveRenderInstance(FParticleMeshPhysXEmitterInstance *InSpawnEmitterInstance);
#endif	//#if WITH_NOVODEX

}


defaultproperties
{
   PhysXRotationMethod=PMRM_Spherical
   FluidRotationCoefficient=5.000000
   VerticalLod=(WeightForFifo=1.000000,WeightForSpawnLod=1.000000,SpawnLodRateVsLifeBias=1.000000)
   Name="Default__ParticleModuleTypeDataMeshPhysX"
   ObjectArchetype=ParticleModuleTypeDataMesh'Engine.Default__ParticleModuleTypeDataMesh'
}
