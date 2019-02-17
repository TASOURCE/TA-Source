class TrStormCore extends TrGameObjective
    abstract;

/** Shield bar MIC */
var MaterialInstanceConstant m_ShieldBarMIC;
var(OverheadIndicator) float m_fShieldBarPlacementY;

simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local TrGame_TrStorm StormGame;
	local bool bIsInstantHitDamage;
	local TrDevice DeviceDamager;
	local TrPlayerController TrPCDamager;

	if( EventInstigator.GetTeamNum() == DefenderTeamIndex )
	{
		return;
	}

	DeviceDamager = TrDevice(DamageCauser);
	if (DeviceDamager != none)
	{
		bIsInstantHitDamage = DeviceDamager.WeaponFireTypes[DeviceDamager.CurrentFireMode] == EWFT_InstantHit;
	}

	if( Role == ROLE_Authority && DamageAmount > 0 )
	{
		TrPCDamager = TrPlayerController(EventInstigator);
		if (TrPCDamager != none)
		{
			TrPCDamager.ClientShowOverheadNumber(DamageAmount, Location, Location.Z);
			TrPCDamager.FlashShooterHitReticule(DamageAmount, bIsInstantHitDamage, GetTeamNum());
		}

		// Damage is forwarded to the game type.
		StormGame = TrGame_TrStorm(WorldInfo.Game);
		if( StormGame != none )
		{
			StormGame.TakeDamageFromCore(DefenderTeamIndex, DamageAmount);
		}
	}

	if( WorldInfo.NetMode != NM_DedicatedServer && DamageAmount > 0 )
	{
		// Health was lost, so play damage effects.
		PlayDamageHealthEffects(DamageAmount, m_Mesh.MatchRefBone(HitInfo.BoneName));
	}
}

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

function OnCoreDestroyed()
{
	// Kismet
	TriggerEventClass(class'TrSeqEvent_StormCore', self, 0);
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local bool bIsFriendly;
	local string DisplayName;
	local Texture2D marker;
	local TrHUD HUD;
	local vector screenLoc, vMarkerOffset, NamePlacement;

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	if( m_HealthBarMIC == none )
	{
		m_HealthBarMIC = new(self) class'MaterialInstanceConstant';
		m_HealthBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	if( m_ShieldBarMIC == none )
	{
		m_ShieldBarMIC = new(self) class'MaterialInstanceConstant';
		m_ShieldBarMIC.SetParent(MaterialInstanceConstant'Hud_HealthBar.MIC_Hud_HealthBar');
	}

	// Do not draw if we aren't facing the objective.
	if ((CameraDir dot (Location - CameraPosition)) <= 0.f)
		return;

	// Calculate positions.
	vMarkerOffset = MarkerOffset * vect(0,0,1);
	screenLoc = Canvas.Project(Location + vMarkerOffset);
	screenLoc.Z = VSize(CameraPosition - Location);

	// Calculate the health and determine if we are friendly.
	bIsFriendly = WorldInfo.GRI.OnSameTeam(self, PC);

	// Calculate the display name.
	DisplayName = GetScreenName(PC);

	// Draw the UI elements.
	if( true )
	{
		NamePlacement = screenLoc;
		NamePlacement.Y += m_fObjectiveNamePlacementY;

   	    HUD.DrawMarkerText(DisplayName, bIsFriendly, NamePlacement, Canvas);

		// Draw the health bar.
		m_HealthBarMIC.SetScalarParameterValue('Scal_Health',GetHealthAmount());
		m_HealthBarMIC.SetScalarParameterValue('SCAL_Friendly', 0.0);
		// Forcing color here to red. WIP
		HUD.DrawHealthBar(m_HealthBarMIC,false,ScreenLoc,Canvas, m_fObjectiveHealthBarPlacementX, m_fObjectiveHealthBarPlacementY, m_fObjectiveHealthBarWidth, m_fObjectiveHealthBarHeight);

		// Draw the shield bar.
		m_ShieldBarMIC.SetScalarParameterValue('Scal_Health',GetShieldAmount());
		m_ShieldBarMIC.SetScalarParameterValue('SCAL_Friendly', 1.0);
		// Forcing color here to blue. WIP
		HUD.DrawHealthBar(m_ShieldBarMIC,true,ScreenLoc,Canvas, m_fObjectiveHealthBarPlacementX, m_fShieldBarPlacementY, m_fObjectiveHealthBarWidth, m_fObjectiveHealthBarHeight);

		marker = GetMarker();
		
		if (marker != none)
		{
			HUD.DrawMarker(marker, screenLoc, Canvas);
		}
	}
	// Are we drawing the marker?
	// BZ 8120: Remove 'HUD.bShowObjectives' from this if to have distance always be applied.
	else if (HUD.bShowObjectives || (screenLoc.Z < Class'TrPawn'.default.m_fShowObjectThreshold))
	{
		marker = GetMarker();
		
		if (marker != none)
		{
			HUD.DrawMarker(marker, screenLoc, Canvas);
		}
	}
}

defaultproperties
{
   m_fShieldBarPlacementY=30.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
      AnimSets(0)=None
      MorphSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrStormCore:MyLightEnvironment'
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Scale=2.500000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Scale=2.500000
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=96
   m_sScreenName="Reactor Core"
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
   DefenderTeamIndex=0
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
   Components(4)=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=CollisionMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:CollisionMesh'
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenGame=True
      HiddenEditor=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Scale=2.500000
      Name="CollisionMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:CollisionMesh'
   End Object
   Components(5)=CollisionMesh
   Components(6)=ShieldMesh
   Components(7)=OnlineSound
   Components(8)=CriticalSound
   Components(9)=ShieldHitSound
   Components(10)=PowerDownSound
   Components(11)=DestroyedSound
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   CollisionComponent=CollisionMesh
   SupportedEvents(5)=Class'TribesGame.TrSeqEvent_StormCore'
   Name="Default__TrStormCore"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}
