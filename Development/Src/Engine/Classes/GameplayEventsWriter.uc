/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Streams gameplay events recorded during a session to disk
 */
class GameplayEventsWriter extends GameplayEvents
	dependson(OnlineSubsystem,SoundCue)
	config(Game)
	native;










	


	 
	const GAMEEVENT_MATCH_STARTED = 0;
	 
	const GAMEEVENT_MATCH_ENDED = 1;
	 
	const GAMEEVENT_ROUND_STARTED = 2;
	 
	const GAMEEVENT_ROUND_ENDED = 3;
	 
	const GAMEEVENT_GAME_CLASS = 6;
	 
	const GAMEEVENT_GAME_OPTION_URL = 7;
	 
	const GAMEEVENT_GAME_MAPNAME = 8;
	
	


	 
	const GAMEEVENT_MEMORYUSAGE_POLL = 35;
	 
	const GAMEEVENT_FRAMERATE_POLL = 36;
	 
	const GAMEEVENT_NETWORKUSAGEIN_POLL = 37;
	 
	const GAMEEVENT_NETWORKUSAGEOUT_POLL = 38;
	 
	const GAMEEVENT_PING_POLL = 39;
	 
	const GAMEEVENT_RENDERTHREAD_POLL = 40;
	 
	const GAMEEVENT_GAMETHREAD_POLL = 41;
	 
	const GAMEEVENT_GPUFRAMETIME_POLL = 42;
	 
	const GAMEEVENT_FRAMETIME_POLL = 43;

	


	 
	const GAMEEVENT_TEAM_CREATED = 50;
	 
	const GAMEEVENT_TEAM_GAME_SCORE = 51;
	 
	const GAMEEVENT_TEAM_MATCH_WON = 4;
	 
	const GAMEEVENT_TEAM_ROUND_WON = 5;
	 
	const GAMEEVENT_TEAM_ROUND_STALEMATE = 6;

	


	 
	const GAMEEVENT_PLAYER_LOGIN = 100;
	 
	const GAMEEVENT_PLAYER_LOGOUT = 101;
	 
	const GAMEEVENT_PLAYER_SPAWN = 102;
	 
	const GAMEEVENT_PLAYER_MATCH_WON = 103;
	 
	const GAMEEVENT_PLAYER_KILL = 104;
	 
	const GAMEEVENT_PLAYER_LOCATION_POLL = 105;
	 
	const GAMEEVENT_PLAYER_TEAMCHANGE = 106;
	 
	const GAMEEVENT_PLAYER_KILL_STREAK = 107;
	 
	const GAMEEVENT_PLAYER_DEATH = 108;
	 
	const GAMEEVENT_PLAYER_ROUND_WON = 109;
	 
	const GAMEEVENT_PLAYER_ROUND_STALEMATE = 110;

	 
	const GAMEEVENT_WEAPON_DAMAGE = 150;
	 
	const GAMEEVENT_WEAPON_DAMAGE_MELEE = 151;
	 
	const GAMEEVENT_WEAPON_FIRED = 152;

	 
	const GAMEEVENT_PLAYER_KILL_NORMAL = 200; 

	 
	const GAMEEVENT_GENERIC_PARAM_LIST_START = 300;
	const GAMEEVENT_GENERIC_PARAM_LIST_END = 400;

	 
	const GAMEEVENT_GAME_SPECIFIC = 1000;

	 
	const GAMEEVENT_MAX_EVENTID = 0x0000FFFF;







































	









	



		
		
	






































#linenumber 12;


/** Reference to the game (set by StartLogging/EndLogging) */
var const GameInfo Game;

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


/** Turns a controller into a player index, possibly adding new information to the player array **/
function native int ResolvePlayerIndex(Controller Player);

/** 
 * Mark a new session, clear existing events, etc 
 *
 * @param HeartbeatDelta - polling frequency (0 turns it off)
 */
native function StartLogging(optional float HeartbeatDelta);

/** 
 * Resets the session, clearing all event data, but keeps the session ID/Timestamp intact
 * @param HeartbeatDelta - polling frequency (0 turns it off)
 */
native function ResetLogging(optional float HeartbeatDelta);

/** 
 * Mark the end of a logging session
 * closes file, stops polling, etc
 */
