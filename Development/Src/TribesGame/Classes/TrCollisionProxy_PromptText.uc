class TrCollisionProxy_PromptText extends TrCollisionProxy
	dependson(TrPromptMessage);

var CylinderComponent m_CylinderComponent;

var float m_fPromptTextRemovalTime;

var int m_nPromptMessageIndex;

var int m_nLastUpgradeLevel;

var string m_LastUpgradeMsg;

var Pawn m_LocalPawn;

/** Called when the player is added to the m_NearByPlayers array. */
simulated function OnPawnAdded(Pawn aPawn)
{
	local TrGameObjective TrGO;

	TrGO = TrGameObjective(Owner);
	if (TrGO == none)
		return;

	if( aPawn.IsLocallyControlled() )
	{
		m_LocalPawn = aPawn;

		m_nLastUpgradeLevel = TrGO.r_nUpgradeLevel;
		SetTimer(0.5, true, 'CheckForUpgradeLevel');

		if( TrGO.IsInLOS_Basic(aPawn) )
		{
			RequestPromptText();
		}
		else
		{
			// Line of sight trace failed, try again soon.
			SetTimer(1.0, true, 'TryTraceAgainTimer');
		}
	}
}

simulated function RequestPromptText()
{
	local TrGameObjective TrGO;
	local TrPlayerController TrPC;

	TrGO = TrGameObjective(Owner);
	TrPC = TrPlayerController(GetALocalPlayerController());

	// No game objective owner, or we shouldn't show the prompt text.
	if (TrGO == none || !TrGO.ShouldShowPromptText(m_LocalPawn))
		return;

	if( TrPC != none && TrPC.myHUD != none && TrPC.myHUD.IsA('TrHUD') )
	{
		// Show the prompt message.
		m_LastUpgradeMsg = class'TrPromptMessage'.static.GetString(m_nPromptMessageIndex, false, none, none, TrGO);
		TrHUD(TrPC.myHUD).AddToPromptPanelTime(m_LastUpgradeMsg, m_fPromptTextRemovalTime, GC_APT_MINIMAL);
	}
}

simulated function CheckForUpgradeLevel()
{
	local TrGameObjective TrGO;
	local TrPlayerController TrPC;

	TrGO = TrGameObjective(Owner);
	TrPC = TrPlayerController(GetALocalPlayerController());

	if (TrGO != none && TrPC != none && m_LocalPawn != none && TrGO.r_nUpgradeLevel != m_nLastUpgradeLevel)
	{
		TrHUD(TrPC.myHUD).ClearPromptPanelMessage(m_LastUpgradeMsg);

		// Upgrade the prompt text if possible.
		if( TrGO.IsInLOS_Basic(m_LocalPawn) )
		{
			RequestPromptText();
		}
		else
		{
			// Line of sight trace failed, try again soon.
			SetTimer(1.0, true, 'TryTraceAgainTimer');
		}
	}
}

simulated function TryTraceAgainTimer()
{
	local TrGameObjective TrGO;

	TrGO = TrGameObjective(Owner);
	if( TrGO != none && m_LocalPawn != none && TrGO.IsInLOS_Basic(m_LocalPawn) )
	{
		ClearTimer('TryTraceAgainTimer');
		RequestPromptText();
	}
}

/** Called when the player is removed from the m_NearByPlayers array. */
simulated function OnPawnRemoved(Pawn aPawn)
{
	ClearTimer('CheckForUpgradeLevel');
	ClearTimer('TryTraceAgainTimer');
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrCollisionProxy:CollisionCylinder'
   End Object
   m_CylinderComponent=CollisionCylinder
   m_fPromptTextRemovalTime=1.000000
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__TrCollisionProxy_PromptText"
   ObjectArchetype=TrCollisionProxy'TribesGame.Default__TrCollisionProxy'
}
