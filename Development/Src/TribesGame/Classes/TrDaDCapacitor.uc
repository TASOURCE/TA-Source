class TrDaDCapacitor extends TrGameObjective
    abstract;

/** Shield bar MIC */
var MaterialInstanceConstant m_ShieldBarMIC;
var(OverheadIndicator) float m_fShieldBarPlacementY;

/** The core that this capacitor helps power. */
var transient TrDaDCore m_Core;

/** The index for this capacitor. */
var transient int m_CapacitorIndex;

/** Capacitor mesh. */
var StaticMeshComponent StaticMeshComponent;

/** "A" */
var localized string StringA;

/** "B" */
var localized string StringB;

/** "C" */
var localized string StringC;

/** Initialization */
simulated function Init(TrDaDCore Core, int Index)
{
	m_Core = Core;
	m_CapacitorIndex = Index;
}

simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local class<TrDmgType_Base> TrDamageType;

	TrDamageType = class<TrDmgType_Base>(DamageType);
	if( TrDamageType != none )
	{
		DamageAmount *= TrDamageType.default.m_fDamageMultiplierAgainstGenerators;
	}

	Super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
}

simulated state BlownUp
{
	simulated event BeginState( Name PreviousStateName )
    {
		super.BeginState(PreviousStateName);

        if (Role == ROLE_Authority)
        {
			m_Core.OnCapacitorBlownUp(m_CapacitorIndex);
        }
    }

	simulated function OnHealthChanged(bool wasDamage)
    {
		// We've reached the repair health threshold, so re-deploy.
        if (r_Health >= r_nRepairHealthThreshold && m_bIsRepairableAfterDeath)
		{
			if (Role == ROLE_Authority)
			{
				r_bInDestroyedState = false;
				PlayDestroyedEffects();
				m_Core.OnCapacitorRestored(m_CapacitorIndex);
			}
			GotoState('Active');
		}
		global.OnHealthChanged(wasDamage);
    }
}

simulated function string GetScreenName(PlayerController PC)
{
	local string Suffix;

	switch( m_CapacitorIndex )
	{
		case 0:
			Suffix = StringA;
			break;
		case 1:
			Suffix = StringB;
			break;
		case 2:
			Suffix = StringC;
			break;
	}

	if( IsInState('BlownUp') )
	{
		Suffix = Suffix$" [Offline]";
	}

	return m_sScreenName@Suffix;
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
    if (WorldInfo.TimeSeconds - LastPostRenderTraceTime > 0.5)
    {
        LastPostRenderTraceTime = WorldInfo.TimeSeconds + 0.2*FRand();
        bPostRenderTraceSucceeded = (FastTrace(Location, CameraPosition) || FastTrace(Location + vMarkerOffset, CameraPosition));
    }

	// Calculate distance and 
    screenLoc.Z = VSize(CameraPosition - Location);

	if( TrPlayerController(PC).GetZoomedState() == ZST_NotZoomed )
	{
		MaxOffset = (100 / (ScreenLoc.Z * 2));
		MaxOffset *= 2;
	}
	else
	{
		MaxOffset = m_fMarker2DDistance;
	}

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
	if( ShowHeaderUntil > WorldInfo.TimeSeconds && bPostRenderTraceSucceeded)
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

		marker = GetMarker();
		
		if (marker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(marker.SizeX, marker.SizeY));
		}
	}
	// Are we drawing the marker?
	// BZ 8120: Remove 'HUD.bShowObjectives' from this if to have distance always be applied.
	else if (HUD.bShowObjectives || (screenLoc.Z < Class'TrPawn'.default.m_fShowObjectThreshold && showingMarkers))
	{
		marker = GetMarker();
		
		if (marker != none)
		{
			HUD.DrawMICMarker(m_MarkerMIC, screenLoc, Canvas, vect2d(marker.SizeX, marker.SizeY));
		}
	}
}

simulated function Texture2D GetMarker()
{
	if( r_Health > 0 )
	{
		return class'TrHUD'.default.BaseGeneratorLevel1;
	}
	else
	{
		return class'TrHUD'.default.BaseGeneratorLevel1_Down;
	}
}

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=StaticMeshComponent0
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      Name="StaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   StaticMeshComponent=StaticMeshComponent0
   StringA="A"
   StringB="B"
   StringC="C"
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
      Animations=AnimNodeSequence'TribesGame.Default__TrDaDCapacitor:ObjectiveMesh.AnimNodeSeq0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDaDCapacitor:MyLightEnvironment'
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
   MarkerOffset=96
   m_sScreenName="Capacitor"
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
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   CollisionComponent=StaticMeshComponent0
   Name="Default__TrDaDCapacitor"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}