native function EndLogging();

/** Returns whether or not a logging session has been started */
function bool IsSessionInProgress()
{
	return CurrentSessionInfo.bGameplaySessionInProgress;
}

/** 
 *   Creates the archive that we are going to write to
 * @param Filename - name of the file that will be open for serialization
 * @return TRUE if successful, else FALSE
 */
native function bool OpenStatsFile(string Filename);

/** 
 * Closes and deletes the archive that was being written to
 * clearing all data stored within
 */
native function CloseStatsFile();

/** Serialize the contents of the file header */
native protected function bool SerializeHeader();

/** Serialize the contents of the file footer */
native protected function bool SerializeFooter();

/** Heartbeat function to record various stats (player location, etc) */
function Poll()
{
	local WorldInfo WI;
	WI = class'WorldInfo'.static.GetWorldInfo();
	if (WI.Pauser == None)
	{
		//Get a sample of where everyone is at the moment
		if (Game != None && !Game.bWaitingToStartMatch)
		{
			LogAllPlayerPositionsEvent(class'GameplayEventsWriter'.const.GAMEEVENT_PLAYER_LOCATION_POLL);
			Game.GameEventsPoll();
		}

		LogSystemPollEvents();
	}
}

/*
 * Get the Id for the gametype the game is using
 * @return Id related to the game specific game type being played
 */
event int GetGameTypeId() { return 0; }

/**
* Logs an int base game event
*
* @param EventId the event being logged
* @param Value the value associated with the event
*/
native function LogGameIntEvent(int EventId, int Value);

/**
* Logs a string based game event
*
* @param EventId the event being logged
* @param Value the value associated with the event
*/
native function LogGameStringEvent(int EventId, string Value);

/**
* Logs a float based game event
*
* @param EventId the event being logged
* @param Value the value associated with the event
*/
native function LogGameFloatEvent(int EventId, float Value);

/**
* Logs a position based game event
*
* @param EventId the event being logged
* @param Position the position of the event
* @param Value the value associated with the event
*/
native function LogGamePositionEvent(int EventId, const out vector Position, float Value);

/**
* Logs a int based team event
*
* @param EventId - the event being logged
* @param Team - the team associated with this event
* @param Value - the value associated with the event
*/
native function LogTeamIntEvent(int EventId, TeamInfo Team, int Value);

/**
* Logs a float based team event
*
* @param EventId - the event being logged
* @param Team - the team associated with this event
* @param Value - the value associated with the event
*/
native function LogTeamFloatEvent(int EventId, TeamInfo Team, float Value);

/**
* Logs a string based team event
*
* @param EventId - the event being logged
* @param Team - the team associated with this event
* @param Value - the value associated with the event
*/
native function LogTeamStringEvent(int EventId, TeamInfo Team, string Value);

/**
* Logs an event with an integer value associated with it
*
* @param EventId the event being logged
* @param Player the player that triggered the event
* @param Value the value for this event
*/
native function LogPlayerIntEvent(int EventId, Controller Player, int Value);

/**
* Logs an event with an float value associated with it
*
* @param EventId the event being logged
* @param Player the player that triggered the event
* @param Value the value for this event
*/
native function LogPlayerFloatEvent(int EventId, Controller Player, float Value);

/**
* Logs an event with an string value associated with it
*
* @param EventId the event being logged
* @param Player the player that triggered the event
* @param EventString the value for this event
*/
native function LogPlayerStringEvent(int EventId, Controller Player, string EventString);

/**
* Logs a spawn event for a player (team, class, etc)
*
* @param EventId the event being logged
* @param Player the player that triggered the event
* @param PawnClass the pawn this player spawned with
* @param Team the team the player is on
*/
native function LogPlayerSpawnEvent(int EventId, Controller Player, class<Pawn> PawnClass, int TeamID);

/**
* Logs when a player leaves/joins a session
*
* @param EventId the login/logout event for the player
* @param Player the player that joined/left
* @param PlayerName the name of the player in question
* @param PlayerId the net id of the player in question
* @param bSplitScreen whether the player is on splitscreen
*/
native function LogPlayerLoginChange(int EventId, Controller Player, string PlayerName, UniqueNetId PlayerId, bool bSplitScreen);

