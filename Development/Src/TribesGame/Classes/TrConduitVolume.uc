class TrConduitVolume extends TrPhysicsVolume
	placeable;

simulated event PawnEnteredVolume(Pawn Other)
{
	local TrPawn TrP;
	local TrPlayerController TrPC;

	TrP = TrPawn(Other);
	if (TrP == none)
		return;

	TrP.m_bIsInConduit = true;

	TrPC = TrPlayerController(TrP.Controller);
	if( TrPC != none && TrPC.m_HelpTextManager != none )
	{
		TrPC.m_HelpTextManager.RequestHelpText(HelpText_ConduitDescription);
	}

	Super.PawnEnteredVolume(Other);

}

simulated event PawnLeavingVolume(Pawn Other)
{
	local TrPawn TrP;
	local TrPlayerController TrPC;

	TrP = TrPawn(Other);
	if (TrP == none)
		return;

	TrP.m_bIsInConduit = false;

	TrPC = TrPlayerController(TrP.Controller);
	if( TrPC != none && TrPC.m_HelpTextManager != none )
	{
		TrPC.m_HelpTextManager.RemoveHelpText(HelpText_ConduitDescription);
	}

	Super.PawnLeavingVolume(Other);
}

defaultproperties
{
   Priority=10
   BrushColor=(B=30,G=255,R=80,A=0)
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'TribesGame.Default__TrPhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'TribesGame.Default__TrPhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__TrConduitVolume"
   ObjectArchetype=TrPhysicsVolume'TribesGame.Default__TrPhysicsVolume'
}
