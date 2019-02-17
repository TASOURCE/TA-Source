class TrStormControlPoint extends TrGameObjective
    placeable;

/** State of the point. */
enum ControlPointState
{
	ControlPointState_Neutral,
	ControlPointState_FullyOwnedBE,
	ControlPointState_FullyOwnedDS,
	ControlPointState_TransitioningToBE,
	ControlPointState_TransitioningToDS,
};
var protected ControlPointState r_CurrentControlPointState;

/** Speed at which the point transitions to another team if contested. */
var() float m_fTransitionSpeed;

/** 
 *  0: Fully owned by Blood Eagle
 *  1: Fully owned by Diamond Sword
 *  Anything in between represents transition.
 */
var float m_fCurrentTransitionAmount;

/** Once m_fMissileLaunchTracker gets to 1.0, Missile may be fired. */
var float m_fMissileLaunchTracker;

/** Speed at which the m_fMissileLaunchTracker increments. */
var() float m_fMissileLaunchTrackerSpeed;

/** Time it takes for a missile to explode on an enemy Carrier. */
var() float m_fMissileFlightTime;

var(OverheadIndicator) float m_fControlDescriptionPlacementY;
var(OverheadIndicator) float m_fLaunchTimeDescriptionPlacementY;

var() array<TrInventoryStation_Storm> m_InventoryStations;
var() string m_sControlPointName;

replication
{
	if( Role == ROLE_Authority )
		r_CurrentControlPointState;
}

/** Called when a pawn has touched a gate associated with this control point. */
function OnPawnTouched(TrPawn TrP)
{
	local byte PawnTeamNum;

	if( TrP.IsAliveAndWell() )
	{
		PawnTeamNum = TrP.GetTeamNum();
		switch( GetControlPointState() )
		{
			case ControlPointState_Neutral:
				BeginTransition(PawnTeamNum);
				break;
			case ControlPointState_TransitioningToBE: //Pass through.
			case ControlPointState_FullyOwnedBE:
				if( PawnTeamNum == 1 )
				{
					BeginTransition(PawnTeamNum);
				}
				break;
			case ControlPointState_TransitioningToDS: //Pass through.
			case ControlPointState_FullyOwnedDS:
				if( PawnTeamNum == 0 )
				{
					BeginTransition(PawnTeamNum);
				}
				break;
		}
	}
}

simulated event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	// Handle point transitioning.
	if( r_CurrentControlPointState == ControlPointState_TransitioningToBE )
	{
		m_fCurrentTransitionAmount = FMax(m_fCurrentTransitionAmount - DeltaTime * m_fTransitionSpeed, 0.0);

		//`log("Transitioning to Blood Eagle"@m_fCurrentTransitionAmount);

		if( m_fCurrentTransitionAmount == 0.0 )
		{
			// We are fully transitioned.
			SetControlPointState(ControlPointState_FullyOwnedBE);
		}
	}
	else if( r_CurrentControlPointState == ControlPointState_TransitioningToDS )
	{
		m_fCurrentTransitionAmount = FMin(m_fCurrentTransitionAmount + DeltaTime * m_fTransitionSpeed, 1.0);

		//`log("Transitioning to DiamondSword"@m_fCurrentTransitionAmount);

		if( m_fCurrentTransitionAmount == 1.0 )
		{
			// We are fully transitioned.
			SetControlPointState(ControlPointState_FullyOwnedDS);
		}
	}
	
	// Increment the Missile Launcher Tracker
	if( r_CurrentControlPointState != ControlPointState_Neutral && m_fMissileLaunchTracker < 1.0 )
	{
		m_fMissileLaunchTracker = FMin(m_fMissileLaunchTracker + DeltaTime * m_fMissileLaunchTrackerSpeed, 1.0);
		//`log("Launching missile in"@m_fMissileLaunchTracker);
	}

	if( m_fMissileLaunchTracker == 1.0 )
	{
		// Missile is ready to go, fire if fully cotrolled by a team.
		if( r_CurrentControlPointState == ControlPointState_FullyOwnedBE )
		{
			FireMissile(1);
		}
		else if( r_CurrentControlPointState == ControlPointState_FullyOwnedDS )
		{
			FireMissile(0);
		}
	}
}

simulated function FireMissile(byte TeamNum)
{
	local TrGame_TrStorm StormGame;

	// Reset the missile launch tracker to prep the next missile fire.
	m_fMissileLaunchTracker = 0.0;

	if( Role == ROLE_Authority )
	{
		// Kismet.
		TriggerEventClass(class'TrSeqEvent_StormControlPoint', self, TeamNum);

		StormGame = TrGame_TrStorm(WorldInfo.Game);
		if( StormGame != none )
		{
			// Let the game know a missile was fired.
			StormGame.MissileFired(self, m_fMissileFlightTime, TeamNum);
		}
	}
}

function BeginTransition(byte TeamNum)
{
	local ControlPointState NewControlPointState;

	NewControlPointState = (TeamNum == 0) ? ControlPointState_TransitioningToBE : ControlPointState_TransitioningToDS;

	if( NewControlPointState != r_CurrentControlPointState )
	{
		SetControlPointState(NewControlPointState);
	}
}

