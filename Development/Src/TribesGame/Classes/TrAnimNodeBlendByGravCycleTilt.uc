class TrAnimNodeBlendByGravCycleTilt extends AnimNodeBlendBase
	native;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var     float   m_fTiltAmount;
var()	float   m_fTiltScale;
var()	name    m_RootBoneName;
var()   float   m_fDeadZone;

defaultproperties
{
   m_fTiltScale=1.000000
   m_RootBoneName="Root"
   Children(0)=(Name="Left")
   Children(1)=(Name="Flat",Weight=1.000000)
   Children(2)=(Name="Right")
   bFixNumChildren=True
   Name="Default__TrAnimNodeBlendByGravCycleTilt"
   ObjectArchetype=AnimNodeBlendBase'Engine.Default__AnimNodeBlendBase'
}
