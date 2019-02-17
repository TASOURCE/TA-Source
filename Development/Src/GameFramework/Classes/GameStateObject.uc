/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Keeps track of current state as a game stats stream is parsed
 */
class GameStateObject extends GameplayEventsHandler
	native(GameStats)
	config(Game);

/** Types of game sessions the state object can handle */
enum GameSessionType
{
	GT_SessionInvalid,
	GT_SinglePlayer,
	GT_Coop,
	GT_Multiplayer
};

/** State variables related to a game team */
struct native TeamState
{
	/** Team Index related to team metadata array */
	var int TeamIndex;
	/** Array of player indices that were ever on a given team */
	var init array<int> PlayerIndices;
};

/** All teams present in the game over the course of the stream */
var native const Array_Mirror TeamStates{TArray<FTeamState*>};

/** Contains the notion of player state while parsing the stats stream */
struct native PlayerState
{
	/** Player index related to player metadata array */
	var int PlayerIndex;
	/** Current team index (changes with TEAM_CHANGE event) */
	var int CurrentTeamIndex;
	/** Last time player spawned */
	var float TimeSpawned; 
	/** If non-zero represents the time between a spawn and death event */
	var float TimeAliveSinceLastDeath;
};

/** All players present in the game over the course of the stream */
var native const Array_Mirror PlayerStates{TArray<FPlayerState*>};

/** Type of game session we are parsing */
var GameSessionType SessionType;
/** Has the stream passed a match started event */
var bool bIsMatchStarted;
/** True if between round started and ended events */
var bool bIsRoundStarted; 
/** Current round number reported by the last round started event */
var int RoundNumber;
/** Maximum round number reported during the match */
var int MaxRoundNumber;

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

/** Completely reset the game state object */
native function Reset();

defaultproperties
{
   Name="Default__GameStateObject"
   ObjectArchetype=GameplayEventsHandler'Engine.Default__GameplayEventsHandler'
}
