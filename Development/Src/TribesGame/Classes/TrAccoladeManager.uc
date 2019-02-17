class TrAccoladeManager extends Object
    native;

var TrGame m_TrG;
var TrPlayerController m_TrPC;
var TrStatsInterface Stats;

var int m_nCurrSnipingKillStreak;
var int m_nCurrExplosiveKillStreak;
var int m_nCurrSpinfusorKillStreak;

/** Time that must pass between getting credits for individual flag grabs / returns (anti-cheat) */
var int MINIMUM_TIME_FLAG_CREDITS;

var int MAXIMUM_LLAMA_GRAB_SPEED;
var int MINIMUM_FAST_GRAB_SPEED;
var int MINIMUM_ULTRA_GRAB_SPEED;
var int MAXIMUM_FLAG_DEFENSE_DISTANCE;
var int MAXIMUM_EMERGENCY_GRAB_DISTANCE;

var int m_nLastFlagGrabTime;
var int m_nLastFlagReturnTime;

native function int GetFlagDistance(Vector Loc1, Vector Loc2);

function Initialize(TrPlayerController TrPC)
{
    m_TrPC = TrPC;
    m_TrG = TrGame(m_TrPC.WorldInfo.Game);

    if (m_TrG != none)
    {
        Stats = m_TrG.Stats;
    }
}

function ResetStreaks()
{
    m_nCurrSnipingKillStreak = 0;
    m_nCurrExplosiveKillStreak = 0;
    m_nCurrSpinfusorKillStreak = 0;
}

function GiveAssist()
{
    QueueAccolade(class'TrAccolade_Assist');
}

function GiveVehicleAssist()
{
    QueueAccolade(class'TrAccolade_Assist_Vehicle');
}

function KillAsRabbit(Controller Killer, Controller Other)
{
    QueueAccolade(class'TrAccolade_Caerbannog');
}

function KilledTheRabbit(Controller Killer, Controller Other)
{
    QueueAccolade(class'TrAccolade_RabbitHunter');
}

function KilledTheFlagHolder()
{
    QueueAccolade(class'TrAccolade_FlagKiller');
}

function UpdateStandardKillingSpree(UTPlayerReplicationInfo Other, int currentSpree)
{
	switch (currentSpree)
	{
	case 5:  QueueAccolade(class'TrAccolade_KillStreak_Five'); break;
	case 10: QueueAccolade(class'TrAccolade_KillStreak_Ten'); break;
	case 15: QueueAccolade(class'TrAccolade_KillStreak_Fifteen'); break;
	case 20: QueueAccolade(class'TrAccolade_KillStreak_Twenty'); break;
	case 25: QueueAccolade(class'TrAccolade_KillStreak_TwentyFive'); break;
	default:
		break;
	}
}

function KilledGenerator()
{
    QueueAccolade(class'TrAccolade_GeneratorKill');
}

function RepairedBase()
{
    if (Stats != none) Stats.AddRepair(m_TrPC);
    QueueAccolade(class'TrAccolade_BaseRepair');
}

function KilledBaseTurret()
{
    QueueAccolade(class'TrAccolade_BaseTurretKill');
}

function KilledBaseRadar()
{
    QueueAccolade(class'TrAccolade_BaseRadarKill');
}

