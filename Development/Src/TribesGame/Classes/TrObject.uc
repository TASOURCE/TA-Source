class TrObject extends Object
    native;
    

const UnrealUnitsToKM = 0.072;

// Common Tg-Wide structs and enums


// game win states (outcomes)
enum GAME_WIN_STATE
{
    GWS_NONE,
    GWS_DEFENDER_WON,
    GWS_ATTACKER_WON,
    GWS_TIE
};

enum GAME_TYPE
{
    TGT_CTF,
    TGT_RAB,
    TGT_TDM,
    TGT_ARN,
    TGT_CAH,
    TGT_MAX
};

enum TR_HIDEABLE_HUD_ELEMENT
{
    DeviceBar,
    BuffBar,
    ChatBox,
    AlertBox,
    MiniMap,
    MissionInfo,
    PlayerInfo,
    TeamInfo,
    Reticle,
	OmegaAlert,
    AgentInfo,
    QuestTracking,
    AllElements     //people find value in this sort of thing
};

enum DAMAGE_INFO_TYPE
{
    DIT_Death,
    DIT_Damage,
    DIT_Status,
    DIT_Healing,
    DIT_Objective,
    DIT_Experience,
};

// The values we calculate for objective mics
struct native ObjectiveMICInfo
{
	var int     MyTeam;
    var float   AmountFilled;
	var int     ObjStatus;
	var int     IsContested;
    var int     Flip;
};

enum EffectType
{
    ET_None,
    ET_Hit,
    ET_Fire,
    ET_Equip,
    ET_Active,
};

enum OverlayType
{
    OT_UNKNOWN,
    OT_PLAYER,
    OT_OBJECTIVE,
    OT_DEPLOYABLE,
    OT_VEHICLE,
};

const TR_MAX_SLOTS_TO_EQUIP = 5;    //equippable slot have the device selection

// WARNING: This struct cannot contain ANY object references as this can cause garbage collection crashes!
const MAX_HEARING_DISTANCE = 1300;
const FADE_TIME = 1.0f;
struct native TR_HUD_INFO
{
    var vector vScreenLoc;
    var float fScale;
    var float fAlphaLevel;
    var float fLastSeenTime;   
    var float fLastUnseenTime;
    var bool  bIsTarget;
    var string sName;
    var int   nHealth;
    var int   nMaxHealth;
    var bool  bEnemy;
    var bool  bDrawStat;        //otherwise it will draw player icon only
    var bool  bDrawHealth;
    var float fDistance;
    
    var OverlayType eOverlayType;
    var int   nActorId;         //r_nPawnId etc
};
/////////// Credits

enum TrCreditEventType
{
	PlayerKillEvent,
	PlayerDeathEvent,
	FlagCaptureEvent,
	FlagPickupEvent,
	FlagReturnEvent,
	FiveKillStreakEvent,
	TenKillStreakEvent,
	FifteenKillStreakEvent,
	TwentyKillStreakEvent,
	TwentyFiveKillStreakEvent,
	PlayerKillAssistEvent,
	FiveSnipingStreakEvent,
	TenSnipingStreakEvent,
	FifteenSnipingStreakEvent, 
	FiveExplosiveStreakEvent,
	TenExplosiveStreakEvent,
	FifteenExplosiveStreakEvent,
	FiveSpinfusorStreakEvent,
	TenSpinfusorStreakEvent,
	FifteenSpinfusorStreakEvent,
	DoubleKillEvent,
	TripleKillEvent,
	QuatraKillEvent,
	UltraKillEvent,
	TeamKillEvent,
	SpreeEndedEvent,
	RevengeEvent,
	AftermathEvent,
	FirstBloodEvent,
	BluePlateSpecialEvent,
	StickyKillEvent,
	HeadShotEvent,
	ArtilleryShotEvent,
	MeleeKillEvent,
	SquishEvent,
	GeneratorKillEvent,
	GeneratorRepairEvent,
	BaseTurretKillEvent,
	BaseTurretRepairEvent,
	RabbitKillEvent,
	KillAsRabbitEvent,
	FinalBlowEvent,
	SuicideEvent,
	OffhandKillCredit,
	TeamKillCredit,
};

