/**
 * GFxTrScene_Settings
 * 
 * This scene is used to interface with the various system settings, such
 * as keybindings, video configurations, and mouse controls
 * 
 * Loaded on the front movie and ingame movie
 */

class GFxTrScene_Settings extends GFxTrScene;
    /*native;

var TrKeyBindings     KeyBindings;
var TrAudioSettings   AudioSettings;
var TrVideoSettings   VideoSettings;
var TrRegionSettings  RegionSettings;
var TrControlSettings ControlSettings;

native function BlockForPopup(bool bBlock);

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();

    KeyBindings = new (Outer) class'TrKeyBindings';
    AudioSettings = new (Outer) class'TrAudioSettings';
    VideoSettings = new (Outer) class'TrVideoSettings';
    RegionSettings = new (Outer) class'TrRegionSettings';
    ControlSettings = new (Outer) class'TrControlSettings';

    if (AudioSettings != none) AudioSettings.InitializeAudioVolumes();

    bSceneCreated = true;
}

function CaptureNextKey()
{
    if (KeyBindings != none) KeyBindings.CaptureNextKey();
}

function LoadKeyBindings(GFxObject List)
{
    if (KeyBindings != none) KeyBindings.LoadBindings(List);
}

function LoadControlSettings(GFxObject List)
{
    if (ControlSettings != none) ControlSettings.LoadControlSettings(list);
}

function LoadAudioSettings(GFxObject List)
{
    if (AudioSettings != none) AudioSettings.LoadAudioSettings(list);
}

function LoadVideoResolutions(GFxObject List)
{
    if (VideoSettings != none) VideoSettings.LoadVideoResolutions(List);
}

function LoadVideoSettings(GFxObject List)
{
    if (VideoSettings != none) VideoSettings.LoadVideoSettings(List);
}

function LoadRegionLabels(GFxObject List)
{
    if (RegionSettings != none) RegionSettings.LoadRegionLabels(List);
}

function string LoadRegionSetting()
{
    if (RegionSettings != none) return RegionSettings.LoadRegionSetting();

    return "North America";
}

function ApplyKeyBinding(int Index, string Val)
{
    if (KeyBindings != none) KeyBindings.ApplyKeyBinding(Index, Val);
}

function ApplyControlSetting(int Index, int Val)
{
    if (ControlSettings != none) ControlSettings.ApplyControlSetting(Index, Val);
}

function ApplyAudioSetting(int Index, int Val)
{
    if (AudioSettings != none) AudioSettings.ApplyAudioSetting(Index, Val);
}

function ApplyVideoSetting(int Index, int Val)
{
    if (VideoSettings != none) VideoSettings.CacheVideoSetting(Index, Val);
}

function ApplyVideoSettings()
{
    if (VideoSettings != none) VideoSettings.ApplyVideoSettings();

    TrOuter.ASC_Resize();
    TrOuter.ASC_ReapplyMasks();
    TrOuter.RestorePlayerHUD();
}

function ApplyDefaultSettings()
{
    if (KeyBindings != none) KeyBindings.ApplyDefaultSettings();
}

function ApplyRegionSetting(int Index, int Val)
{
    if (RegionSettings != none) RegionSettings.SetPreferredRegion(Val);
}

function AddAvailableRegion(string RegionName, int Id)
{
    if (RegionSettings != none) RegionSettings.AddAvailableRegion(RegionName, Id);
}*/

defaultproperties
{
   Name="Default__GFxTrScene_Settings"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
