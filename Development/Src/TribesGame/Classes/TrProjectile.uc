/**
 * 
 */
class TrProjectile extends UTProjectile
    native
    config(engine);

/* Mesh for projectile */
var()	PrimitiveComponent  m_ProjMesh;
var class<TrDeployable>     m_SpawnedDeployableClass;

/** Damage radius in the XY-plane to limit ourself to */
var bool m_bLimitXYDamageCheck;
var float m_fXYDamageRadius;

/** Amount of XY-plane to inherit. */
var float m_fProjInheritVelocityPct;

/** Amount of Z to inherit. */
var float m_fProjInheritVelocityPctZ;

/** Max inheritence. */
var float m_fMaxProjInheritPct;

/** Utiliity for displaying the projectile's radius. */
var() config bool m_bDebugProjectileRadius;

var	DynamicLightEnvironmentComponent	m_ProjLightEnvironment;

var int m_nPerPlayerMaxDeployed;

/** 'Fast Projectile' meaning we lag its shutdown a bit so that clients can spawn close & fast shots. */
var bool m_bFastProjectile;

/** Has this projectile bounced? */
var bool    m_bHasBounced;

/** How much velocity the projectile loses with each bounce. */
var float   m_fBounceDampingPercent;

/** Damage multiplier for when a direct hit has been received. */
var float   m_fDirectHitMultiplier;

/** How much time to fade the ambient sound in. */
var float   m_fAmbientSoundFadeIn;

/** How much time to fade the ambient sound out. */
var float   m_fAmbientSoundFadeOut;

/** Should we orient to wall. */
var bool	m_bOrientToWall;

/** Multiplier on momentum for the instigator if they shoot themself. */
var float m_fInstigatorMomentumTransferMultiplier;

/** A constant scalar for extra Z momentum applied to instigator. */
var float m_fInstigatorExtraZMomentum;

/** Is exploding against non-static targets controlled by the authority? */
var bool m_bAuthoritativeExploding;

/** Should this projectile be tethered between server and autonomous client? */
var bool m_bTether;

/** ID for tethering this projectile between server and client. */
var repnotify int r_nTetherId;

/** The projectile that is owned by the server and is tethered to this projectile. */
var transient TrProjectile c_ParentTetheredProjectile;
var transient TrProjectile c_ChildTetheredProjectile;

/** How much are we tweened (influenced) by the tethered projectile? */
var transient float m_fCurrentTetherTweenAmount;

/** Speed of tweening to tethered projectile. */
var float m_fTweenSpeed;

/** Which equip point this projectile came from on an owning pawn. */
var TR_EQUIP_POINT m_SpawnedEquipPoint;

/** 
 *  Speed of the projectile when it is only on the client and waiting for
 *  a server tether.
 */
var float m_fClientSimulatedSpeed;

var vector m_vAccelDirection;

/** The location where I was spawned */
var repnotify vector r_vSpawnLocation;

/** Should this projectile be simulated with a client tracer instead on autonomous clients? */
var bool m_bSimulateAutonomousProjectiles;

/** Does this projectile behave as a bullet? */
var bool m_bIsBullet;

/** Array of explosion sounds depending on hit material */
var array<MaterialImpactEffect> ImpactEffects;

/** The min/max lifespan allowed - for randomization */
var float m_fMaxLifespan;
var float m_fMinLifespan;

/** The minimum distance at which projectiles are always net relevant */
var float m_fAlwaysRelevantDistanceSquared;

/** Autonomous client only, spawned from device. */
var transient TrDevice SpawnedFromDevice;

native function bool IsBlockedByBlocker(Actor DamageInstigator, Actor Target, optional Actor OriginActor, optional bool CheckWorldGeometry = true, optional vector AltOriginLocation);
native function OrientToSlope(Vector HitNormal);
native static function vector CalculateHitLocation(Actor Shooter, vector ShotDirection, vector ShotLocation, float ClampedMaxSpeed);

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		r_vSpawnLocation;
	if (bNetDirty && bNetOwner && Role == ROLE_Authority)
		r_nTetherId;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event ReplicatedEvent(name VarName)
{   
    if(VarName == 'r_nTetherId')
    {
        ClientReceivedProjectileToTether();
        return;
    }
	else if (VarName == 'r_vSpawnLocation')
	{
		ClientCheckFastSpawnExplode();
		return;
	}

    super.ReplicatedEvent(VarName);
}

