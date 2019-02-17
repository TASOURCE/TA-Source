/**
 *  This object contains references to the assets that will need to be available when
 *  at the main menu.
 */

class TrMainMenuContentData extends Object;

struct MeshData
{
	var EContentDataType ContentDataType;
	var TrMainMenuMeshInfo MainMeshInfo;
};

/** Specific meshes with tags. */
var array<MeshData> m_MeshData;

function SendPaperDollANewMesh(TrPaperDollMainMenu MainMenuPaperDoll, EContentDataType ContentDataType)
{
	local int i;

	for( i = 0; i < m_MeshData.Length; i++ )
	{
		if( ContentDataType == m_MeshData[i].ContentDataType )
		{
			MainMenuPaperDoll.SetMainMeshInfo(m_MeshData[i].MainMeshInfo, ContentDataType);
			return;
		}
	}
}

function PreloadTextures(float ForceDuration)
{
	local int i;

	for( i = 0; i < m_MeshData.Length; i++ )
	{
		if (m_MeshData[i].MainMeshInfo != none)
		{
			m_MeshData[i].MainMeshInfo.PreloadTextures(ForceDuration);
		}
	}
}

defaultproperties
{
   Name="Default__TrMainMenuContentData"
   ObjectArchetype=Object'Core.Default__Object'
}
