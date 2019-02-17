/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ProjectileFactory extends SeqAct_ActorFactory
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 *	The particle system to spawn as the muzzle flash.
 */
var(MuzzleFlash)	ParticleSystem		PSTemplate;

/** 
 *	The name of the socket to spawn the muzzle flash at.
 *	If set, takes precedence over the bone name.
 */
var(MuzzleFlash)	Name				SocketName;

/** 
 *	The name of the bone to spawn the muzzle flash at.
 *	If SocketName is set, it takes precedence over this.
 */
var(MuzzleFlash)	Name				BoneName;

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 0;
};

cpptext
{
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	virtual UBOOL UpdateOp(FLOAT DeltaTime);
	virtual void DeActivated();

	virtual void Spawned(UObject *NewSpawn);

}


defaultproperties
{
   SpawnDelay=0.000000
   InputLinks(0)=(LinkDesc="Spawn Projectile")
   InputLinks(1)=()
   InputLinks(2)=()
   InputLinks(3)=()
   ObjName="Projectile Factory"
   Name="Default__SeqAct_ProjectileFactory"
   ObjectArchetype=SeqAct_ActorFactory'Engine.Default__SeqAct_ActorFactory'
}
