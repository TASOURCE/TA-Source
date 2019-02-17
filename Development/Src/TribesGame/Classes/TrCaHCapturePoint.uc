class TrCaHCapturePoint extends TrGameObjective
    placeable
    native;

/** LDs name the capture points. */
var string m_sCapturePointName;

/** Base turrets belonging to this point. */
var() array<TrBaseTurret_Neutral> m_BaseTurrets;

/** Base sensors belonging to this point. */
var() array<TrRadarStation_Neutral> m_BaseSensors;

/** Inventory Stations. */
var() array<TrInventoryStation_Neutral> m_InventoryStations;

/** Repair Stations. */
var() array<TrRepairStation_Neutral> m_RepairStations;

/** Holograms */
var StaticMeshComponent m_GroundBloodEagleHologramMesh;
var StaticMeshComponent m_GroundDiamondSwordHologramMesh;
var StaticMeshComponent m_SkyBloodEagleHologramMesh;
var StaticMeshComponent m_SkyDiamondSwordHologramMesh;
var StaticMeshComponent m_SkyPreviewHologramMesh;

/** Used for changing the color of the holograms. -1 for Enemy, 0 for Held Transition, 1 for Friendly. */
var MaterialInstanceConstant m_BloodEagleHologramMIC;
var MaterialInstanceConstant m_DiamondSwordHologramMIC;

/** Distance to draw holograms in the sky. */
var() float m_fSkyHologramOffsetX;
var() float m_fSkyHologramOffsetY;
var() float m_fSkyHologramOffsetZ;
var Vector m_vSkyHologramOffsetBE;
var Vector m_vSkyHologramOffsetDS;

/** Scale of the sky holograms. */
var() float m_fSkyHologramScaleOffset;
var float m_fSkyHologramScaleBE;
var float m_fSkyHologramScaleDS;

/** Skel control for sky hologram. */
var SkelControlSingleBone m_SkyHologramSkelControl;

/** Size of the radius that destroys enemy deployables, etc. */
var() float m_fInfluenceRadiusSize;

var vector  LastScreenLoc;
var vector  LastCameraDir;
var vector  LastCameraPos;

/** 'Held' means that this has been held for enough time to start generating points for the owning team. */
var repnotify bool r_bIsHeld;

/** Label the point, A, B, C, D, E, etc. */
var() CaHCapturePointLabel m_CapturePointLabel;

/** Size of the marker. */
var() editconst float m_MarkerSize;

/** A marker pulses when the point switches to held. */
var float m_fRemainingPulseMarkerTime;
var float m_fPulseMarkerTime;
var float m_fPulseMarkerSpeed;

/** A marker pulses when the point switches to held. */
var float m_fRemainingPointPulseMarkerTime;
var float m_fPointPulseMarkerTime;
var float m_fPointPulseMarkerSpeed;

/** The server sends down a pulse request for a client to play. */
var repnotify byte r_nFlashPointPulse;

/** The last player to capture this point. */
var TrPlayerController m_LastCapturedBy;

/** Keeps track of who has been nearby this point. */
struct native NearbyPlayer
{
	var TrPlayerController NearbyPC;
	var float Time;
	var float LastCheckedTimestamp;
};
var array<NearbyPlayer> m_NearbyPlayers;

/** How long to periodically check for nearby pawns. */
var float m_fNearbyPawnCheckTime;

/** How long a player must be at this point to get a Holding The Line accolade. */
var float m_HoldTheLineAccoladeTime;