event PreBeginPlay()
{
	local TrPawn aPawn;

	aPawn = TrPawn(Instigator);
	if (aPawn != None && aPawn.DrivenWeaponPawn.BaseVehicle != none)
	{
		InstigatorBaseVehicle = aPawn.DrivenWeaponPawn.BaseVehicle;
	}
	else if (Instigator != none && Instigator.IsA('Vehicle'))
	{
		InstigatorBaseVehicle = Vehicle(Instigator);
	}

	Super.PreBeginPlay();
}

function ExplodeFromTimeLimit()
{
	Explode(Location, vect(0,0,1));
}

simulated function PostBeginPlay()
{
	local DrawSphereComponent CheckRadiusDebugComponent, DamageRadiusDebugComponent;
	local TrPlayerController TrPC;

	// force ambient sound if not vehicle game mode
	bImportantAmbientSound = !WorldInfo.bDropDetail;

	if (Role == ROLE_Authority)
	{
		r_vSpawnLocation = Location;
		bNetDirty = true;

		// If on console, init wide check
		if ( !bWideCheck )
		{
			CheckRadius *= GlobalCheckRadiusTweak;
		}
		bWideCheck = bWideCheck || ((CheckRadius > 0) && (Instigator != None) && (UTPlayerController(Instigator.Controller) != None) && UTPlayerController(Instigator.Controller).AimingHelp(false));
	}

	Super(UDKProjectile).PostBeginPlay();

	if ( bDeleteMe || bShuttingDown)
		return;

	// Set its Ambient Sound
	if (AmbientSound != None && WorldInfo.NetMode != NM_DedicatedServer && !bSuppressSounds)
	{
		//if ( bImportantAmbientSound || (!WorldInfo.bDropDetail && (WorldInfo.GetDetailMode() != DM_Low)) )
		//{
			AmbientComponent = CreateAudioComponent(AmbientSound, false, true);
			if ( AmbientComponent != None )
			{
				AmbientComponent.FadeIn(m_fAmbientSoundFadeIn, 1.0f);
				AmbientComponent.bShouldRemainActiveIfDropped = true;
			}
		//}
	}

	// Spawn any effects needed for flight
	if( WorldInfo.NetMode != NM_DedicatedServer && ProjFlightTemplate != none )
	{
		SpawnFlightEffects();
	}

	// shorter lifespan on mobile devices
	if (WorldInfo.IsConsoleBuild(CONSOLE_Mobile) )
	{
		LifeSpan = FMin(LifeSpan, 0.5*default.LifeSpan);
	}

	// Utility for artists to see the explosion radius of this projectile.
	if( m_bDebugProjectileRadius )
	{
		CheckRadiusDebugComponent = new class'DrawSphereComponent';
		CheckRadiusDebugComponent.SphereRadius = CheckRadius;
		CheckRadiusDebugComponent.SetHidden(FALSE);
		CheckRadiusDebugComponent.SphereColor = MakeColor(255,0,0);
		AttachComponent(CheckRadiusDebugComponent);

		DamageRadiusDebugComponent = new class'DrawSphereComponent';
		DamageRadiusDebugComponent.SphereRadius = DamageRadius;
		DamageRadiusDebugComponent.SetHidden(FALSE);
		DamageRadiusDebugComponent.SphereColor = MakeColor(0,0,255);
		AttachComponent(DamageRadiusDebugComponent);
	}

	if( WorldInfo.NetMode == NM_Client && Instigator != none )
	{
		TrPC = TrPlayerController(Instigator.Controller);
		if( TrPC != none && Instigator.Controller == TrPC )
		{
			if( TrPC.m_bAllowSimulatedProjectiles && Role == ROLE_SimulatedProxy )
			{
				// Don't draw the replicated projectile.
				SetHidden(true);
			}
		}
	}
}

simulated function ClientReceivedProjectileToTether()
{
	local TrPlayerController TrPC;
	local ActorComponent ComponentIt;
	local MeshComponent MC;
	local LightComponent LC;
	local ParticleSystemComponent PSC;

	// Find the simulated projectile to tether
	TrPC = TrPlayerController(Instigator.Controller);
	if( TrPC != none )
	{
		// Tether the projectiles together.
		c_ChildTetheredProjectile = TrPC.TetherProjectile(self); // 'Server's' projectile is self.
		if( c_ChildTetheredProjectile != none )
		{
			c_ChildTetheredProjectile.c_ParentTetheredProjectile = self;
			
			// Hide everything about this projectile now that it's tethered.
			foreach ComponentList(class'ActorComponent',ComponentIt)
			{
				MC = MeshComponent(ComponentIt);
				LC = LightComponent(ComponentIt);
				PSC = ParticleSystemComponent(ComponentIt);
				if( MC != none )
				{
					MC.SetHidden(true);
					
				}
				else if( LC != none )
				{
					LC.SetEnabled(false);
				}
				else if( PSC != none )
				{
					DetachComponent(PSC);
				}
			
			}
		}
		else
		{
			// Something went wrong. We recevied a projectile to tether, but don't have one stored!
			;
		}
	}
}

