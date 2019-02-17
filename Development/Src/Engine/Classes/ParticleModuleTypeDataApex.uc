class ParticleModuleTypeDataApex extends ParticleModuleTypeDataBase
	native(Particle)
	editinlinenew
	collapsecategories
	hidecategories(Object);

// Embedded IOFX asset...
var ApexGenericAsset ApexIOFX;
var ApexGenericAsset ApexEmitter;

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
	
	void ConditionalInitialize(void);

}


defaultproperties
{
   ApexIOFX=ApexGenericAsset'Engine.Default__ParticleModuleTypeDataApex:ApexGenericAsset0'
   ApexEmitter=ApexGenericAsset'Engine.Default__ParticleModuleTypeDataApex:ApexGenericAsset1'
   Name="Default__ParticleModuleTypeDataApex"
   ObjectArchetype=ParticleModuleTypeDataBase'Engine.Default__ParticleModuleTypeDataBase'
}
