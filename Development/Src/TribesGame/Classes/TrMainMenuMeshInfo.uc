/**
 * Represents a collection of visual components for a single model to show in a
 * main menu background scene.
 */
class TrMainMenuMeshInfo extends Object;

var PaperDollInfo MeshInfo;
var array<TrMainMenuMeshInfo> Children;
var name ParentSocketName;

struct ParticleSystemInfo
{
	var ParticleSystem ParticleSystem;
	var name SocketName;
};
var array<ParticleSystemInfo> AttachedParticleSystems;

function PreloadTextures(float ForceDuration)
{
	local TrMainMenuMeshInfo Child;
	local int i;

	if( MeshInfo.SkelMesh != none )
	{
		for( i = 0; i < MeshInfo.SkelMesh.Materials.Length; i++ )
		{
			MeshInfo.SkelMesh.Materials[i].SetForceMipLevelsToBeResident(true, true, ForceDuration);
		}
	}

	foreach Children(Child)
	{
		Child.PreloadTextures(ForceDuration);
	}
}

defaultproperties
{
   MeshInfo=(Rotation=(Pitch=0,Yaw=-16384,Roll=0),Scale=1.000000,CharacterLightingContrastFactor=1.500000)
   Name="Default__TrMainMenuMeshInfo"
   ObjectArchetype=Object'Core.Default__Object'
}