simulated event CreateProjectileLight()
{
	if ( WorldInfo.bDropDetail )
		return;

	AttachComponent(ProjectileLight);
}

//
//	Make the projectile a dud and explode it
//
function DetonateObsolete(optional bool bDetonateFromAOE = false)
{
	Damage=0;
	Explode(Location, vect(0,0,1));	
}

//
//	limit the number of projectiles of this type that can be deployed at once by the same controller
//
simulated function DestroyOldestOverLimit()
{
	local Actor aActor;
	local int deployedCount, ableToDeployCount, MaxDeployedLimit;
	local TrProjectile firstFound, aProjectile;

	MaxDeployedLimit = GetMaxDeployedLimit();
	ableToDeployCount = MaxDeployedLimit;
	if (ableToDeployCount == 0) return;

	deployedCount = 0;

	foreach DynamicActors( default.class, aActor )
	{
		aProjectile = TrProjectile(aActor);

		// Make sure the projectile isn't shutting down.
		if (aProjectile != self && aProjectile.InstigatorController == InstigatorController && !aProjectile.bShuttingDown)
		{
			if (deployedCount==0)
				firstFound=aProjectile;

			deployedCount++;
		}
    }

	//`log("MINES:  found "@deployedCount@" of this type ("@m_nPerPlayerMaxDeployed@"allowed)");

	if (deployedCount >= MaxDeployedLimit)
	{
		firstFound.DetonateObsolete();
	}
}

simulated function int GetMaxDeployedLimit()
{
	local int defaultDeploy;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	defaultDeploy = default.m_nPerPlayerMaxDeployed;

	if( InstigatorController != none && defaultDeploy > 0 )
	{
		TrPRI = TrPlayerReplicationInfo(InstigatorController.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				return defaultDeploy + VM.m_nExtraMinesOutBuff;
			}
		}
	}

	return defaultDeploy;
}

/*
 * Add effects of the instigator's frame of reference to the projectile launch
 */
singular function Init( Vector Direction )
{
	;
	InitProjectile(Direction);
}

simulated function InitProjectile(vector Direction, optional class<TrProjectile> ClassToInherit)
{
	SetRotation(rotator(Direction));

	// Client side predicted tracers will copy certain properties from the 'real' projectile.
	if( ClassToInherit != none )
	{
		Speed = 1;
		m_fMaxProjInheritPct = ClassToInherit.default.m_fMaxProjInheritPct;
		m_fProjInheritVelocityPct = ClassToInherit.default.m_fProjInheritVelocityPct;
		m_fProjInheritVelocityPctZ = ClassToInherit.default.m_fProjInheritVelocityPctZ;
		MaxSpeed = ClassToInherit.default.MaxSpeed;
		LifeSpan = ClassToInherit.default.LifeSpan;
		ProjFlightTemplate = ClassToInherit.default.ProjFlightTemplate;
		ProjExplosionTemplate = ClassToInherit.default.ProjExplosionTemplate;
		ExplosionDecal = ClassToInherit.default.ExplosionDecal;
		ExplosionSound = ClassToInherit.default.ExplosionSound;
		ImpactSound = ClassToInherit.default.ImpactSound;
		SpawnFlightEffects();
	}

	Velocity = Speed * Direction;
	Velocity.Z += TossZ;
	
	if( m_bTether && Role == ROLE_Authority && WorldInfo.NetMode == NM_Client )
	{
		Velocity = normal(Velocity) * m_fClientSimulatedSpeed;
	}

	// Generate a random lifespan.
	if (Role == ROLE_Authority && m_fMaxLifespan > 0.0f && m_fMinLifespan != m_fMaxLifespan)
	{
		SetTimer(RandRange(m_fMinLifespan, m_fMaxLifespan), false, 'ExplodeFromTimeLimit');
	}

	m_vAccelDirection = Normal(Velocity);

	ApplyInheritance(Direction);

	Acceleration = AccelRate * m_vAccelDirection;
}

