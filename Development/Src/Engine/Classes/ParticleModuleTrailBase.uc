/**
 *	ParticleModuleTrailBase
 *	Provides the base class for Trail emitter modules
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class ParticleModuleTrailBase extends ParticleModule
	native(Particle)
	editinlinenew
	hidecategories(Object)
	abstract;

//*************************************************************************************************
// C++ Text
//*************************************************************************************************
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

//*************************************************************************************************
// Default properties
//*************************************************************************************************

cpptext
{
	virtual EModuleType	GetModuleType() const	{	return EPMT_Trail;	}

}


defaultproperties
{
   Name="Default__ParticleModuleTrailBase"
   ObjectArchetype=ParticleModule'Engine.Default__ParticleModule'
}
