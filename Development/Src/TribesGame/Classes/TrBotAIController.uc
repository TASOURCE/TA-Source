class TrBotAIController extends UTBot;

function OnAIStartJetting(TrSeqAct_AIStartJetting Action)
{
	if( Action.m_bResetVelocity && Pawn != none )
	{
		Pawn.Velocity = vect(0,0,0);
	}

	StartJetting(Normal(Action.Direction), Action.Magnitude);
}

function OnAIStopJetting(TrSeqAct_AIStopJetting Action)
{
	if( Action.m_bResetVelocity && Pawn != none )
	{
		Pawn.Velocity = vect(0,0,0);
	}

	StopJetting();
}

function OnAIStartSkiing(TrSeqAct_AIStartSkiing Action)
{
	local TrPawn TrP;

	TrP = TrPawn(Pawn);
	if( TrP != none )
	{
		TrP.r_bIsSkiing = true;
		TrP.SetPhysics(PHYS_Skiing);
	}
}

function OnAIStopSkiing(TrSeqAct_AIStopSkiing Action)
{
	local TrPawn TrP;

	TrP = TrPawn(Pawn);
	if( TrP != none )
	{
		TrP.r_bIsSkiing = false;
		TrP.SetPhysics(PHYS_Falling);
	}
}

function OnAIMoveToActor(SeqAct_AIMoveToActor Action)
{
	if( Pawn != none )
	{
		Pawn.MovementSpeedModifier = Action.MovementSpeedModifier;
	}
	Super.OnAIMoveToActor(Action);
}

function StartJetting(Vector Direction, float Magnitude)
{
	local TrPlayerPawn TrP;

	TrP = TrPlayerPawn(Pawn);
	if( TrP != none )
	{
		TrP.bCanFly = true;
		TrP.SetPhysics(PHYS_Flying);
		Trp.r_bIsJetting = TRUE;
        Trp.PlayJetpackEffects();
		TrP.Acceleration = Direction * Magnitude;
	}
}

function StopJetting()
{
	local TrPlayerPawn TrP;

	TrP = TrPlayerPawn(Pawn);
	if( TrP != none )
	{
		TrP.SetPhysics(PHYS_Falling);
		Trp.r_bIsJetting = False;
        Trp.StopJetpackEffects();
		TrP.Acceleration = vect(0,0,0);
	}
}

function Possess(Pawn aPawn, bool bVehicleTransition)
{
	if (aPawn.bDeleteMe)
	{
		;
		ScriptTrace();
		GotoState('Dead');
	}
	else
	{
		Super(UDKBot).Possess(aPawn, bVehicleTransition);
		enable('NotifyBump');
	}
}

defaultproperties
{
   Begin Object Class=UDKAIDecisionComponent Name=TheDecider Archetype=UDKAIDecisionComponent'UTGame.Default__UTBot:TheDecider'
      Name="TheDecider"
      ObjectArchetype=UDKAIDecisionComponent'UTGame.Default__UTBot:TheDecider'
   End Object
   DecisionComponent=TheDecider
   Components(0)=TheDecider
   Name="Default__TrBotAIController"
   ObjectArchetype=UTBot'UTGame.Default__UTBot'
}