simulated function ApplyInheritance(Vector ProjectileDir)
{
	local float InheritPct, ForwardPct;

	if (Instigator != none)
	{
		ForwardPct = FMin(normal(Instigator.Velocity) dot normal(ProjectileDir), m_fMaxProjInheritPct);
		InheritPct = FMax(m_fProjInheritVelocityPct, ForwardPct);

		Velocity.X += InheritPct * Instigator.Velocity.X;
		Velocity.Y += InheritPct * Instigator.Velocity.Y;

		// ML: Hack! There is a bug in skiing where if a pawn skied down a slope and onto a relatively flat surface
		// the velocity in Z is pushing towards the ground and can make shots inherit this Z.
		// If on a flattish surface and skiing, then don't inherit Z.
		if( Instigator.Physics == PHYS_Skiing && Instigator.Floor.Z > 0.9 )
		{
			// Don't do any Z inheritence.
		}
		else
		{
			Velocity.Z += m_fProjInheritVelocityPctZ * Instigator.Velocity.Z;
		}
	}
}

simulated function ClientCheckFastSpawnExplode()
{
	local Actor HitActor;
	local vector HitLocation, HitNormal;

	// We only check for a spawn explode on fast projectiles.
	if (!m_bFastProjectile)
	{
		return;
	}

	// Determine if something stationary got in the way between us and the spawn (skip things that move).
	HitNormal = Normal(Velocity * -1);
	HitActor = Trace(HitLocation, HitNormal, Location, r_vSpawnLocation, true, , , TRACEFLAG_Bullet);

	// We had to have hit something, it must stop projectiles, and it can't be movable.
	if (HitActor != none && !HitActor.bMovable && HitActor.StopsProjectile(self))
	{
		SpawnExplosionEffects(HitLocation, HitNormal);
		Shutdown();
	}
}

