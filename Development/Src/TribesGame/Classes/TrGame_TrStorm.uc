/**
 * Storm game type.
 */
class TrGame_TrStorm extends TrGame
    config(game);

struct Carrier
{
	/** Health of the shields. */
	var int ShieldHealth;

	/** Core health. */
	var int CoreHealth;

	/** Team this Carrier is assigned to. */
	var byte TeamNum;
};

/** Represents the ships for each team. */
var Carrier m_Carriers[2];

struct Missile
{
	var TrStormControlPoint FiredFrom;
	var float RemainingFlightTime;
	var byte TargetTeam;
};

/** Keeps track of all fired missiles. */
var transient array<Missile> m_fActiveMissiles;

/** Amount of damage a missile deals. */
var float m_fMissileDamageAmount;

/** Pointers to the carrier shield for each team (BE: 0, DS: 1). */
var TrStormCarrierShield m_CarrierShields[2];

/** Pointers to the carrier core for each team (BE: 0, DS: 1). */
var TrStormCore m_CarrierCore[2];

/** Initial shield health. */
var int m_nMaxShieldHealth;

/** Initial core health. */
var int m_nMaxCoreHealth;

/** How long to stay in MatchEnding state. Represents how long we want the destroyed carrier to blow up. */
var float MatchEndingTime;

function PostBeginPlay()
{
	local TrStormCarrierShield Shield;
	local TrGameReplicationInfo TrGRI;

	Super.PostBeginPlay();

	foreach AllActors( class 'TrStormCarrierShield', Shield )
	{
		if( Shield.m_AssociatedCarrierCore.DefenderTeamIndex == 0 )
		{
			m_CarrierShields[0] = Shield;
			m_CarrierCore[0] = Shield.m_AssociatedCarrierCore;
		}
		else if( Shield.m_AssociatedCarrierCore.DefenderTeamIndex == 1 )
		{
			m_CarrierShields[1] = Shield;
			m_CarrierCore[1] = Shield.m_AssociatedCarrierCore;
		}
	}

	m_Carriers[0].TeamNum = 0;
	m_Carriers[0].CoreHealth = m_nMaxCoreHealth;
	m_Carriers[0].ShieldHealth = m_nMaxShieldHealth;

	m_Carriers[1].TeamNum = 1;
	m_Carriers[1].CoreHealth = m_nMaxCoreHealth;
	m_Carriers[1].ShieldHealth = m_nMaxShieldHealth;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if( TrGRI != none )
	{
		TrGRI.r_CarrierCoreHealth[0] = m_Carriers[0].CoreHealth;
		TrGRI.r_CarrierShieldHealth[0] = m_Carriers[0].ShieldHealth;
		TrGRI.r_CarrierCoreHealth[1] = m_Carriers[1].CoreHealth;
		TrGRI.r_CarrierShieldHealth[1] = m_Carriers[1].ShieldHealth;
	}
}

/** Adds a missile to be tracked and later explode on a Carrier. */
function MissileFired(TrStormControlPoint FiredFrom, float TimeTillExplosion, byte TargetTeam)
{
	local Missile NewMissile;

	;

	NewMissile.FiredFrom = FiredFrom;
	NewMissile.RemainingFlightTime = TimeTillExplosion;
	NewMissile.TargetTeam = TargetTeam;

	m_fActiveMissiles.AddItem(NewMissile);
}

event Tick(float DeltaTime)
{
	local int i;

	for( i = 0; i < m_fActiveMissiles.Length; i++ )
	{
		// Update each missile.
		m_fActiveMissiles[i].RemainingFlightTime -= DeltaTime;

		if( m_fActiveMissiles[i].RemainingFlightTime <= 0.0 )
		{
			// Explode!
			ExplodeMissile(m_fActiveMissiles[i].TargetTeam);
			m_fActiveMissiles.Remove(i,1);
			i--;
		}
	}
}

