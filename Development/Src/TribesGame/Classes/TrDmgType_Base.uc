class TrDmgType_Base extends UTDamageType
	abstract
	native;

//
//	Given that a weapon can do damage at up to WeaponRange distance, the following defines how the damage
//  changes as the instigator of the damage is more and more remote:
//		below m_fMaxDamageRangePct of WeaponRange, damage is not reduced.
//		between m_fMaxDamageRangePct and m_fMinDamageRangePct of WeaponRange, damage falls linearly to m_fMinDamagePct
//		beyond m_fMinDamageRangePct of WeaponRange, damage is m_fMinDamagePct
//		beyond WeaponRange, there is great rejoicing
//
var int     DBWeaponId;                    // Database Id for weapon
var int     DBWeaponBaseId;                // Database Id for parent type
var int     DBWeaponTypeId;                // Database Id for fire type

var float	m_fMaxDamageRangePct;
var float	m_fMinDamageRangePct;
var float	m_fMinDamagePct;
var float   m_fBulletDamageRange;
var float	m_fDamageMultiplierAgainstArmor;
var float   m_fDamageMultiplierAgainstGenerators;
var float   m_fDamageMultiplierAgainstNonArmoredObjectives;
var float	m_fDamageMultiplierAgainstShrike;

var bool                    m_bCausesGib;	// Does this damage type cause the victim to gib on death?
var float                   m_fGibRadius;   // Radius for the impulse when gibbing.
var float                   m_fGibStrength; // Strength of the gib impulse.
var ERadialImpulseFalloff   m_GibFalloff;   // Falloff type for gib impulse.

var bool                    m_bEnableMotors;    // Enable motors on death?
var array<name>             m_nmDeathAnimNames;  // Name of the anim to play.

var bool m_bIgnoreDamageFalloff; // Should projectile ignore damage falloff.

var bool m_bImpulsesFlags; // Cause flags to be 'pushed'?
var name m_nmCameraShake;   // Causes a camera shake to play (name maps to TrPlayerController.m_CameraShakes.ShakeName)

var SoundCue m_RingingSound; // Sound that plays from the victim's perspective when this damage type hurts someone
var name m_nmTakeHitSoundMode;   // Sound mode that plays from the victim's perspective when this damage is applied.

var() int m_nKillIconIndex;

var float m_EnergyDrainAmount; // How much energy to drain from victim on impact.

var Vector2D m_v2DDamageNumbersMinMaxX;
var Vector2D m_v2DDamageNumbersMinMaxY;
var Vector2D m_v2DDamageNumbersMinMaxZ;

var bool bOffhandType;

static function float VehicleDamageScalingFor(Vehicle V)
{
	local TrVehicle TrV;

	TrV = TrVehicle(V);
	if (TrV != none)
	{
		if (TrVehicle_BaseFlying(TrV) != none && default.m_fDamageMultiplierAgainstShrike != -1)
		{
			return default.m_fDamageMultiplierAgainstShrike;
		}
		else if (TrV.m_bUsesArmoredMultiplier && default.m_fDamageMultiplierAgainstArmor != -1)
		{
			return default.m_fDamageMultiplierAgainstArmor;
		}
	}

	return Super.VehicleDamageScalingFor(V);
}
//
//	Calculate damage falloff 
//
static function float CalculateRangeDamageFalloff(float Dist, float damageRange, optional TrPlayerController TrPCDamager, optional TR_EQUIP_POINT EquipPoint = EQP_NONE, optional bool bMinDamageAlwaysApplied = false)
{
	local float maxDamageRange, minDamageRange, DamageScale, minDamagePct, ValueModifiedRange;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	ValueModifiedRange = 1.0;
	if( TrPCDamager != none )
	{
		TrPRI = TrPlayerReplicationInfo(TrPCDamager.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				switch( EquipPoint )
				{
					case EQP_Primary:
						ValueModifiedRange += VM.m_fPrimaryWeaponRangeBuffPct;
						break;
					case EQP_Secondary:
						ValueModifiedRange += VM.m_fSecondaryWeaponRangeBuffPct;
						break;
				}
			}
		}
	}

	maxDamageRange = damageRange * default.m_fMaxDamageRangePct * ValueModifiedRange;
	minDamageRange = damageRange * default.m_fMinDamageRangePct * ValueModifiedRange;
	minDamagePct = default.m_fMinDamagePct;

	// Ignore damage falloff, always 100% damage.
	if (default.m_bIgnoreDamageFalloff)
		return 1.0f;

	DamageScale = 1.0f;

	// far outside of range?
	if (!bMinDamageAlwaysApplied && Dist > damageRange)
	{
		DamageScale = 0;
	}
	// far enough to reduce the damage?
	else if (Dist > maxDamageRange)
	{
		DamageScale = Lerp(1.0f, minDamagePct, FPctByRange(Min(Dist, minDamageRange), maxDamageRange, minDamageRange));
	}

	return DamageScale;
}

