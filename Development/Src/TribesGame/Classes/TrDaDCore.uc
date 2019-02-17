class TrDaDCore extends TrGameObjective
    abstract;

/** Shield bar MIC */
var MaterialInstanceConstant m_ShieldBarMIC;
var(OverheadIndicator) float m_fShieldBarPlacementY;

/** Capacitors that power the shields to this core. */
var() TrDaDCapacitor m_Capacitors[3];

/** Core shields. */
var transient editinline TrDaDCoreShield m_Shields[3];

/** Shell. */
var transient TrDaDShell m_Shell;

/** Core mesh. */
var StaticMeshComponent StaticMeshComponent;

simulated event PostBeginPlay()
{
	local TrGameReplicationInfo TrGRI;

	super.PostBeginPlay();

	// Initialize the capacitors.
	m_Capacitors[0].Init(self, 0);
	m_Capacitors[1].Init(self, 1);
	m_Capacitors[2].Init(self, 2);

	if( Role == ROLE_Authority )
	{
		// Initialize the shell.
		m_Shell = Spawn(class'TrDaDShell', self,,Location, Rotation,,true);
		m_Shell.SetCollisionType(COLLIDE_BlockAll);

		// Spawn the shields.
		SpawnShield(0);
		SpawnShield(1);
		SpawnShield(2);

		// bWorldGeometry needs to be disabled for the shields to properly base, but needs to be enabled
		// in order for the shell to rotate.
		m_Shell.bWorldGeometry = true;

		TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
		if( TrGRI != none )
		{
			TrGRI.r_DaDCore[DefenderTeamIndex] = self;
		}
	}
}

simulated function SpawnShield(int ShieldIndex)
{
	m_Shields[ShieldIndex] = Spawn(class'TrDaDCoreShield', self,,Location, Rotation,,true);
	m_Shields[ShieldIndex].Init(ShieldIndex, self);
	m_Shields[ShieldIndex].EnableBlocking();
	m_Shields[ShieldIndex].SetBase(m_Shell);
}

/** Called when a capacitor belonging to this core has been blown up. */
function OnCapacitorBlownUp(int CapacitorIndex)
{	
	if( Role == ROLE_Authority )
	{
		m_Shields[CapacitorIndex].DisableBlocking();

		switch( CapacitorIndex )
		{
			case 0:
				m_Shell.r_bShield0Up = false;
				break;
			case 1:
				m_Shell.r_bShield1Up = false;
				break;
			case 2:
				m_Shell.r_bShield2Up = false;
				break;
		}
		m_Shell.bNetDirty = true;
	}
}

/** Called when a capacitor belonging to this core has been restored. */
function OnCapacitorRestored(int CapacitorIndex)
{
	if( Role == ROLE_Authority )
	{
		m_Shields[CapacitorIndex].EnableBlocking();

		switch( CapacitorIndex )
		{
			case 0:
				m_Shell.r_bShield0Up = true;
				break;
			case 1:
				m_Shell.r_bShield1Up = true;
				break;
			case 2:
				m_Shell.r_bShield2Up = true;
				break;
		}
		m_Shell.bNetDirty = true;
	}
}

simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local float DamageScale;
	local class<TrDmgType_Base> TrDamageType;
	local TrValueModifier VM;
	local class<TrDevice> DamageWeaponClass;
	local TrPlayerReplicationInfo InstigatorTrPRI;
	local TR_EQUIP_POINT InstigatorWeaponEquipPoint;
	local TrPawn TrPawnInstigator;

	DamageScale = 1.0;

	TrDamageType = class<TrDmgType_Base>(DamageType);
	DamageScale *= TrDamageType.default.m_fDamageMultiplierAgainstArmor;

	if( TrDamageType != none && EventInstigator != none )
	{
		DamageWeaponClass = class<TrDevice>(TrDamageType.default.DamageWeaponClass);
		TrPawnInstigator = TrPawn(EventInstigator.Pawn);
		if( TrPawnInstigator != none && DamageWeaponClass != none )
		{
			// Perk/Skill
			InstigatorTrPRI = TrPlayerReplicationInfo(EventInstigator.PlayerReplicationInfo);
			if( InstigatorTrPRI != none )
			{
				VM = InstigatorTrPRI.GetCurrentValueModifier();
				if( VM != none )
				{
					InstigatorWeaponEquipPoint = InstigatorTrPRI.GetEquipPointByWeaponId(DamageWeaponClass.default.DBWeaponId);
					if( InstigatorWeaponEquipPoint == EQP_Primary )
					{
						DamageScale *= 1.0 + VM.m_fPrimaryWeaponArmorPenetrationBuffPct;
					}
					else if( InstigatorWeaponEquipPoint == EQP_Secondary )
					{
						DamageScale *= 1.0 + VM.m_fSecondaryWeaponArmorPenetrationBuffPct;
					}
					else if( InstigatorWeaponEquipPoint == EQP_Belt )
					{
						DamageScale *= 1.0 + VM.m_fOffhandArmorPenetrationBuffPct;
					}
				}
			}
		}
	}

	DamageAmount *= DamageScale;

	super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
}

/**
simulated function float GetHealthAmount()
{
	local TrGameReplicationInfo TrGRI;
	
	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if( TrGRI != none )
	{
		return TrGRI.r_CarrierCoreHealth[DefenderTeamIndex] / float(class'TrGame_TrStorm'.default.m_nMaxCoreHealth);
	}
}

simulated function float GetShieldAmount()
{
	local TrGameReplicationInfo TrGRI;
	
	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if( TrGRI != none )
	{
		return TrGRI.r_CarrierShieldHealth[DefenderTeamIndex] / float(class'TrGame_TrStorm'.default.m_nMaxShieldHealth);
	}
}
*/