replication
{
    if (bNetDirty && Role == ROLE_Authority)
        r_bIsHeld, r_nFlashPointPulse;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function PostBeginPlay()
{
	local int i;

	super.PostBeginPlay();

	if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // Set the animation tree.
		m_Mesh.SetAnimTreeTemplate(default.m_Mesh.AnimTreeTemplate);

		// Attach holograms to sockets
		m_Mesh.AttachComponentToSocket(m_GroundBloodEagleHologramMesh, 'GroundHologramSocketBE');
		m_Mesh.AttachComponentToSocket(m_GroundDiamondSwordHologramMesh, 'GroundHologramSocketDS');
		m_Mesh.AttachComponentToSocket(m_SkyBloodEagleHologramMesh, 'SkyHologramSocket');
		m_Mesh.AttachComponentToSocket(m_SkyDiamondSwordHologramMesh, 'SkyHologramSocket');

		// Set up materials.
		m_BloodEagleHologramMIC = m_GroundBloodEagleHologramMesh.CreateAndSetMaterialInstanceConstant(0);
		m_SkyBloodEagleHologramMesh.SetMaterial(0, m_BloodEagleHologramMIC);
		m_DiamondSwordHologramMIC = m_GroundDiamondSwordHologramMesh.CreateAndSetMaterialInstanceConstant(0);
		m_SkyDiamondSwordHologramMesh.SetMaterial(0, m_DiamondSwordHologramMIC);

		UpdateHologramVisibility();
    }

	// Check for none on Base Turrets and Sensors.
	for (i = 0; i < m_BaseSensors.Length; i++)
	{
		if (m_BaseSensors[i] == none)
		{
			;
			continue;
		}
	}

	for (i = 0; i < m_BaseTurrets.Length; i++)
	{
		if (m_BaseTurrets[i] == none)
		{
			;
			continue;
		}
	}

	// Switch over owned Inventory Stations.
	for( i=0;i<m_InventoryStations.Length;i++ )
	{
		if (m_InventoryStations[i] == none)
		{
			;
			continue;
		}

		m_InventoryStations[i].m_OwningCaHCapturePoint = self;
	}

	// Switch over owned Repair Stations.
	for(i=0; i < m_RepairStations.Length; i++)
	{
		if (m_RepairStations[i] == none)
		{
			;
			continue;
		}

		m_RepairStations[i].m_OwningCaHCapturePoint = self;
	}

	if( Role == ROLE_Authority )
	{
		SetTimer(m_fNearbyPawnCheckTime, true, 'CheckNearbyPlayersTimer');
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == m_Mesh )
    {
		m_SkyHologramSkelControl = SkelControlSingleBone(m_Mesh.FindSkelControl('SkyHologramOffset'));
    }
}

/** Pulses the marker (Tick() takes care of updating the marker material). */
simulated function PulseMarker()
{
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		m_fRemainingPulseMarkerTime = m_fPulseMarkerTime;
	}
}

simulated function PointPulseMarker()
{
	if( Role == ROLE_Authority )
	{
		r_nFlashPointPulse++;
	}

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		m_fRemainingPointPulseMarkerTime = m_fPointPulseMarkerTime;
	}
}

simulated event UpdateHologramVisibility()
{
	local TrPlayerController TrPC;

	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		return;
	}

	TrPC = TrPlayerController(GetALocalPlayerController());

	switch( DefenderTeamIndex )
	{
		case 0: 
			// Mesh visibility.
			m_SkyBloodEagleHologramMesh.SetHidden(false);
			m_GroundBloodEagleHologramMesh.SetHidden(false);
			m_GroundDiamondSwordHologramMesh.SetHidden(true);
			m_SkyDiamondSwordHologramMesh.SetHidden(true);

			// Update color.
			if( TrPC != none )
			{
				if( r_bIsHeld )
				{
					m_BloodEagleHologramMIC.SetScalarParameterValue('TeamColor', TrPC.GetTeamNum() == 0 ? 1 : -1);
				}
				else
				{
					m_BloodEagleHologramMIC.SetScalarParameterValue('TeamColor', 0);
				}
			}

			// Udpate position of sky hologram.
			if( m_SkyHologramSkelControl != none )
			{
				m_SkyHologramSkelControl.BoneTranslation.X = m_Mesh.Translation.X + m_vSkyHologramOffsetBE.X + m_fSkyHologramOffsetX;
				m_SkyHologramSkelControl.BoneTranslation.Y = m_Mesh.Translation.Y + m_vSkyHologramOffsetBE.Y + m_fSkyHologramOffsetY;
				m_SkyHologramSkelControl.BoneTranslation.Z = m_Mesh.Translation.Z + m_vSkyHologramOffsetBE.Z + m_fSkyHologramOffsetZ;
				m_SkyHologramSkelControl.BoneScale = m_fSkyHologramScaleBE * m_fSkyHologramScaleOffset;
			}

			break;
		case 1:
			// Mesh visibility.
			m_SkyBloodEagleHologramMesh.SetHidden(true);
			m_GroundBloodEagleHologramMesh.SetHidden(true);
			m_GroundDiamondSwordHologramMesh.SetHidden(false);
			m_SkyDiamondSwordHologramMesh.SetHidden(false);

			if( TrPC != none )
			{
				// Update color.
				if( r_bIsHeld )
				{
					m_DiamondSwordHologramMIC.SetScalarParameterValue('TeamColor', TrPC.GetTeamNum() == 0 ? -1 : 1);
				}
				else
				{
					m_DiamondSwordHologramMIC.SetScalarParameterValue('TeamColor', 0);
				}
			}

			// Udpate position of sky hologram.
			if( m_SkyHologramSkelControl != none )
			{
				m_SkyHologramSkelControl.BoneTranslation.X = m_Mesh.Translation.X + m_vSkyHologramOffsetDS.X + m_fSkyHologramOffsetX;
				m_SkyHologramSkelControl.BoneTranslation.Y = m_Mesh.Translation.Y + m_vSkyHologramOffsetDS.Y + m_fSkyHologramOffsetY;
				m_SkyHologramSkelControl.BoneTranslation.Z = m_Mesh.Translation.Z + m_vSkyHologramOffsetDS.Z + m_fSkyHologramOffsetZ;
				m_SkyHologramSkelControl.BoneScale = m_fSkyHologramScaleDS * m_fSkyHologramScaleOffset;
			}
			break;
		default:
			m_SkyBloodEagleHologramMesh.SetHidden(true);
			m_GroundBloodEagleHologramMesh.SetHidden(true);
			m_GroundDiamondSwordHologramMesh.SetHidden(true);
			m_SkyDiamondSwordHologramMesh.SetHidden(true);
	}
}

