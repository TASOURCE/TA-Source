/**
 * Light environment class used by particle systems.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleLightEnvironmentComponent extends DynamicLightEnvironmentComponent
	native(Light);

/** Reference count used to know when this light environment can be detached and cleaned up since it may be shared by multiple particle system components. */
var transient protected{protected} const int ReferenceCount;

/** 
 * Whether this DLE can be used with components of the same actor.
 * This should be set to FALSE when attaching a UParticleSystemComponent on a pool actor.
 */
var bool bAllowDLESharing;

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
	inline void AddRef() { ReferenceCount++; }
	inline void RemoveRef() 
	{ 
		check(ReferenceCount > 0);
		ReferenceCount--; 
	}
	inline INT GetRefCount() const { return ReferenceCount; }

	virtual void UpdateLight(const ULightComponent* Light);

	// UActorComponent interface.
	virtual void Tick(FLOAT DeltaTime);

}


defaultproperties
{
   InvisibleUpdateTime=10.000000
   MinTimeBetweenFullUpdates=3.000000
   bForceCompositeAllLights=True
   bAffectedBySmallDynamicLights=False
   BoundsMethod=DLEB_ActiveComponents
   Name="Default__ParticleLightEnvironmentComponent"
   ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
}
