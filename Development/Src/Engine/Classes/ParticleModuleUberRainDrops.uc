/**
 *	ParticleModuleUberRainDrops
 *
 *	Uber-module replacing the following classes:
 *		LT  - Lifetime
 *		IS  - Initial Size
 *		IV  - Initial Velocity
 *		COL - Color Over Life
 *		PC	- Primitive Cylinder (optional)
 *		IL	- Initial Location
 *
 *	Intended for use in the Rain particle system.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class ParticleModuleUberRainDrops extends ParticleModuleUberBase
	native(Particle)
	editinlinenew
	collapsecategories
	hidecategories(Object);

//*-----------------------------------------------------------------------------*/
/** Lifetime Module Members														*/
//*-----------------------------------------------------------------------------*/
var(Lifetime)	float				LifetimeMin;
var(Lifetime)	float				LifetimeMax;

//*-----------------------------------------------------------------------------*/
/** Size Module Members															*/
//*-----------------------------------------------------------------------------*/
var(Size)		vector				StartSizeMin;
var(Size)		vector				StartSizeMax;

//*-----------------------------------------------------------------------------*/
/** Velocity Module Members														*/
//*-----------------------------------------------------------------------------*/
var(Velocity)	vector				StartVelocityMin;
var(Velocity)	vector				StartVelocityMax;
var(Velocity)	float				StartVelocityRadialMin;
var(Velocity)	float				StartVelocityRadialMax;

//*-----------------------------------------------------------------------------*/
/** ColorOverLife Module Members												*/
//*-----------------------------------------------------------------------------*/
var(Color)		vector				ColorOverLife;
var(Color)		float				AlphaOverLife;

//*-----------------------------------------------------------------------------*/
/** PrimitiveCylinder Module Members											*/
//*-----------------------------------------------------------------------------*/
var(Location)	bool				bIsUsingCylinder;
var(Location)	bool				bPositive_X;
var(Location)	bool				bPositive_Y;
var(Location)	bool				bPositive_Z;
var(Location)	bool				bNegative_X;
var(Location)	bool				bNegative_Y;
var(Location)	bool				bNegative_Z;
var(Location)	bool				bSurfaceOnly;
var(Location)	bool				bVelocity;
var(Location)	float				PC_VelocityScale;
var(Location)	vector				PC_StartLocation;
var(Location)	bool				bRadialVelocity;
var(Location)	float				PC_StartRadius;
var(Location)	float				PC_StartHeight;
var(Location)	CylinderHeightAxis	PC_HeightAxis;

//*-----------------------------------------------------------------------------*/
/** Location Module Members														*/
//*-----------------------------------------------------------------------------*/
var(Location)		vector					StartLocationMin;
var(Location)		vector					StartLocationMax;

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

//*-----------------------------------------------------------------------------*/
//*-----------------------------------------------------------------------------*/

cpptext
{
	virtual void	PostLoad();
	virtual void	Spawn(FParticleEmitterInstance* Owner, INT Offset, FLOAT SpawnTime);
	virtual void	Update(FParticleEmitterInstance* Owner, INT Offset, FLOAT DeltaTime);

	virtual void	Render3DPreview(FParticleEmitterInstance* Owner, const FSceneView* View,FPrimitiveDrawInterface* PDI);

	void	DetermineUnitDirection(FParticleEmitterInstance* Owner, FVector& vUnitDir);

	/** Used by derived classes to indicate they could be used on the given emitter.	*/
	virtual	UBOOL				IsCompatible(UParticleEmitter* InputEmitter);
	
	/** Copy the contents of the modules to the UberModule								*/
	virtual	UBOOL				ConvertToUberModule(UParticleEmitter* InputEmitter);

}


defaultproperties
{
   LifetimeMin=1.000000
   LifetimeMax=1.000000
   StartSizeMin=(X=1.000000,Y=1.000000,Z=1.000000)
   StartSizeMax=(X=1.000000,Y=1.000000,Z=1.000000)
   StartVelocityMin=(X=1.000000,Y=1.000000,Z=1.000000)
   StartVelocityMax=(X=1.000000,Y=1.000000,Z=1.000000)
   ColorOverLife=(X=255.899994,Y=255.899994,Z=255.899994)
   AlphaOverLife=255.899994
   bPositive_X=True
   bPositive_Y=True
   bPositive_Z=True
   bNegative_X=True
   bNegative_Y=True
   bNegative_Z=True
   bRadialVelocity=True
   PC_VelocityScale=1.000000
   PC_StartRadius=50.000000
   PC_StartHeight=50.000000
   PC_HeightAxis=PMLPC_HEIGHTAXIS_Z
   bSpawnModule=True
   bUpdateModule=True
   bSupported3DDrawMode=True
   Name="Default__ParticleModuleUberRainDrops"
   ObjectArchetype=ParticleModuleUberBase'Engine.Default__ParticleModuleUberBase'
}
