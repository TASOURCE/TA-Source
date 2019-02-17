/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTPawnSoundGroup extends Object
	abstract
	dependson(UTPhysicalMaterialProperty);

var SoundCue DodgeSound;
var SoundCue DoubleJumpSound;
var SoundCue DefaultJumpingSound;
var SoundCue LandSound;
var SoundCue FallingDamageLandSound;
var SoundCue DyingSound;
var SoundCue HitSounds[3];
var SoundCue GibSound;
var SoundCue DrownSound;
var SoundCue GaspSound;

struct FootstepSoundInfo
{
	var name MaterialType;
	var SoundCue Sound;
};
/** footstep sound effect to play per material type */
var array<FootstepSoundInfo> FootstepSounds;
/** default footstep sound used when a given material type is not found in the list */
var SoundCue DefaultFootstepSound;

var array<FootstepSoundInfo> JumpingSounds;

var array<FootstepSoundInfo> LandingSounds;
var SoundCue DefaultLandingSound;

// The following are /body/ sounds, not vocals:
/* sound for regular bullet hits on the body */
var SoundCue BulletImpactSound;
/* sound from being crushed, such as by a vehicle */
var SoundCue CrushedSound;
/* sound when the body is gibbed*/
var SoundCue BodyExplosionSound;
var SoundCue InstagibSound;

static function PlayInstagibSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.Playsound(Default.InstagibSound, false, true);
}

static function PlayBulletImpact(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.BulletImpactSound, false, true);
}

static function PlayCrushedSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.CrushedSound,false,true);
}

static function PlayBodyExplosion(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.CrushedSound,false,true);
}

static function PlayDodgeSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.DodgeSound, false, true);
}

static function PlayDoubleJumpSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.DoubleJumpSound, false, true);
}

static function PlayJumpSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.DefaultJumpingSound, false, true);
}

static function PlayLandSound(Pawn P)
{
    //    PlayOwnedSound(GetSound(EST_Land), SLOT_Interact, FMin(1,-0.3 * P.Velocity.Z/P.JumpZ));
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.LandSound, false, true);
}

static function PlayFallingDamageLandSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.FallingDamageLandSound, false, true);
}

static function SoundCue GetFootstepSound(int FootDown, name MaterialType)
{
	local int i;

	i = default.FootstepSounds.Find('MaterialType', MaterialType);
	return (i == -1 || MaterialType=='') ? default.DefaultFootstepSound : default.FootstepSounds[i].Sound; // checking for a '' material in case of empty array elements
}

static function SoundCue GetJumpSound(name MaterialType)
{
	local int i;
	i = default.JumpingSounds.Find('MaterialType', MaterialType);
	return (i == -1 || MaterialType=='') ? default.DefaultJumpingSound : default.JumpingSounds[i].Sound; // checking for a '' material in case of empty array elements
}

static function SoundCue GetLandSound(name MaterialType)
{
	local int i;
	i = default.LandingSounds.Find('MaterialType', MaterialType);
	return (i == -1 || MaterialType=='') ? default.DefaultLandingSound : default.LandingSounds[i].Sound; // checking for a '' material in case of empty array elements
}

static function PlayDyingSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(Default.DyingSound);
}

/** play sound when taking a hit
 * this sound should be played replicated
 */
static function PlayTakeHitSound(Pawn P, int Damage)
{
	//$$BE Disabled sound no longer used.
	/*local int HitSoundIndex;

	if ( P.Health > 0.5 * P.HealthMax )
	{
		HitSoundIndex = (Damage < 20) ? 0 : 1;
	}
	else
	{
		HitSoundIndex = (Damage < 20) ? 1 : 2;
	}
	P.PlaySound(default.HitSounds[HitSoundIndex]);*/
}

static function PlayGibSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(default.GibSound, true);
}

static function PlayGaspSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(default.GaspSound, true);
}

static function PlayDrownSound(Pawn P)
{
	//$$BE Disabled sound no longer used.
	//P.PlaySound(default.DrownSound, true);
}

defaultproperties
{
   Name="Default__UTPawnSoundGroup"
   ObjectArchetype=Object'Core.Default__Object'
}
