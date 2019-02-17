/**
 * 
 */
class TrCamera_DiamondSword extends TrCamera_SpectatorBookmark
	ClassGroup(Common)
	placeable;

defaultproperties
{
   m_BookmarkDescription=Bookmark_DSBase
   Begin Object Class=DrawFrustumComponent Name=DrawFrust0 Archetype=DrawFrustumComponent'TribesGame.Default__TrCamera_SpectatorBookmark:DrawFrust0'
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="DrawFrust0"
      ObjectArchetype=DrawFrustumComponent'TribesGame.Default__TrCamera_SpectatorBookmark:DrawFrust0'
   End Object
   DrawFrustum=DrawFrust0
   Begin Object Class=StaticMeshComponent Name=CamMesh0 Archetype=StaticMeshComponent'TribesGame.Default__TrCamera_SpectatorBookmark:CamMesh0'
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="CamMesh0"
      ObjectArchetype=StaticMeshComponent'TribesGame.Default__TrCamera_SpectatorBookmark:CamMesh0'
   End Object
   MeshComp=CamMesh0
   Components(0)=CamMesh0
   Components(1)=DrawFrust0
   Name="Default__TrCamera_DiamondSword"
   ObjectArchetype=TrCamera_SpectatorBookmark'TribesGame.Default__TrCamera_SpectatorBookmark'
}
