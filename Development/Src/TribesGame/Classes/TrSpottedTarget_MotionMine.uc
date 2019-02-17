class TrSpottedTarget_MotionMine extends TrSpottedTarget
	native;

var transient float m_fCurrentMarkerTime;
var transient float m_fMarkerBlinkSpeed;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event Tick(float DeltaTime)
{
	m_fCurrentMarkerTime += DeltaTime * m_fMarkerBlinkSpeed;
	m_fMarkerOpacity = (sin(m_fCurrentMarkerTime) + 1.0) / 2.0;
	super.Tick(DeltaTime);
}

simulated function Texture2D GetMarker()
{
	return class'TrHUD'.default.SpottedTarget_MotionMine;
}

simulated function LinearColor GetMarkerColor()
{
	return class'TrHUD'.default.MarkerColorFriendly;
}

simulated function bool ShouldRenderMarker()
{
	return Role < ROLE_Authority || (Role == ROLE_Authority && m_SpottedActor != none && m_SpottedActor.GetTeamNum() == GetALocalPlayerController().GetTeamNum());
}

defaultproperties
{
   m_fSpottedActorDuration=7.000000
   Name="Default__TrSpottedTarget_MotionMine"
   ObjectArchetype=TrSpottedTarget'TribesGame.Default__TrSpottedTarget'
}
