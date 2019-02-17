/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleEventBase extends ParticleModule
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

cpptext
{
	/**
	 *	Retrieve the ModuleType of this module.
	 *
	 *	@return	EModuleType		The type of module this is.
	 */
	virtual EModuleType	GetModuleType() const	{	return EPMT_Event;	}

}


defaultproperties
{
   Name="Default__ParticleModuleEventBase"
   ObjectArchetype=ParticleModule'Engine.Default__ParticleModule'
}
