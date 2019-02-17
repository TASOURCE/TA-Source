/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Aggregates data from a game session stored on disk
 */
class GameStatsAggregator extends GameplayEventsHandler
	native(GameStats)
	config(Game);



















































































































































	









	



		
		
	






































#linenumber 10;

/* Aggregate data starts here */
const GAMEEVENT_AGGREGATED_DATA = 10000;

/** Player aggregates */
const GAMEEVENT_AGGREGATED_PLAYER_TIMEALIVE		= 10001;
const GAMEEVENT_AGGREGATED_PLAYER_KILLS			= 10002;
const GAMEEVENT_AGGREGATED_PLAYER_DEATHS		= 10003;
const GAMEEVENT_AGGREGATED_PLAYER_MATCH_WON		= 10004;
const GAMEEVENT_AGGREGATED_PLAYER_ROUND_WON		= 10005;
const GAMEEVENT_AGGREGATED_PLAYER_NORMALKILL	= 10006;
const GAMEEVENT_AGGREGATED_PLAYER_WASNORMALKILL	= 10007;

/** Team aggregates */
const GAMEEVENT_AGGREGATED_TEAM_KILLS			= 10100;
const GAMEEVENT_AGGREGATED_TEAM_DEATHS			= 10101;
const GAMEEVENT_AGGREGATED_TEAM_GAME_SCORE		= 10102;
const GAMEEVENT_AGGREGATED_TEAM_MATCH_WON		= 10103;
const GAMEEVENT_AGGREGATED_TEAM_ROUND_WON		= 10104;

/** Damage class aggregates */
const GAMEEVENT_AGGREGATED_DAMAGE_KILLS						= 10200;
const GAMEEVENT_AGGREGATED_DAMAGE_DEATHS					= 10201;
const GAMEEVENT_AGGREGATED_DAMAGE_DEALT_WEAPON_DAMAGE		= 10202;
const GAMEEVENT_AGGREGATED_DAMAGE_DEALT_MELEE_DAMAGE		= 10203;
const GAMEEVENT_AGGREGATED_DAMAGE_RECEIVED_WEAPON_DAMAGE	= 10204;
const GAMEEVENT_AGGREGATED_DAMAGE_RECEIVED_MELEE_DAMAGE		= 10205;

/** Weapon class aggregates */
const GAMEEVENT_AGGREGATED_WEAPON_FIRED			= 10300;

/** Pawn class aggregates */
const GAMEEVENT_AGGREGATED_PAWN_SPAWN			= 10400;

/** Game specific starts here */
const GAMEEVENT_AGGREGATED_GAME_SPECIFIC		= 11000;


/** Current game state as the game stream is parsed */
var GameStateObject GameState;

/** Base container for a single stat aggregated over multiple time periods */
struct native GameEvent
{
	var init array<float> EventCountByTimePeriod;
	structcpptext
	{
		FGameEvent()
		{}
		FGameEvent(EEventParm)
		{
			appMemzero(this, sizeof(FGameEvent));
		}
		/** 
		 * Accumulate data for a given time period
		 * @param TimePeriod - time period slot to use (0 - game total, 1+ round total)
		 * @param Value - value to accumulate 
		 */
		void AddEventData(INT TimePeriod, FLOAT Value)
		{
			if (TimePeriod >= 0 && TimePeriod < 100) //sanity check
			{
				if (!EventCountByTimePeriod.IsValidIndex(TimePeriod))
				{
					EventCountByTimePeriod.AddZeroed(TimePeriod - EventCountByTimePeriod.Num() + 1);
				}

				check(EventCountByTimePeriod.IsValidIndex(TimePeriod));
				EventCountByTimePeriod(TimePeriod) += Value;
			}
			else
			{
				debugf(TEXT("AddEventData: Timeperiod %d way out of range."), TimePeriod);
			}
		}

		/*
		 *	Get accumulated data for a given time period
		 * @param TimePeriod - time period slot to get (0 - game total, 1+ round total)
		 */
		FLOAT GetEventData(INT TimePeriod) const
		{
			if (EventCountByTimePeriod.IsValidIndex(TimePeriod))
			{
				return EventCountByTimePeriod(TimePeriod);
			}
			else
			{
				return 0.0f;
			}
		}
	}
};

