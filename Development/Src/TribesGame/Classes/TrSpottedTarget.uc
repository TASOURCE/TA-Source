class TrSpottedTarget extends Actor
	native;

/** The actual actor that this target represents. */
var Actor m_SpottedActor;
var byte m_CachedTeamIndex;

/** Timestamp for when this target was last spotted. */
var float m_fLastSpottedTimestamp;

/** How much higher than the target location to draw the marker. */
var float m_fMarkerZOffset;

/** The current opacity of the marker */
var transient float m_fMarkerOpacity;

/** How long spotted actors should remain spotted. */
var float m_fSpottedActorDuration;

/** MIC used for the HUD marker */
var transient MaterialInstanceConstant m_MarkerMIC;
var transient Vector2D m_MarkerSize;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function PostBeginPlay()
{
	local TrPlayerController TrPC;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		TrPC = TrPlayerController(GetALocalPlayerController());
		if( TrPC != none && TrPC.myHUD != none )
		{
			TrPC.myHUD.AddPostRenderedActor(self);
		}
	}
}

function SetSpottedActor(Actor NewSpottedActor)
{
	m_SpottedActor = NewSpottedActor;
	m_fLastSpottedTimestamp = WorldInfo.TimeSeconds;
	m_CachedTeamIndex = m_SpottedActor.GetTeamNum();
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local vector ScreenLoc, TargetLocation;
	local TrHUD HUD;
	local LinearColor RenderColor;

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	// If hud is disabled while spectating, don't draw anything.
	if( PC.IsSpectating() )
	{
		return;
	}

	if( ShouldRenderMarker() )
	{
		if (m_markerMIC == none)
		{
			m_MarkerMIC = new(self) class'MaterialInstanceConstant';
			m_MarkerMIC.SetParent(class'TrHUD'.default.MarkerBaseMIC);
			m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', GetMarker());

			m_MarkerSize = vect2d(GetMarker().SizeX, GetMarker().SizeY);

			RenderColor = GetMarkerColor();
			RenderColor.A = m_fMarkerOpacity;

			m_MarkerMIC.SetVectorParameterValue('HudItem_Color', RenderColor);
		}

		TargetLocation = Location;
		TargetLocation.Z += m_fMarkerZOffset;
		Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, TargetLocation, ScreenLoc);
		ScreenLoc.Z = VSize(CameraPosition - Location);
		HUD.DrawMICMarker(m_MarkerMIC, ScreenLoc, Canvas, m_MarkerSize);
	}
}

simulated function bool ShouldRenderMarker()
{
	return Role < ROLE_Authority || (Role == ROLE_Authority && m_SpottedActor != none && m_SpottedActor.GetTeamNum() != GetALocalPlayerController().GetTeamNum());
}

simulated function Texture2D GetMarker()
{
	return class'TrHUD'.default.SpottedTarget;
}

simulated function LinearColor GetMarkerColor()
{
	return class'TrHUD'.default.MarkerColorEnemy;
}

defaultproperties
{
   m_CachedTeamIndex=255
   m_fMarkerZOffset=100.000000
   m_fSpottedActorDuration=3.000000
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bAlwaysRelevant=True
   bUpdateSimulatedPosition=True
   bPostRenderIfNotVisible=True
   bGameRelevant=True
   Name="Default__TrSpottedTarget"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
