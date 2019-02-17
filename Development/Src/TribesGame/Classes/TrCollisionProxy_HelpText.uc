class TrCollisionProxy_HelpText extends TrCollisionProxy
	dependson(TrHelpTextManager);

var CylinderComponent m_CylinderComponent;

var transient EHelpTextType m_HelpTextType;

var float m_fHelpTextRemovalTime;

var Pawn m_LocalPawn;

delegate bool ShouldShowHelpText_Delegate(EHelpTextType HelpTextType)
{
	return true;
}

/** Called when the player is added to the m_NearByPlayers array. */
simulated function OnPawnAdded(Pawn aPawn)
{
	if( aPawn.IsLocallyControlled() )
	{
		m_LocalPawn = aPawn;

		SetTimer(1.0, true, 'TryTraceAgainTimer');
		TryTraceAgainTimer();
	}
}

simulated function RequestHelpText()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(GetALocalPlayerController());

	if( TrPC != none && ( TrPC.m_HelpTextManager == none || !(TrPC.m_HelpTextManager.RequestHelpText(m_HelpTextType))) )
	{
		// Request was denied because the text type is already suppressed.
		Destroy();
	}
}

simulated function TryTraceAgainTimer()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(GetALocalPlayerController());

	// Don't show this one yet.
	if (!ShouldShowHelpText_Delegate(m_HelpTextType))
	{
		return;
	}

	// If the help manager is gone or if we have suppressed the type, stop trying and destroy ourself.
	if( TrPC != none && ( TrPC.m_HelpTextManager == none || TrPC.m_HelpTextManager.IsSuppressed(m_HelpTextType)) )
	{
		// Request was denied because the text type is already suppressed.
		Destroy();
		return;
	}

	if( FastTrace(Location, m_LocalPawn.Location) || 
		FastTrace(Location + vect(0,0,16), m_LocalPawn.Location) || 
		FastTrace(Location - vect(0,0,16), m_LocalPawn.Location))
	{
		ClearTimer('TryTraceAgainTimer');
		RequestHelpText();
	}
}

/** Called when the player is removed from the m_NearByPlayers array. */
simulated function OnPawnRemoved(Pawn aPawn)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(GetALocalPlayerController());

	if( TrPC != none && TrPC.m_HelpTextManager != none )
	{
		TrPC.m_HelpTextManager.RemoveHelpText(m_HelpTextType, m_fHelpTextRemovalTime);
	}

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
   m_fHelpTextRemovalTime=1.000000
   m_bTrackLocallyControlledPawnsOnly=True
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__TrCollisionProxy_HelpText"
   ObjectArchetype=TrCollisionProxy'TribesGame.Default__TrCollisionProxy'
}
