/**
 * Blends based on velocity.
 */

class TrAnimNodeBlendBySpeed extends AnimNodeBlendBySpeed
    native;

/** TrPawn owner */
var transient TrPawn m_TrPawn;

/** Scale the play rate based on speed */
var()	array<FLOAT>	m_BaseSpeed;

/** Ignore the Z velocity? */
var()	bool			m_bIgnoreZVelocity;

/** Any entries here will assume idle at all times when owner is in that physics state. */
var()	array<EPhysics>	m_IgnoredPhysics;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   m_bIgnoreZVelocity=True
   Name="Default__TrAnimNodeBlendBySpeed"
   ObjectArchetype=AnimNodeBlendBySpeed'Engine.Default__AnimNodeBlendBySpeed'
}
