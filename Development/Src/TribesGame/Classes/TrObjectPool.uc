/**
 * TrObjectPool
 *
 * This should only be spawned on the client.
 * Contains pools of cached objects.
 */

class TrObjectPool extends Actor;
    
/** Maximum number of tracers **/
const MAX_TRACERS = 20;

struct native TracerCacheInfo
{
	var int Type;

	var class<TrProj_Tracer> TracerClass;

	/** Index of the most recently used tracer */
	var int ListIdx;

	/** List of tracers this weapon uses, for recycling */
	var TrProj_Tracer List[MAX_TRACERS];
};

var TracerCacheInfo m_TracerCache[2]; // this is TrObject.EWeaponTracerType EnumCount

simulated event PreBeginPlay()
{
	CreatePools();
}

simulated event Destroyed()
{
	CleanUpPools();

	Super.Destroyed();
}

simulated final function CreatePools()
{
    CreateTracers();
}

simulated final function CleanUpPools()
{
	CleanupTracers();

    // GC here
	WorldInfo.ForceGarbageCollection();
}

simulated final function CleanupTracers()
{
	local int Idx;
	local int Jdx;

	for( Idx = 0; Idx < 2; ++Idx )  // this is TrObject.EWeaponTracerType EnumCount
	{
		for( Jdx = 0; Jdx < MAX_TRACERS; ++Jdx )
		{
			if( m_TracerCache[Idx].List[Jdx] != none )
			{
				m_TracerCache[Idx].List[Jdx].Destroy();
				m_TracerCache[Idx].List[Jdx] = none;
			}
		}
	}
}

simulated final function CreateTracers()
{
	local int Idx;

	for( Idx = 0; Idx < MAX_TRACERS; ++Idx )
	{
		CreateTracer( WTT_PistolBullet, class'TrProj_Tracer', Idx, TRUE );
	}
    	
    for( Idx = 0; Idx < MAX_TRACERS; ++Idx )
	{
		CreateTracer( WTT_ChainGunBullet, class'TrProj_Tracer', Idx, TRUE );
	}
}


simulated final function CreateTracer( EWeaponTracerType TracerType, class<TrProj_Tracer> TracerClass, int Idx, bool bForceCreate )
{
	local vector SpawnLocation;

	// 262144 is HALF_WORLD_MAX @see engine.h
	SpawnLocation = vect(262144,262144,262144);

	m_TracerCache[TracerType].TracerClass = TracerClass;

	if( bForceCreate == TRUE )
	{
		m_TracerCache[TracerType].List[Idx] = Spawn( TracerClass, self, , SpawnLocation );
		m_TracerCache[TracerType].List[Idx].SetDrawScale3D( TracerClass.default.m_vTracerDrawScale3D );
		m_TracerCache[TracerType].List[Idx].Recycle();
	}
}

simulated final function TrProj_Tracer GetTracer( EWeaponTracerType TracerType, byte ActiveReloadTier, vector SpawnLocation, rotator SpawnRotation )
{
    local TrProj_Tracer Tracer;

    if( ++m_TracerCache[TracerType].ListIdx >= MAX_TRACERS )
	{
		m_TracerCache[TracerType].ListIdx = 0;
	}

    Tracer = m_TracerCache[TracerType].List[m_TracerCache[TracerType].ListIdx];

    // Check to see if we need to spawn a new tracer.
	if( ( Tracer == none ) || ( Tracer.bDeleteMe ) )
	{
		CreateTracer( TracerType, m_TracerCache[TracerType].TracerClass, m_TracerCache[TracerType].ListIdx, TRUE );
		Tracer = m_TracerCache[TracerType].List[m_TracerCache[TracerType].ListIdx];
	}

    Tracer.SetLocation(SpawnLocation);
    Tracer.SetRotation(SpawnRotation);
    Tracer.SetPhysics(PHYS_Projectile);
    
    return Tracer;
}

defaultproperties
{
   CollisionType=COLLIDE_CustomDefault
   Name="Default__TrObjectPool"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