simulated function SpawnExplosionEffects(vector HitLocation, vector HitNormal)
{
	local vector LightLoc, LightHitLocation, LightHitNormal;
	local ParticleSystemComponent ProjExplosion;
	local Actor EffectAttachActor;
	local MaterialInstanceTimeVarying MITV_Decal;
	local Actor HitActor;
	local SoundCue NewExplosionSound;
	local TraceHitInfo HitInfo;
	local vector NewHitLoc, NewHitNormal;

	if( c_ChildTetheredProjectile != none )
	{
		if( !c_ChildTetheredProjectile.bSuppressExplosionFX )
		{
			// The server's tethered projectile exploded, so explode this one too
			c_ChildTetheredProjectile.SpawnExplosionEffects(HitLocation, HitNormal);
		}
		bSuppressExplosionFX = true;
		return;
	}

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		// Added usage of new hit location and normal based off of the object hit.
		HitActor = Trace(NewHitLoc, NewHitNormal, (HitLocation - (HitNormal * 32)), HitLocation + (HitNormal * 32), true,, HitInfo, TRACEFLAG_Bullet);

		if (ProjectileLight != None)
		{
			DetachComponent(ProjectileLight);
			ProjectileLight = None;
		}
		if (ProjExplosionTemplate != None && EffectIsRelevant(Location, false, MaxEffectDistance, DamageRadius * 1.5f))
		{
			EffectAttachActor = (bAttachExplosionToVehicles || (UTVehicle(ImpactedActor) == None)) ? ImpactedActor : None;

			// Bullet projectiles rotate the emitter.
			if (m_bIsBullet)
			{
				ProjExplosion = WorldInfo.MyEmitterPool.SpawnEmitter(ProjExplosionTemplate, HitLocation, rotator(HitNormal));
			}
			else
			{
				ProjExplosion = WorldInfo.MyEmitterPool.SpawnEmitter(ProjExplosionTemplate, HitLocation);
			}

			SetExplosionEffectParameters(ProjExplosion);

			// Sean wants to drop detail on the light only.
			if ( !WorldInfo.bDropDetail && ExplosionLightClass != None && ShouldSpawnExplosionLight(HitLocation, HitNormal) )
			{
				if (Trace(LightHitLocation, LightHitNormal, HitLocation + (0.25 * ExplosionLightClass.default.TimeShift[0].Radius * HitNormal), HitLocation, false) == None)
				{
					LightLoc = HitLocation + (0.25 * ExplosionLightClass.default.TimeShift[0].Radius * (vect(1,0,0) >> ProjExplosion.Rotation));
				}
				else
				{
					LightLoc = HitLocation + (0.5 * VSize(HitLocation - LightHitLocation) * (vect(1,0,0) >> ProjExplosion.Rotation));
				}

				UDKEmitterPool(WorldInfo.MyEmitterPool).SpawnExplosionLight(ExplosionLightClass, LightLoc, EffectAttachActor);
			}

			// this code is mostly duplicated in:  UTGib, UTProjectile, UTVehicle, UTWeaponAttachment be aware when updating
			if (ExplosionDecal != None && Pawn(ImpactedActor) == None && HitActor != none )
			{
				if( MaterialInstanceTimeVarying(ExplosionDecal) != none )
				{
					MITV_Decal = new(self) class'MaterialInstanceTimeVarying';
					MITV_Decal.SetParent( ExplosionDecal );

					// hack, since they don't show up on terrain anyway
					if ( Terrain(HitActor) == None )
					{
						// Added usage of new hit location and normal based off of the object hit
						//WorldInfo.MyDecalManager.SpawnDecal(MITV_Decal, HitLocation, rotator(-HitNormal), DecalWidth, DecalHeight, 10.0, FALSE );
						WorldInfo.MyDecalManager.SpawnDecal(MITV_Decal, NewHitLoc, rotator(-NewHitNormal), DecalWidth, DecalHeight, 10.0, false, , HitInfo.HitComponent, true, false, HitInfo.BoneName, HitInfo.Item, HitInfo.LevelIndex );
						//here we need to see if we are an MITV and then set the burn out times to occur
						MITV_Decal.SetScalarStartTime( DecalDissolveParamName, DurationOfDecal );
					}
					// Unhack the hack! UNHACK THE GIBSON!!!!!
					else
					{
						WorldInfo.MyDecalManager.SpawnDecal(MITV_Decal, NewHitLoc, rotator(vect(0,0,-1)), DecalWidth, DecalHeight, (DecalWidth > DecalHeight ? DecalWidth : DecalHeight) / 2.0f, false, , HitInfo.HitComponent, true, false, HitInfo.BoneName, HitInfo.Item, HitInfo.LevelIndex );
					}
				}
				else
				{
					// Added usage of new hit location and normal based off of the object hit
					//WorldInfo.MyDecalManager.SpawnDecal( ExplosionDecal, HitLocation, rotator(-HitNormal), DecalWidth, DecalHeight, 10.0, true );
					WorldInfo.MyDecalManager.SpawnDecal( ExplosionDecal, NewHitLoc, rotator(-NewHitNormal), DecalWidth, DecalHeight, 10.0, false, , HitInfo.HitComponent, true, false, HitInfo.BoneName, HitInfo.Item, HitInfo.LevelIndex );
				}
			}
		}

		// Support for different hit-material explosion FX sounds
		if(UTPawn(HitActor) != none)
		{
			HitInfo.PhysMaterial = PhysicalMaterial'physmat_tgphysicalmaterials.PM_Pawn';
		}

		NewExplosionSound = GetExplosionSound(HitInfo.PhysMaterial, HitActor);
		if (NewExplosionSound != none && !bSuppressSounds)
		{
			PlaySound(NewExplosionSound, true);
		}

		// Fade out projectile loop
		if (AmbientComponent != none)
		{
			AmbientComponent.FadeOut(0.1f, 0.0f);
		}

		bSuppressExplosionFX = true; // so we don't get called again
	}
}

