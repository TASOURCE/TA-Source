/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleTypeDataBase extends ParticleModule
	native(Particle)
	editinlinenew
	hidecategories(Object)
	abstract;

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
	virtual FParticleEmitterInstance* CreateInstance(UParticleEmitter* InEmitterParent, UParticleSystemComponent* InComponent);
	virtual void	PreSpawn(FParticleEmitterInstance* Owner, FBaseParticle* Particle)			{};
	virtual void	PreUpdate(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime)		{};
	virtual void	PostUpdate(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime)	{};

	virtual EModuleType	GetModuleType() const							{	return EPMT_TypeData;	}
	virtual UBOOL		SupportsSpecificScreenAlignmentFlags() const	{	return FALSE;			}
	virtual UBOOL		SupportsSubUV() const	{ return FALSE; }
	virtual UBOOL		IsAMeshEmitter() const	{ return FALSE; }

}


defaultproperties
{
   Name="Default__ParticleModuleTypeDataBase"
   ObjectArchetype=ParticleModule'Engine.Default__ParticleModule'
}