struct native TrEventCredits
{
	var TrCreditEventType eventType;
	var int eventCredits;
	var int proxyEventCredits;
	var int msgIdx;
	var bool bIsBroadcast;
};

enum TgSupportedAspectRatios
{
    TgAR_4x3, TgAR_5x4, TgAR_16x9, TgAR_16x10, TgAR_Other,
};

///////////////////////////////////////
// Equip points
// - used for the pawn's 'paper doll'. 
// - limits the number and kind of devices that can be equipped at once.  
// - Add EQP_NONE to ensure equip point index starts from 1 (consistent with Lua side)

enum TR_EQUIP_POINT
{
    EQP_NONE,
    EQP_Melee,       // Melee
    EQP_Primary,     // Primary weapon
    EQP_Secondary,   // Secondary weapon
    EQP_Pack,        // Pack
    EQP_Belt,        // Belt (grenades, mines, etc.)
    EQP_Deployable,  // Deployable (sensor, turrets, etc.)
	EQP_LaserTarget, // Laser Target
	EQP_Armor,       // Armor Mod
	EQP_PerkA,       // Perk A
	EQP_PerkB,       // Perk B
	EQP_Skin,        // Skin
	EQP_Voice,       // Skin
    EQP_MAX
};


enum EMissileLock
{
	EMissileLockNone,
	EMissileLocking,
	EMissileLocked,
	EMissileFired,
	EMissilePotentialTarget,
};

// NOTE: these are saved by name - edit names at your own risk
enum TR_WIDGET_SUBTYPES
{
    IST_NONE,
    IST_DEVICE_MELEE,
    IST_DEVICE_RANGED,
    IST_DEVICE_SPECIALTY,
    IST_DEVICE_JETPACK,
    IST_DEVICE_TOGGLE,
    IST_DEVICE_GRENADE,
    IST_DEVICE_BELT,
    IST_DEVICE_DEPLOYABLE,
    IST_DEVICE_REST
};

/** Pairings from a database offhand type field and an animation name. */
struct native OffhandAnimation
{
	var		name	m_OffhandUseType;
	var()	name	m_AnimName;
	var()	bool	m_bFullBody;
};

/** replicated information on a hit we've taken */
struct native TrTakeHitInfo
{
	/** the amount of damage */
	var int Damage;
	/** the location of the hit */
	var vector HitLocation;
	/** how much momentum was imparted */
	var vector Momentum;
	/** the damage type we were hit with */
	var class<DamageType> DamageType;
	/** the bone that was hit on our Mesh (if any) */
	var name HitBone;
};


// Apply effect to self, friend or enemy
enum DeviceTargeterType
{
    TRDTT_None,
    TRDTT_Self,
    TRDTT_Friend,
    TRDTT_Enemy,
    TRDTT_Enemy_And_Self,
    TRDTT_Friend_Only,
    TRDTT_All
};

enum DeviceAttackType
{
    TRTT_ATTCK_NA,
    TRTT_ATTACK_INSTANT,
    TRTT_ATTACK_PROJECTILE,
    TRTT_ATTACK_DEPLOYABLE,
    TRTT_ATTACK_SPAWN_PET,
    TRTT_ATTACK_TELEPORT
};

/** replicated information on a effect we've taken */
struct native TrTakeEffectInfo
{
	/** the location of the hit */
	var vector HitLocation;
	/** the effect type we were hit with */
	var class<TrEffectForm> EffectForm;
};

enum EffectFormPriority
{
    TR_EF_NORMAL,
    TR_EF_SHIELD,
    TR_EF_STEALTH
};

