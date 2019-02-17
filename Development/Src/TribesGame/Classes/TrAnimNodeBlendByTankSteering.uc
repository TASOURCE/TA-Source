class TrAnimNodeBlendByTankSteering extends TrAnimNodeBlendList
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var transient TrVehicle m_TrVehicle;

defaultproperties
{
   Children(0)=(Name="Steer L")
   Children(1)=(Name="No Steer",Weight=1.000000)
   Children(2)=(Name="Steer R")
   bFixNumChildren=True
   Name="Default__TrAnimNodeBlendByTankSteering"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
