class TrCallIn_Projectile extends TrCallIn;

/** The projectile to drop-in */
var class<TrProj_CallInBase> ProjectileFireClass;

/** The radius around the target point to drop projectiles randomly */
var float CallRadius;

/** The amount of time to spread projectile firing */
var float FireTimeLength;

/** The number of projectiles to drop */
var int NumberOfProjectiles;

/** The sound to play at the target location as a warning */
var SoundCue AreaWarningSound;

/** The sound to play at the target location as part of the particle system */
var SoundCue TargetParticleSound;

/** The particle system to play at the target location */
var ParticleSystem TargetParticleSystem;

var int m_FiredProjectiles;

var vector m_SavedTargetLocation;

var vector m_SavedTargetNormal;

simulated function bool FireCompletedCallIn(int CallInOffs, vector TargetLocation, vector TargetNormal)
{
	local TrEmitterSpawnable SpawnedEmitter;

	// Not enough credits, abort.
	if (!super.FireCompletedCallIn(CallInOffs, TargetLocation, TargetNormal))
		return false;

	m_FiredProjectiles = 0;
	m_SavedTargetLocation = TargetLocation;
	m_SavedTargetNormal = TargetNormal;

	// Play a warning sound.
	if (AreaWarningSound != none && OwningController != none)
	{
		OwningController.PlayReliableSound(AreaWarningSound, , , , TargetLocation);
	}

	// Spawn a particle emitter at the target location.
	if (TargetParticleSystem != none)
	{
		// Spawn the emitter.
		SpawnedEmitter = Spawn(class'TribesGame.TrEmitterSpawnable', none, , TargetLocation);
		if (SpawnedEmitter != none)
		{
			SpawnedEmitter.SetTemplate(TargetParticleSystem, true);
		}

		// Spawn the sound for the emitter.
		if (TargetParticleSound != none && OwningController != none)
		{
			OwningController.PlayReliableSound(TargetParticleSound, , , , TargetLocation);
		}
	}

	// Instant-fire projectile.
	if (NumberOfProjectiles == 1 && FireTimeLength == 0.0)
	{
		FireProjectile();
		IsInProgress = false;
	}
	else
	{
		SetTimer(FireTimeLength / NumberOfProjectiles, true, 'FireProjectile');
	}

	return true;
}

function FireProjectile()
{
	local TrProj_CallInBase SpawnedProjectile;
	local float OffsetRadii, OffsetTheta;
	local vector HitLoc, HitNorm, HitTestOffs;
	local vector StartFireLoc, StartFireOffs;

	// Exceeded number of called-in projectiles.
	if (m_FiredProjectiles >= NumberOfProjectiles)
	{
		ClearTimer('FireProjectile');
		IsInProgress = false;
		return;
	}

	// Increment the number of projectiles we are firing.
	m_FiredProjectiles++;

	// Calculate a radius and theta that is randomly distributed through the desired radius.
	OffsetRadii = CallRadius * Sqrt(FRand());
	OffsetTheta = 2.0f * Pi * FRand();
	StartFireOffs.X = OffsetRadii * Cos(OffsetTheta);
	StartFireOffs.Y = OffsetRadii * Sin(OffsetTheta);
	StartFireOffs.Z = 0.0f;

	// Fire off the projectile.
	if (ProjectileFireClass != none)
	{
		// Our desired trace point.
		StartFireLoc = m_SavedTargetLocation + StartFireOffs;
		HitTestOffs = ProjectileFireClass.default.Speed * CallTime * vect(0,0,1);

		// Perform a trace back down to earth to see what our new hit location is.
		if (Trace(HitLoc, 
				  HitNorm, 
				  StartFireLoc - HitTestOffs, 
				  StartFireLoc + HitTestOffs, 
				  false, 
				  , 
				  , 
				  TRACEFLAG_Bullet) != none)
		{
			StartFireLoc = HitLoc;
		}

		// Spawn the projectile.
		SpawnedProjectile = OwningController.Spawn(ProjectileFireClass, , , StartFireLoc + HitTestOffs);
		if (SpawnedProjectile != None && !SpawnedProjectile.bDeleteMe)
		{
			SpawnedProjectile.Instigator = Instigator;
			SpawnedProjectile.InstigatorController = OwningController;
			SpawnedProjectile.r_TargetLocation = StartFireLoc;
			SpawnedProjectile.InitProjectile(vect(0,0,-1));
		}
	}
}

defaultproperties
{
   NumberOfProjectiles=1
   FlagStationDist=0.000000
   GameObjectiveDist=0.000000
   VehicleDist=0.000000
   Name="Default__TrCallIn_Projectile"
   ObjectArchetype=TrCallIn'TribesGame.Default__TrCallIn'
}
