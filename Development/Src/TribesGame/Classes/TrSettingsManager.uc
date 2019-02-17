class TrSettingsManager extends Object within GFxTrMenuMoviePlayer;

var TrHUDSettings     HUDSettings;
var TrKeyBindings     KeyBindings;
var TrAudioSettings   AudioSettings;
var TrVideoSettings   VideoSettings;
var TrRegionSettings  RegionSettings;
var TrControlSettings ControlSettings;

var GFxTrMenuMoviePlayer MP;

function Initialize()
{
    MP = Outer;

    HUDSettings = new (MP) class'TrHUDSettings';
    KeyBindings = new (MP) class'TrKeyBindings';
    AudioSettings = new (MP) class'TrAudioSettings';
    VideoSettings = new (MP) class'TrVideoSettings';
    RegionSettings = new (MP) class'TrRegionSettings';
    ControlSettings = new (MP) class'TrControlSettings';

    AudioSettings.InitializeAudioVolumes();
}

defaultproperties
{
   Name="Default__TrSettingsManager"
   ObjectArchetype=Object'Core.Default__Object'
}