function FlagGrab()
{
    local int pawnSpeed;
    local int flagDist;
    local TrGame_TRCTF CTF;

    pawnSpeed = TrPawn(m_TrPC.Pawn).CalculatePawnSpeed();

	if (Stats != none) Stats.AddFlagGrab(m_TrPC);

    if (pawnSpeed > MINIMUM_ULTRA_GRAB_SPEED)
    {
        QueueAccolade(class'TrAccolade_UltraGrab');
    }
    else if (pawnSpeed > MINIMUM_FAST_GRAB_SPEED)
    {
        QueueAccolade(class'TrAccolade_FastGrab');
    }
    else if (pawnSpeed < MAXIMUM_LLAMA_GRAB_SPEED)
    {
        QueueAccolade(class'TrAccolade_FlagGrabLlama');
    }
    else
    {
        QueueAccolade(class'TrAccolade_FlagGrabCTF');
    }

    m_TrG.Stats.FlagGrabSpeed(m_TrPC, pawnSpeed);
    
    CTF = TrGame_TRCTF(m_TrG);

    if (CTF != none)
    {
        flagDist = GetFlagDistance(CTF.m_Flags[0].Location, CTF.m_Flags[1].Location);

        if ((flagDist > 0) && (flagDist < MAXIMUM_EMERGENCY_GRAB_DISTANCE))
        {
            QueueAccolade(class'TrAccolade_FlagGrabE');
        }
    }
}

function FlagGrabDeathmatch()
{
	if (Stats != none) Stats.AddFlagGrab(m_TrPC);

    QueueAccolade(class'TrAccolade_FlagGrabDM');
}

function FlagHeld()
{
    QueueAccolade(class'TrAccolade_FlagHolder');
}

function FlagAssist(int AssistCount)
{
    local int assistCredits;

    switch (AssistCount)
    {
    case 0:
    case 1:
        assistCredits = 1000;
        break;
    case 2:
        assistCredits = 500;
        break;
    case 3:
        assistCredits = 300;
        break;
    case 4:
        assistCredits = 250;
        break;
    case 5:
        assistCredits = 200;
        break;
    case 6:
        assistCredits = 150;
        break;
    case 7:
    case 8:
    case 9:
    case 10:
        assistCredits = 100;
        break;
    default:
        assistCredits = 50;
        break;
    }

    QueueAccolade(class'TrAccolade_FlagAssist', assistCredits);
}

function FlagCapture(bool bUnAssisted)
{
	if (Stats != none) Stats.AddFlagCap(m_TrPC);

    if (bUnAssisted)
    {
        QueueAccolade(class'TrAccolade_FlagCap', 2000);
    }
    else
    {
        QueueAccolade(class'TrAccolade_FlagCap');
    }
}

function FlagReturn()
{
    if (Stats != none) Stats.AddFlagReturn(m_TrPC);
    QueueAccolade(class'TrAccolade_FlagReturn');
}

function NoJoy()
{
    QueueAccolade(class'TrAccolade_NoJoy');
}

function GameCompleted()
{
    // This just shows up in the summaries, not the HUD
    if (Stats != none) Stats.AddAccolade(m_TrPC, class'TrAccolade_GameComplete'.default.DatabaseId, class'TrAccolade_GameComplete'.default.ActivityId);
}

function GameWon()
{
    QueueAccolade(class'TrAccolade_GameWinner');
}

function UpdateMultiKills(int MultiKillLevel)
{
	switch (MultiKillLevel)
	{
		case 1: QueueAccolade(class'TrAccolade_MultiKill_Double'); break;
		case 2: QueueAccolade(class'TrAccolade_MultiKill_Triple'); break;
		case 3: QueueAccolade(class'TrAccolade_MultiKill_Quatra'); break;
		case 4: QueueAccolade(class'TrAccolade_MultiKill_Ultra'); break;
		case 5: QueueAccolade(class'TrAccolade_MultiKill_Team'); break;
		default:
			break;
	}
}

function VehicleDestroyed(TrVehicle aVehicle)
{
    if (TrVehicle_Tank(aVehicle) != none)
    {
        QueueAccolade(class'TrAccolade_HeavyVehicleDestroy');
    }
    else if (TrVehicle_BaseFlying(aVehicle) != none)
    {
        QueueAccolade(class'TrAccolade_MediumVehicleDestroy');
    }
    else
    {
        QueueAccolade(class'TrAccolade_LightVehicleDestroy');
    }
}