simulated function SoundCue GetExplosionSound(PhysicalMaterial HitMaterial, Actor HitActor)
{
	local int i;
	local name PhysMaterialName;
	local TrPhysicalMaterialProperty PhysicalProperty;
	local TrMapInfo TrMI;

	if (Terrain(HitActor) != none || Terrain(ImpactedActor) != none)
	{
		// If we hit terrain, return the map's default phys mat.
		TrMI = TrMapInfo(WorldInfo.GetMapInfo());
		if( TrMI != none )
		{
			PhysMaterialName = TrMI.m_DefaultPhysicalMaterialName;
		}
		else
		{
			PhysMaterialName = '';
		}
	}
	else if (TrPawn(HitActor) != none || TrPawn(ImpactedActor) != none)
	{
		PhysMaterialName = 'Pawn';
	}
	else if (TrDeployable_ForceField(HitActor) != none || TrDeployable_ForceField(ImpactedActor) != none)
	{
		PhysMaterialName = 'ForceField';
	}
	else if (HitMaterial != None)
	{
		PhysicalProperty = TrPhysicalMaterialProperty(HitMaterial.GetPhysicalMaterialProperty(class'TrPhysicalMaterialProperty'));

		if (PhysicalProperty != none)
		{
			PhysMaterialName = PhysicalProperty.MaterialType;
		}
	}

	if (PhysMaterialName != 'none' && PhysMaterialName != '')
	{
		i = ImpactEffects.Find('MaterialType', PhysMaterialName);
		if (i != INDEX_NONE)
		{
			return default.ImpactEffects[i].Sound;
		}
	}

	return default.ExplosionSound;
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	if (bShuttingDown)
		return;

	if( c_ChildTetheredProjectile != none )
	{
		// The server's tethered projectile exploded, so explode this one too
		c_ChildTetheredProjectile.Explode(HitLocation, HitNormal);
		return;
	}

	if( m_bFastProjectile )
	{
		if (Damage>0 && DamageRadius>0)
		{
			if ( Role == ROLE_Authority )
			{
				MakeNoise(1.0);
			}
			
			if( Role == ROLE_Authority && WorldInfo.NetMode != NM_Client )
			{
				ProjectileHurtRadius(HitLocation, HitNormal );
			}
		}
		SpawnExplosionEffects(HitLocation, HitNormal);

		// Prevent explode to be called over and over.
		bShuttingDown = true;

		// Delay the shutdown.
		if ( Role == ROLE_Authority )
		{
			SetTimer(0.15, false, 'ShutDown');
		}

		// Do some of the stuff that is normally associated with shutting down.
		if( AmbientComponent != None )
		{
			AmbientComponent.FadeOut(m_fAmbientSoundFadeOut, 0.0f);
		}
		if (ProjEffects!=None)
		{
			ProjEffects.DeactivateSystem();
		}
		HideProjectile();
		SetCollision(false,false);
	}
	else
	{
		if( Damage > 0 )
		{
			if ( Role == ROLE_Authority )
				MakeNoise(1.0);
			if ( !bShuttingDown )
			{
				ProjectileHurtRadius(HitLocation, HitNormal );
			}
		}
		SpawnExplosionEffects(HitLocation, HitNormal);

		ShutDown();
	}
}

simulated function Shutdown()
{
	local TrPlayerController TrPC;

	if( m_bTether && Role == ROLE_Authority && Instigator != none && WorldInfo.NetMode == NM_Client )
	{
		TrPC = TrPlayerController(Instigator.Controller);
		if( TrPC != none )
		{
			TrPC.CheckTetherList(self);
		}
	}

    if( AmbientComponent != None )
    {
		AmbientComponent.FadeOut(m_fAmbientSoundFadeOut, 0.0f);
    }

	if( c_ChildTetheredProjectile != none )
	{
		c_ChildTetheredProjectile.Shutdown();
	}

    Super.Shutdown();
}

/** Sets the velocity from a bounce off a wall.*/
simulated function Bounce(Actor Other, Vector WallNormal)
{
	m_bHasBounced = true;

	// back up a smidge if we hit an objective so we will bounce off of the outside surface
	// without this, grenades get stuck inside objectives 5/16/11
	if (Other != none && (Other.IsA('TrGameObjective') || Other.IsA('TrVehicle')))
	{
		Move(Normal(Velocity)*-30.0);
	}

	Velocity = (1.0 - m_fBounceDampingPercent) * (( Velocity dot WallNormal ) * WallNormal * -2.0 + Velocity);
	Speed = VSize(Velocity);
	m_vAccelDirection = Normal(Velocity);
}

simulated function bool ProjectileHurtRadius( vector HurtOrigin, vector HitNormal)
{
	local vector AltOrigin, TraceHitLocation, TraceHitNormal;
	local Actor TraceHitActor;
	local TrDaDCore DaDCore;

	if( Role < ROLE_Authority )
	{
		return false;
	}

	// early out if already in the middle of hurt radius
	if ( bHurtEntry )
		return false;

	AltOrigin = HurtOrigin;

	DaDCore = TrDaDCore(ImpactedActor);

	if ( (ImpactedActor != None) && (ImpactedActor.bWorldGeometry || DaDCore != none) )
	{
		// try to adjust hit position out from hit location if hit world geometry
		AltOrigin = HurtOrigin + 2.0 * class'Pawn'.Default.MaxStepHeight * HitNormal;
		TraceHitActor = Trace(TraceHitLocation, TraceHitNormal, AltOrigin, HurtOrigin, false,,,TRACEFLAG_Bullet);
		if ( TraceHitActor != None )
		{
			AltOrigin = HurtOrigin + 0.5*(TraceHitLocation - HurtOrigin);
		}
	}

	return HurtRadius_Internal(Damage, DamageRadius, MyDamageType, MomentumTransfer, HurtOrigin, AltOrigin);
}

