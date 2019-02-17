/**
 * Mapping of sounds that the player pawn plays.
 */

class TrPawnSoundGroup extends UTPawnSoundGroup;

/** Looping jetpack sound. */
var SoundCue    m_JetpackLoopSound;

/** Sound that plays after a jetpack has been disengaged. */
var SoundCue    m_JetpackCooldownSound;

/** Low health sound. */
var SoundCue    m_LowHealthSound;

/** Recharge health sound. */
var SoundCue    m_RechargeHealthSound;
var SoundCue    m_RechargeHealthSound3p;

/** Plays when a shield is activated. */
var SoundCue    m_ShieldPackActivateSound1p;
var SoundCue    m_ShieldPackActivateSound3p;

/** Plays when a shield is deactivated. */
var SoundCue    m_ShieldPackDeactivateSound1p;
var SoundCue    m_ShieldPackDeactivateSound3p;

/** Looping shield sound. */
var SoundCue    m_ShieldPackLoopSound1p;
var SoundCue    m_ShieldPackLoopSound3p;

/** Plays when stealth is activated. */
var SoundCue    m_StealthPackActivateSound1p;
var SoundCue    m_StealthPackActivateSound3p;

/** Plays when stealth is deactivated. */
var SoundCue    m_StealthPackDeactivateSound1p;
var SoundCue    m_StealthPackDeactivateSound3p;

/** Looping stealth sound. */
var SoundCue    m_StealthPackLoopSound1p;
var SoundCue    m_StealthPackLoopSound3p;

/** Plays when jammer is activated. */
var SoundCue    m_JammerPackActivateSound1p;
var SoundCue    m_JammerPackActivateSound3p;

/** Plays when jammer is deactivated. */
var SoundCue    m_JammerPackDeactivateSound1p;
var SoundCue    m_JammerPackDeactivateSound3p;

/** Looping jammer sound. */
var SoundCue    m_JammerPackLoopSound1p;
var SoundCue    m_JammerPackLoopSound3p;

/** Plays when rage is activated. */
var SoundCue    m_RageActivateSound1p;
var SoundCue    m_RageActivateSound3p;

/** Plays when rage is deactivated. */
var SoundCue    m_RageDeactivateSound1p;
var SoundCue    m_RageDeactivateSound3p;

/** Looping rage sound. */
var SoundCue    m_RageLoopSound1p;
var SoundCue    m_RageLoopSound3p;

var array<SoundCue> m_DyingSounds;

/** Plays when a blink is executed. */
var SoundCue    m_BlinkPackSound1p;
var SoundCue    m_BlinkPackSound3p;


/**
 * A note to audio designers: P.PlaySound() creates an AudioComponent only if the sound is determined to be audible, 
 * and replicates the sound to clients based on optional flags.
 * @param InSoundCue - the sound to play
 * @param bNotReplicated (opt) - sound is considered only for players on this machine (supercedes other flags)
 * @param bNoRepToOwner (opt) - sound is not replicated to the Owner of this Actor (typically for Inventory sounds)
 * @param bStopWhenOwnerDestroyed (opt) - whether the sound should cut out early if the playing Actor is destroyed
 * @param SoundLocation (opt) - alternate location to play the sound instead of this Actor's Location
 * @param bNoRepToRelevant (opt) - sound is not replicated to clients for which this Actor is relevant (for important sounds that are locally simulated when possible)
 */
static function PlayShieldPackActivateSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_ShieldPackActivateSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_ShieldPackActivateSound3p, true);
    }
}

static function PlayShieldPackDeactivateSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_ShieldPackDeactivateSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_ShieldPackDeactivateSound3p, true);
    }
}

static function PlayStealthPackActivateSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_StealthPackActivateSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_StealthPackActivateSound3p, true);
    }
}

static function PlayStealthPackDeactivateSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_StealthPackDeactivateSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_StealthPackDeactivateSound3p, true);
    }
}

static function PlayJammerPackActivateSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_JammerPackActivateSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_JammerPackActivateSound3p, true);
    }
}

static function PlayJammerPackDeactivateSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_JammerPackDeactivateSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_JammerPackDeactivateSound3p, true);
    }
}

static function PlayRageActivateSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_RageActivateSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_RageActivateSound3p, true);
    }
}

static function PlayRageDeactivateSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_RageDeactivateSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_RageDeactivateSound3p, true);
    }
}

static function PlayDyingSound(Pawn P)
{
	P.PlaySound(default.m_DyingSounds[RandRange(0, default.m_DyingSounds.Length - 1)]);
}

static function PlayBlinkPackSound(Pawn P)
{
    if( P.IsLocallyControlled() )
    {
        P.PlaySound(Default.m_BlinkPackSound1p, true);
    }
    else
    {
        P.PlaySound(Default.m_BlinkPackSound3p, true);
    }
}

defaultproperties
{
   m_DyingSounds(0)=None
   m_DyingSounds(1)=None
   m_DyingSounds(2)=None
   FootstepSounds(0)=(MaterialType="Composite")
   FootstepSounds(1)=(MaterialType="Concrete")
   FootstepSounds(2)=(MaterialType="Dirt")
   FootstepSounds(3)=(MaterialType="Grass")
   FootstepSounds(4)=(MaterialType="Metal")
   FootstepSounds(5)=(MaterialType="MetalGrate")
   FootstepSounds(6)=(MaterialType="Rock")
   FootstepSounds(7)=(MaterialType="ForceField")
   FootstepSounds(8)=(MaterialType="Water")
   FootstepSounds(9)=(MaterialType="Pawn")
   FootstepSounds(10)=(MaterialType="Snow")
   FootstepSounds(11)=(MaterialType="Gravel")
   FootstepSounds(12)=(MaterialType="Sand")
   Name="Default__TrPawnSoundGroup"
   ObjectArchetype=UTPawnSoundGroup'UTGame.Default__UTPawnSoundGroup'
}
