/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Gameplay event interface
 */
class GameplayEvents extends Object
	config(Game)
	abstract
	native;



















































































































































	









	



		
		
	






































#linenumber 11;	

// Bitmasks for flags stored on the MCP header
const HeaderFlags_NoEventStrings = 1;

/** Stat verbosity level */
enum EGameStatGroups
{
	GSG_EngineStats,
	GSG_Game,
	GSG_Team,
	GSG_Player,
	GSG_Weapon,
	GSG_Damage,
	GSG_Projectile,
	GSG_Pawn,
	GSG_GameSpecific,
	GSG_Aggregate
};

struct native GameStatGroup
{
	/** Group stat belongs to*/
	var EGameStatGroups Group;
	/** Level of the stat */
	var int Level;

	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FGameStatGroup& T );
	}
};

/** Basic file header when writing to disk */
struct native GameplayEventsHeader
{   
	/** Version of engine at the time of writing the file */
	var const int EngineVersion;

	/** Version of the stats format at the time of writing the file */
	var const int StatsWriterVersion;

	/** Offset into the file for the stream data */
	var const int StreamOffset;

	/** Offset into the file for aggregate data */
	var const int AggregateOffset;

	/** Offset into the file where the metadata is written */
	var const int FooterOffset;

	/** Amount of data in the stream (not including header/footer data) */
	var const int TotalStreamSize;

	/** File size on disk */
	var const int FileSize;

	/** What filter class is being used on the data, if any */
	var string FilterClass;

	/** Various settings */
	var int Flags;
};

/** Game stats session information recorded at log start */
struct native GameSessionInformation
{
	/** Unique title identifier */
	var int AppTitleID;

	/** Platform the session was run on */
	var int PlatformType;

	/** Language the session was run in */
	var string Language;

	/** Time this session was begun (real time) */
	var const string GameplaySessionTimestamp;

	/** Time this session was started (game time) */
	var const float GameplaySessionStartTime;

	/** Time this session was ended (game time) */
	var const float GameplaySessionEndTime;

	/** Is a session currently in progress */
	var const bool bGameplaySessionInProgress;

	/** Unique session ID */
	var const string GameplaySessionID;

	/** Name of the game class used */
	var const string GameClassName;

	/** Name of map at time of session  */
	var const string MapName;

	/** Game URL at time of session */
	var const string MapURL;

	/** Value used to distinguish between contiguous sections */
	var const int SessionInstance;

	/** Gametype ID */
	var const int GameTypeId;

	/** UniqueID of player logging stats */
	var const UniqueNetId OwningNetId;

	structcpptext
	{
		/** Constructors */
		FGameSessionInformation() {}
		FGameSessionInformation(EEventParm)
		{
			appMemzero(this, sizeof(FGameSessionInformation));
		}

		/** Return the unique key for this session */
		const FString GetSessionID() const { return FString::Printf(TEXT("%s:%d"), *GameplaySessionID, SessionInstance); }
	}
};

/** List of team information cached during the play session */
struct native TeamInformation
{
	/** Index of the team in game */
	var int TeamIndex;

	/** Name of the team */
	var string TeamName;

	/** Color of the team */
	var color TeamColor;

	/** Max size during the game */
	var int MaxSize;
	
	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FTeamInformation& T );
	}
};

/** List of player information cached in case the player logs out and GC collects the objects */
struct native PlayerInformationNew
{
	/** Controller.Name */
	// has to be a string unfortunately since the names are shared, number appended
	var string ControllerName;
	/** Controller.PlayerReplicationInfo.PlayerName */
	var string PlayerName;
	/** UniqueID of the player */
	var UniqueNetId UniqueId;
	/** Whether the player is a bot or not */
	var bool bIsBot;
	
	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FPlayerInformationNew& T );
	}
};

/** Holds the information describing a gameplay event */
struct native GameplayEventMetaData
{
	/** The unique id of the event (16 bits clamped) */
	var const int EventID;

	/** Human readable name of the event */
	var const name EventName;

	/** Group that this stat belongs to, for filtering */
	var const GameStatGroup StatGroup;

	/** Type of data associated with this event */
	var const int EventDataType;
	
	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FGameplayEventMetaData& T );
	}
};

/** Metadata describing the weapon classes recorded during gameplay */
struct native WeaponClassEventData
{
	/** Name of the weapon class used **/
	var string WeaponClassName;
	
	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FWeaponClassEventData& T );
	}
};

/** Metadata describing the damage classes recorded during gameplay */
struct native DamageClassEventData
{
	/** Name of the damage class used **/
	var string DamageClassName;
	
	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FDamageClassEventData& T );
	}
};

/** Metadata describing the projectile classes recorded during gameplay */
struct native ProjectileClassEventData
{
	/** name of the projectile class used **/
	var string ProjectileClassName;
	
	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FProjectileClassEventData& T );
	}
};