function bool HurtRadius_Internal( float DamageAmount,
								    float InDamageRadius,
				    class<DamageType> DamageType,
									float Momentum,
									vector HurtOrigin,
									vector AltHurtOrigin,
									optional actor IgnoredActor,
									optional Controller InstigatedByController = Instigator != None ? Instigator.Controller : None,
									optional bool bDoFullDamage
									)
{
	local Actor	Victim;
	local bool bCausedDamage;
	//local float fMomentumTransferMultiplierAgainstEnemies;
	local TraceHitInfo HitInfo;
	local StaticMeshComponent HitComponent;
	local KActorFromStatic NewKActor;
	//local TrPlayerController TrPC;
	local float XYDamageRadius;
	local float ModDamageRadius;
	local TrDaDCore DaDCore;
    local TrGameReplicationInfo TrGRI;

	if ( bHurtEntry )
		return false;

	XYDamageRadius = DamageRadius;
	if (m_bLimitXYDamageCheck)
	{
		// If we are limiting the radius check in the XY axes, use it as our damage radius calculation.
		InDamageRadius = m_fXYDamageRadius;
		XYDamageRadius = m_fXYDamageRadius;
	}

	bCausedDamage = false;
	if (InstigatedByController == None)
	{
		InstigatedByController = InstigatorController;
	}

	// if ImpactedActor is set, we actually want to give it full damage, and then let him be ignored by super.HurtRadius()
	if ( (ImpactedActor != None) && (ImpactedActor != self)  )
	{
		ImpactedActor.TakeRadiusDamage(InstigatedByController, DamageAmount * m_fDirectHitMultiplier, InDamageRadius, DamageType, Momentum, HurtOrigin, true, self);
		bCausedDamage = ImpactedActor.bProjTarget;
	}

	// Prevent HurtRadius() from being reentrant.
	if ( bHurtEntry )
		return false;

	bHurtEntry = true;
	bCausedDamage = false;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    ModDamageRadius = DamageRadius;

    if (TrGRI != none && TrGRI.r_ServerConfig != none)
    {
        DamageAmount *= TrGRI.r_ServerConfig.fAoEDamageMultiplier;
        InDamageRadius *= TrGRI.r_ServerConfig.fAoESizeMultiplier;
		XYDamageRadius *= TrGRI.r_ServerConfig.fAoESizeMultiplier;
        ModDamageRadius *= TrGRI.r_ServerConfig.fAoESizeMultiplier;
    }

	foreach VisibleCollidingExtentActors(class'Actor', Victim, ModDamageRadius, HurtOrigin, AltHurtOrigin,,,,, HitInfo, XYDamageRadius)
	{
		if ( Victim.bWorldGeometry )
		{
			// check if it can become dynamic
			// @TODO note that if using StaticMeshCollectionActor (e.g. on Consoles), only one component is returned.  Would need to do additional octree radius check to find more components, if desired
			HitComponent = StaticMeshComponent(HitInfo.HitComponent);
			if ( (HitComponent != None) && HitComponent.CanBecomeDynamic() )
			{
				NewKActor = class'KActorFromStatic'.Static.MakeDynamic(HitComponent);
				if ( NewKActor != None )
				{
					Victim = NewKActor;
				}
			}
		}

		DaDCore = TrDaDCore(Victim);

		if ( !Victim.bWorldGeometry && (Victim != self) && (Victim != ImpactedActor) && (Victim != IgnoredActor) && (Victim.bCanBeDamaged || Victim.bProjTarget) && DaDCore == none )
		{
			if( Victim == Instigator )
			{
				Victim.TakeRadiusDamage(InstigatedByController, DamageAmount, InDamageRadius, DamageType, Momentum * m_fInstigatorMomentumTransferMultiplier, HurtOrigin, bDoFullDamage, self);
			}
			else
			{
				Victim.TakeRadiusDamage(InstigatedByController, DamageAmount, InDamageRadius, DamageType, Momentum /* * fMomentumTransferMultiplierAgainstEnemies*/, HurtOrigin, bDoFullDamage, self);
			}
			bCausedDamage = bCausedDamage || Victim.bProjTarget;
		}
	}
	bHurtEntry = false;
	return bCausedDamage;
}

