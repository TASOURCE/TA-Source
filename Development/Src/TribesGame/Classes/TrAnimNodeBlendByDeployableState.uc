class TrAnimNodeBlendByDeployableState extends TrAnimNodeBlendList
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var transient TrDeployable m_TrDeployable;

defaultproperties
{
   Children(0)=(Name="Active",Weight=1.000000)
   Children(1)=(Name="Damaged")
   Children(2)=(Name="Inactive")
   Children(3)=(Name="Deploying")
   bFixNumChildren=True
   Name="Default__TrAnimNodeBlendByDeployableState"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