simulated event ReplicatedEvent(name VarName)
{   
    if( VarName == 'DefenderTeamIndex' )
    {
        UpdateHologramVisibility();
    }
	else if( VarName == 'r_bIsHeld' )
	{
		PulseMarker();
		UpdateHologramVisibility();
	}
	else if( VarName == 'r_nFlashPointPulse' )
	{
		if( DefenderTeamIndex == GetALocalPlayerController().GetTeamNum() )
		{
			PointPulseMarker();
		}
	}
    super.ReplicatedEvent(VarName);
}

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local TrPawn TrP;

	TrP = TrPawn(Other);
	if( TrP != none )
	{
		OnPawnTouched(TrP);
	}
	super.Touch(Other, OtherComp, HitLocation, HitNormal);
}

simulated function OnPawnTouched(TrPawn TrP)
{
	local int i, PawnTeamNum;
	local TrGameReplicationInfo TrGRI;
	local TrGame_TrCaH TrG;
	local TrPlayerController TrPC;

	TrG = TrGame_TrCaH(WorldInfo.Game);
	if( Role == ROLE_Authority )
	{
		TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
		if( TrGRI != none && TrGRI.bWarmupRound )
		{
			// Don't allow capturing during a warmup round.
			return;
		}

		if( TrP != none && TrP.IsAliveAndWell() )
		{
			PawnTeamNum = TrP.GetTeamNum();

			// Make sure our capturing pawn is on a valid team.
			if( !(PawnTeamNum == 0 || PawnTeamNum == 1) )
			{
				return;
			}

			if( DefenderTeamIndex != PawnTeamNum )
			{
				// Switch ownership to this pawn's team.
				DefenderTeamIndex = PawnTeamNum;

				// Remember who captured this point.
				m_LastCapturedBy = TrPlayerController(TrP.Controller);

				// Switch over owned turrets.
				for( i=0;i<m_BaseTurrets.Length;i++ )
				{
					if (m_BaseTurrets[i] != none)
					{
						m_BaseTurrets[i].DefenderTeamIndex = 255;
						m_BaseTurrets[i].m_bEnabled = false;
						m_BaseTurrets[i].bNetDirty = true;
					}
				}

				// Switch over owned sensors.
				for( i=0;i<m_BaseSensors.Length;i++ )
				{
					if (m_BaseSensors[i] != none)
					{
						m_BaseSensors[i].DefenderTeamIndex = 255;
						m_BaseSensors[i].bNetDirty = true;
					}
				}

				// Switch over owned Inventory Stations.
				for( i=0;i<m_InventoryStations.Length;i++ )
				{
					if (m_InventoryStations[i] != none)
					{
						m_InventoryStations[i].DefenderTeamIndex = 255;
						m_InventoryStations[i].bNetDirty = true;
					}
				}

				// Switch over owned Repair Stations.
				for( i=0;i<m_RepairStations.Length;i++ )
				{
					if( m_RepairStations[i] != none )
					{
						m_RepairStations[i].DefenderTeamIndex = 255;
						m_RepairStations[i].bNetDirty = true;
					}
				}
				
				r_bIsHeld = false;

				UpdateHologramVisibility();

				// Award the point and re-enable turrets after a short pause.
				SetTimer(TrG.m_nPostCapturePointTime, false, 'PostCapturePointTimer');
				ClearTimer('AwardPointTimer');

				// Notify the game about this event.
				TrG.OnCapturePointOwnershipChanged(self, TrP);

				// Pulse the player.
				TrP.PulseStealth(true);
				TrP.r_nPulseStealth++;

				TrPC = TrPlayerController(TrP.Controller);
				if( TrPC != none )
				{
					// Pulse the HUD for the pawn.
					TrPC.ClientPulseHUD(2);
				}

				bNetDirty = true;
			}
		}
	}
}

