/**
 * TrAnimNodeBlendByRidingPassenger.uc
 */

class TrAnimNodeBlendByRidingPassenger extends TrAnimNodeBlendList
		native;

/** TrPawn owner */
var transient TrPawn m_TrPawn;

/** Fire anim sequence name. */
var() name m_nmFireAnimSeqNodeName;

/** Fire anim sequence. */
var() AnimNodeSequence m_FireAnimSeqNode;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function PlayIdle();
native function PlayFire(float RefireTime, name FireAnimName, float ReloadTime);
native function PlayReload(float ReloadTime);
native function PlayOffhand();

defaultproperties
{
   bPlayActiveChild=True
   Children(0)=(Name="Idle")
   Children(1)=(Name="Fire")
   Children(2)=(Name="reload")
   Children(3)=(Name="OffHand")
   NodeName="PassengerBlend"
   Name="Default__TrAnimNodeBlendByRidingPassenger"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
