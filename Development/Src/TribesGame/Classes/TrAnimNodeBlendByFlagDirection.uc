/**
 * Blends based on flag direction.
 */

class TrAnimNodeBlendByFlagDirection extends TrAnimNodeBlendList
    native;

enum EFlagAnimTypes
{
	FlagAnim_Idle,
	FlagAnim_Forward,
	FlagAnim_Back,
	FlagAnim_Left,
	FlagAnim_Right,
	FlagAnim_Up,
	FlagAnim_Down,
	FlagAnim_None
};

/** Holds the last used direction */
var const EFlagAnimTypes  LastDirection;

/** TrPawn owner */
var transient TrFlagBase m_TrFlagOwner;

/** How fast (squared) the flag must be moving to be considered non-idle. */
var() float m_fIdleSpeedSizeSq;

/** Additive animation node that controls the flag movement. */
var() name m_nmAdditiveAnimNodeName;
var AnimNodeAdditiveBlending m_AdditiveBlendNode;

/** How long to blend in and out of idle. */
var() float m_fIdleBlendInTime;
var() float m_fIdleBlendOutTime;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   m_fIdleSpeedSizeSq=10000.000000
   m_nmAdditiveAnimNodeName="AdditiveBlendNode"
   m_fIdleBlendInTime=0.250000
   m_fIdleBlendOutTime=0.200000
   bPlayActiveChild=True
   Children(0)=(Name="Idle",Weight=1.000000)
   Children(1)=(Name="Forward")
   Children(2)=(Name="back")
   Children(3)=(Name="Left")
   Children(4)=(Name="Right")
   Children(5)=(Name="Up")
   Children(6)=(Name="Down")
   bFixNumChildren=True
   Name="Default__TrAnimNodeBlendByFlagDirection"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