/** Called once the point has entered a 'held' state. */
function PostCapturePointTimer()
{
	local int i;
	local TrGame_TrCaH TrG;

	TrG = TrGame_TrCaH(WorldInfo.Game);
	if( TrG != none )
	{
		// Switch over owned turrets.
		for( i=0;i<m_BaseTurrets.Length;i++ )
		{
			if (m_BaseTurrets[i] != none)
			{
				m_BaseTurrets[i].DefenderTeamIndex = DefenderTeamIndex;
				m_BaseTurrets[i].m_bEnabled = true;
				m_BaseTurrets[i].bNetDirty = true;
				m_BaseTurrets[i].InstantlyRegenerateHealth();
			}
		}

		// Switch over owned sensors.
		for( i=0;i<m_BaseSensors.Length;i++ )
		{
			if (m_BaseSensors[i] != none)
			{
				m_BaseSensors[i].DefenderTeamIndex = DefenderTeamIndex;
				m_BaseSensors[i].bNetDirty = true;
				m_BaseSensors[i].InstantlyRegenerateHealth();
			}
		}

		// Switch over owned Inventory Stations.
		for( i=0;i<m_InventoryStations.Length;i++ )
		{
			if (m_InventoryStations[i] != none)
			{
				m_InventoryStations[i].DefenderTeamIndex = DefenderTeamIndex;
				m_InventoryStations[i].bNetDirty = true;
			}
		}

		// Switch over owned Repair Stations.
		for( i=0;i<m_RepairStations.Length;i++ )
		{
			if( m_RepairStations[i] != none )
			{
				m_RepairStations[i].DefenderTeamIndex = DefenderTeamIndex;
				m_RepairStations[i].bNetDirty = true;
			}
		}

		// Award a point.
		TrG.AwardPoint(DefenderTeamIndex);

		if( !r_bIsHeld )
		{
			// The point is now considered held.
			r_bIsHeld = true;
			TrG.OnCapturePointHeld(self);
			UpdateHologramVisibility();
			PulseMarker();
		}

		SetTimer(TrG.m_nTicketCountTime, true, 'AwardPointTimer');
	}
}

function AwardPointTimer()
{
	local TrGame_TrCaH TrG;

	TrG = TrGame_TrCaH(WorldInfo.Game);
	if( TrG != none )
	{
		TrG.AwardPoint(DefenderTeamIndex);
		PointPulseMarker();
	}
}

simulated function bool ShouldPostRenderForCaH()
{
	return true;
}

simulated function string GetScreenName(PlayerController PC)
{
	switch( m_CapturePointLabel )
	{
		case CaHCapturePoint_A: return "A";
		case CaHCapturePoint_B: return "B";
		case CaHCapturePoint_C: return "C";
		case CaHCapturePoint_D: return "D";
		case CaHCapturePoint_E: return "E";
	}
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local vector ScreenLoc, vMarkerOffset;
	local TrHUD HUD;
	local bool bAlongScreenEdges;

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	// If hud is disabled while spectating, don't draw anything.
	if( PC.IsSpectating() )
	{
		if( !TrPlayerController(PC).m_bShowSpectatorHUD )
		{
			return;
		}
	}

	vMarkerOffset = MarkerOffset * vect(0,0,1);
	bAlongScreenEdges = Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, Location + vMarkerOffset, ScreenLoc);



	// If a large difference in screen positions happens and there wasn't a huge difference in camera direction and position, go with the previous screen pos.
	// If the flag was recently returned, jump to it's new location.
	if (bAlongScreenEdges && VSize(ScreenLoc - LastScreenLoc) > 200.0f && VSize(CameraDir * 200 - LastCameraDir * 200) < 100.0f && VSize(CameraPosition - LastCameraPos) < 200.0f)
		ScreenLoc = LastScreenLoc;
	// Save the new location.
	else
	{
		LastScreenLoc = ScreenLoc;
		LastCameraDir = CameraDir;
		LastCameraPos = CameraPosition;
	}

	if (m_markerMIC == none)
	{
		m_MarkerMIC = new(self) class'MaterialInstanceConstant';
		m_MarkerMIC.SetParent(MaterialInstanceConstant'Hud_CaH.Materials.MIC_CaH');
		m_MarkerMIC.SetScalarParameterValue('Scal_CapPoint', m_CapturePointLabel);
	}

	ScreenLoc.Z = VSize(CameraPosition - Location);

	HUD.DrawMICMarker(m_MarkerMIC, ScreenLoc, Canvas, vect2d(m_MarkerSize, m_MarkerSize));
}

