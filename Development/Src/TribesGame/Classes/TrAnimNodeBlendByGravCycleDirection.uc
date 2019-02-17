class TrAnimNodeBlendByGravCycleDirection extends TrAnimNodeBlendList
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var transient TrVehicle m_TrVehicle;
var() float m_fBackwardThreshold;

defaultproperties
{
   m_fBackwardThreshold=100.000000
   Children(0)=(Name="Forward",Weight=1.000000)
   Children(1)=(Name="Backward")
   bFixNumChildren=True
   Name="Default__TrAnimNodeBlendByGravCycleDirection"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
