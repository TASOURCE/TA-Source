class TrAnimNodeBlendByFlyingVehicleThrottle extends TrAnimNodeBlendList
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
   Children(0)=(Name="Throttle F")
   Children(1)=(Name="No Throttle",Weight=1.000000)
   Children(2)=(Name="Throttle B")
   Children(3)=(Name="Throttle Up")
   bFixNumChildren=True
   Name="Default__TrAnimNodeBlendByFlyingVehicleThrottle"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
