class TrMapInfo extends UDKMapInfo
	dependson(TrMapMusicInfo)
	native;

/** This is stored in a content package and then pointed to by the map **/
var() editinline TrMapMusicInfo m_MapMusicInfo;

/** List of invalid deployable volumes for each team. */
var() array<TrInvalidDeployableVolume> m_BEInvalidDeployableVolumes;
var() array<TrInvalidDeployableVolume> m_DSInvalidDeployableVolumes;
var() array<TrInvalidDeployableVolume> m_NeutralInvalidDeployableVolumes;

/** The default physical material name for terrain (vehicles, footsteps, etc. use this). */
var() name m_DefaultPhysicalMaterialName;

/** Weather system played as a camera effect. */
var() class<UDKEmitCameraEffect> m_WeatherEffect;

defaultproperties
{
   Name="Default__TrMapInfo"
   ObjectArchetype=UDKMapInfo'UDKBase.Default__UDKMapInfo'
}
