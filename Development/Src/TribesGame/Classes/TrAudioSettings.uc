/**
 * 
 */
class TrAudioSettings extends GFxObject
    config(Engine)
    native;

var int       m_SettingsCount;
var GFxObject m_SettingsList;

/** Saved off volume levels for each player locally */
var config int m_nVolumeEffects;
var config int m_nVolumeVGS;
var config int m_nVolumeVoice;
var config int m_nVolumeMusic;
var config int m_nVolumeMaster;

/** Name sets for each audio groups, so we can control each as one */
var array<string> MasterSoundClassNames;
var array<string> EffectsSoundClassNames;
var array<string> MusicSoundClassNames;
var array<string> VGSSoundClassNames;
var array<string> VoiceSoundClassNames;

native function FlushSettings();
native function StoreSetting(int SettingId, int Val);
native function int ReadSetting(int SettingId);

function ReadSettings()
{
    local int i;
    local int val;

    for (i = ESL_AUDIO_START+1; i < ESL_AUDIO_END; i++)
    {
        val = ReadSetting(ESettingsList(i));

        if (val >= 0)
        {
            if (val != GetCurrentSettingValue(ESettingsList(i)))
            {
                ApplyAudioSetting(i, val, false);
            }
        }
    }
}

function InitializeAudioVolumes()
{
    SetMasterVolume(m_nVolumeMaster);
    SetEffectsVolume(m_nVolumeEffects);
    SetMusicVolume(m_nVolumeMusic);
    SetVoiceVolume(m_nVolumeVGS);
    SetVoiceVolume(m_nVolumeVoice);
}

function LoadAudioSettings(GFxObject List)
{
	local int i;

    m_SettingsCount = 0;
    m_SettingsList = List;

	for (i = ESL_AUDIO_START+1; i < ESL_AUDIO_END; i++)
	{
		AddSettingToList(GetSettingNameFromType(ESettingsList(i)), GetCurrentSettingValue(ESettingsList(i)));
	}
}

function ApplyAudioSetting(int Type, int Val, optional bool bStore = true)
{
    switch (Type)
    {
	case ESL_MASTER:
        SetMasterVolume(Val);
        break;
    case ESL_EFFECTS:
        SetEffectsVolume(Val);
        break;
    case ESL_MUSIC:
        SetMusicVolume(Val);
        break;
    case ESL_VGS:
        SetVGSVolume(Val);
        break;
    case ESL_VOICE:
        SetVoiceVolume(Val);
        break;
    default:
        break;
    }
    
    if (bStore)
    {
        StoreSetting(Type, Val);
    }
}

function int GetCurrentSettingValue(ESettingsList Type)
{
    switch (Type)
    {
	case ESL_MASTER:
        return m_nVolumeMaster;
    case ESL_EFFECTS:
        return m_nVolumeEffects;
    case ESL_MUSIC:
        return m_nVolumeMusic;
    case ESL_VGS:
        return m_nVolumeVGS;
    case ESL_VOICE:
        return m_nVolumeVoice;
    case ESL_BASSBOOST:
		return int(GetBassBoost());
    default:
        break;
    }
    
    return 100;
}

function AddSettingToList(string SettingName, int Val)
{
    local GFxObject obj;

    obj = CreateObject("Object");           
    obj.SetString("label", SettingName);
    obj.SetFloat("value", float(Val));

    m_SettingsList.SetElementObject(m_SettingsCount++, obj);
}

function SetMasterVolume(float NewVolume)
{
    local int i;

    m_nVolumeMaster = int(NewVolume);

    for (i = 0; i < MasterSoundClassNames.Length; i++) GetPC().SetAudioGroupVolume(name(MasterSoundClassNames[i]), float(m_nVolumeMaster)/100);
    
    SaveConfig();
}

function SetEffectsVolume(float NewVolume)
{
    local int i;

    m_nVolumeEffects = int(NewVolume);

    for (i = 0; i < EffectsSoundClassNames.Length; i++) GetPC().SetAudioGroupVolume(name(EffectsSoundClassNames[i]), float(m_nVolumeEffects)/100);
    
    SaveConfig();
}

function SetMusicVolume(float NewVolume)
{
    local int i;

    m_nVolumeMusic = int(NewVolume);

    for (i = 0; i < MusicSoundClassNames.Length; i++) GetPC().SetAudioGroupVolume(name(MusicSoundClassNames[i]), float(m_nVolumeMusic)/100);
    
    SaveConfig();
}

function SetVGSVolume(float NewVolume)
{
    local int i;

    m_nVolumeVGS = int(NewVolume);

    for (i = 0; i < VGSSoundClassNames.Length; i++) GetPC().SetAudioGroupVolume(name(VGSSoundClassNames[i]), float(m_nVolumeVGS)/100);
    
    SaveConfig();
}

function SetVoiceVolume(float NewVolume)
{
    local int i;

    m_nVolumeVoice = int(NewVolume);

    for (i = 0; i < VoiceSoundClassNames.Length; i++) GetPC().SetAudioGroupVolume(name(VoiceSoundClassNames[i]), float(m_nVolumeVoice)/100);
    
    SaveConfig();
}

function bool GetBassBoost()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(GetPC());
	if (TrPC != none)
	{
		return TrPC.IsBassBoostToggled();
	}

	return false;
}

function SetBassBoost(bool NewBassBoost)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(GetPC());
	if (TrPC != none)
	{
		TrPC.ToggleBassBoost(NewBassBoost);
	}
}


function string GetSettingNameFromType(ESettingsList Type)
{
    switch (Type)
    {
	case ESL_MASTER:
        return "playerVolume";
    case ESL_EFFECTS:
        return "sfxVolume";
    case ESL_MUSIC:
        return "musicVolume";
    case ESL_VGS:
        return "vgsVolume";
    case ESL_VOICE:
        return "voiceVolume";
    default:
        break;
    }

    return "N/A";
}

defaultproperties
{
   m_nVolumeEffects=75
   m_nVolumeVGS=100
   m_nVolumeVoice=100
   m_nVolumeMaster=80
   MasterSoundClassNames(0)="Master"
   EffectsSoundClassNames(0)="Ambient"
   EffectsSoundClassNames(1)="Character"
   EffectsSoundClassNames(2)="Concussion"
   EffectsSoundClassNames(3)="SFX"
   EffectsSoundClassNames(4)="SFXExceptions"
   EffectsSoundClassNames(5)="UI"
   EffectsSoundClassNames(6)="Vehicle"
   EffectsSoundClassNames(7)="Weapon"
   EffectsSoundClassNames(8)="WeaponExplosion"
   EffectsSoundClassNames(9)="WeaponFire"
   EffectsSoundClassNames(10)="WeaponFoley"
   EffectsSoundClassNames(11)="Tutorial_SFX_Reverb"
   EffectsSoundClassNames(12)="World_Props"
   MusicSoundClassNames(0)="Music"
   VGSSoundClassNames(0)="VOX"
   VGSSoundClassNames(1)="VOXRadio"
   VoiceSoundClassNames(0)="VOX2"
   VoiceSoundClassNames(1)="VOXExceptions"
   VoiceSoundClassNames(2)="VOXHelp"
   VoiceSoundClassNames(3)="VOXIngame"
   VoiceSoundClassNames(4)="Tutorial_VOX_Reverb"
   VoiceSoundClassNames(5)="VoxAnnouncer"
   Name="Default__TrAudioSettings"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
