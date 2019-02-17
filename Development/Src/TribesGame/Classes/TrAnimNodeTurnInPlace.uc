/** 
 * Blender to handle turning in place transitions
 */
class TrAnimNodeTurnInPlace extends AnimNodeBlend
    native;

/** TrPawn owner */
var transient TrPawn m_TrPawn;

/** Node needs to be initialized to track Pawn rotations */
var const transient bool m_bInitialized;

/** Track Pawn rotation changes */
var const transient int m_nLastPawnYaw;
var const transient int m_nLastPawnPitch;

/** Pawn rotation rate for this frame */
var const transient float   m_fPawnRotationRate;

/** TurnInPlace transition animation Root Bone Rotation tracking */
var const transient	int     m_nLastRootBoneYaw;
var const transient	bool    m_bRootRotInitialized;

/** Current Yaw offset between camera and Pawn */
var()   const transient	int m_nYawOffset;

var()	const transient int m_nPitchOffset;

/** If TRUE, rotator will not change yaw offset for this node. */ 
var()	bool    m_bDisableRotation;

/** 
 * If TRUE, this node will try to delay his parent from blending to another child,
 * So the turn in place animation can play fully.
 */
var()	bool    m_bDelayBlendOutToPlayAnim;

/** relative offset, applied to AimOffset nodes */
var		const transient	float   m_fRelativeOffset;

/** Offset Nodes */
var		Array<TrAnimNodeAimOffset>	m_OffsetNodes;

struct native RotTransitionInfo
{
	var()	Float	RotationOffset;
	var()	Name	TransName;
};

var()	Array<RotTransitionInfo>	m_RotTransitions;

var()	float						m_fTransitionBlendTime;
var		const bool					m_bPlayingTurnTransition;
var		const INT					m_nCurrentTransitionIndex;

var()	float						m_fTransitionThresholdAngle;

/** Options for forcing a transition type */
enum ForcedTransitionAngle
{
	FTA_NONE,	// Don't force anything
	FTA_90,		// Force 90 degree turns (180 will never play)
	FTA_180		// Force 180 degree (90 will never play)
};

/** Should the turn angle be forced? */
var(ChooseNewTransition)	ForcedTransitionAngle	m_ForcedTransitionAngle;

/** 
 * If TRUE, this node can opt to pick a better animation to play while playing
 * another animation
 */
var(ChooseNewTransition)	bool	m_bCanChooseNewTransition;

/**
 * If we are able to choose a better animation, specify what how long 
 * (percent) a valid window will last (valid between 0-1)
 */
var(ChooseNewTransition)	float	m_fChooseNewTransitionPercent;

/** 
 * If TRUE, specify a length (in seconds) for the interpolated rotation. If FALSE,
 * use the length of the animation sequence
 */
var(Interpolation)			bool	m_bOverrideInterpolationTime;

/** Time (in seconds) that it will take for the rotation interpolation to happen */
var(Interpolation)			float	m_fInterpolationTime;

var							float	m_RemainingInterpolationTime;

/** 
 * Internal, cached arra of player nodes.
 * Used to play different types of transition animations.
 */
var		Array<TrAnimNodeTurnInPlace_Player>	m_PlayerNodes;

/** 
 * If TRUE, mirror left and right directions if owner has a mirror node and that
 * node jas mirroring enabled.
 */
var()	bool	m_bMirrorOffsetWhenPawnMirrored;

var()	bool	m_bAlwaysUpdateYawOffset;

var(IgnoreTransitionAnimations)	bool	m_bIgnoreTransitionAnimations;
var(IgnoreTransitionAnimations) float	m_fIgnoredTransitionTime;
var(IgnoreTransitionAnimations) bool	m_bOnlyUpdateRotationWhenMoving;

var(TurnTowardsVelocity)	bool	m_bTurnTowardsVelocity;
var(TurnTowardsVelocity)	float	m_fTurnInterpTime;
var(TurnTowardsVelocity)	bool	m_bUsePawnRotationAtZeroVelocity;
var(TurnTowardsVelocity)	bool	m_bUse180ShortestRoute;
var(TurnTowardsVelocity)	bool	m_bConstrictIdleYawOffset;
var							rotator	m_InterpRotation;

var()	bool	m_bDisableAllTurning;

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
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   m_bCanChooseNewTransition=True
   m_RotTransitions(0)=(RotationOffset=16384.000000,TransName="Rt_90")
   m_RotTransitions(1)=(RotationOffset=32768.000000,TransName="Rt_180")
   m_RotTransitions(2)=(RotationOffset=-16384.000000,TransName="Lt_90")
   m_RotTransitions(3)=(RotationOffset=-32768.000000,TransName="Lt_180")
   m_fTransitionBlendTime=0.100000
   m_fTransitionThresholdAngle=4096.000000
   m_fChooseNewTransitionPercent=0.500000
   m_fIgnoredTransitionTime=2.000000
   Children(0)=(Name="Source")
   Children(1)=(Name="TurnTransition")
   Name="Default__TrAnimNodeTurnInPlace"
   ObjectArchetype=AnimNodeBlend'Engine.Default__AnimNodeBlend'
}