function UpdateSpecialAccolades(Controller Victim)
{
    local int flagDist;
	local Actor DamageCauser;
    local Vector flagLoc;
    local TrPawn KillerPawn;
    local TrPawn VictimPawn;
    local TrVehicle KillerVehicle;
    local TrVehicle VictimVehicle;
    local TrGame_TRCTF CTF;
    local TrPhysicsVolume TrPhysicsV;
	local class<DamageType> KillType;
    local TrPlayerController KillerPC;
    local TrPlayerController VictimPC;

    KillerPC = m_TrPC;
    KillerPawn = TrPawn(KillerPC.Pawn);

    if (Victim != none)
    {
        VictimPC = TrPlayerController(Victim);
        VictimPawn = TrPawn(Victim.Pawn);
    }
    
    if (VictimPawn == none)
    {
        VictimVehicle = TrVehicle(Victim.Pawn);

        if (VictimVehicle == none) return;
    }

    if (KillerPawn == none)
    {
        KillerVehicle = TrVehicle(KillerPC.Pawn);

        if (KillerVehicle == none)
        {
			if (KillerPC.Pawn != none)
			{
				KillerVehicle = TrVehicle(KillerPC.Pawn.Base);
			}

            if (KillerVehicle == none)
            {
	            // Aftermath!
	            QueueAccolade(class'TrAccolade_Aftermath');
            }
        }

        if (Stats != none) Stats.AddVehicleKill(KillerPC);
    }

    CTF = TrGame_TRCTF(m_TrG);

	// First Blood - Got the first kill of the match
	if (!m_TrG.bFirstBloodAchieved)
	{
		m_TrG.bFirstBloodAchieved = true;
	    QueueAccolade(class'TrAccolade_FirstBlood');
	}

    if (CTF != none)
    {
        flagLoc = CTF.m_Flags[m_TrPC.GetTeamNum()].Location;
		if (VictimPawn != none)
		{
			flagDist = GetFlagDistance(flagLoc, VictimPawn.Location);
		}

        if (flagDist > 0 && flagDist < MAXIMUM_FLAG_DEFENSE_DISTANCE)
        {
            QueueAccolade(class'TrAccolade_FlagDefense');
        }
        
		if (VictimPawn != none)
		{
			TrPhysicsV = TrPhysicsVolume(VictimPawn.PhysicsVolume);
		}
        
	    if( TrPhysicsV != none )
	    {
            if (TrPhysicsV.m_ContextLocation == VGSContext_NearGenerator && 
                TrPhysicsV.m_DefenderTeamIndex != VictimPawn.GetTeamNum())
            {
                QueueAccolade(class'TrAccolade_GenDefense');
            }
	    }
    }

	// Save off last killer for Revenge accolade in the future
	if (VictimPC != none) VictimPC.m_LastKilledBy = KillerPC;
    
    // Update our furthest kill distance (will only overwrite if greater)
    if (Stats != none && VictimPC != none && VictimPC.Pawn != none) Stats.SetDistanceKill(KillerPC, VictimPC.Pawn.LastHitInfo.Distance/200);

	// Get the type of damage that killed and the causer
    if (VictimPawn != none)
    {
	    DamageCauser = VictimPawn.LastHitInfo.Causer;
	    KillType = VictimPawn.LastHitInfo.Type;
    }
    else if (VictimVehicle != none)
    {
	    DamageCauser = VictimVehicle.LastHitInfo.Causer;
	    KillType = VictimVehicle.LastHitInfo.Type;
    }

	// Revenge!
	if (VictimPC != none && KillerPC.m_LastKilledBy == VictimPC)
	{
		QueueAccolade(class'TrAccolade_Revenge');

		// Reset killed by to none
		KillerPC.m_LastKilledBy = none;
	}

	// Melee Updates
	if (class<TrDmgType_Melee>(KillType) != none)
	{
		QueueAccolade(class'TrAccolade_Melee');
	}
	
	// Vehicle squishes
	if (class<TrDmgType_RanOver>(KillType) != none)
	{
		QueueAccolade(class'TrAccolade_Roadkill');
	}
    
	// Process sticky kills before explosive streaks for continuity
	if (class<TrDmgType_StickyGrenade>(KillType) != none ||
	    class<TrDmgType_LightStickyGrenade>(KillType) != none ||
	    class<TrDmgType_ArxBuster>(KillType) != none)
	{
		// Only award if this badboy was actually stuck to the player
		if (TrProj_Grenade(DamageCauser) != none && TrProj_Grenade(DamageCauser).m_bStuckOnPlayer)
		{
		    QueueAccolade(class'TrAccolade_Sticky');
		}
	}
	
	// Long Range Mortar kill, process before explosives streak
	if (class<TrDmgType_MortarLauncher>(KillType) != none)
	{
		if (VictimPawn != none && VictimPawn.LastHitInfo.Distance > 5000)
		{
		    QueueAccolade(class'TrAccolade_ArtilleryStrike');
		}
	}

	// Sniping Streak Updates
	if (class<TrDmgType_PhaseRifle>(KillType) != none ||
	    class<TrDmgType_SniperRifle>(KillType) != none)
	{
		m_nCurrSnipingKillStreak++;
		
		switch (m_nCurrSnipingKillStreak)
		{
			case 5: QueueAccolade(class'TrAccolade_KillStreak_Sniping_Five'); break;
			case 10: QueueAccolade(class'TrAccolade_KillStreak_Sniping_Ten'); break;
			case 15: QueueAccolade(class'TrAccolade_KillStreak_Sniping_Fifteen'); break;
			default:
				break;
		}
	}

	// Explosive Streak Updates
	if (class<TrDmgType_Explosive>(KillType) != none)
	{
		m_nCurrExplosiveKillStreak++;
		
		switch (m_nCurrExplosiveKillStreak)
		{
			case 5: QueueAccolade(class'TrAccolade_KillStreak_Explosive_Five'); break;
			case 10: QueueAccolade(class'TrAccolade_KillStreak_Explosive_Ten'); break;
			case 15: QueueAccolade(class'TrAccolade_KillStreak_Explosive_Fifteen'); break;
			default:
				break;
		}
	}

	// If the kill is a direct hit and in midair
	if (VictimPawn != none && VictimPawn.LastHitInfo.bDirectHit &&
	   (VictimPawn.Physics == PHYS_Falling || VictimPawn.Physics == PHYS_Flying))
	{
        if (class<TrDmgType_Spinfusor>(KillType) != none)
        {
			KillerPC.ClientPlayBluePlateImpact();
		    QueueAccolade(class'TrAccolade_BluePlateSpecial');
	        if (Stats != none) Stats.AddMidairKill(KillerPC);
        }
        else if (class<TrDmgType_PlasmaGun>(KillType) != none ||
                 class<TrDmgType_PlasmaCannon>(KillType) != none)
        {
			KillerPC.ClientPlayAirMailImpact();
		    QueueAccolade(class'TrAccolade_HotAir');
	        if (Stats != none) Stats.AddMidairKill(KillerPC);
        }
	    else if (class<TrDmgType_Explosive>(KillType) != none &&
                 class<TrDmgType_TrackingMissile>(KillType) == none &&
                 class<TrDmgType_Mine>(KillType) == none)
	    {
			KillerPC.ClientPlayAirMailImpact();
		    QueueAccolade(class'TrAccolade_AirMail');
	        if (Stats != none) Stats.AddMidairKill(KillerPC);
	    }
	}
        
	// Spinfusor Updates
	if (class<TrDmgType_Spinfusor>(KillType) != none)
	{
		m_nCurrSpinfusorKillStreak++;

		switch (m_nCurrSpinfusorKillStreak)
		{
			case 5: QueueAccolade(class'TrAccolade_KillStreak_Spinfusor_Five'); break;
			case 10:QueueAccolade(class'TrAccolade_KillStreak_Spinfusor_Ten'); break;
			case 15:QueueAccolade(class'TrAccolade_KillStreak_Spinfusor_Fifteen'); break;
			default:
				break;
		}
	}

	// Head Shot! Only instant-fire weapons
	if (VictimPawn != none && VictimPawn.bLastHitWasHeadShot && ((class<TrDmgType_Bullet>(KillType) != none)))
	{
        if (Stats != none) Stats.SetDistanceHeadshot(KillerPC, VictimPawn.LastHitInfo.Distance/200);
	    QueueAccolade(class'TrAccolade_Headshot');
	}

	// Final Blow - Got the last kill of the match (GRI updates later, check at 1)
	if (m_TrG.GameReplicationInfo.GameClass == class'TrGame_TRTeamRabbit' &&
	    m_TrG.GameReplicationInfo.Teams[m_TrPC.GetTeamNum() == 0 ? 1 : 0].Score == 1)
	{
	    QueueAccolade(class'TrAccolade_FinalBlow');
	}
}