/** Lets pawns know that a control point is attempting to add them to its NearbyPlayers list. */
function CheckNearbyPlayersTimer()
{
	local TrPawn TrP;
	local int i, PlayerIndex;
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if( TrGRI == none || TrGRI.bWarmupRound )
	{
		// Don't attempt to give out accolades if we are warming up.
		return;
	}

	if( DefenderTeamIndex != 255 )
	{
		foreach WorldInfo.AllPawns(class'TrPawn', TrP, Location, m_fInfluenceRadiusSize)
		{
			PlayerIndex = INDEX_NONE;

			// Find the existing nearby player.
			for( i = 0; i < m_NearbyPlayers.Length; i++ )
			{
				if( m_NearbyPlayers[i].NearbyPC == TrP.Controller )
				{
					PlayerIndex = i;
					break;
				}
			}

			if( PlayerIndex == INDEX_NONE )
			{
				// No existing nearby player found, attempt to add them to our list.
				if( IsPawnConsideredNearby(TrP) )
				{
					PlayerIndex = m_NearbyPlayers.Add(1);
					m_NearbyPlayers[PlayerIndex].NearbyPC = TrPlayerController(TrP.Controller);
					m_NearbyPlayers[PlayerIndex].Time = 0.0;
					m_NearbyPlayers[PlayerIndex].LastCheckedTimestamp = WorldInfo.TimeSeconds;
				}
			}
			else
			{
				if( IsPawnConsideredNearby(TrP) )
				{
					m_NearbyPlayers[PlayerIndex].Time += m_fNearbyPawnCheckTime;
					m_NearbyPlayers[PlayerIndex].LastCheckedTimestamp = WorldInfo.TimeSeconds;

					if( m_NearbyPlayers[PlayerIndex].Time > m_HoldTheLineAccoladeTime )
					{
						// This player deserves an accolade.
						m_NearbyPlayers[PlayerIndex].NearbyPC.m_AccoladeManager.QueueAccolade(class'TrAccolade_HoldTheLine');

						// Reset the time.
						m_NearbyPlayers[PlayerIndex].Time = FMax(0.0, m_NearbyPlayers[PlayerIndex].Time - m_HoldTheLineAccoladeTime);
					}
				}
				else
				{
					// The pawn no longer belongs to the list.
					m_NearbyPlayers.Remove(PlayerIndex, 1);
				}
			}
		}

		// Walk though the list a final time and remove any entries that were not updated.
		for( i = 0; i < m_NearbyPlayers.Length; i++ )
		{
			if( m_NearbyPlayers[i].LastCheckedTimestamp != WorldInfo.TimeSeconds )
			{
				m_NearbyPlayers.Remove(i, 1);
			}
		}
	}

	// DEBUG
	/*
	`log(self@"Nearby players:");
	for( i = 0; i < m_NearbyPlayers.Length; i++ )
	{
		`log(i@m_NearbyPlayers[i].NearbyPC@m_NearbyPlayers[i].Time);
	}
	*/
}