/** Metadata describing the pawn classes recorded during gameplay */
struct native PawnClassEventData
{
	/** Name of the pawn class used **/
	var string PawnClassName;
	
	structcpptext
	{
		friend FArchive& operator<<( FArchive& Ar, FPawnClassEventData& T );
	}
};

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

/** FArchive pointer to serialize the data to/from disk */
var const native pointer Archive{FArchive};

/** The name of the file we are writing the data to (const so set only upon create natively) */
var const private string StatsFileName;

/** Header of the gameplay events file */
var GameplayEventsHeader Header;

/** Information specific to the session when it was run */
var GameSessionInformation CurrentSessionInfo;

/** Array of all players 'seen' by the game in this session **/
var const array<PlayerInformationNew> PlayerList;

/** Array of all teams 'seen' by the game in this session **/
var const array<TeamInformation> TeamList;

/** The set of events that the game supports writing to disk */
var array<GameplayEventMetaData> SupportedEvents;

/** The set of weapons recorded during gameplay */
var array<WeaponClassEventData> WeaponClassArray;

/** The set of damage types recorded during gameplay */
var array<DamageClassEventData> DamageClassArray;

/** The set of projectiles recorded during gameplay */
var array<ProjectileClassEventData> ProjectileClassArray;

/** The set of pawns recorded during gameplay */
var array<PawnClassEventData> PawnClassArray;

/** The set of actors recorded during gameplay */
var array<String> ActorArray;

/** The set of sound cues encountered during gameplay */
var array<String> SoundCueArray;

/** 
 *   Creates the archive that we are going to be manipulating 
 * @param Filename - name of the file that will be open for serialization
 * @return TRUE if successful, else FALSE
 */
function bool OpenStatsFile(string Filename);

/** 
 * Closes and deletes the archive created
 * clearing all data stored within
 */
function CloseStatsFile();

/** Retrieve the name of the file last in use by the gameplay event serializer, possibly empty */
event string GetFilename()
{
	return StatsFileName;
}

cpptext
{
	/** Access the current session info */
	const FGameSessionInformation& GetSessionInfo() const
	{
		return CurrentSessionInfo;
	}

	/** Returns the metadata associated with the given index */
	virtual const FGameplayEventMetaData& GetEventMetaData(INT EventID) const;

	/** Returns the metadata associated with the given index */
	const FTeamInformation& GetTeamMetaData(INT TeamIndex) const;

	/** Returns the metadata associated with the given index */
	const FPlayerInformationNew& GetPlayerMetaData(INT PlayerIndex) const;

	/** Returns the metadata associated with the given index */
	const FPawnClassEventData& GetPawnMetaData(INT PawnClassIndex) const;

	/** Returns the metadata associated with the given index */
	const FWeaponClassEventData& GetWeaponMetaData(INT WeaponClassIndex) const;

	/** Returns the metadata associated with the given index */
	const FDamageClassEventData& GetDamageMetaData(INT DamageClassIndex) const;

	/** Returns the metadata associated with the given index */
	const FProjectileClassEventData& GetProjectileMetaData(INT ProjectileClassIndex) const;

	/**
	 * Returns the metadata associated with the given index
	 * @param ActorIndex the index of the actor being looked up
	 * @return the name of the actor at that index
	 */
	const FString& GetActorMetaData(INT ActorIndex) const
	{
		return ActorArray(ActorIndex);
	}

	/**
	 * Returns the metadata associated with the given index
	 * @param SoundIndex the index of the soundcue being looked up
	 * @return the name of the actor at that index
	 */
	const FString& GetSoundMetaData(INT SoundIndex) const
	{
		return SoundCueArray(SoundIndex);
	}

}