function OnCoreDestroyed()
{
	// Kismet
	//TriggerEventClass(class'TrSeqEvent_StormCore', self, 0);
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local bool isFriendly, showingMarkers;
	local float MaxOffset, projectedHeight;
	local string displayName;
	local Texture2D marker;
	local TrDevice TrDev;
	local TrHUD HUD;
	local vector screenLoc, screenLocBot, vMarkerOffset, NamePlacement;
	local string InstigatorPlayerName;

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

	if( m_HealthBarMIC == none )
	{
		m_HealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_HealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	//if (!HUD.bShowObjectives) return;

	// Do not draw if we aren't facing the objective.
	if ((CameraDir dot (Location - CameraPosition)) <= 0.f)
		return;

	// Calculate positions.
	vMarkerOffset = MarkerOffset * vect(0,0,1);
	screenLoc = Canvas.Project(Location + vMarkerOffset);
	screenLocBot = Canvas.Project(Location);
	projectedHeight = abs(screenLoc.Y - screenLocBot.Y);

	// If we are clipped out, don't draw.
	if (screenLoc.X < 0 || screenLoc.X >= Canvas.ClipX || screenLoc.Y < 0 || screenLoc.Y >= Canvas.ClipY)
		return;

	// Calculate the health and determine if we are friendly.
	isFriendly = ((PC.IsSpectating() ? GetTeamNum() == 1 : WorldInfo.GRI.OnSameTeam(self, PC)) || DefenderTeamIndex == 255);

	// Calculate the display name.
	displayName = GetScreenName(PC);

    // Make sure we are visible.
	/*
    if (WorldInfo.TimeSeconds - LastPostRenderTraceTime > 0.5)
    {
        LastPostRenderTraceTime = WorldInfo.TimeSeconds + 0.2*FRand();
        bPostRenderTraceSucceeded = (FastTrace(Location, CameraPosition) || FastTrace(Location + vMarkerOffset, CameraPosition));
    }
*/

	// Calculate distance and 
    screenLoc.Z = VSize(CameraPosition - Location);

	MaxOffset=0.5;

	// Where is the crosshair?
	if( Abs(screenLoc.X - Canvas.ClipX * 0.5) < MaxOffset * 0.5 * Canvas.ClipX
		&& Abs((screenLoc.Y + projectedHeight) - Canvas.ClipY * 0.5) < MaxOffset * Canvas.ClipY )
	{
        HUD.bCrosshairOnFriendly = true;
        ShowHeaderUntil = WorldInfo.TimeSeconds + 1.0;
    }

	// Don't render behind weapon.
	if (TrPawn(PC.Pawn) != None)
	{
		TrDev = TrDevice(TrPawn(PC.Pawn).Weapon);

		if (TrDev != none && TrDev.CoversScreenSpace(screenLoc, Canvas))
			return;
	}

	if (m_markerMIC == none)
	{
		m_MarkerMIC = new(self) class'MaterialInstanceConstant';
		m_MarkerMIC.SetParent(class'TrHUD'.default.MarkerBaseMIC);
	}

	// Are we drawing the markers?
	showingMarkers = HUD.bShowObjectives || m_bForceShowHUD || (isFriendly && TrPlayerController(PC).NeedToVisitInventoryStation() && self.IsA('TrInventoryStation'));

	marker = GetMarker();
	m_MarkerMIC.SetVectorParameterValue('HudItem_Color', isFriendly ? class'TrHUD'.default.MarkerColorFriendly : class'TrHUD'.default.MarkerColorEnemy);
	m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', marker);

	// Draw the UI elements.
	if( ShowHeaderUntil > WorldInfo.TimeSeconds )
	{
		NamePlacement = screenLoc;
		NamePlacement.Y += m_fObjectiveNamePlacementY;

   	    HUD.DrawMarkerText(displayName, isFriendly, NamePlacement, Canvas);

		if( GetPossessiveInstigatorName(InstigatorPlayerName) )
		{
			NamePlacement = screenLoc;
			NamePlacement.Y += m_fInstigatorNamePlacementY;
			HUD.DrawMarkerText(InstigatorPlayerName, isFriendly, NamePlacement, Canvas);
		}

		if( bCanBeDamaged )
		{
			// Draw the health bar.
			m_HealthBarMIC.SetScalarParameterValue('Scal_Health',GetHealthAmount());
			m_HealthBarMIC.SetScalarParameterValue('SCAL_Friendly', isFriendly ? 1.0 : 0.0);
			HUD.DrawHealthBar(m_HealthBarMIC,isFriendly,ScreenLoc,Canvas, m_fObjectiveHealthBarPlacementX, m_fObjectiveHealthBarPlacementY, m_fObjectiveHealthBarWidth, m_fObjectiveHealthBarHeight);
		}
		
		if (marker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(marker.SizeX, marker.SizeY));
		}
	}
	// Are we drawing the marker?
	// BZ 8120: Remove 'HUD.bShowObjectives' from this if to have distance always be applied.
	else if (HUD.bShowObjectives || (screenLoc.Z < Class'TrPawn'.default.m_fShowObjectThreshold && showingMarkers))
	{		
		if (marker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(marker.SizeX, marker.SizeY));
		}
	}
}

simulated state BlownUp
{
	simulated event BeginState( Name PreviousStateName )
    {
		local TrGame_TrDaD DaDGame;
		super.BeginState(PreviousStateName);

        if (Role == ROLE_Authority)
        {
			DaDGame = TrGame_TrDaD(WorldInfo.Game);
			if( DaDGame != none )
			{
				DaDGame.OnCoreBlownUp(DefenderTeamIndex);
			}
        }
    }
}

simulated function int GetCeilPctScore()
{
	if( r_MaxHealth == 0 )
	{
		return 0;
	}
	return FCeil((float(r_Health) / float(r_MaxHealth)) * 100.0);
}

defaultproperties
{
   m_fShieldBarPlacementY=30.000000
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrGameObjective:AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrGameObjective:AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDaDCore:ObjectiveMesh.AnimNodeSeq0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDaDCore:MyLightEnvironment'
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=32000
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=96
   m_sScreenName="Relay Core"
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
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
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
   Components(4)=OnlineSound
   Components(5)=CriticalSound
   Components(6)=ShieldHitSound
   Components(7)=PowerDownSound
   Components(8)=DestroyedSound
   Components(9)=StaticMeshComponent0
   bWorldGeometry=True
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__TrDaDCore"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}