function bool IsPawnConsideredNearby(TrPawn TrP)
{
	if( !TrP.IsAliveAndWell() )
	{
		// Player is dead.
		return false;
	}

	if( r_bIsHeld )
	{
		if( TrP.GetTeamNum() != DefenderTeamIndex )
		{
			// The point is held by the enemy.
			return false;
		}
	}
	return true;
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=GroundBloodEagleHologram
      ReplacementPrimitive=None
      HiddenEditor=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Translation=(X=0.000000,Y=0.000000,Z=100.000000)
      Rotation=(Pitch=0,Yaw=-16384,Roll=0)
      Scale3D=(X=0.550000,Y=0.550000,Z=0.550000)
      Name="GroundBloodEagleHologram"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   m_GroundBloodEagleHologramMesh=GroundBloodEagleHologram
   Begin Object Class=StaticMeshComponent Name=GroundDiamondSwordHologram
      ReplacementPrimitive=None
      HiddenEditor=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Translation=(X=0.000000,Y=0.000000,Z=120.000000)
      Rotation=(Pitch=0,Yaw=-16384,Roll=0)
      Scale3D=(X=0.500000,Y=0.500000,Z=0.500000)
      Name="GroundDiamondSwordHologram"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   m_GroundDiamondSwordHologramMesh=GroundDiamondSwordHologram
   Begin Object Class=StaticMeshComponent Name=SkyBloodEagleHologram
      ReplacementPrimitive=None
      HiddenEditor=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Name="SkyBloodEagleHologram"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   m_SkyBloodEagleHologramMesh=SkyBloodEagleHologram
   Begin Object Class=StaticMeshComponent Name=SkyDiamondSwordHologram
      ReplacementPrimitive=None
      HiddenEditor=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnServer=False
      Name="SkyDiamondSwordHologram"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   m_SkyDiamondSwordHologramMesh=SkyDiamondSwordHologram
   Begin Object Class=StaticMeshComponent Name=EditorPreviewSkyHologram
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Translation=(X=0.000000,Y=0.000000,Z=1000.000000)
      Rotation=(Pitch=0,Yaw=-16384,Roll=0)
      Scale3D=(X=2.500000,Y=2.500000,Z=2.500000)
      Name="EditorPreviewSkyHologram"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   m_SkyPreviewHologramMesh=EditorPreviewSkyHologram
   m_fSkyHologramOffsetZ=1000.000000
   m_vSkyHologramOffsetDS=(X=0.000000,Y=0.000000,Z=20.000000)
   m_fSkyHologramScaleOffset=1.000000
   m_fSkyHologramScaleBE=2.550000
   m_fSkyHologramScaleDS=2.500000
   m_fInfluenceRadiusSize=4800.000000
   m_MarkerSize=35.000000
   m_fRemainingPulseMarkerTime=-1.000000
   m_fPulseMarkerTime=1.400000
   m_fPulseMarkerSpeed=1.900000
   m_fRemainingPointPulseMarkerTime=-1.000000
   m_fPointPulseMarkerTime=1.400000
   m_fPointPulseMarkerSpeed=1.900000
   m_fNearbyPawnCheckTime=2.500000
   m_HoldTheLineAccoladeTime=15.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrCaHCapturePoint:MyLightEnvironment'
      AlwaysLoadOnServer=False
      Translation=(X=0.000000,Y=0.000000,Z=15.000000)
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=7000
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=20
   m_bForceShowHUD=True
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   m_fObjectiveHealthBarPlacementY=20.000000
   DefenderTeamIndex=255
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
      CollisionHeight=58.000000
      CollisionRadius=45.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Translation=(X=0.000000,Y=0.000000,Z=75.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Components(5)=OnlineSound
   Components(6)=CriticalSound
   Components(7)=ShieldHitSound
   Components(8)=PowerDownSound
   Components(9)=DestroyedSound
   Begin Object Class=StaticMeshComponent Name=EditorPreviewHologram
      ReplacementPrimitive=None
      HiddenGame=True
      CastShadow=False
      CollideActors=False
      BlockRigidBody=False
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Translation=(X=0.000000,Y=0.000000,Z=100.000000)
      Rotation=(Pitch=0,Yaw=-16384,Roll=0)
      Scale3D=(X=0.550000,Y=0.550000,Z=0.550000)
      Name="EditorPreviewHologram"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(10)=EditorPreviewHologram
   Components(11)=EditorPreviewSkyHologram
   Components(12)=CollisionCylinder
   Begin Object Class=DrawSphereComponent Name=DrawSphere
      SphereColor=(B=231,G=239,R=255,A=255)
      SphereRadius=500.000000
      SphereSides=32
      ReplacementPrimitive=None
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      AbsoluteScale=True
      Name="DrawSphere"
      ObjectArchetype=DrawSphereComponent'Engine.Default__DrawSphereComponent'
   End Object
   Components(13)=DrawSphere
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   bCanBeDamaged=False
   bBlockActors=False
   bProjTarget=False
   CollisionComponent=CollisionCylinder
   Name="Default__TrCaHCapturePoint"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}