/** Container for game event stats stored by event ID */
struct native GameEvents
{
	var const private native transient  Map_Mirror  Events{TMap<INT, FGameEvent>};
	structcpptext
	{
		FGameEvents()
		{}

		/* 
		 *   Accumulate an event's data
		 * @param EventID - the event to record
		 * @param Value - the events recorded value
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddEvent(INT EventID, FLOAT Value, INT TimePeriod);

		/** @return Number of events in the list */
		INT Num() const
		{
			return Events.Num();
		}
	}
};

/** 
 * Container for all weapon events
 * Stores totals across all weapons plus individually by recorded weapon class metadata
 */
struct native WeaponEvents
{
	var GameEvents TotalEvents;
	var array<GameEvents> EventsByWeaponClass;
	structcpptext
	{
		FWeaponEvents()
		{}

		/* 
		 *   Accumulate a weapon event's data
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddWeaponIntEvent(INT EventID, struct FWeaponIntEvent* GameEventData, INT TimePeriod);
	}
};

/** 
 * Container for all projectile events
 * Stores totals across all projectiles plus individually by recorded projectile class metadata
 */
struct native ProjectileEvents
{
	var GameEvents TotalEvents;
	var array<GameEvents> EventsByProjectileClass;

	structcpptext
	{
		FProjectileEvents()
		{}

		/* 
		 *   Accumulate a projectile event's data
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddProjectileIntEvent(INT EventID, struct FProjectileIntEvent* GameEventData, INT TimePeriod);
	}
};

/** 
 * Container for all damage events
 * Stores totals across all damage plus individually by recorded damage class metadata
 */
struct native DamageEvents
{
	var GameEvents TotalEvents;
	var array<GameEvents> EventsByDamageClass;

	structcpptext
	{
		FDamageEvents()
		{}

		/* 
		 *   Accumulate a kill event for a given damage type
		 * @param EventID - the event to record
		 * @param KillTypeID - the ID of the kill type recorded
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddKillEvent(INT EventID, INT KillTypeID, struct FPlayerKillDeathEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a death event for a given damage type
		 * @param EventID - the event to record
		 * @param KillTypeID - the ID of the kill type recorded
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddDeathEvent(INT EventID, INT KillTypeID, struct FPlayerKillDeathEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a damage event for a given damage type
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddDamageIntEvent(INT EventID, struct FDamageIntEvent* GameEventData, INT TimePeriod);
	}
};

/** 
 * Container for all pawn events
 * Stores totals across all pawn plus individually by recorded pawn class metadata
 */
struct native PawnEvents
{		
	var GameEvents TotalEvents;
	var array<GameEvents> EventsByPawnClass;

	structcpptext
	{
		FPawnEvents()
		{}

		/* 
		 *   Accumulate a pawn event for a given pawn type
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddPlayerSpawnEvent(INT EventID, struct FPlayerSpawnEvent* GameEventData, INT TimePeriod);
	}
};

/** 
 * Container for all team events
 * Stores totals across a single team plus all sub container types
 */
struct native TeamEvents
{
	var GameEvents TotalEvents;
	var WeaponEvents WeaponEvents;
	var DamageEvents DamageAsPlayerEvents;
	var DamageEvents DamageAsTargetEvents;
	var ProjectileEvents ProjectileEvents;
	var PawnEvents PawnEvents;

	structcpptext
	{
		FTeamEvents()
		{}

		/** 
		 * Accumulate data for a generic event
		 * @param EventID - the event to record
		 * @param TimePeriod - time period slot to use (0 - game total, 1+ round total)
		 * @param Value - value to accumulate 
		 */
		void AddEvent(INT EventID, FLOAT Value, INT TimePeriod);
		/* 
		 *   Accumulate a kill event for a given damage type
		 * @param EventID - the event to record
		 * @param KillTypeID - the ID of the kill type recorded
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddKillEvent(INT EventID, INT KillTypeID, struct FPlayerKillDeathEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a death event for a given damage type
		 * @param EventID - the event to record
		 * @param KillTypeID - the ID of the kill type recorded
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddDeathEvent(INT EventID, INT KillTypeID, struct FPlayerKillDeathEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a weapon event's data
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddWeaponIntEvent(INT EventID, struct FWeaponIntEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a damage event for a given damage type where the team member was the attacker
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddDamageDoneIntEvent(INT EventID, struct FDamageIntEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a damage event for a given damage type where the team member was the target
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddDamageTakenIntEvent(INT EventID, struct FDamageIntEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a pawn event for a given pawn type
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddPlayerSpawnEvent(INT EventID, struct FPlayerSpawnEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a projectile event's data
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddProjectileIntEvent(INT EventID, struct FProjectileIntEvent* GameEventData, INT TimePeriod);
	}
};

/** 
 * Container for all player events
 * Stores totals across a single player plus all sub container types
 */
struct native PlayerEvents
{
	var GameEvents TotalEvents;
	var WeaponEvents WeaponEvents;
	var DamageEvents DamageAsPlayerEvents;
	var DamageEvents DamageAsTargetEvents;
	var ProjectileEvents ProjectileEvents;
	var PawnEvents PawnEvents;

	structcpptext
	{
		FPlayerEvents()
		{}

		/** 
		 * Accumulate data for a generic event
		 * @param EventID - the event to record
		 * @param TimePeriod - time period slot to use (0 - game total, 1+ round total)
		 * @param Value - value to accumulate 
		 */
		void AddEvent(INT EventID, FLOAT Value, INT TimePeriod);
		/* 
		 *   Accumulate a kill event for a given damage type
		 * @param EventID - the event to record
		 * @param KillTypeID - the ID of the kill type recorded
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddKillEvent(INT EventID, INT KillTypeID, struct FPlayerKillDeathEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a death event for a given damage type
		 * @param EventID - the event to record
		 * @param KillTypeID - the ID of the kill type recorded
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddDeathEvent(INT EventID, INT KillTypeID, struct FPlayerKillDeathEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a weapon event's data
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddWeaponIntEvent(INT EventID, struct FWeaponIntEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a damage event for a given damage type where the player was the attacker
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddDamageDoneIntEvent(INT EventID, struct FDamageIntEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a damage event for a given damage type where the player was the target
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddDamageTakenIntEvent(INT EventID, struct FDamageIntEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a pawn event for a given pawn type
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddPlayerSpawnEvent(INT EventID, struct FPlayerSpawnEvent* GameEventData, INT TimePeriod);
		/* 
		 *   Accumulate a projectile event's data
		 * @param EventID - the event to record
		 * @param GameEventData - the event data
		 * @param TimePeriod - a given time period (0 - game total, 1+ round total) 
		 */
		void AddProjectileIntEvent(INT EventID, struct FProjectileIntEvent* GameEventData, INT TimePeriod);
	}
};

struct native AggregateEventMapping
{
	/** Recorded event ID */
	var int EventID;
	/** Mapping to the main aggregate event */
	var int AggregateID;
	/** Mapping to the aggregate event for the target if applicable*/
	var int TargetAggregateID;
};

/** Array of all aggregates that require mappings when making an aggregate run */
var array<AggregateEventMapping> AggregatesList;

/** Mapping of event ID to its aggregate equivalents (created at runtime) */
var	const private native transient	Map_Mirror	AggregateEventsMapping{TMap<INT, struct FAggregateEventMapping>};

/** The set of aggregate events that the aggregation supports */
var array<GameplayEventMetaData> AggregateEvents;
				
/** Aggregates of all recorded events */
var GameEvents AllGameEvents;
/** Aggregates of all recorded team events */
var array<TeamEvents> AllTeamEvents;
/** Aggregates of all recorded player events */
var array<PlayerEvents> AllPlayerEvents;
/** Aggregates of all recorded weapon events */
var WeaponEvents AllWeaponEvents;
/** Aggregates of all recorded projectile events */
var ProjectileEvents AllProjectileEvents;
/** Aggregates of all recorded pawn events */
var PawnEvents AllPawnEvents;
/** Aggregates of all recorded damage events */
var DamageEvents AllDamageEvents;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** A chance to do something before the stream starts */
native event PreProcessStream();

/** A chance to do something after the stream ends */
native event PostProcessStream();

/*
 *   Get the mapping from an event ID to its equivalent aggregate IDs
 * @param EventID - EventID to map
 * @param AggregateID - Aggregate ID (main/player ID)
 * @param TargetAggregateID - AggregateID that applies to the target (if applicable)
 * @return TRUE if mapping found, FALSE otherwise
 */
native function bool GetAggregateMappingIDs(int EventID, out int AggregateID, out int TargetAggregateID);

defaultproperties
{
   AggregatesList(0)=(EventID=103,AggregateID=10004)
   AggregatesList(1)=(EventID=109,AggregateID=10005)
   AggregatesList(2)=(EventID=51,AggregateID=10102)
   AggregatesList(3)=(EventID=4,AggregateID=10103)
   AggregatesList(4)=(EventID=5,AggregateID=10104)
   AggregatesList(5)=(EventID=150,AggregateID=10202,TargetAggregateID=10204)
   AggregatesList(6)=(EventID=151,AggregateID=10203,TargetAggregateID=10205)
   AggregatesList(7)=(EventID=152,AggregateID=10300)
   AggregatesList(8)=(EventID=102,AggregateID=10400)
   AggregatesList(9)=(EventID=200,AggregateID=10006,TargetAggregateID=10007)
   AggregateEvents(0)=(EventID=10001,EventName="Player Time Alive",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=21)
   AggregateEvents(1)=(EventID=10002,EventName="Kills",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=21)
   AggregateEvents(2)=(EventID=10003,EventName="Deaths",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=21)
   AggregateEvents(3)=(EventID=10006,EventName="Normal Kill",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=21)
   AggregateEvents(4)=(EventID=10007,EventName="Was Normal Kill",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=21)
   AggregateEvents(5)=(EventID=10004,EventName="Match Won",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=21)
   AggregateEvents(6)=(EventID=10005,EventName="Round Won",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=21)
   AggregateEvents(7)=(EventID=10100,EventName="Kills",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=20)
   AggregateEvents(8)=(EventID=10101,EventName="Deaths",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=20)
   AggregateEvents(9)=(EventID=10102,EventName="Team Score",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=20)
   AggregateEvents(10)=(EventID=10103,EventName="Matches Won",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=20)
   AggregateEvents(11)=(EventID=10104,EventName="Rounds Won",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=20)
   AggregateEvents(12)=(EventID=10200,EventName="Kills",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=23)
   AggregateEvents(13)=(EventID=10201,EventName="Deaths",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=23)
   AggregateEvents(14)=(EventID=10202,EventName="Weapon Damage Dealt",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=23)
   AggregateEvents(15)=(EventID=10203,EventName="Melee Damage Dealt",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=23)
   AggregateEvents(16)=(EventID=10204,EventName="Weapon Damage Received",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=23)
   AggregateEvents(17)=(EventID=10205,EventName="Melee Damage Received",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=23)
   AggregateEvents(18)=(EventID=10300,EventName="Weapon Fired",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=22)
   AggregateEvents(19)=(EventID=10400,EventName="Spawns",StatGroup=(Group=GSG_Aggregate,Level=1),EventDataType=25)
   Name="Default__GameStatsAggregator"
   ObjectArchetype=GameplayEventsHandler'Engine.Default__GameplayEventsHandler'
}
