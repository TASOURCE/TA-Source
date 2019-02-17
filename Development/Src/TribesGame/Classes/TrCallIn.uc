class TrCallIn extends Actor
	native;

/** The enum for which call-in this is */
var ETrPlayerCallIns CallInId;

/** The database ID for the call-in */
var int DatabaseId;

/** The amount of time this call-in takes to buildup */
var float BuildupTime;

/** The amount of time this call-in takes to fall to earth */
var float CallTime;

/** The amount of time this call-in takes to cooldown */
var float CooldownTime;

/** The amount of degrees-per-tick the targeter can move before resetting */
var float DegreeOfMovement;

/** The credit cost of this call-in */
var int CreditCost;

/** The MIC to show on the targeting display */
var MaterialInstanceConstant MICDisplay;

/** The friendly string for this call-in */
var localized string DisplayName;

/** The distance from flag stations we must be */
var float FlagStationDist;

/** The distance from game objectives we must be */
var float GameObjectiveDist;

/** The distance from vehicles we must be */
var float VehicleDist;

/** Whether we should do an extent check */
var bool CheckExtentsOnSpawn;
var class<Actor> ExtentTemplateClass;

/** Whether the call-in is in progress */
var bool PendingDelete;
var bool IsInProgress;

/** The controller that owns us */
var TrPlayerController OwningController;

simulated function Initialize(int NewPrice, int NewBuildup, int NewCooldown)
{
	OwningController = TrPlayerController(Instigator.Controller);
    CreditCost = NewPrice;
    BuildupTime = NewBuildup;
    CooldownTime = NewCooldown;
}

/** Get the cost of the call-in */
simulated function int GetCreditCost()
{
	// For roaming, call-ins are free.
	if (OwningController != none && OwningController.InTraining())
	{
		CreditCost = 0.0;
	}

	return CreditCost;
}

/** Verify the player has enough credits */
simulated function bool VerifyCredits()
{
	// Make sure they have enough credits.
	if (OwningController == none || OwningController.GetCurrentCredits() < GetCreditCost())
	{
		return false;
	}

	return true;
}

simulated function bool VerifyPower()
{
    local TrGameReplicationInfo TrGRI;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (OwningController == none || OwningController.GetTeamNum() == 255 || TrGRI == none || (TrGRI.GeneratorPower[OwningController.GetTeamNum()] == 0 && TrGRI.r_bPoweredCallins))
    {
        return false;
    }

	return true;
}

/** Handle the final call-in */
simulated function bool FireCompletedCallIn(int CallInOffs, vector TargetLocation, vector TargetNormal)
{
	// Make sure they have enough credits and we are authority.
	if (Role != ROLE_Authority || !VerifyCredits() || !VerifyPower() || (OwningController.m_fCallInCooldown[CallInOffs] > 0.0 && OwningController.m_fCallInCooldown[CallInOffs] + CooldownTime > WorldInfo.TimeSeconds) || PendingDelete)
		return false;

	// We are now in progress.
	IsInProgress = true;

	// Modify the players credits.
	OwningController.ModifyCredits(-GetCreditCost());

	// Tell teammates about the call-in.
	BroadcastLocalizedTeamMessage(OwningController.GetTeamNum(), class'TrCallInMessage', CallInId, OwningController.PlayerReplicationInfo);

	// Reset the cool-down time.
	OwningController.m_fCallInCooldown[CallInOffs] = WorldInfo.TimeSeconds;
	if (Role == ROLE_Authority)
	{
		OwningController.r_nCallinCooldownFlash[CallInOffs]++;
	}

	return true;
}

/** If we are pending deletion, wait until we are done and then delete us */
simulated event Tick(float DeltaTime)
{
	if (PendingDelete && !IsInProgress)
	{
		PendingDelete = false;
		IsInProgress = false;
		Destroy();
	}

	super.Tick(DeltaTime);
}

defaultproperties
{
   BuildupTime=5.000000
   CallTime=5.000000
   CooldownTime=5.000000
   DegreeOfMovement=3.000000
   CreditCost=2000
   FlagStationDist=256.000000
   GameObjectiveDist=256.000000
   VehicleDist=256.000000
   RemoteRole=ROLE_SimulatedProxy
   CollisionType=COLLIDE_CustomDefault
   bOnlyRelevantToOwner=True
   bReplicateInstigator=True
   bReplicateMovement=False
   NetUpdateFrequency=0.100000
   TickFrequency=3.000000
   Name="Default__TrCallIn"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