// Combined the chain of HitWall event's, and removed what we didn't need.
simulated event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp)
{
	local KActorFromStatic NewKActor;
	local StaticMeshComponent HitStaticMesh;
	local TrVehicle VehicleWall;
	local TrDaDCore DaDCore;

	VehicleWall = TrVehicle(Wall);
	if (VehicleWall != none && !VehicleWall.StopsProjectile(self))
	{
		return;
	}

	TriggerEventClass(class'SeqEvent_HitWall', Wall);

	if ( Wall.bWorldGeometry )
	{ 
		HitStaticMesh = StaticMeshComponent(WallComp);
        if ( (HitStaticMesh != None) && HitStaticMesh.CanBecomeDynamic() )
        {
	        NewKActor = class'KActorFromStatic'.Static.MakeDynamic(HitStaticMesh);
	        if ( NewKActor != None )
			{
				Wall = NewKActor;
			}
        }

		if( DamageRadius == 0.0 && WallComp != none && Damage > 0.0 )
		{
			DaDCore = TrDaDCore(WallComp.Owner);
			if( DaDCore != none )
			{
				DaDCore.TakeDamage(Damage,InstigatorController,Location,MomentumTransfer * Normal(Velocity), MyDamageType,, self);
			}
		}
	}

	ImpactedActor = Wall;
	if (DamageRadius == 0 && !Wall.bStatic)
	{
		ImpactedActor.TakeDamage(Damage,InstigatorController,Location,MomentumTransfer * Normal(Velocity), MyDamageType,, self);
	}

	Explode(Location, HitNormal);
	//ImpactedActor = None;
}

simulated singular event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	if ( (Other == None) || Other.bDeleteMe ) // Other just got destroyed in its touch?
		return;

	// don't allow projectiles to explode while spawning on clients
	// because if that were accurate, the projectile would've been destroyed immediately on the server
	// and therefore it wouldn't have been replicated to the client
	if ( Other.StopsProjectile(self) && (Role == ROLE_Authority || bBegunPlay) && (bBlockedByInstigator || (Other != Instigator)) )
	{
		ImpactedActor = Other;
		ProcessTouch(Other, HitLocation, HitNormal);
		//ImpactedActor = None;
	}
}

simulated function ProcessTouch(Actor Other, Vector HitLocation, Vector HitNormal)
{
	if( m_bAuthoritativeExploding )
	{
		// Ignore touch events on pawns if we are the client..
		if (Other != none && Other.IsA('TrPawn') && WorldInfo.NetMode == NM_Client)
		{
			return;
		}

		super.ProcessTouch(Other, HitLocation, HitNormal);
	}
	else
	{
		super.ProcessTouch(Other, HitLocation, HitNormal);
	}
}

state WaitingForVelocity
{
	simulated function Tick(float DeltaTime)
	{
		if (!IsZero(Velocity))
		{
			m_vAccelDirection = Normal(Velocity);
			Acceleration = AccelRate * Normal(Velocity);
			GotoState((InitialState != 'None') ? InitialState : 'Auto');
		}
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=ProjectileMeshComp
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrProjectile:MyLightEnvironment'
      bUseAsOccluder=False
      bAcceptsStaticDecals=False
      bAcceptsDynamicDecals=False
      bCastDynamicShadow=False
      CollideActors=False
      BlockActors=False
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      BlockRigidBody=False
      bDisableAllRigidBody=True
      Name="ProjectileMeshComp"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   m_ProjMesh=ProjectileMeshComp
   m_bOrientToWall=True
   m_bAuthoritativeExploding=True
   m_fProjInheritVelocityPct=0.200000
   m_fProjInheritVelocityPctZ=0.200000
   m_fMaxProjInheritPct=0.200000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
      MinTimeBetweenFullUpdates=2.000000
      bCastShadows=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
   End Object
   m_ProjLightEnvironment=MyLightEnvironment
   m_fBounceDampingPercent=0.550000
   m_fDirectHitMultiplier=1.000000
   m_fAmbientSoundFadeIn=0.500000
   m_fAmbientSoundFadeOut=0.100000
   m_fInstigatorMomentumTransferMultiplier=1.200000
   m_fInstigatorExtraZMomentum=90000.000000
   m_fTweenSpeed=1.000000
   m_fAlwaysRelevantDistanceSquared=2560000.000000
   Begin Object Class=PointLightComponent Name=ProjectilePointLight
      Radius=128.000000
      bEnabled=False
      CastShadows=False
      Name="ProjectilePointLight"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   ProjectileLight=ProjectilePointLight
   ExplosionLightClass=Class'UTGame.UTRocketExplosionLight'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTProjectile:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTProjectile:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=MyLightEnvironment
   Components(2)=ProjectileMeshComp
   bNetTemporary=False
   bCollideComplex=False
   CollisionComponent=CollisionCylinder
   Name="Default__TrProjectile"
   ObjectArchetype=UTProjectile'UTGame.Default__UTProjectile'
}