function SetControlPointState(ControlPointState NewControlPointState)
{
	local int i;
	local PlayerController P;
	local ControlPointState OldControlPointState;

	//`log("Setting Control Point State to"@NewControlPointState);
	OldControlPointState = r_CurrentControlPointState;
	r_CurrentControlPointState = NewControlPointState;
	bNetDirty = true;

	if( OldControlPointState == r_CurrentControlPointState )
	{
		return;
	}

	// Switch inventory stations to the appropriate team if a team fully owns the point.
	if( NewControlPointState == ControlPointState_FullyOwnedBE )
	{
		for( i = 0; i < m_InventoryStations.Length; i++ )
		{
			m_InventoryStations[i].DefenderTeamIndex = 0;
		}
	}
	else if( NewControlPointState == ControlPointState_FullyOwnedDS )
	{
		for( i = 0; i < m_InventoryStations.Length; i++ )
		{
			m_InventoryStations[i].DefenderTeamIndex = 1;
		}
	}

	// Broadcast messages to all players.
	foreach WorldInfo.AllControllers(class'PlayerController', P)
	{
		switch( r_CurrentControlPointState )
		{
			case ControlPointState_FullyOwnedBE:
				P.ReceiveLocalizedMessage(class'TrStormMessage', ((P.GetTeamNum() == 0) ? 0 : 1),,,self);
				break;
			case ControlPointState_FullyOwnedDS:
				P.ReceiveLocalizedMessage(class'TrStormMessage', ((P.GetTeamNum() == 1) ? 0 : 1),,,self);
				break;
			case ControlPointState_TransitioningToBE: // Pass through.
			case ControlPointState_TransitioningToDS:
				if( OldControlPointState == ControlPointState_FullyOwnedBE || 
					OldControlPointState == ControlPointState_FullyOwnedDS ||
					OldControlPointState == ControlPointState_Neutral )
				{
					P.ReceiveLocalizedMessage(class'TrStormMessage', 2,,,self);
				}
				break;
		}
	}
}

simulated function ControlPointState GetControlPointState()
{
	return r_CurrentControlPointState;
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local string LaunchTimeDescription;
	local TrHUD HUD;
	local vector screenLoc, vMarkerOffset, NamePlacement;
	local Color TextColor;

	if( GetControlPointState() == ControlPointState_Neutral )
	{
		return;
	}

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	// Do not draw if we aren't facing the objective.
	if ((CameraDir dot (Location - CameraPosition)) <= 0.f)
		return;

	// Calculate positions.
	vMarkerOffset = MarkerOffset * vect(0,0,1);
	screenLoc = Canvas.Project(Location + vMarkerOffset);
	screenLoc.Z = VSize(CameraPosition - Location);

	switch( GetControlPointState() )
	{
		case ControlPointState_Neutral:
			TextColor = class'HUD'.default.WhiteColor;
			break;
		case ControlPointState_FullyOwnedBE:
			TextColor = PC.GetTeamNum() == 0 ? class'TrHUD'.default.ColorFriend : class'TrHUD'.default.ColorEnemy;
			break;
		case ControlPointState_FullyOwnedDS:
			TextColor = PC.GetTeamNum() == 1 ? class'TrHUD'.default.ColorFriend : class'TrHUD'.default.ColorEnemy;
			break;
		case ControlPointState_TransitioningToDS:
			TextColor = class'HUD'.default.WhiteColor;
			break;
		case ControlPointState_TransitioningToBE:
			TextColor = class'HUD'.default.WhiteColor;
			break;
	}

	// Launch Time Description
	if( m_fMissileLaunchTracker < 1.0 )
	{
		LaunchTimeDescription = "Launching in:"@((1.0 - m_fMissileLaunchTracker)*10.0);
	}
	else 
	{
		LaunchTimeDescription = "Ready for Launch";
	}
	NamePlacement = screenLoc;
	NamePlacement.Y += m_fLaunchTimeDescriptionPlacementY;
	HUD.DrawColoredMarkerText(LaunchTimeDescription, TextColor, NamePlacement, Canvas);
}

simulated function string GetScreenName(PlayerController PC)
{
	if( m_sControlPointName != "" )
	{
		return m_sControlPointName;
	}
	return m_sScreenName;
}

defaultproperties
{
   m_fTransitionSpeed=0.100000
   m_fCurrentTransitionAmount=0.500000
   m_fMissileLaunchTrackerSpeed=0.050000
   m_fMissileFlightTime=5.000000
   m_fControlDescriptionPlacementY=-20.000000
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
      Animations=AnimNodeSequence'TribesGame.Default__TrStormControlPoint:ObjectiveMesh.AnimNodeSeq0'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrStormControlPoint:MyLightEnvironment'
      Translation=(X=0.000000,Y=0.000000,Z=-75.000000)
      Scale=4.000000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=250
   m_sScreenName="Missile Control Point"
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
   DefenderTeamIndex=255
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
      CollisionHeight=150.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      CollideActors=True
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
   Components(12)=CollisionCylinder
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   bCanBeDamaged=False
   CollisionComponent=CollisionCylinder
   SupportedEvents(5)=Class'TribesGame.TrSeqEvent_StormControlPoint'
   Name="Default__TrStormControlPoint"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}