function QueueAccolade(class<TrAccolade> Accolade, optional int ModifiedCredits = 0)
{
	local int  CreditsAwarded;
    local bool bDenyCredits;

    if (CreditsGiven(Accolade))
    {
        if (Stats != none) Stats.AddAccolade(m_TrPC, Accolade.default.DatabaseId, Accolade.default.ActivityId);
    }
    else
    {
        bDenyCredits = true;
    }

	// Increase the number of credits awarded to accolades if the perk is active.
	CreditsAwarded = Accolade.default.CreditsAwarded;

    if (ModifiedCredits > 0)
    {
        CreditsAwarded = ModifiedCredits;
    }
       
    if (bDenyCredits)
    {
        m_TrPC.ClientQueueAccolade(Accolade.default.IconIndex, Caps(Accolade.default.FriendlyName), "");
    }
    else
    {
        m_TrPC.ClientQueueAccolade(Accolade.default.IconIndex, Caps(Accolade.default.FriendlyName), "+"$string(CreditsAwarded));
        m_TrPC.ModifyCredits(CreditsAwarded);
    }

    if (Accolade.default.Broadcast)
    {
        BroadcastAccolade(Accolade);
    }
}

function bool CreditsGiven(class<TrAccolade> Accolade)
{
    if (class<TrAccolade_FlagGrab>(Accolade) != none)
    {
        if ((m_nLastFlagGrabTime == 0) || (m_TrG.WorldInfo.TimeSeconds > (m_nLastFlagGrabTime + MINIMUM_TIME_FLAG_CREDITS)))
        {
            m_nLastFlagGrabTime = m_TrG.WorldInfo.TimeSeconds;
        }
        else
        {
            return false;
        }
    }
    else if (class<TrAccolade_FlagReturn>(Accolade) != none)
    {
        if ((m_nLastFlagReturnTime == 0) || (m_TrG.WorldInfo.TimeSeconds > (m_nLastFlagReturnTime + MINIMUM_TIME_FLAG_CREDITS)))
        {
            m_nLastFlagReturnTime = m_TrG.WorldInfo.TimeSeconds;
        }
        else
        {
            return false;
        }
    }

    return true;
}

function BroadcastAccolade(class<TrAccolade> Accolade)
{        
    local string Message;

    Message = m_TrPC.PlayerReplicationInfo.PlayerName@Accolade.default.HUDMessage;

    m_TrG.BroadcastAccolade(Message);
}

defaultproperties
{
   MINIMUM_TIME_FLAG_CREDITS=25
   MAXIMUM_LLAMA_GRAB_SPEED=40
   MINIMUM_FAST_GRAB_SPEED=135
   MINIMUM_ULTRA_GRAB_SPEED=175
   MAXIMUM_FLAG_DEFENSE_DISTANCE=1500000
   MAXIMUM_EMERGENCY_GRAB_DISTANCE=2000000
   Name="Default__TrAccoladeManager"
   ObjectArchetype=Object'Core.Default__Object'
}
