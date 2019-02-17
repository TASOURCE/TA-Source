/**
 * Basic blend list
 */

class TrAnimNodeBlendByPhysics extends TrAnimNodeBlendList
    dependson(Actor)
    native;

/** TrPawn owner */
var transient TrPawn m_TrPawn;

/** Holds the last known Posture type for the tree's owner */
var EPhysics    m_LastPhysics;

/**	Holds the current Posture type for the tree's owner */
var EPhysics    m_CurrentPhysics;

/** Stores the child index for the current posture */
var int m_CurrentPhysicsChildIndex;

/** Array of posture transition sets */
var()   array<EPhysics> m_PhysicsChildren;

/** If TRUE, any physics mode not included as a child will use child 0.*/
var()   bool    m_bDirectUnspecifiedPhysicsThroughChild0;

/** Allow for specific per-physics blends (i.e. flying to falling may be different than flying to walking). */
struct native ChildBlendInfo
{
	/** Name of the physics state we are blending to. */
	var() EPhysics			m_PhysicsState;

	/** The time it takes to blend from the current physics state to this one. */
	var() float				m_fBlendTime;
};

struct native ChildrenBlendInfo
{
	/** Name of the physics state we are blending from. */
	var() EPhysics			m_PhysicsState;

	/** Pairings of a name and blend time for the physics state we're blending to. */
	var() array<ChildBlendInfo>	m_ChildBlendInfo;
};

/** Per-physics blends */
var()	array<ChildrenBlendInfo>	m_ChildrenBlendInfo;

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
   m_PhysicsChildren(0)=PHYS_Walking
   m_bDirectUnspecifiedPhysicsThroughChild0=True
   Children(0)=(Name="PHYS_Walking",Weight=1.000000)
   Name="Default__TrAnimNodeBlendByPhysics"
   ObjectArchetype=TrAnimNodeBlendList'TribesGame.Default__TrAnimNodeBlendList'
}
