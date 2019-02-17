/**
 * Basic blend list
 */

class TrAnimNodeBlendList extends AnimNodeBlendList
    native;

/** Custom blend in time for each child */
var()			Array<float>	m_ChildBlendInTime;

/** Blend time, if no child blend time is specified */
var()			float			m_fBlendTime;

/** Returns the blend time for a specific child. */
native function float GetBlendTime(int ChildIndex, optional bool bGetDefault);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   m_fBlendTime=0.200000
   Name="Default__TrAnimNodeBlendList"
   ObjectArchetype=AnimNodeBlendList'Engine.Default__AnimNodeBlendList'
}