/**
* Logs the location of all players when this event occurred 
*
* @param EventId the event being logged
*/
native function LogAllPlayerPositionsEvent(int EventId);

/**
* Logs a player killing and a player being killed
*
* @param EventId the event that should be written
* @param KillType the additional information about a kill
* @param Killer the player that did the killing
* @param DmgType the damage type that was done
* @param Dead the player that was killed
*/
native function LogPlayerKillDeath(int EventId, int KillType, Controller Killer, class<DamageType> DmgType, Controller Dead);

/**
* Logs a player to player event
*
* @param EventId the event that should be written
* @param Player the player that triggered the event
* @param Target the player that was the recipient
*/
native function LogPlayerPlayerEvent(int EventId, Controller Player, Controller Target);

/**
* Logs a weapon event with an integer value associated with it
*
* @param EventId the event being logged
* @param Player the player that triggered the event
* @param WeaponClass the weapon class associated with the event
* @param Value the value for this event
*/
native function LogWeaponIntEvent(int EventId, Controller Player, class<Weapon> WeaponClass, int Value);

/**
* Logs damage with the amount that was done and to whom it was done
*
* @param EventId the event being logged
* @param Player the player that triggered the event
* @param DmgType the damage type that was done
* @param Target the player being damaged
* @param Amount the amount of damage done
*/
native function LogDamageEvent(int EventId, Controller Player, class<DamageType> DmgType, Controller Target, int Amount);

/**
* Logs a projectile event with an integer value associated with it
*
* @param EventId the event being logged
* @param Player the player that triggered the event
* @param Proj the projectile class associated with the event
* @param Value the value for this event
*/
native function LogProjectileIntEvent(int EventId, Controller Player, class<Projectile> Proj, int Value);


/** Log various system properties like memory usage, network usage, etc. */
native function LogSystemPollEvents();

/** will return a generic param list entry that can then have params set on it before commiting to disk */
native function GenericParamListStatEntry GetGenericParamListEntry();

function RecordAIPathFail(Controller AI, coerce string reason, vector dest)
{
















}

function int RecordCoverLinkFireLinks(CoverLink Link,Controller Player)
{











































	return 0;



}

cpptext
{
	/** 
	 * Turns a controller into a player index, possibly adding new information to the player array 
	 *  @param TeamInfo - TeamInfo class to resolve an index for
	 *	@return Index of the team in the team metadata array
	 */
	virtual INT ResolveTeamIndex(class ATeamInfo *TeamInfo);

	/** Turns a weapon class into an index, possibly adding new information to the array **/
	INT ResolveWeaponClassIndex(UClass* WeaponClass);

	/** Turns a damage class into an index, possibly adding new information to the array **/
	INT ResolveDamageClassIndex(UClass* DamageClass);

	/** Turns a projectile class into an index, possibly adding new information to the array **/
	INT ResolveProjectileClassIndex(UClass* ProjectileClass);

	/** Turns a pawn class into an index, possibly adding new information to the array **/
	INT ResolvePawnIndex(UClass* PawnClass);

	/**
	 * Turns an actor into an index
	 * @param Actor the actor to find in the array
	 * @return the index in the array for that actor
	 */
	INT ResolveActorIndex(AActor* Actor)
	{
		INT Index = INDEX_NONE;
		if (Actor != NULL)
		{
			Index = ActorArray.FindItemIndex(Actor->GetName());
			if (Index == INDEX_NONE)
			{
				Index = ActorArray.AddItem(Actor->GetName());
			}
		}
		return Index;
	}

	/**
	 * Turns an sound cue into an index
	 *
	 * @param Cue the sound cue to find in the array
	 *
	 * @return the index in the array for that sound cue
	 */
	INT ResolveSoundCueIndex(USoundCue* Cue)
	{
		INT Index = INDEX_NONE;
		if (Cue != NULL)
		{
			Index = SoundCueArray.FindItemIndex(Cue->GetName());
			if (Index == INDEX_NONE)
			{
				Index = SoundCueArray.AddItem(Cue->GetName());
			}
		}
		return Index;
	}

}


defaultproperties
{
   Name="Default__GameplayEventsWriter"
   ObjectArchetype=GameplayEvents'Engine.Default__GameplayEvents'
}