// Determine damaging actor.
static function Actor GetActorCausingDamage(Controller EventInstigator, Actor DamageCauser)
{
	local TrPawn TrP;
	local TrVehicleWeapon TrVW;

	TrP = none;

	if (DamageCauser != none && (DamageCauser.IsA('TrProjectile') || DamageCauser.IsA('TrVehicle')))
	{
		return DamageCauser;
	}

	// Get the parent vehicle of the vehicle weapon.
	TrVW = TrVehicleWeapon(DamageCauser);
	if (TrVW != none)
		return TrVW.MyVehicle;

	if (EventInstigator != none && EventInstigator.Pawn != none)
		TrP = TrPawn(EventInstigator.Pawn);

	if (TrP == none && DamageCauser != none && DamageCauser.IsA('TrDevice'))
	{
		if (DamageCauser.Owner != none)
			TrP = TrPawn(DamageCauser.Owner);
		else
			return DamageCauser;
	}

	return TrP;
}

// Determine damage scale
static function float GetDamageScale(Actor DamageCauser, float Dist, class<TrDmgType_Base> DmgType)
{
	local TrProjectile TrProj;

	if (DmgType == none)
	{
		;
		DmgType = class'TrDmgType_Base';
	}

	if (TrDevice(DamageCauser)!=None)
	{
		return TrDevice(DamageCauser).CalculateRangeDamageFalloff(Dist);
	}
	else
	{
		TrProj = TrProjectile(DamageCauser);
		if (TrProj != none)
		{
			// Bullet-type projectile have to go through a special branch to take into account the TrDevice fall-off.
			if (TrProj.m_bIsBullet)
			{
				return DmgType.static.CalculateRangeDamageFalloff(Dist, DmgType.default.m_fBulletDamageRange, TrPlayerController(TrProj.InstigatorController), TrProj.m_SpawnedEquipPoint, true);
			}

			return DmgType.static.CalculateRangeDamageFalloff(Dist, TrProj.DamageRadius);
		}
	}

	return 1.0f;
}

static function GetCameraShake(int Damage, out name outCameraShakeName, out float outScale)
{
	local float MaxDamage;

	if( default.m_nmCameraShake != '' )
	{
		// Scale the damage based on how much damage was done vs. the max damage of the damagetype.
		if( default.DamageWeaponClass != none && default.DamageWeaponClass.default.WeaponProjectiles[0] != none )
		{
			MaxDamage = default.DamageWeaponClass.default.WeaponProjectiles[0].default.Damage;
			if( MaxDamage <= 0.0 )
			{
				return;
			}
			outScale = float(Damage) / MaxDamage;
		}
		else
		{
			outScale = 1.0;
		}

		// If the scale requires us to play a camera shake, return the name.
		if( outScale > 0.0 )
		{
			outCameraShakeName = default.m_nmCameraShake;
		}
	}
}

static function vector ModifyOverheadNumberLocation(Vector InLocation)
{
	InLocation.X += RandRange(default.m_v2DDamageNumbersMinMaxX.X, default.m_v2DDamageNumbersMinMaxX.Y);
	InLocation.Y += RandRange(default.m_v2DDamageNumbersMinMaxY.X, default.m_v2DDamageNumbersMinMaxY.Y);
	InLocation.Z += RandRange(default.m_v2DDamageNumbersMinMaxZ.X, default.m_v2DDamageNumbersMinMaxZ.Y);
	return InLocation;
}

static function name GetRandomDeathAnimName()
{
	local int i;
	i = Rand(default.m_nmDeathAnimNames.Length);
	if (i < default.m_nmDeathAnimNames.Length)
		return default.m_nmDeathAnimNames[i];
	else
		return 'DeathFlail';
}

defaultproperties
{
   DBWeaponId=102000
   m_fMaxDamageRangePct=0.300000
   m_fMinDamageRangePct=0.700000
   m_fMinDamagePct=0.200000
   m_fBulletDamageRange=6000.000000
   m_fDamageMultiplierAgainstGenerators=1.000000
   m_fDamageMultiplierAgainstNonArmoredObjectives=1.000000
   m_fDamageMultiplierAgainstShrike=2.500000
   m_fGibRadius=100.000000
   m_fGibStrength=40.000000
   m_nmDeathAnimNames(0)="DeathFlail"
   m_nmDeathAnimNames(1)="DeathFlail02"
   m_nmDeathAnimNames(2)="DeathFlail03"
   m_nKillIconIndex=140
   bCausesBlood=True
   bLocationalHit=True
   KDamageImpulse=2500.000000
   KDeathUpKick=1000.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_Base:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_Base:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_Base"
   ObjectArchetype=UTDamageType'UTGame.Default__UTDamageType'
}