enum EffectCalcMethod
{
    TRCM_NA,
    TRCM_ADD,
    TRCM_SUBTRACT,
    TRCM_PERC_INCREASE,
    TRCM_PERC_DECREASE,
    TRCM_STATIC
};

// in priority order
enum DeployModeStatus
{
    DMS_None,
    DMS_CannotFire,
    DMS_CannotPlace,
    DMS_OK
};

/** These are the Tracer Types we utilize.  Named after what they look like. **/
enum EWeaponTracerType
{
	WTT_PistolBullet,
    WTT_ChainGunBullet,
};

/** The various vehicles a player can pilot.*/
enum EVehicleTypes
{
    VEHICLE_GravCycle,
    VEHICLE_Shrike,
    VEHICLE_Beowulf,
    VEHICLE_HERC,
	VEHICLE_Havoc,
};

/** The various settings for assigning a team*/
enum TeamAssignTypes
{
    TAT_BALANCED,
    TAT_UNBALANCED,
    TAT_AUTOASSIGN,
};

enum EffectFormMatTypes
{
    MAT_None,
    MAT_Stealth,
    MAT_Shield,
};

struct native EffectFormOverwrite
{
    var EffectFormMatTypes eType;
    var Material           mat;
};

const FEET_TO_UNREAL_UNITS              = 16;
///////////SENSOR IMPLEMENTATION////////////////

const INDEX_DISPLAY_TARGET_INGAME       =  0;
const INDEX_DISPLAY_TARGET_FOREGROUND   =  1;      

const INDEX_SEE_NORMAL_ENEMY            =  0;
const INDEX_SEE_STEALTHED_ENEMY         =  1;
const INDEX_SEE_LOW_HEALTH_ENEMY        =  2;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
const TR_TASKFORCE_NONE = 0;			// neutral or no task force
const TR_TASKFORCE_BLOODEAGLE = 1;      // Blood Eagle task force.
const TR_TASKFORCE_DIAMONDSWORD = 2;    // Diamond Sword task force.

enum TrMiscMessages
{
	TrMISC_BloodEagleBoughtHerc,
	TrMISC_DiamondSwordBoughtHerc,
	TrMISC_BloodEagleCloseToWin,
	TrMISC_DiamondSwordCloseToWin
};

enum EArmorType
{
    ARMOR_Light,
    ARMOR_Medium,
    ARMOR_Heavy
};

// Call-Ins
enum ETrPlayerCallIns
{
	TRCALLIN_None,
	TRCALLIN_SupportInventory,
	TRCALLIN_OrbitalStrike,
	TRCALLIN_TacticalStrike,
};

