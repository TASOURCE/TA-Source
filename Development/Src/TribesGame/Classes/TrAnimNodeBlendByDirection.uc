/**
 * TrAnimNodeBlendByDirection.uc
 */

class TrAnimNodeBlendByDirection extends AnimNodeSequenceBlendBase
		native;

var() float	m_fBlendSpeed;

/** Internal */
var float m_fDirAngle;

/** Internal variable, to not interpolate weights when node comes into relevancy for the final blend */
var const transient bool m_bInterpolateWeights;

/** 
 * If TRUE, then if the owner'd direction is within any range from 50% of 
 * the Forward Left direction, then the Forward Left direction is forced.
 */
var() bool m_bForwardLeftCorrection;

/** TrPawn owner */
var transient TrPawn m_TrPawn;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   m_fBlendSpeed=10.000000
   Anims(0)=(AnimName="Forward")
   Anims(1)=(AnimName="Backward")
   Anims(2)=(AnimName="Left")
   Anims(3)=(AnimName="Right")
   Anims(4)=(AnimName="ForwardRight")
   Anims(5)=(AnimName="ForwardLeft")
   Anims(6)=(AnimName="BackRight")
   Anims(7)=(AnimName="BackLeft")
   Name="Default__TrAnimNodeBlendByDirection"
   ObjectArchetype=AnimNodeSequenceBlendBase'Engine.Default__AnimNodeSequenceBlendBase'
}
