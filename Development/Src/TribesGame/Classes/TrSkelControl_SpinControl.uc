/* 
 * TrSkelControl_SpinControl 
 */

class TrSkelControl_SpinControl extends SkelControlSingleBone
	native
    hidecategories(Adjustments,Translation);

/** How fast is to spin. */
var(Spin) float 	m_fDegreesPerSecond;

/** Axis to spin about. */
var(Spin) vector	m_vAxis;

/** Preview start/stop spin. */
var(Spin)	transient editoronly	bool 	m_PreviewStartStop;

/** The time it takes to spin to full speed. */
var(Spin) float	m_fSpinUpTime;

/** The time it takes to spin down to zero speed. */
var(Spin) float	m_fSpinDownTime;

/** Is the control spinning?*/
var bool	m_bIsSpinning;
var bool	m_bSpinningUp;
var bool	m_bSpinningDown;
var float	m_fCurrentDegreesPerSecond;

var(TargetRotation) rotator	m_TargetRotation;
var(TargetRotation) float	m_TimeToInterpToTargetRotation;
var(TargetRotation) bool	m_bRotateToTargetRotation;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function Spin(bool bEnabled);
native function SpinToTargetRotation(rotator TargetRotation, optional float Time, optional bool bReset);

defaultproperties
{
   m_fDegreesPerSecond=180.000000
   bApplyRotation=True
   bAddRotation=True
   BoneRotationSpace=BCS_ActorSpace
   Name="Default__TrSkelControl_SpinControl"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