/** Explodes a missile on a team's Carrier. */
function ExplodeMissile(byte TeamNum)
{
	local int RemainingDamage, OldShieldHealth;
	local TrGameReplicationInfo TrGRI;
	local PlayerController P;
	local float PctCoreHealth, PctOldCoreHealth;

	;
	RemainingDamage = m_fMissileDamageAmount;
	if( m_Carriers[TeamNum].ShieldHealth > 0)
	{
		OldShieldHealth = m_Carriers[TeamNum].ShieldHealth;

		// First take away any shields.
		m_Carriers[TeamNum].ShieldHealth -= RemainingDamage;

		if( m_Carriers[TeamNum].ShieldHealth <= 0 )
		{
			// Carry over any remaining damage to the core health.
			RemainingDamage = Abs(m_Carriers[TeamNum].ShieldHealth);
			m_Carriers[TeamNum].ShieldHealth = 0;

			// Shield is destroyed.
			m_CarrierShields[TeamNum].OnShieldsDestroyed();
		}

		TrGRI = TrGameReplicationInfo(WorldInfo.Game.GameReplicationInfo);
		if( TrGRI != none )
		{
			TrGRI.r_CarrierShieldHealth[TeamNum] = m_Carriers[TeamNum].ShieldHealth;
		}

		// Broadcast messages to all players.
		if( float(OldShieldHealth) / float(default.m_nMaxShieldHealth) > 0.5 &&
			float(m_Carriers[TeamNum].ShieldHealth) / float(default.m_nMaxShieldHealth) < 0.5 )
		{
			// Broadcast that shield health has just gone below 50%.
			foreach WorldInfo.AllControllers(class'PlayerController', P)
			{
				P.ReceiveLocalizedMessage(class'TrStormMessage', (P.GetTeamNum() == TeamNum ? 3 : 4));
			}
		}
		else if(  m_Carriers[TeamNum].ShieldHealth <= 0 )
		{
			// Broadcast that shield health has just been taken down.
			foreach WorldInfo.AllControllers(class'PlayerController', P)
			{
				P.ReceiveLocalizedMessage(class'TrStormMessage', (P.GetTeamNum() == TeamNum ? 5 : 6));
			}
		}
	}

	// Damage the core.
	if( m_Carriers[TeamNum].ShieldHealth <= 0 )
	{
		PctOldCoreHealth = float(m_Carriers[TeamNum].CoreHealth) / float(default.m_nMaxCoreHealth);
		TakeHealthDamage(TeamNum, RemainingDamage);
		PctCoreHealth = float(m_Carriers[TeamNum].CoreHealth) / float(default.m_nMaxCoreHealth);

		if( PctOldCoreHealth > 0.75 && PctCoreHealth < 0.75 )
		{
			// Broadcast 75% core health.
			foreach WorldInfo.AllControllers(class'PlayerController', P)
			{
				P.ReceiveLocalizedMessage(class'TrStormMessage', (P.GetTeamNum() == TeamNum ? 11 : 7));
			}
		}
		else if( PctOldCoreHealth > 0.5 && PctCoreHealth < 0.5 )
		{
			// Broadcast 50% core health.
			foreach WorldInfo.AllControllers(class'PlayerController', P)
			{
				P.ReceiveLocalizedMessage(class'TrStormMessage', (P.GetTeamNum() == TeamNum ? 12 : 8));
			}
		}
		else if( PctOldCoreHealth > 0.25 && PctCoreHealth < 0.25 )
		{
			// Broadcast 25% core health.
			foreach WorldInfo.AllControllers(class'PlayerController', P)
			{
				P.ReceiveLocalizedMessage(class'TrStormMessage', (P.GetTeamNum() == TeamNum ? 13 : 9));
			}
		}
		else if( PctCoreHealth == 0.0 )
		{
			// Broadcast core destroyed.
			foreach WorldInfo.AllControllers(class'PlayerController', P)
			{
				P.ReceiveLocalizedMessage(class'TrStormMessage', (P.GetTeamNum() == TeamNum ? 14 : 10));
			}
		}
	}
}


function TakeHealthDamage(byte TeamNum, int DamageAmount)
{
	local TrGameReplicationInfo TrGRI;

	m_Carriers[TeamNum].CoreHealth -= DamageAmount;
	if( m_Carriers[TeamNum].CoreHealth <= 0 )
	{
		m_Carriers[TeamNum].CoreHealth = 0.0;
		CarrierDestroyed(TeamNum);
	}

	TrGRI = TrGameReplicationInfo(WorldInfo.Game.GameReplicationInfo);
	if( TrGRI != none )
	{
		TrGRI.r_CarrierCoreHealth[TeamNum] = m_Carriers[TeamNum].CoreHealth;
	}
}

/** A carrier has been destroyed. */
function CarrierDestroyed(byte TeamNum)
{
	m_CarrierCore[TeamNum].OnCoreDestroyed();
	GotoState('MatchEnding');
}

/** A core has been damaged. */
function TakeDamageFromCore(byte TeamNum, int DamageAmount)
{
	TakeHealthDamage(TeamNum, DamageAmount);
}

state MatchEnding
{
ignores TakeHealthDamage, MissileFired, CarrierDestroyed, TakeDamageFromCore;
	function BeginState(Name PreviousStateName)
	{
		SetTimer(MatchEndingTime, false);
	}

	function Timer()
	{
		local string Reason;

		if( m_Carriers[0].CoreHealth == 0.0 )
		{
			Reason="BloodEagleCarrierDestroyed";
		}
		else
		{
			Reason="DiamondSwordCarrierDestroyed";
		}
		EndGame(none, Reason);
	}
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
	local bool bControllerTeamWon;
	local Controller P;

	if( m_Carriers[0].CoreHealth <= 0 || m_Carriers[1].CoreHealth <= 0 )
	{
		foreach WorldInfo.AllControllers(class'Controller', P)
		{
			if( P.PlayerReplicationInfo != None )
			{
				if( Reason ~= "BloodEagleCarrierDestroyed" && P.PlayerReplicationInfo.Team.TeamIndex == 1)
				{
					bControllerTeamWon = true;
				}
				else if( Reason ~= "DiamondSwordCarrierDestroyed" && P.PlayerReplicationInfo.Team.TeamIndex == 0)
				{
					bControllerTeamWon = true;
				}
				P.GameHasEnded(EndGameFocus,bControllerTeamWon);
			}
		}
		return true;
	}
	return false;
}

function EndGame(PlayerReplicationInfo Winner, string Reason )
{
	super.EndGame(Winner, Reason);
	GotoState('MatchOver');
}

function int DetermineWinningTeam()
{
	local int WinningTeam;

	if( m_Carriers[0].CoreHealth <= 0 )
	{
		// Diamond Sword wins.
		WinningTeam = 1;
	}
	else if( m_Carriers[1].CoreHealth <= 0 )
	{
		// Blood Eagle wins.
		WinningTeam = 2;
	}
	else
	{
		// Stalemate.
		WinningTeam = 0;
	}
	return WinningTeam;
}

defaultproperties
{
   m_fMissileDamageAmount=1.000000
   m_nMaxShieldHealth=1
   m_nMaxCoreHealth=300
   MatchEndingTime=1.000000
   bSpawnInTeamArea=True
   Acronym="TrStorm"
   MapPrefixes(0)="TrStorm"
   bTeamGame=True
   OnlineGameSettingsClass=Class'TribesGame.TrGameSettingsTrStorm'
   Name="Default__TrGame_TrStorm"
   ObjectArchetype=TrGame'TribesGame.Default__TrGame'
}