enum ESettingsList
{
    //Keybindings
    ESL_KEYBIND_START,
    ESL_MOVE_FORWARD,
    ESL_MOVE_BACKWARD,
    ESL_STRAFE_LEFT,
    ESL_STRAFE_RIGHT,
    ESL_DO_SKI,
    ESL_DO_JUMP,
    ESL_DO_JETPACK,
    ESL_DO_JUMPJETPACK,
    ESL_DO_JUMPSKI,
    ESL_TOGGLE_SKI,
    ESL_DO_ZOOM,
    ESL_FIRE_WEAPON,
    ESL_RELOAD,
    ESL_NEXT_WEAPON,
    ESL_WEAPON_SWITCH_FILTER,
    ESL_WEAPON_SWITCH_FILTER2,
    ESL_USE,
    ESL_ACTIVATE_MELEE,
    ESL_ACTIVATE_PACK,
    ESL_ACTIVATE_BELT,
    ESL_TOGGLE_MENU_CLASS,
    ESL_SHOW_SCORES,
    ESL_SHOW_OBJECTIVES,
    ESL_DROP_FLAG,
    ESL_TALK,
    ESL_TALK_TEAM,
    ESL_TALK_REPLY,
    ESL_HORN,
    ESL_BEGIN_VGS, 
    ESL_CALLIN_ONE,
    ESL_CALLIN_TWO,
    ESL_CALLIN_THREE,
    ESL_TYPE_KEY,
    ESL_WEAPON_PRIMARY,
    ESL_WEAPON_SECONDARY,
    ESL_SWITCH_SEAT_ONE,
    ESL_SWITCH_SEAT_TWO,
    ESL_SWITCH_SEAT_THREE,
    ESL_SWITCH_SEAT_FOUR,
    ESL_SWITCH_SEAT_FIVE,
    ESL_SWITCH_SEAT_SIX,
    ESL_SUICIDE,
    ESL_SPOT_TARGET,
    ESL_THIRD_PERSON,
    ESL_FREE_LOOK,
    ESL_TEAM_SELECT,
    ESL_SUPPRESS_HELP,
    ESL_QUICKCLASSES,
    ESL_FRIENDS,
    ESL_SETTINGS,
    ESL_MAINMENU,
    ESL_HOTKEY1,
    ESL_HOTKEY2,
    ESL_HOTKEY3,
    ESL_HOTKEY4,
    ESL_HOTKEY5,
    ESL_HOTKEY6,
    ESL_HOTKEY7,
    ESL_HOTKEY8,
    ESL_HOTKEY9,
    ESL_CHAT,
    ESL_SPECTATE_MOVEUP,
    ESL_SPECTATE_MOVEDOWN,
    ESL_SPECTATE_MOVEFORWARD,
    ESL_SPECTATE_MOVEBACKWARD,
    ESL_SPECTATE_TURNLEFT,
    ESL_SPECTATE_TURNRIGHT,
    ESL_SPECTATE_STRAFELEFT,
    ESL_SPECTATE_STRAFERIGHT,
    ESL_SPECTATE_CAMERAX,
    ESL_SPECTATE_CAMERAY,
    ESL_SPECTATE_SPEEDINCREASE,
    ESL_SPECTATE_SPEEDDECREASE,
    ESL_SPECTATE_VIEWNEXTPLAYER,
    ESL_SPECTATE_VIEWPREVPLAYER,
    ESL_SPECTATE_VIEWSELF,
    ESL_SPECTATE_VIEWBOOKMARKS,
    ESL_SPECTATE_VIEWGENERATORS,
    ESL_SPECTATE_VIEWSTANDS,
    ESL_SPECTATE_VIEWFLAGS,
    ESL_SPECTATE_SHOWCONTROLS,
    ESL_SPECTATE_SHOWHUD,
    ESL_SPECTATE_SHOWSCORES,
    ESL_SPECTATE_TYPE_KEY,
    ESL_SPECTATE_CHANGETEAM,
    ESL_SPECTATE_VEHICLES,
    ESL_SPECTATE_FASTESTPLAYER,
    ESL_SPECTATE_OBJECTIVES,    
    ESL_SPECTATE_LOCKVIEW,
    ESL_KEYBIND_END,

    //Control Settings
    ESL_CONTROL_START,
    ESL_MOUSESENSITIVITY,
    ESL_FLYINGPITCHSENSITIVITY,
    ESL_FLYINGYAWSENSITIVITY,
    ESL_MOUSEINVERT,
    ESL_VEHICLEINVERT,
    ESL_MOUSESMOOTHING,
    ESL_FOV,
    ESL_TOGGLEZOOM,
    ESL_DISABLEHELP,
    ESL_HUDOBJECTIVES,
    ESL_TINYWEAPONS,
    ESL_DAMAGECOUNTER,
    ESL_ALIENFX,
    ESL_CHATFILTER,         
	ESL_SIMULATEDPROJECTILES, //THIS SUCKS, BUT USE THIS AS LAST IN SETTINGS PAGE
    ESL_HUDFRIENDSNOTIFY,
    ESL_WHISPERNOTIFY, 
    ESL_CONTROL_END,

