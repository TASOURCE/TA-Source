class TrAnimNotify_Sound extends AnimNotify_Sound
	native;

struct native DeviceOverride
{
	var() SoundCue SoundCue;
	var() class<TrDevice> DeviceClass;
};

var() array<DeviceOverride> m_DeviceOverrides;

/** When played back in editor, this class's override will play. */
var() editoronly class<TrDevice> m_PreviewDeviceClass;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__TrAnimNotify_Sound"
   ObjectArchetype=AnimNotify_Sound'Engine.Default__AnimNotify_Sound'
}
