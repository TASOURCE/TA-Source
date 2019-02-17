class TrAnimNodeAimOffset extends AnimNodeAimOffset
	native
	hidecategories(Object);

/** TrPawn owner */
var transient TrPawn m_TrPawn;

/** TrDevice owner */
var transient TrDevice m_TrDevice;

/** Amount of turning offset from turn in place. */
var() const transient FLOAT	 m_fTurnInPlaceOffset;

/** Interpolation when looping around, so it doesn't look weird */
var transient const vector2d	m_v2dLastAimOffset, m_v2dLastPostProcessedAimOffset;
var transient const	FLOAT		m_fTurnAroundTimeToGo;
var()	FLOAT					m_fTurnAroundBlendTime;

var(Random)	bool		m_bRandomAimPointsEnabled;
var(Random)	vector2d	m_RandomAimPointsRangeX;
var(Random)	vector2d	m_RandomAimPointsRangeY;
var(Random)	float		m_fRandomAimPointsInterpRate;
var(Random) float		m_fRandomAimPointsIntervalMin;
var(Random) float		m_fRandomAimPointsIntervalMax;
var			float		m_fCurrentRandomAimPointsInterval;
var			vector2d	m_TargetRandomAimLocation;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   m_RandomAimPointsRangeX=(X=-1.000000,Y=1.000000)
   m_RandomAimPointsRangeY=(X=-1.000000,Y=1.000000)
   m_fRandomAimPointsInterpRate=8.000000
   m_fRandomAimPointsIntervalMin=1.000000
   m_fRandomAimPointsIntervalMax=2.000000
   Name="Default__TrAnimNodeAimOffset"
   ObjectArchetype=AnimNodeAimOffset'Engine.Default__AnimNodeAimOffset'
}
