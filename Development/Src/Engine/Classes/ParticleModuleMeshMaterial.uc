/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleMeshMaterial extends ParticleModuleMaterialBase
	native(Particle)
	editinlinenew
	hidecategories(Object);

//=============================================================================
//	Properties
//=============================================================================
/** The array of materials to apply to the mesh particles. */
var(MeshMaterials)	array<MaterialInterface>		MeshMaterials;

//=============================================================================
//	C++
//=============================================================================
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
// (cpptext)
// (cpptext)
// (cpptext)

//=============================================================================
//	Default properties
//=============================================================================

cpptext
{
	/**
	 *	Called on a particle that is freshly spawned by the emitter.
	 *	
	 *	@param	Owner		The FParticleEmitterInstance that spawned the particle.
	 *	@param	Offset		The modules offset into the data payload of the particle.
	 *	@param	SpawnTime	The time of the spawn.
	 */
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);

	/**
	 *	Returns the number of bytes the module requires in the emitters 'per-instance' data block.
	 *	
	 *	@param	Owner		The FParticleEmitterInstance that 'owns' the particle.
	 *
	 *	@return UINT		The number fo bytes the module needs per emitter instance.
	 */
	virtual UINT	RequiredBytesPerInstance(FParticleEmitterInstance* Owner = NULL);

}


defaultproperties
{
   bSpawnModule=True
   bUpdateModule=True
   Name="Default__ParticleModuleMeshMaterial"
   ObjectArchetype=ParticleModuleMaterialBase'Engine.Default__ParticleModuleMaterialBase'
}