defaultproperties
{
   SupportedEvents(0)=(EventID=-1,EventName="Unknown",StatGroup=(Level=999),EventDataType=1)
   SupportedEvents(1)=(EventName="Match Started",StatGroup=(Group=GSG_Game,Level=1),EventDataType=1)
   SupportedEvents(2)=(EventID=1,EventName="Match Ended",StatGroup=(Group=GSG_Game,Level=1),EventDataType=1)
   SupportedEvents(3)=(EventID=2,EventName="Round Started",StatGroup=(Group=GSG_Game,Level=1),EventDataType=1)
   SupportedEvents(4)=(EventID=3,EventName="Round Ended",StatGroup=(Group=GSG_Game,Level=1),EventDataType=1)
   SupportedEvents(5)=(EventID=6,EventName="Game Class",StatGroup=(Group=GSG_Game,Level=1))
   SupportedEvents(6)=(EventID=7,EventName="Game Options",StatGroup=(Group=GSG_Game,Level=1))
   SupportedEvents(7)=(EventID=8,EventName="Map Name",StatGroup=(Group=GSG_Game,Level=1))
   SupportedEvents(8)=(EventID=50,EventName="Team Created",StatGroup=(Group=GSG_Team,Level=1),EventDataType=2)
   SupportedEvents(9)=(EventID=51,EventName="Team Score",StatGroup=(Group=GSG_Team,Level=1),EventDataType=2)
   SupportedEvents(10)=(EventID=4,EventName="Match Won",StatGroup=(Group=GSG_Team,Level=1),EventDataType=2)
   SupportedEvents(11)=(EventID=5,EventName="Round Won",StatGroup=(Group=GSG_Team,Level=1),EventDataType=2)
   SupportedEvents(12)=(EventID=6,EventName="Round Stalemate",StatGroup=(Group=GSG_Team,Level=1),EventDataType=2)
   SupportedEvents(13)=(EventID=100,EventName="Player Login",StatGroup=(Group=GSG_Player,Level=1),EventDataType=7)
   SupportedEvents(14)=(EventID=101,EventName="Player Logout",StatGroup=(Group=GSG_Player,Level=1),EventDataType=7)
   SupportedEvents(15)=(EventID=104,EventName="Player Killed",StatGroup=(Group=GSG_Player,Level=1),EventDataType=9)
   SupportedEvents(16)=(EventID=108,EventName="Player Death",StatGroup=(Group=GSG_Player,Level=1),EventDataType=9)
   SupportedEvents(17)=(EventID=106,EventName="Player Team Change",StatGroup=(Group=GSG_Player,Level=1),EventDataType=3)
   SupportedEvents(18)=(EventID=102,EventName="Player Spawn",StatGroup=(Group=GSG_Player,Level=1),EventDataType=6)
   SupportedEvents(19)=(EventID=105,EventName="Player Locations",StatGroup=(Group=GSG_Player,Level=10),EventDataType=8)
   SupportedEvents(20)=(EventID=107,EventName="Kill Streak",StatGroup=(Group=GSG_Player,Level=1),EventDataType=3)
   SupportedEvents(21)=(EventID=103,EventName="Player Match Won",StatGroup=(Group=GSG_Player,Level=1),EventDataType=3)
   SupportedEvents(22)=(EventID=109,EventName="Player Round Won",StatGroup=(Group=GSG_Player,Level=1),EventDataType=3)
   SupportedEvents(23)=(EventID=110,EventName="Player Round Stalemate",StatGroup=(Group=GSG_Player,Level=1),EventDataType=3)
   SupportedEvents(24)=(EventID=150,EventName="Weapon Damage",StatGroup=(Group=GSG_Weapon,Level=5),EventDataType=12)
   SupportedEvents(25)=(EventID=151,EventName="Melee Damage",StatGroup=(Group=GSG_Weapon,Level=5),EventDataType=12)
   SupportedEvents(26)=(EventID=152,EventName="Weapon Fired",StatGroup=(Group=GSG_Weapon,Level=10),EventDataType=11)
   SupportedEvents(27)=(EventID=200,EventName="Normal Kill",StatGroup=(Group=GSG_Weapon,Level=1),EventDataType=9)
   SupportedEvents(28)=(EventID=35,EventName="Memory Usage",StatGroup=(Level=10),EventDataType=1)
   SupportedEvents(29)=(EventID=37,EventName="Network Usage IN",StatGroup=(Level=10),EventDataType=1)
   SupportedEvents(30)=(EventID=38,EventName="Network Usage OUT",StatGroup=(Level=10),EventDataType=1)
   SupportedEvents(31)=(EventID=39,EventName="Ping",StatGroup=(Level=10),EventDataType=1)
   SupportedEvents(32)=(EventID=36,EventName="Frame Rate",StatGroup=(Level=10),EventDataType=1)
   SupportedEvents(33)=(EventID=41,EventName="Game thread time",StatGroup=(Level=10),EventDataType=18)
   SupportedEvents(34)=(EventID=40,EventName="Render thread time",StatGroup=(Level=10),EventDataType=18)
   SupportedEvents(35)=(EventID=42,EventName="GPU render time",StatGroup=(Level=10),EventDataType=18)
   SupportedEvents(36)=(EventID=43,EventName="Total frame time",StatGroup=(Level=10),EventDataType=18)
   SupportedEvents(37)=(EventID=302,EventName="AI Path Failure",StatGroup=(Group=GSG_Game,Level=10),EventDataType=14)
   SupportedEvents(38)=(EventID=305,EventName="AI Firelink",StatGroup=(Group=GSG_Game,Level=10),EventDataType=14)
   Name="Default__GameplayEvents"
   ObjectArchetype=Object'Core.Default__Object'
}