    //Audio Settings
    ESL_AUDIO_START,
	ESL_MASTER,
	ESL_EFFECTS,
	ESL_MUSIC,
	ESL_VGS,
	ESL_VOICE,
	ESL_BASSBOOST,
    ESL_AUDIO_END,

    EAKC_MAX,
};

struct native PaperDollInfo
{
	/** Component-space translation */
	var() Vector Translation;

	/** Component-space rotation */
	var() Rotator Rotation;

	/** Scale */
	var() float Scale;

	/** Mesh */
	var SkeletalMesh SkelMesh;

	/** Physics Asset */
	var PhysicsAsset PhysAsset;

	/** Animtree */
	var AnimTree AnimTreeTemplate;

	/** Animset */
	var AnimSet AnimSet;

	/** Only self shadow? */
	var bool bOnlySelfShadow;

	/** Sets CharacterLightingContrastFactor in world post process properties */
	var float CharacterLightingContrastFactor;

	/** Are the textures for SkelMesh currently streaming? */
	var bool bIsStreaming;

	/** Are elements of this paper doll still async loading? */
	var bool bIsLoading;

	structdefaultproperties
	{
		Rotation=(Yaw=-16384)
		Scale=1.0
		CharacterLightingContrastFactor=1.5
	}
};

enum CaHCapturePointLabel
{
	CaHCapturePoint_A,
	CaHCapturePoint_B,
	CaHCapturePoint_C,
	CaHCapturePoint_D,
	CaHCapturePoint_E,
};

enum ServerPropType
{
    SPT_GAME,
    SPT_QUEUE,
};

enum TrClassType
{
    TCT_PTH,
    TCT_SEN,
    TCT_INF,
    TCT_SLD,
    TCT_TCN,
    TCT_RDR,
    TCT_JUG,
    TCT_DMB,
    TCT_BRT,
    TCT_MAX,
};

enum LoadoutSlotTypes
{
    LST_DEFAULT,
    LST_ONE,
    LST_TWO,
    LST_THREE,
    LST_FOUR,
    LST_FIVE,
    LST_MAX
};

enum SpawnTypes
{
    EST_NORMAL,
    EST_PTHSLDJUG,
    EST_NAKEDPTH,
    EST_MAX
};

enum EContentDataType
{
	CDT_None,
	CDT_CTF,     
	CDT_RemoveFriend,
	CDT_AddFriend,
	CDT_Login,
	CDT_BuyGold,
	CDT_BuyBoost,
	CDT_InviteToParty,
	CDT_JoinGame,
	CDT_MapRoaming,
	CDT_PlayNow,
	CDT_Rabbit,
	CDT_MainMenu,
	CDT_Settings,
	CDT_SkiingTutorial,
	CDT_TeamDeathMatch,
	CDT_TargetPractice,
	CDT_SkiChallenge,
	CDT_QuickMatch,
	CDT_RankedMatch,
	CDT_Arena,
	CDT_Bundle_Inf_Prem,
	CDT_Bundle_Inf_Merc,
	CDT_Bundle_Inf_Asn,
	CDT_Bundle_Inf_Wep,
	CDT_PrivateServer,
	CDT_CaptureAndHold,
	CDT_ChangeName,
	CDT_Bundle_Rdr_Prem,
	CDT_Bundle_Rdr_Gvr,
	CDT_Bundle_Rdr_Merc,
	CDT_Bundle_Rdr_Wep,
	CDT_Bundle_Brt_Wep,
    CDT_Bundle_LoG,
    CDT_StarterPack,
    CDT_Bundle_Twinfusor,
    CDT_Bundle_SkinPack,
    CDT_Bundle_Specialist,
    CDT_Bundle_Sentinel,
};

enum ReticuleDataType
{
    RDT_TYPE,
    RDT_COLOR,
    RDT_OPACITY,
    RDT_MAX,
};

defaultproperties
{
   Name="Default__TrObject"
   ObjectArchetype=Object'Core.Default__Object'
}
