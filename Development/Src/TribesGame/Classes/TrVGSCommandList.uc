class TrVGSCommandList extends Object;

/*
 * VGS Overview:
 * 1. m_CommandList is built when the game is initialized. It contains the information for each VGS command.
 * 2. TrPlayerInput is put into VGS 'capture mode' when the player wants to use VGS.
 * 3. TrPlayerInput begins with class'TrVGSNode_Root'. Each TrVGSNode can have a list of children and VGS commands.
 * 4. As the player inputs keys, we first look through the children nodes to match a key with a new submenu
 * 5. If a child was found, we set that as the current and begin step 4 again.
 * 6. If a child was not found, we look through each command listed in the node and find the corresponding keybind
 *    in m_CommandList. If this keybind equals the requested key, TrPlayerInput is told to play this VGS Command.
 * 7. The VGS system closes.
 */

enum VGSCommandType
{
	// Global
		VGSCommandType_GlobalYes,
		VGSCommandType_GlobalNo,
		VGSCommandType_GlobalHi,
		VGSCommandType_GlobalBye,
		VGSCommandType_GlobalOoops,
		VGSCommandType_GlobalQuiet,
		VGSCommandType_GlobalShazbot,
		VGSCommandType_GlobalWoohoo,
		// Compliment
			VGSCommandType_GlobalComplimentAwesome,
			VGSCommandType_GlobalComplimentGoodGame,
			VGSCommandType_GlobalComplimentNiceMove,
			VGSCommandType_GlobalComplimentYouRock,
			VGSCommandType_GlobalComplimentGreatShot,
		// Respond
			VGSCommandType_GlobalRespondAnyTime,
			VGSCommandType_GlobalRespondDontKnow,
			VGSCommandType_GlobalRespondThanks,
			VGSCommandType_GlobalRespondWait,
		// Global Taunt
			VGSCommandType_GlobalTauntAww,
			VGSCommandType_GlobalTauntObnoxious,
			VGSCommandType_GlobalTauntBrag,
			VGSCommandType_GlobalTauntSarcasm,
			VGSCommandType_GlobalTauntLearn,
	// Attack
		VGSCommandType_Attack,
		VGSCommandType_AttackBase,
		VGSCommandType_AttackChase,
		VGSCommandType_AttackDisrupt,
		VGSCommandType_AttackFlag,
		VGSCommandType_AttackGenerator,
		VGSCommandType_AttackReinforce,
		VGSCommandType_AttackSensors,
		VGSCommandType_AttackTurrets,
		VGSCommandType_AttackVehicle,
		VGSCommandType_AttackWait,
		VGSCommandType_AttackPointA,
		VGSCommandType_AttackPointB,
		VGSCommandType_AttackPointC,
		VGSCommandType_AttackPointD,
		VGSCommandType_AttackPointE,
	// Defend
		VGSCommandType_DefendBase,
		VGSCommandType_DefendFlagCarrier,
		VGSCommandType_DefendEntrances,
		VGSCommandType_DefendFlag,
		VGSCommandType_DefendGenerator,
		VGSCommandType_DefendMe,
		VGSCommandType_DefendReinforce,
		VGSCommandType_DefendSensors,
		VGSCommandType_DefendTurrets,
		VGSCommandType_DefendVehicle,
		VGSCommandType_DefendPointA,
		VGSCommandType_DefendPointB,
		VGSCommandType_DefendPointC,
		VGSCommandType_DefendPointD,
		VGSCommandType_DefendPointE,
	// Repair
		VGSCommandType_RepairGenerator,
		VGSCommandType_RepairSensors,
		VGSCommandType_RepairTurrets,
		VGSCommandType_RepairVehicle,
	// Base
		VGSCommandType_BaseClear,
		VGSCommandType_EnemyInBase,
		VGSCommandType_BaseRetake,
		VGSCommandType_BaseSecure,
	// Command
		VGSCommandType_CommandAcknowledged,
		VGSCommandType_CommandCompleted,
		VGSCommandType_CommandDeclined,
		VGSCommandType_CommandAssignment,
	// Enemy
		VGSCommandType_EnemyDisarray,
		VGSCommandType_EnemyGeneratorDestroyed,
		VGSCommandType_EnemySensorsDestroyed,
		VGSCommandType_EnemyTurretsDestroyed,
		VGSCommandType_EnemyVehicleDestroyed,
	// Flag
		VGSCommandType_FlagDefend,
		VGSCommandType_FlagIHave,
		VGSCommandType_FlagGiveMe,
		VGSCommandType_FlagSecure,
		VGSCommandType_FlagRetrieve,
		VGSCommandType_FlagSelfRetrieve,
		VGSCommandType_FlagTake,
	// Need
		VGSCommandType_NeedCover,
		VGSCommandType_NeedDriver,
		VGSCommandType_NeedEscort,
		VGSCommandType_NeedHoldVehicle,
		VGSCommandType_NeedRide,
		VGSCommandType_NeedSupport,
		VGSCommandType_NeedVehicleReady,
		VGSCommandType_NeedWhereTo,
	// Self Attack
		VGSCommandType_SelfAttack,
		VGSCommandType_SelfAttackBase,
		VGSCommandType_SelfAttackFlag,
		VGSCommandType_SelfAttackGenerator,
		VGSCommandType_SelfAttackSensors,
		VGSCommandType_SelfAttackTurrets,
		VGSCommandType_SelfAttackVehicle,
		VGSCommandType_SelfAttackPointA,
		VGSCommandType_SelfAttackPointB,
		VGSCommandType_SelfAttackPointC,
		VGSCommandType_SelfAttackPointD,
		VGSCommandType_SelfAttackPointE,
	// Self Defend
		VGSCommandType_SelfDefendBase,
		VGSCommandType_SelfDefend,
		VGSCommandType_SelfDefendFlag,
		VGSCommandType_SelfDefendGenerator,
		VGSCommandType_SelfDefendSensors,
		VGSCommandType_SelfDefendTurrets,
		VGSCommandType_SelfDefendVehicle,
		VGSCommandType_SelfDefendPointA,
		VGSCommandType_SelfDefendPointB,
		VGSCommandType_SelfDefendPointC,
		VGSCommandType_SelfDefendPointD,
		VGSCommandType_SelfDefendPointE,
	// Self Repair
		VGSCommandType_SelfRepairBase,
		VGSCommandType_SelfRepairGenerator,
		VGSCommandType_SelfRepairSensors,
		VGSCommandType_SelfRepairTurrets,
		VGSCommandType_SelfRepairVehicle,
	// Self Task
		VGSCommandType_SelfTaskCover,
		VGSCommandType_SelfTaskDefenses,
		VGSCommandType_SelfTaskForcefield,
		VGSCommandType_SelfTaskOnIt,
		VGSCommandType_SelfTaskDeploySensors,
		VGSCommandType_SelfTaskDeployTurrets,
		VGSCommandType_SelfTaskVehicle,
	// Self Upgrade
		VGSCommandType_SelfUpgradeGenerator,
		VGSCommandType_SelfUpgradeSensors,
		VGSCommandType_SelfUpgradeTurrets,
	// Target
		VGSCommandType_TargetAcquired,
		VGSCommandType_TargetBase,
		VGSCommandType_TargetDestroyed,
		VGSCommandType_TargetFlag,
		VGSCommandType_TargetFireOnMy,
		VGSCommandType_TargetNeed,
		VGSCommandType_TargetSensors,
		VGSCommandType_TargetTurret,
		VGSCommandType_TargetVehicle,
		VGSCommandType_TargetWait,
	// Upgrade
		VGSCommandType_UpgradeGenerator,
		VGSCommandType_UpgradeSensors,
		VGSCommandType_UpgradeTurrets,
	// Warn
		VGSCommandType_WarnEnemies,
		VGSCommandType_WarnVehicle,
	// Very Quick
		VGSCommandType_TeamYes,
		VGSCommandType_TeamNo,
		VGSCommandType_TeamAnytime,
		VGSCommandType_TeamBaseSecure,
		VGSCommandType_TeamCeaseFire,
		VGSCommandType_TeamDontKnow,
		VGSCommandType_TeamHelp,
		VGSCommandType_TeamMove,
		VGSCommandType_TeamSorry,
		VGSCommandType_TeamThanks,
		VGSCommandType_TeamWait,
};

enum EVGSScope 
{
	VGSScope_Team,      // Only teammates recieve the command.
	VGSScope_Global,    // Everyone recieves the command.
};

struct TrVGSCommand
{
	var EVGSScope VGSScope;
	var name KeyBind;
    var string KeyBindPath;     //was going to compute this at load time, but why bother.
	var string ChatString;
	var string MenuString;
	var bool bIsContext;
};

enum EVGSContextLocation
{
	VGSContext_None,
	VGSContext_InsideBase,
	VGSContext_AroundBase,
	VGSContext_BehindBase,
	VGSContext_Midfield,
	VGSContext_NearGenerator,
	VGSContext_NearFlag,
	VGSContext_NearBaseTurret,
	VGSContext_NearVehiclePad,
};

enum EVGSContextActor
{
	VGSContextActors_None,
	VGSContextActors_ActorLightPawn,
	VGSContextActors_ActorMediumPawn,
	VGSContextActors_ActorHeavyPawn,
	VGSContextActors_ActorTurret,
	VGSContextActors_ActorSensor,
	VGSContextActors_ActorVehicle,
	VGSContextActors_ActorDeployable,
};

var TrVGSCommand m_CommandList[VGSCommandType];

// Chat strings
var localized string ChatString_GlobalYes;
var localized string ChatString_GlobalNo;
var localized string ChatString_GlobalHi;
var localized string ChatString_GlobalBye;
var localized string ChatString_GlobalOoops;
var localized string ChatString_GlobalQuiet;
var localized string ChatString_GlobalShazbot;
var localized string ChatString_GlobalWoohoo;
// Compliment
var localized string ChatString_GlobalComplimentAwesome;
var localized string ChatString_GlobalComplimentGoodGame;
var localized string ChatString_GlobalComplimentNiceMove;
var localized string ChatString_GlobalComplimentYouRock;
var localized string ChatString_GlobalComplimentGreatShot;
// Respond
var localized string ChatString_GlobalRespondAnyTime;
var localized string ChatString_GlobalRespondDontKnow;
var localized string ChatString_GlobalRespondThanks;
var localized string ChatString_GlobalRespondWait;
// Global Taunt
var localized string ChatString_GlobalTauntAww;
var localized string ChatString_GlobalTauntObnoxious;
var localized string ChatString_GlobalTauntBrag;
var localized string ChatString_GlobalTauntSarcasm;
var localized string ChatString_GlobalTauntLearn;
// Attack
var localized string ChatString_Attack;
var localized string ChatString_AttackBase;
var localized string ChatString_AttackChase;
var localized string ChatString_AttackDisrupt;
var localized string ChatString_AttackFlag;
var localized string ChatString_AttackGenerator;
var localized string ChatString_AttackReinforce;
var localized string ChatString_AttackSensors;
var localized string ChatString_AttackTurrets;
var localized string ChatString_AttackVehicle;
var localized string ChatString_AttackWait;
var localized string ChatString_AttackPointA;
var localized string ChatString_AttackPointB;
var localized string ChatString_AttackPointC;
var localized string ChatString_AttackPointD;
var localized string ChatString_AttackPointE;
// Defend
var localized string ChatString_DefendBase;
var localized string ChatString_DefendFlagCarrier;
var localized string ChatString_DefendEntrances;
var localized string ChatString_DefendFlag;
var localized string ChatString_DefendGenerator;
var localized string ChatString_DefendMe;
var localized string ChatString_DefendReinforce;
var localized string ChatString_DefendSensors;
var localized string ChatString_DefendTurrets;
var localized string ChatString_DefendVehicle;
var localized string ChatString_DefendPointA;
var localized string ChatString_DefendPointB;
var localized string ChatString_DefendPointC;
var localized string ChatString_DefendPointD;
var localized string ChatString_DefendPointE;
// Repair
var localized string ChatString_RepairGenerator;
var localized string ChatString_RepairSensors;
var localized string ChatString_RepairTurrets;
var localized string ChatString_RepairVehicle;
// Base
var localized string ChatString_BaseClear;
var localized string ChatString_EnemyInBase;
var localized string ChatString_BaseRetake;
var localized string ChatString_BaseSecure;
// Command
var localized string ChatString_CommandAcknowledged;
var localized string ChatString_CommandCompleted;
var localized string ChatString_CommandDeclined;
var localized string ChatString_CommandAssignment;
// Enemy
var localized string ChatString_EnemyDisarray;
var localized string ChatString_EnemyGeneratorDestroyed;
var localized string ChatString_EnemySensorsDestroyed;
var localized string ChatString_EnemyTurretsDestroyed;
var localized string ChatString_EnemyVehicleDestroyed;
// Flag
var localized string ChatString_FlagDefend;
var localized string ChatString_FlagIHave;
var localized string ChatString_FlagGiveMe;
var localized string ChatString_FlagRetrieve;
var localized string ChatString_FlagSelfRetrieve;
var localized string ChatString_FlagSecure;
var localized string ChatString_FlagTake;
// Need
var localized string ChatString_NeedCover;
var localized string ChatString_NeedDriver;
var localized string ChatString_NeedEscort;
var localized string ChatString_NeedHoldVehicle;
var localized string ChatString_NeedRide;
var localized string ChatString_NeedSupport;
var localized string ChatString_NeedVehicleReady;
var localized string ChatString_NeedWhereTo;
// Self Attack
var localized string ChatString_SelfAttack;
var localized string ChatString_SelfAttackBase;
var localized string ChatString_SelfAttackFlag;
var localized string ChatString_SelfAttackGenerator;
var localized string ChatString_SelfAttackSensors;
var localized string ChatString_SelfAttackTurrets;
var localized string ChatString_SelfAttackVehicle;
var localized string ChatString_SelfAttackPointA;
var localized string ChatString_SelfAttackPointB;
var localized string ChatString_SelfAttackPointC;
var localized string ChatString_SelfAttackPointD;
var localized string ChatString_SelfAttackPointE;
// Self Defend
var localized string ChatString_SelfDefendBase;
var localized string ChatString_SelfDefend;
var localized string ChatString_SelfDefendFlag;
var localized string ChatString_SelfDefendGenerator;
var localized string ChatString_SelfDefendSensors;
var localized string ChatString_SelfDefendTurrets;
var localized string ChatString_SelfDefendVehicle;
var localized string ChatString_SelfDefendPointA;
var localized string ChatString_SelfDefendPointB;
var localized string ChatString_SelfDefendPointC;
var localized string ChatString_SelfDefendPointD;
var localized string ChatString_SelfDefendPointE;
// Self Repair
var localized string ChatString_SelfRepairBase;
var localized string ChatString_SelfRepairGenerator;
var localized string ChatString_SelfRepairSensors;
var localized string ChatString_SelfRepairTurrets;
var localized string ChatString_SelfRepairVehicle;
// Self Task
var localized string ChatString_SelfTaskCover;
var localized string ChatString_SelfTaskDefenses;
var localized string ChatString_SelfTaskForcefield;
var localized string ChatString_SelfTaskOnIt;
var localized string ChatString_SelfTaskDeploySensors;
var localized string ChatString_SelfTaskDeployTurrets;
var localized string ChatString_SelfTaskVehicle;
// Self Upgrade
var localized string ChatString_SelfUpgradeGenerator;
var localized string ChatString_SelfUpgradeSensors;
var localized string ChatString_SelfUpgradeTurrets;
// Target
var localized string ChatString_TargetAcquired;
var localized string ChatString_TargetBase;
var localized string ChatString_TargetDestroyed;
var localized string ChatString_TargetFlag;
var localized string ChatString_TargetFireOnMy;
var localized string ChatString_TargetNeed;
var localized string ChatString_TargetSensors;
var localized string ChatString_TargetTurret;
var localized string ChatString_TargetVehicle;
var localized string ChatString_TargetWait;
// Upgrade
var localized string ChatString_UpgradeGenerator;
var localized string ChatString_UpgradeSensors;
var localized string ChatString_UpgradeTurrets;
// Warn
var localized string ChatString_WarnEnemies;
var localized string ChatString_WarnVehicle;
var localized string ChatString_WarnContext_EnemyInsideOurBase;
var localized string ChatString_WarnContext_EnemyInsideEnemyBase;
var localized string ChatString_WarnContext_EnemyAroundOurBase;
var localized string ChatString_WarnContext_EnemyAroundEnemyBase;
var localized string ChatString_WarnContext_EnemyBehindOurBase;
var localized string ChatString_WarnContext_EnemyBehindEnemyBase;
var localized string ChatString_WarnContext_EnemyInMidfield;
var localized string ChatString_WarnContext_EnemyNearOurGenerator;
var localized string ChatString_WarnContext_EnemyNearEnemyGenerator;
var localized string ChatString_WarnContext_EnemyNearOurFlag;
var localized string ChatString_WarnContext_EnemyNearEnemyFlag;
var localized string ChatString_WarnContext_EnemyNearOurBaseTurret;
var localized string ChatString_WarnContext_EnemyNearEnemyBaseTurret;
var localized string ChatString_WarnContext_EnemyNearOurVehiclePad;
var localized string ChatString_WarnContext_EnemyNearEnemyVehiclePad;
var localized string ChatString_WarnContext_EnemyNearby;
var localized string ChatString_WarnContext_ActorLightPawn;
var localized string ChatString_WarnContext_ActorMediumPawn;
var localized string ChatString_WarnContext_ActorHeavyPawn;
var localized string ChatString_WarnContext_ActorTurret;
var localized string ChatString_WarnContext_ActorSensor;
var localized string ChatString_WarnContext_ActorVehicle;
var localized string ChatString_WarnContext_ActorDeployable;
// Very Quick
var localized string ChatString_TeamYes;
var localized string ChatString_TeamNo;
var localized string ChatString_TeamAnytime;
var localized string ChatString_TeamBaseSecure;
var localized string ChatString_TeamCeaseFire;
var localized string ChatString_TeamDontKnow;
var localized string ChatString_TeamHelp;
var localized string ChatString_TeamMove;
var localized string ChatString_TeamSorry;
var localized string ChatString_TeamThanks;
var localized string ChatString_TeamWait;

// Menu strings
var localized string MenuString_GlobalYes;
var localized string MenuString_GlobalNo;
var localized string MenuString_GlobalHi;
var localized string MenuString_GlobalBye;
var localized string MenuString_GlobalOoops;
var localized string MenuString_GlobalQuiet;
var localized string MenuString_GlobalShazbot;
var localized string MenuString_GlobalWoohoo;
// Compliment
var localized string MenuString_GlobalComplimentAwesome;
var localized string MenuString_GlobalComplimentGoodGame;
var localized string MenuString_GlobalComplimentNiceMove;
var localized string MenuString_GlobalComplimentYouRock;
var localized string MenuString_GlobalComplimentGreatShot;
// Respond
var localized string MenuString_GlobalRespondAnyTime;
var localized string MenuString_GlobalRespondDontKnow;
var localized string MenuString_GlobalRespondThanks;
var localized string MenuString_GlobalRespondWait;
// Global Taunt
var localized string MenuString_GlobalTauntAww;
var localized string MenuString_GlobalTauntObnoxious;
var localized string MenuString_GlobalTauntBrag;
var localized string MenuString_GlobalTauntSarcasm;
var localized string MenuString_GlobalTauntLearn;
// Attack
var localized string MenuString_Attack;
var localized string MenuString_AttackBase;
var localized string MenuString_AttackChase;
var localized string MenuString_AttackDisrupt;
var localized string MenuString_AttackFlag;
var localized string MenuString_AttackGenerator;
var localized string MenuString_AttackReinforce;
var localized string MenuString_AttackSensors;
var localized string MenuString_AttackTurrets;
var localized string MenuString_AttackVehicle;
var localized string MenuString_AttackWait;
var localized string MenuString_AttackPointA;
var localized string MenuString_AttackPointB;
var localized string MenuString_AttackPointC;
var localized string MenuString_AttackPointD;
var localized string MenuString_AttackPointE;
// Defend
var localized string MenuString_DefendBase;
var localized string MenuString_DefendFlagCarrier;
var localized string MenuString_DefendEntrances;
var localized string MenuString_DefendFlag;
var localized string MenuString_DefendGenerator;
var localized string MenuString_DefendMe;
var localized string MenuString_DefendReinforce;
var localized string MenuString_DefendSensors;
var localized string MenuString_DefendTurrets;
var localized string MenuString_DefendVehicle;
var localized string MenuString_DefendPointA;
var localized string MenuString_DefendPointB;
var localized string MenuString_DefendPointC;
var localized string MenuString_DefendPointD;
var localized string MenuString_DefendPointE;
// Repair
var localized string MenuString_RepairGenerator;
var localized string MenuString_RepairSensors;
var localized string MenuString_RepairTurrets;
var localized string MenuString_RepairVehicle;
// Base
var localized string MenuString_BaseClear;
var localized string MenuString_EnemyInBase;
var localized string MenuString_BaseRetake;
var localized string MenuString_BaseSecure;
// Command
var localized string MenuString_CommandAcknowledged;
var localized string MenuString_CommandCompleted;
var localized string MenuString_CommandDeclined;
var localized string MenuString_CommandAssignment;
// Enemy
var localized string MenuString_EnemyDisarray;
var localized string MenuString_EnemyGeneratorDestroyed;
var localized string MenuString_EnemySensorsDestroyed;
var localized string MenuString_EnemyTurretsDestroyed;
var localized string MenuString_EnemyVehicleDestroyed;
// Flag
var localized string MenuString_FlagDefend;
var localized string MenuString_FlagIHave;
var localized string MenuString_FlagGiveMe;
var localized string MenuString_FlagRetrieve;
var localized string MenuString_FlagSelfRetrieve;
var localized string MenuString_FlagSecure;
var localized string MenuString_FlagTake;
// Need
var localized string MenuString_NeedCover;
var localized string MenuString_NeedDriver;
var localized string MenuString_NeedEscort;
var localized string MenuString_NeedHoldVehicle;
var localized string MenuString_NeedRide;
var localized string MenuString_NeedSupport;
var localized string MenuString_NeedVehicleReady;
var localized string MenuString_NeedWhereTo;
// Self Attack
var localized string MenuString_SelfAttack;
var localized string MenuString_SelfAttackBase;
var localized string MenuString_SelfAttackFlag;
var localized string MenuString_SelfAttackGenerator;
var localized string MenuString_SelfAttackSensors;
var localized string MenuString_SelfAttackTurrets;
var localized string MenuString_SelfAttackVehicle;
var localized string MenuString_SelfAttackPointA;
var localized string MenuString_SelfAttackPointB;
var localized string MenuString_SelfAttackPointC;
var localized string MenuString_SelfAttackPointD;
var localized string MenuString_SelfAttackPointE;
// Self Defend
var localized string MenuString_SelfDefendBase;
var localized string MenuString_SelfDefend;
var localized string MenuString_SelfDefendFlag;
var localized string MenuString_SelfDefendGenerator;
var localized string MenuString_SelfDefendSensors;
var localized string MenuString_SelfDefendTurrets;
var localized string MenuString_SelfDefendVehicle;
var localized string MenuString_SelfDefendPointA;
var localized string MenuString_SelfDefendPointB;
var localized string MenuString_SelfDefendPointC;
var localized string MenuString_SelfDefendPointD;
var localized string MenuString_SelfDefendPointE;
// Self Repair
var localized string MenuString_SelfRepairBase;
var localized string MenuString_SelfRepairGenerator;
var localized string MenuString_SelfRepairSensors;
var localized string MenuString_SelfRepairTurrets;
var localized string MenuString_SelfRepairVehicle;
// Self Task
var localized string MenuString_SelfTaskCover;
var localized string MenuString_SelfTaskDefenses;
var localized string MenuString_SelfTaskForcefield;
var localized string MenuString_SelfTaskOnIt;
var localized string MenuString_SelfTaskDeploySensors;
var localized string MenuString_SelfTaskDeployTurrets;
var localized string MenuString_SelfTaskVehicle;
// Self Upgrade
var localized string MenuString_SelfUpgradeGenerator;
var localized string MenuString_SelfUpgradeSensors;
var localized string MenuString_SelfUpgradeTurrets;
// Target
var localized string MenuString_TargetAcquired;
var localized string MenuString_TargetBase;
var localized string MenuString_TargetDestroyed;
var localized string MenuString_TargetFlag;
var localized string MenuString_TargetFireOnMy;
var localized string MenuString_TargetNeed;
var localized string MenuString_TargetSensors;
var localized string MenuString_TargetTurret;
var localized string MenuString_TargetVehicle;
var localized string MenuString_TargetWait;
// Upgrade
var localized string MenuString_UpgradeGenerator;
var localized string MenuString_UpgradeSensors;
var localized string MenuString_UpgradeTurrets;
// Warn
var localized string MenuString_WarnEnemies;
var localized string MenuString_WarnVehicle;
// Very Quick
var localized string MenuString_TeamYes;
var localized string MenuString_TeamNo;
var localized string MenuString_TeamAnytime;
var localized string MenuString_TeamBaseSecure;
var localized string MenuString_TeamCeaseFire;
var localized string MenuString_TeamDontKnow;
var localized string MenuString_TeamHelp;
var localized string MenuString_TeamMove;
var localized string MenuString_TeamSorry;
var localized string MenuString_TeamThanks;
var localized string MenuString_TeamWait;

simulated function Init()
{
	/* Template.
	m_CommandList[VGSCommandType_XXX].ChatString=ChatString_XXX;
	m_CommandList[VGSCommandType_XXX].KeyBind='ZZ';
	m_CommandList[VGSCommandType_XXX].MenuString=MenuString_XXX;
	m_CommandList[VGSCommandType_XXX].VGSScope=VGSScope_Team;
	*/

	//Global
	m_CommandList[VGSCommandType_GlobalYes].ChatString=ChatString_GlobalYes;
	m_CommandList[VGSCommandType_GlobalYes].KeyBind='Y';
    m_CommandList[VGSCommandType_GlobalYes].KeyBindPath="[VGY]";
	m_CommandList[VGSCommandType_GlobalYes].MenuString=MenuString_GlobalYes;
	m_CommandList[VGSCommandType_GlobalYes].VGSScope=VGSScope_Global;

	m_CommandList[VGSCommandType_GlobalNo].ChatString=ChatString_GlobalNo;
	m_CommandList[VGSCommandType_GlobalNo].KeyBind='N';
    m_CommandList[VGSCommandType_GlobalNo].KeyBindPath="[VGN]";
	m_CommandList[VGSCommandType_GlobalNo].MenuString=MenuString_GlobalNo;
	m_CommandList[VGSCommandType_GlobalNo].VGSScope=VGSScope_Global;

	m_CommandList[VGSCommandType_GlobalHi].ChatString=ChatString_GlobalHi;
	m_CommandList[VGSCommandType_GlobalHi].KeyBind='H';
    m_CommandList[VGSCommandType_GlobalHi].KeyBindPath="[VGH]";
	m_CommandList[VGSCommandType_GlobalHi].MenuString=MenuString_GlobalHi;
	m_CommandList[VGSCommandType_GlobalHi].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalBye].ChatString=ChatString_GlobalBye;
	m_CommandList[VGSCommandType_GlobalBye].KeyBind='B';
    m_CommandList[VGSCommandType_GlobalBye].KeyBindPath="[VGB]";
	m_CommandList[VGSCommandType_GlobalBye].MenuString=MenuString_GlobalBye;
	m_CommandList[VGSCommandType_GlobalBye].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalOoops].ChatString=ChatString_GlobalOoops;
	m_CommandList[VGSCommandType_GlobalOoops].KeyBind='O';
    m_CommandList[VGSCommandType_GlobalOoops].KeyBindPath="[VGO]";
	m_CommandList[VGSCommandType_GlobalOoops].MenuString=MenuString_GlobalOoops;
	m_CommandList[VGSCommandType_GlobalOoops].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalQuiet].ChatString=ChatString_GlobalQuiet;
	m_CommandList[VGSCommandType_GlobalQuiet].KeyBind='Q';
    m_CommandList[VGSCommandType_GlobalQuiet].KeyBindPath="[VGQ]";
	m_CommandList[VGSCommandType_GlobalQuiet].MenuString=MenuString_GlobalQuiet;
	m_CommandList[VGSCommandType_GlobalQuiet].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalShazbot].ChatString=ChatString_GlobalShazbot;
	m_CommandList[VGSCommandType_GlobalShazbot].KeyBind='S';
    m_CommandList[VGSCommandType_GlobalShazbot].KeyBindPath="[VGS]";
	m_CommandList[VGSCommandType_GlobalShazbot].MenuString=MenuString_GlobalShazbot;
	m_CommandList[VGSCommandType_GlobalShazbot].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalWoohoo].ChatString=ChatString_GlobalWoohoo;
	m_CommandList[VGSCommandType_GlobalWoohoo].KeyBind='W';
    m_CommandList[VGSCommandType_GlobalWoohoo].KeyBindPath="[VGW]";
	m_CommandList[VGSCommandType_GlobalWoohoo].MenuString=MenuString_GlobalWoohoo;
	m_CommandList[VGSCommandType_GlobalWoohoo].VGSScope=VGSScope_Global;

	//Compliment
	m_CommandList[VGSCommandType_GlobalComplimentAwesome].ChatString=ChatString_GlobalComplimentAwesome;
	m_CommandList[VGSCommandType_GlobalComplimentAwesome].KeyBind='A';
    m_CommandList[VGSCommandType_GlobalComplimentAwesome].KeyBindPath="[VGCA]";
	m_CommandList[VGSCommandType_GlobalComplimentAwesome].MenuString=MenuString_GlobalComplimentAwesome;
	m_CommandList[VGSCommandType_GlobalComplimentAwesome].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalComplimentGoodGame].ChatString=ChatString_GlobalComplimentGoodGame;
	m_CommandList[VGSCommandType_GlobalComplimentGoodGame].KeyBind='G';
    m_CommandList[VGSCommandType_GlobalComplimentGoodGame].KeyBindPath="[VGCG]";
	m_CommandList[VGSCommandType_GlobalComplimentGoodGame].MenuString=MenuString_GlobalComplimentGoodGame;
	m_CommandList[VGSCommandType_GlobalComplimentGoodGame].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalComplimentNiceMove].ChatString=ChatString_GlobalComplimentNiceMove;
	m_CommandList[VGSCommandType_GlobalComplimentNiceMove].KeyBind='N';
    m_CommandList[VGSCommandType_GlobalComplimentNiceMove].KeyBindPath="[VGCN]";
	m_CommandList[VGSCommandType_GlobalComplimentNiceMove].MenuString=MenuString_GlobalComplimentNiceMove;
	m_CommandList[VGSCommandType_GlobalComplimentNiceMove].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalComplimentYouRock].ChatString=ChatString_GlobalComplimentYouRock;
	m_CommandList[VGSCommandType_GlobalComplimentYouRock].KeyBind='Y';
    m_CommandList[VGSCommandType_GlobalComplimentYouRock].KeyBindPath="[VGCY]";
	m_CommandList[VGSCommandType_GlobalComplimentYouRock].MenuString=MenuString_GlobalComplimentYouRock;
	m_CommandList[VGSCommandType_GlobalComplimentYouRock].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalComplimentGreatShot].ChatString=ChatString_GlobalComplimentGreatShot;
	m_CommandList[VGSCommandType_GlobalComplimentGreatShot].KeyBind='S';
    m_CommandList[VGSCommandType_GlobalComplimentGreatShot].KeyBindPath="[VGCS]";
	m_CommandList[VGSCommandType_GlobalComplimentGreatShot].MenuString=MenuString_GlobalComplimentGreatShot;
	m_CommandList[VGSCommandType_GlobalComplimentGreatShot].VGSScope=VGSScope_Global;

	//Respond
	m_CommandList[VGSCommandType_GlobalRespondAnyTime].ChatString=ChatString_GlobalRespondAnyTime;
	m_CommandList[VGSCommandType_GlobalRespondAnyTime].KeyBind='A';
    m_CommandList[VGSCommandType_GlobalRespondAnyTime].KeyBindPath="[VGRA]";
	m_CommandList[VGSCommandType_GlobalRespondAnyTime].MenuString=MenuString_GlobalRespondAnyTime;
	m_CommandList[VGSCommandType_GlobalRespondAnyTime].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalRespondDontKnow].ChatString=ChatString_GlobalRespondDontKnow;
	m_CommandList[VGSCommandType_GlobalRespondDontKnow].KeyBind='D';
    m_CommandList[VGSCommandType_GlobalRespondDontKnow].KeyBindPath="[VGRD]";
	m_CommandList[VGSCommandType_GlobalRespondDontKnow].MenuString=MenuString_GlobalRespondDontKnow;
	m_CommandList[VGSCommandType_GlobalRespondDontKnow].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalRespondThanks].ChatString=ChatString_GlobalRespondThanks;
	m_CommandList[VGSCommandType_GlobalRespondThanks].KeyBind='T';
    m_CommandList[VGSCommandType_GlobalRespondThanks].KeyBindPath="[VGRT]";
	m_CommandList[VGSCommandType_GlobalRespondThanks].MenuString=MenuString_GlobalRespondThanks;
	m_CommandList[VGSCommandType_GlobalRespondThanks].VGSScope=VGSScope_Global;
	
	m_CommandList[VGSCommandType_GlobalRespondWait].ChatString=ChatString_GlobalRespondWait;
	m_CommandList[VGSCommandType_GlobalRespondWait].KeyBind='W';
    m_CommandList[VGSCommandType_GlobalRespondWait].KeyBindPath="[VGRW]";
	m_CommandList[VGSCommandType_GlobalRespondWait].MenuString=MenuString_GlobalRespondWait;
	m_CommandList[VGSCommandType_GlobalRespondWait].VGSScope=VGSScope_Global;

	// Taunt
	m_CommandList[VGSCommandType_GlobalTauntAww].ChatString=ChatString_GlobalTauntAww;
	m_CommandList[VGSCommandType_GlobalTauntAww].KeyBind='A';
    m_CommandList[VGSCommandType_GlobalTauntAww].KeyBindPath="[VGTA]";
	m_CommandList[VGSCommandType_GlobalTauntAww].MenuString=MenuString_GlobalTauntAww;
	m_CommandList[VGSCommandType_GlobalTauntAww].VGSScope=VGSScope_Global;

	m_CommandList[VGSCommandType_GlobalTauntObnoxious].ChatString=ChatString_GlobalTauntObnoxious;
	m_CommandList[VGSCommandType_GlobalTauntObnoxious].KeyBind='B';
    m_CommandList[VGSCommandType_GlobalTauntObnoxious].KeyBindPath="[VGTB]";
	m_CommandList[VGSCommandType_GlobalTauntObnoxious].MenuString=MenuString_GlobalTauntObnoxious;
	m_CommandList[VGSCommandType_GlobalTauntObnoxious].VGSScope=VGSScope_Global;

	m_CommandList[VGSCommandType_GlobalTauntBrag].ChatString=ChatString_GlobalTauntBrag;
	m_CommandList[VGSCommandType_GlobalTauntBrag].KeyBind='G';
    m_CommandList[VGSCommandType_GlobalTauntBrag].KeyBindPath="[VGTG]";
	m_CommandList[VGSCommandType_GlobalTauntBrag].MenuString=MenuString_GlobalTauntBrag;
	m_CommandList[VGSCommandType_GlobalTauntBrag].VGSScope=VGSScope_Global;

	m_CommandList[VGSCommandType_GlobalTauntSarcasm].ChatString=ChatString_GlobalTauntSarcasm;
	m_CommandList[VGSCommandType_GlobalTauntSarcasm].KeyBind='T';
    m_CommandList[VGSCommandType_GlobalTauntSarcasm].KeyBindPath="[VGTT]";
	m_CommandList[VGSCommandType_GlobalTauntSarcasm].MenuString=MenuString_GlobalTauntSarcasm;
	m_CommandList[VGSCommandType_GlobalTauntSarcasm].VGSScope=VGSScope_Global;

	m_CommandList[VGSCommandType_GlobalTauntLearn].ChatString=ChatString_GlobalTauntLearn;
	m_CommandList[VGSCommandType_GlobalTauntLearn].KeyBind='W';
    m_CommandList[VGSCommandType_GlobalTauntLearn].KeyBindPath="[VGTW]";
	m_CommandList[VGSCommandType_GlobalTauntLearn].MenuString=MenuString_GlobalTauntLearn;
	m_CommandList[VGSCommandType_GlobalTauntLearn].VGSScope=VGSScope_Global;

	//Attack
	m_CommandList[VGSCommandType_Attack].ChatString=ChatString_Attack;
	m_CommandList[VGSCommandType_Attack].KeyBind='A';
    m_CommandList[VGSCommandType_Attack].KeyBindPath="[VAA]";
	m_CommandList[VGSCommandType_Attack].MenuString=MenuString_Attack;
	m_CommandList[VGSCommandType_Attack].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackBase].ChatString=ChatString_AttackBase;
	m_CommandList[VGSCommandType_AttackBase].KeyBind='B';
    m_CommandList[VGSCommandType_AttackBase].KeyBindPath="[VAB]";
	m_CommandList[VGSCommandType_AttackBase].MenuString=MenuString_AttackBase;
	m_CommandList[VGSCommandType_AttackBase].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackChase].ChatString=ChatString_AttackChase;
	m_CommandList[VGSCommandType_AttackChase].KeyBind='C';
    m_CommandList[VGSCommandType_AttackChase].KeyBindPath="[VAC]";
	m_CommandList[VGSCommandType_AttackChase].MenuString=MenuString_AttackChase;
	m_CommandList[VGSCommandType_AttackChase].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackDisrupt].ChatString=ChatString_AttackDisrupt;
	m_CommandList[VGSCommandType_AttackDisrupt].KeyBind='D';
    m_CommandList[VGSCommandType_AttackDisrupt].KeyBindPath="[VAD]";
	m_CommandList[VGSCommandType_AttackDisrupt].MenuString=MenuString_AttackDisrupt;
	m_CommandList[VGSCommandType_AttackDisrupt].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackFlag].ChatString=ChatString_AttackFlag;
	m_CommandList[VGSCommandType_AttackFlag].KeyBind='F';
    m_CommandList[VGSCommandType_AttackFlag].KeyBindPath="[VAF]";
	m_CommandList[VGSCommandType_AttackFlag].MenuString=MenuString_AttackFlag;
	m_CommandList[VGSCommandType_AttackFlag].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackGenerator].ChatString=ChatString_AttackGenerator;
	m_CommandList[VGSCommandType_AttackGenerator].KeyBind='G';
    m_CommandList[VGSCommandType_AttackGenerator].KeyBindPath="[VAG]";
	m_CommandList[VGSCommandType_AttackGenerator].MenuString=MenuString_AttackGenerator;
	m_CommandList[VGSCommandType_AttackGenerator].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackReinforce].ChatString=ChatString_AttackReinforce;
	m_CommandList[VGSCommandType_AttackReinforce].KeyBind='R';
    m_CommandList[VGSCommandType_AttackReinforce].KeyBindPath="[VAR]";
	m_CommandList[VGSCommandType_AttackReinforce].MenuString=MenuString_AttackReinforce;
	m_CommandList[VGSCommandType_AttackReinforce].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackSensors].ChatString=ChatString_AttackSensors;
	m_CommandList[VGSCommandType_AttackSensors].KeyBind='S';
    m_CommandList[VGSCommandType_AttackSensors].KeyBindPath="[VAS]";
	m_CommandList[VGSCommandType_AttackSensors].MenuString=MenuString_AttackSensors;
	m_CommandList[VGSCommandType_AttackSensors].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackTurrets].ChatString=ChatString_AttackTurrets;
	m_CommandList[VGSCommandType_AttackTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_AttackTurrets].KeyBindPath="[VAT]";
	m_CommandList[VGSCommandType_AttackTurrets].MenuString=MenuString_AttackTurrets;
	m_CommandList[VGSCommandType_AttackTurrets].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackVehicle].ChatString=ChatString_AttackVehicle;
	m_CommandList[VGSCommandType_AttackVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_AttackVehicle].KeyBindPath="[VAV]";
	m_CommandList[VGSCommandType_AttackVehicle].MenuString=MenuString_AttackVehicle;
	m_CommandList[VGSCommandType_AttackVehicle].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_AttackWait].ChatString=ChatString_AttackWait;
	m_CommandList[VGSCommandType_AttackWait].KeyBind='W';
    m_CommandList[VGSCommandType_AttackWait].KeyBindPath="[VAW]";
	m_CommandList[VGSCommandType_AttackWait].MenuString=MenuString_AttackWait;
	m_CommandList[VGSCommandType_AttackWait].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_AttackPointA].ChatString=ChatString_AttackPointA;
	m_CommandList[VGSCommandType_AttackPointA].KeyBind='One';
    m_CommandList[VGSCommandType_AttackPointA].KeyBindPath="[VA1]";
	m_CommandList[VGSCommandType_AttackPointA].MenuString=MenuString_AttackPointA;
	m_CommandList[VGSCommandType_AttackPointA].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_AttackPointB].ChatString=ChatString_AttackPointB;
	m_CommandList[VGSCommandType_AttackPointB].KeyBind='Two';
    m_CommandList[VGSCommandType_AttackPointB].KeyBindPath="[VA2]";
	m_CommandList[VGSCommandType_AttackPointB].MenuString=MenuString_AttackPointB;
	m_CommandList[VGSCommandType_AttackPointB].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_AttackPointC].ChatString=ChatString_AttackPointC;
	m_CommandList[VGSCommandType_AttackPointC].KeyBind='Three';
    m_CommandList[VGSCommandType_AttackPointC].KeyBindPath="[VA3]";
	m_CommandList[VGSCommandType_AttackPointC].MenuString=MenuString_AttackPointC;
	m_CommandList[VGSCommandType_AttackPointC].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_AttackPointD].ChatString=ChatString_AttackPointD;
	m_CommandList[VGSCommandType_AttackPointD].KeyBind='Four';
    m_CommandList[VGSCommandType_AttackPointD].KeyBindPath="[VA4]";
	m_CommandList[VGSCommandType_AttackPointD].MenuString=MenuString_AttackPointD;
	m_CommandList[VGSCommandType_AttackPointD].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_AttackPointE].ChatString=ChatString_AttackPointE;
	m_CommandList[VGSCommandType_AttackPointE].KeyBind='Five';
    m_CommandList[VGSCommandType_AttackPointE].KeyBindPath="[VA5]";
	m_CommandList[VGSCommandType_AttackPointE].MenuString=MenuString_AttackPointE;
	m_CommandList[VGSCommandType_AttackPointE].VGSScope=VGSScope_Team;

	//Defend
	m_CommandList[VGSCommandType_DefendBase].ChatString=ChatString_DefendBase;
	m_CommandList[VGSCommandType_DefendBase].KeyBind='B';
    m_CommandList[VGSCommandType_DefendBase].KeyBindPath="[VDB]";
	m_CommandList[VGSCommandType_DefendBase].MenuString=MenuString_DefendBase;
	m_CommandList[VGSCommandType_DefendBase].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendFlagCarrier].ChatString=ChatString_DefendFlagCarrier;
	m_CommandList[VGSCommandType_DefendFlagCarrier].KeyBind='C';
    m_CommandList[VGSCommandType_DefendFlagCarrier].KeyBindPath="[VDC]";
	m_CommandList[VGSCommandType_DefendFlagCarrier].MenuString=MenuString_DefendFlagCarrier;
	m_CommandList[VGSCommandType_DefendFlagCarrier].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendEntrances].ChatString=ChatString_DefendEntrances;
	m_CommandList[VGSCommandType_DefendEntrances].KeyBind='E';
    m_CommandList[VGSCommandType_DefendEntrances].KeyBindPath="[VDE]";
	m_CommandList[VGSCommandType_DefendEntrances].MenuString=MenuString_DefendEntrances;
	m_CommandList[VGSCommandType_DefendEntrances].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendFlag].ChatString=ChatString_DefendFlag;
	m_CommandList[VGSCommandType_DefendFlag].KeyBind='F';
    m_CommandList[VGSCommandType_DefendFlag].KeyBindPath="[VDF]";
	m_CommandList[VGSCommandType_DefendFlag].MenuString=MenuString_DefendFlag;
	m_CommandList[VGSCommandType_DefendFlag].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendGenerator].ChatString=ChatString_DefendGenerator;
	m_CommandList[VGSCommandType_DefendGenerator].KeyBind='G';
    m_CommandList[VGSCommandType_DefendGenerator].KeyBindPath="[VDG]";
	m_CommandList[VGSCommandType_DefendGenerator].MenuString=MenuString_DefendGenerator;
	m_CommandList[VGSCommandType_DefendGenerator].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendMe].ChatString=ChatString_DefendMe;
	m_CommandList[VGSCommandType_DefendMe].KeyBind='M';
    m_CommandList[VGSCommandType_DefendMe].KeyBindPath="[VDM]";
	m_CommandList[VGSCommandType_DefendMe].MenuString=MenuString_DefendMe;
	m_CommandList[VGSCommandType_DefendMe].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendReinforce].ChatString=ChatString_DefendReinforce;
	m_CommandList[VGSCommandType_DefendReinforce].KeyBind='R';
    m_CommandList[VGSCommandType_DefendReinforce].KeyBindPath="[VDR]";
	m_CommandList[VGSCommandType_DefendReinforce].MenuString=MenuString_DefendReinforce;
	m_CommandList[VGSCommandType_DefendReinforce].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendSensors].ChatString=ChatString_DefendSensors;
	m_CommandList[VGSCommandType_DefendSensors].KeyBind='S';
    m_CommandList[VGSCommandType_DefendSensors].KeyBindPath="[VDS]";
	m_CommandList[VGSCommandType_DefendSensors].MenuString=MenuString_DefendSensors;
	m_CommandList[VGSCommandType_DefendSensors].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendTurrets].ChatString=ChatString_DefendTurrets;
	m_CommandList[VGSCommandType_DefendTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_DefendTurrets].KeyBindPath="[VDT]";
	m_CommandList[VGSCommandType_DefendTurrets].MenuString=MenuString_DefendTurrets;
	m_CommandList[VGSCommandType_DefendTurrets].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendVehicle].ChatString=ChatString_DefendVehicle;
	m_CommandList[VGSCommandType_DefendVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_DefendVehicle].KeyBindPath="[VDV]";
	m_CommandList[VGSCommandType_DefendVehicle].MenuString=MenuString_DefendVehicle;
	m_CommandList[VGSCommandType_DefendVehicle].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendPointA].ChatString=ChatString_DefendPointA;
	m_CommandList[VGSCommandType_DefendPointA].KeyBind='One';
    m_CommandList[VGSCommandType_DefendPointA].KeyBindPath="[VD1]";
	m_CommandList[VGSCommandType_DefendPointA].MenuString=MenuString_DefendPointA;
	m_CommandList[VGSCommandType_DefendPointA].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendPointB].ChatString=ChatString_DefendPointB;
	m_CommandList[VGSCommandType_DefendPointB].KeyBind='Two';
    m_CommandList[VGSCommandType_DefendPointB].KeyBindPath="[VD2]";
	m_CommandList[VGSCommandType_DefendPointB].MenuString=MenuString_DefendPointB;
	m_CommandList[VGSCommandType_DefendPointB].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendPointC].ChatString=ChatString_DefendPointC;
	m_CommandList[VGSCommandType_DefendPointC].KeyBind='Three';
    m_CommandList[VGSCommandType_DefendPointC].KeyBindPath="[VD3]";
	m_CommandList[VGSCommandType_DefendPointC].MenuString=MenuString_DefendPointC;
	m_CommandList[VGSCommandType_DefendPointC].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendPointD].ChatString=ChatString_DefendPointD;
	m_CommandList[VGSCommandType_DefendPointD].KeyBind='Four';
    m_CommandList[VGSCommandType_DefendPointD].KeyBindPath="[VD4]";
	m_CommandList[VGSCommandType_DefendPointD].MenuString=MenuString_DefendPointD;
	m_CommandList[VGSCommandType_DefendPointD].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_DefendPointE].ChatString=ChatString_DefendPointE;
	m_CommandList[VGSCommandType_DefendPointE].KeyBind='Five';
    m_CommandList[VGSCommandType_DefendPointE].KeyBindPath="[VD5]";
	m_CommandList[VGSCommandType_DefendPointE].MenuString=MenuString_DefendPointE;
	m_CommandList[VGSCommandType_DefendPointE].VGSScope=VGSScope_Team;

	//Repair
	m_CommandList[VGSCommandType_RepairGenerator].ChatString=ChatString_RepairGenerator;
	m_CommandList[VGSCommandType_RepairGenerator].KeyBind='G';
    m_CommandList[VGSCommandType_RepairGenerator].KeyBindPath="[VRG]";
	m_CommandList[VGSCommandType_RepairGenerator].MenuString=MenuString_RepairGenerator;
	m_CommandList[VGSCommandType_RepairGenerator].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_RepairSensors].ChatString=ChatString_RepairSensors;
	m_CommandList[VGSCommandType_RepairSensors].KeyBind='S';
    m_CommandList[VGSCommandType_RepairSensors].KeyBindPath="[VRS]";
	m_CommandList[VGSCommandType_RepairSensors].MenuString=MenuString_RepairSensors;
	m_CommandList[VGSCommandType_RepairSensors].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_RepairTurrets].ChatString=ChatString_RepairTurrets;
	m_CommandList[VGSCommandType_RepairTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_RepairTurrets].KeyBindPath="[VRT]";
	m_CommandList[VGSCommandType_RepairTurrets].MenuString=MenuString_RepairTurrets;
	m_CommandList[VGSCommandType_RepairTurrets].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_RepairVehicle].ChatString=ChatString_RepairVehicle;
	m_CommandList[VGSCommandType_RepairVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_RepairVehicle].KeyBindPath="[VRV]";
	m_CommandList[VGSCommandType_RepairVehicle].MenuString=MenuString_RepairVehicle;
	m_CommandList[VGSCommandType_RepairVehicle].VGSScope=VGSScope_Team;

	//Base
	m_CommandList[VGSCommandType_BaseClear].ChatString=ChatString_BaseClear;
	m_CommandList[VGSCommandType_BaseClear].KeyBind='C';
    m_CommandList[VGSCommandType_BaseClear].KeyBindPath="[VBC]";
	m_CommandList[VGSCommandType_BaseClear].MenuString=MenuString_BaseClear;
	m_CommandList[VGSCommandType_BaseClear].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_EnemyInBase].ChatString=ChatString_EnemyInBase;
	m_CommandList[VGSCommandType_EnemyInBase].KeyBind='E';
    m_CommandList[VGSCommandType_EnemyInBase].KeyBindPath="[VBE]";
	m_CommandList[VGSCommandType_EnemyInBase].MenuString=MenuString_EnemyInBase;
	m_CommandList[VGSCommandType_EnemyInBase].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_BaseRetake].ChatString=ChatString_BaseRetake;
	m_CommandList[VGSCommandType_BaseRetake].KeyBind='R';
    m_CommandList[VGSCommandType_BaseRetake].KeyBindPath="[VBR]";
	m_CommandList[VGSCommandType_BaseRetake].MenuString=MenuString_BaseRetake;
	m_CommandList[VGSCommandType_BaseRetake].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_BaseSecure].ChatString=ChatString_BaseSecure;
	m_CommandList[VGSCommandType_BaseSecure].KeyBind='S';
    m_CommandList[VGSCommandType_BaseSecure].KeyBindPath="[VBS]";
	m_CommandList[VGSCommandType_BaseSecure].MenuString=MenuString_BaseSecure;
	m_CommandList[VGSCommandType_BaseSecure].VGSScope=VGSScope_Team;

	//Command
	m_CommandList[VGSCommandType_CommandAcknowledged].ChatString=ChatString_CommandAcknowledged;
	m_CommandList[VGSCommandType_CommandAcknowledged].KeyBind='A';
    m_CommandList[VGSCommandType_CommandAcknowledged].KeyBindPath="[VCA]";
	m_CommandList[VGSCommandType_CommandAcknowledged].MenuString=MenuString_CommandAcknowledged;
	m_CommandList[VGSCommandType_CommandAcknowledged].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_CommandCompleted].ChatString=ChatString_CommandCompleted;
	m_CommandList[VGSCommandType_CommandCompleted].KeyBind='C';
    m_CommandList[VGSCommandType_CommandCompleted].KeyBindPath="[VCC]";
	m_CommandList[VGSCommandType_CommandCompleted].MenuString=MenuString_CommandCompleted;
	m_CommandList[VGSCommandType_CommandCompleted].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_CommandDeclined].ChatString=ChatString_CommandDeclined;
	m_CommandList[VGSCommandType_CommandDeclined].KeyBind='D';
    m_CommandList[VGSCommandType_CommandDeclined].KeyBindPath="[VCD]";
	m_CommandList[VGSCommandType_CommandDeclined].MenuString=MenuString_CommandDeclined;
	m_CommandList[VGSCommandType_CommandDeclined].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_CommandAssignment].ChatString=ChatString_CommandAssignment;
	m_CommandList[VGSCommandType_CommandAssignment].KeyBind='W';
    m_CommandList[VGSCommandType_CommandAssignment].KeyBindPath="[VCW]";
	m_CommandList[VGSCommandType_CommandAssignment].MenuString=MenuString_CommandAssignment;
	m_CommandList[VGSCommandType_CommandAssignment].VGSScope=VGSScope_Team;
	
	// Enemy
	m_CommandList[VGSCommandType_EnemyDisarray].ChatString=ChatString_EnemyDisarray;
	m_CommandList[VGSCommandType_EnemyDisarray].KeyBind='D';
    m_CommandList[VGSCommandType_EnemyDisarray].KeyBindPath="[VED]";
	m_CommandList[VGSCommandType_EnemyDisarray].MenuString=MenuString_EnemyDisarray;
	m_CommandList[VGSCommandType_EnemyDisarray].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_EnemyGeneratorDestroyed].ChatString=ChatString_EnemyGeneratorDestroyed;
	m_CommandList[VGSCommandType_EnemyGeneratorDestroyed].KeyBind='G';
    m_CommandList[VGSCommandType_EnemyGeneratorDestroyed].KeyBindPath="[VEG]";
	m_CommandList[VGSCommandType_EnemyGeneratorDestroyed].MenuString=MenuString_EnemyGeneratorDestroyed;
	m_CommandList[VGSCommandType_EnemyGeneratorDestroyed].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_EnemySensorsDestroyed].ChatString=ChatString_EnemySensorsDestroyed;
	m_CommandList[VGSCommandType_EnemySensorsDestroyed].KeyBind='S';
    m_CommandList[VGSCommandType_EnemySensorsDestroyed].KeyBindPath="[VES]";
	m_CommandList[VGSCommandType_EnemySensorsDestroyed].MenuString=MenuString_EnemySensorsDestroyed;
	m_CommandList[VGSCommandType_EnemySensorsDestroyed].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_EnemyTurretsDestroyed].ChatString=ChatString_EnemyTurretsDestroyed;
	m_CommandList[VGSCommandType_EnemyTurretsDestroyed].KeyBind='T';
    m_CommandList[VGSCommandType_EnemyTurretsDestroyed].KeyBindPath="[VET]";
	m_CommandList[VGSCommandType_EnemyTurretsDestroyed].MenuString=MenuString_EnemyTurretsDestroyed;
	m_CommandList[VGSCommandType_EnemyTurretsDestroyed].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_EnemyVehicleDestroyed].ChatString=ChatString_EnemyVehicleDestroyed;
	m_CommandList[VGSCommandType_EnemyVehicleDestroyed].KeyBind='V';
    m_CommandList[VGSCommandType_EnemyVehicleDestroyed].KeyBindPath="[VEV]";
	m_CommandList[VGSCommandType_EnemyVehicleDestroyed].MenuString=MenuString_EnemyVehicleDestroyed;
	m_CommandList[VGSCommandType_EnemyVehicleDestroyed].VGSScope=VGSScope_Team;

	// Flag
	m_CommandList[VGSCommandType_FlagDefend].ChatString=ChatString_FlagDefend;
	m_CommandList[VGSCommandType_FlagDefend].KeyBind='D';
    m_CommandList[VGSCommandType_FlagDefend].KeyBindPath="[VFD]";
	m_CommandList[VGSCommandType_FlagDefend].MenuString=MenuString_FlagDefend;
	m_CommandList[VGSCommandType_FlagDefend].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_FlagIHave].ChatString=ChatString_FlagIHave;
	m_CommandList[VGSCommandType_FlagIHave].KeyBind='F';
    m_CommandList[VGSCommandType_FlagIHave].KeyBindPath="[VFF]";
	m_CommandList[VGSCommandType_FlagIHave].MenuString=MenuString_FlagIHave;
	m_CommandList[VGSCommandType_FlagIHave].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_FlagGiveMe].ChatString=ChatString_FlagGiveMe;
	m_CommandList[VGSCommandType_FlagGiveMe].KeyBind='G';
    m_CommandList[VGSCommandType_FlagGiveMe].KeyBindPath="[VFG]";
	m_CommandList[VGSCommandType_FlagGiveMe].MenuString=MenuString_FlagGiveMe;
	m_CommandList[VGSCommandType_FlagGiveMe].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_FlagSecure].ChatString=ChatString_FlagSecure;
	m_CommandList[VGSCommandType_FlagSecure].KeyBind='S';
    m_CommandList[VGSCommandType_FlagSecure].KeyBindPath="[VFS]";
	m_CommandList[VGSCommandType_FlagSecure].MenuString=MenuString_FlagSecure;
	m_CommandList[VGSCommandType_FlagSecure].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_FlagRetrieve].ChatString=ChatString_FlagRetrieve;
	m_CommandList[VGSCommandType_FlagRetrieve].KeyBind='R';
    m_CommandList[VGSCommandType_FlagRetrieve].KeyBindPath="[VFR]";
	m_CommandList[VGSCommandType_FlagRetrieve].MenuString=MenuString_FlagRetrieve;
	m_CommandList[VGSCommandType_FlagRetrieve].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_FlagSelfRetrieve].ChatString=ChatString_FlagSelfRetrieve;
	m_CommandList[VGSCommandType_FlagSelfRetrieve].KeyBind='Q';
    m_CommandList[VGSCommandType_FlagSelfRetrieve].KeyBindPath="[VFQ]";
	m_CommandList[VGSCommandType_FlagSelfRetrieve].MenuString=MenuString_FlagSelfRetrieve;
	m_CommandList[VGSCommandType_FlagSelfRetrieve].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_FlagTake].ChatString=ChatString_FlagTake;
	m_CommandList[VGSCommandType_FlagTake].KeyBind='T';
    m_CommandList[VGSCommandType_FlagTake].KeyBindPath="[VFT]";
	m_CommandList[VGSCommandType_FlagTake].MenuString=MenuString_FlagTake;
	m_CommandList[VGSCommandType_FlagTake].VGSScope=VGSScope_Team;

	// Need
	m_CommandList[VGSCommandType_NeedCover].ChatString=ChatString_NeedCover;
	m_CommandList[VGSCommandType_NeedCover].KeyBind='C';
    m_CommandList[VGSCommandType_NeedCover].KeyBindPath="[VNC]";
	m_CommandList[VGSCommandType_NeedCover].MenuString=MenuString_NeedCover;
	m_CommandList[VGSCommandType_NeedCover].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_NeedDriver].ChatString=ChatString_NeedDriver;
	m_CommandList[VGSCommandType_NeedDriver].KeyBind='D';
    m_CommandList[VGSCommandType_NeedDriver].KeyBindPath="[VND]";
	m_CommandList[VGSCommandType_NeedDriver].MenuString=MenuString_NeedDriver;
	m_CommandList[VGSCommandType_NeedDriver].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_NeedEscort].ChatString=ChatString_NeedEscort;
	m_CommandList[VGSCommandType_NeedEscort].KeyBind='E';
    m_CommandList[VGSCommandType_NeedEscort].KeyBindPath="[VNE]";
	m_CommandList[VGSCommandType_NeedEscort].MenuString=MenuString_NeedEscort;
	m_CommandList[VGSCommandType_NeedEscort].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_NeedHoldVehicle].ChatString=ChatString_NeedHoldVehicle;
	m_CommandList[VGSCommandType_NeedHoldVehicle].KeyBind='H';
    m_CommandList[VGSCommandType_NeedHoldVehicle].KeyBindPath="[VNH]";
	m_CommandList[VGSCommandType_NeedHoldVehicle].MenuString=MenuString_NeedHoldVehicle;
	m_CommandList[VGSCommandType_NeedHoldVehicle].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_NeedRide].ChatString=ChatString_NeedRide;
	m_CommandList[VGSCommandType_NeedRide].KeyBind='R';
    m_CommandList[VGSCommandType_NeedRide].KeyBindPath="[VNR]";
	m_CommandList[VGSCommandType_NeedRide].MenuString=MenuString_NeedRide;
	m_CommandList[VGSCommandType_NeedRide].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_NeedSupport].ChatString=ChatString_NeedSupport;
	m_CommandList[VGSCommandType_NeedSupport].KeyBind='S';
    m_CommandList[VGSCommandType_NeedSupport].KeyBindPath="[VNS]";
	m_CommandList[VGSCommandType_NeedSupport].MenuString=MenuString_NeedSupport;
	m_CommandList[VGSCommandType_NeedSupport].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_NeedVehicleReady].ChatString=ChatString_NeedVehicleReady;
	m_CommandList[VGSCommandType_NeedVehicleReady].KeyBind='V';
    m_CommandList[VGSCommandType_NeedVehicleReady].KeyBindPath="[VNV]";
	m_CommandList[VGSCommandType_NeedVehicleReady].MenuString=MenuString_NeedVehicleReady;
	m_CommandList[VGSCommandType_NeedVehicleReady].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_NeedWhereTo].ChatString=ChatString_NeedWhereTo;
	m_CommandList[VGSCommandType_NeedWhereTo].KeyBind='W';
    m_CommandList[VGSCommandType_NeedWhereTo].KeyBindPath="[VNW]";
	m_CommandList[VGSCommandType_NeedWhereTo].MenuString=MenuString_NeedWhereTo;
	m_CommandList[VGSCommandType_NeedWhereTo].VGSScope=VGSScope_Team;

	// Self Attack
	m_CommandList[VGSCommandType_SelfAttack].ChatString=ChatString_SelfAttack;
	m_CommandList[VGSCommandType_SelfAttack].KeyBind='A';
    m_CommandList[VGSCommandType_SelfAttack].KeyBindPath="[VSAA]";
	m_CommandList[VGSCommandType_SelfAttack].MenuString=MenuString_SelfAttack;
	m_CommandList[VGSCommandType_SelfAttack].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfAttackBase].ChatString=ChatString_SelfAttackBase;
	m_CommandList[VGSCommandType_SelfAttackBase].KeyBind='B';
    m_CommandList[VGSCommandType_SelfAttackBase].KeyBindPath="[VSAB]";
	m_CommandList[VGSCommandType_SelfAttackBase].MenuString=MenuString_SelfAttackBase;
	m_CommandList[VGSCommandType_SelfAttackBase].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfAttackFlag].ChatString=ChatString_SelfAttackFlag;
	m_CommandList[VGSCommandType_SelfAttackFlag].KeyBind='F';
    m_CommandList[VGSCommandType_SelfAttackFlag].KeyBindPath="[VSAF]";
	m_CommandList[VGSCommandType_SelfAttackFlag].MenuString=MenuString_SelfAttackFlag;
	m_CommandList[VGSCommandType_SelfAttackFlag].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfAttackGenerator].ChatString=ChatString_SelfAttackGenerator;
	m_CommandList[VGSCommandType_SelfAttackGenerator].KeyBind='G';
    m_CommandList[VGSCommandType_SelfAttackGenerator].KeyBindPath="[VSAG]";
	m_CommandList[VGSCommandType_SelfAttackGenerator].MenuString=MenuString_SelfAttackGenerator;
	m_CommandList[VGSCommandType_SelfAttackGenerator].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfAttackSensors].ChatString=ChatString_SelfAttackSensors;
	m_CommandList[VGSCommandType_SelfAttackSensors].KeyBind='S';
    m_CommandList[VGSCommandType_SelfAttackSensors].KeyBindPath="[VSAS]";
	m_CommandList[VGSCommandType_SelfAttackSensors].MenuString=MenuString_SelfAttackSensors;
	m_CommandList[VGSCommandType_SelfAttackSensors].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfAttackTurrets].ChatString=ChatString_SelfAttackTurrets;
	m_CommandList[VGSCommandType_SelfAttackTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_SelfAttackTurrets].KeyBindPath="[VSAT]";
	m_CommandList[VGSCommandType_SelfAttackTurrets].MenuString=MenuString_SelfAttackTurrets;
	m_CommandList[VGSCommandType_SelfAttackTurrets].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfAttackVehicle].ChatString=ChatString_SelfAttackVehicle;
	m_CommandList[VGSCommandType_SelfAttackVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_SelfAttackVehicle].KeyBindPath="[VSAV]";
	m_CommandList[VGSCommandType_SelfAttackVehicle].MenuString=MenuString_SelfAttackVehicle;
	m_CommandList[VGSCommandType_SelfAttackVehicle].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfAttackPointA].ChatString=ChatString_SelfAttackPointA;
	m_CommandList[VGSCommandType_SelfAttackPointA].KeyBind='One';
    m_CommandList[VGSCommandType_SelfAttackPointA].KeyBindPath="[VSA1]";
	m_CommandList[VGSCommandType_SelfAttackPointA].MenuString=MenuString_SelfAttackPointA;
	m_CommandList[VGSCommandType_SelfAttackPointA].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfAttackPointB].ChatString=ChatString_SelfAttackPointB;
	m_CommandList[VGSCommandType_SelfAttackPointB].KeyBind='Two';
    m_CommandList[VGSCommandType_SelfAttackPointB].KeyBindPath="[VSA2]";
	m_CommandList[VGSCommandType_SelfAttackPointB].MenuString=MenuString_SelfAttackPointB;
	m_CommandList[VGSCommandType_SelfAttackPointB].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfAttackPointC].ChatString=ChatString_SelfAttackPointC;
	m_CommandList[VGSCommandType_SelfAttackPointC].KeyBind='Three';
    m_CommandList[VGSCommandType_SelfAttackPointC].KeyBindPath="[VSA3]";
	m_CommandList[VGSCommandType_SelfAttackPointC].MenuString=MenuString_SelfAttackPointC;
	m_CommandList[VGSCommandType_SelfAttackPointC].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfAttackPointD].ChatString=ChatString_SelfAttackPointD;
	m_CommandList[VGSCommandType_SelfAttackPointD].KeyBind='Four';
    m_CommandList[VGSCommandType_SelfAttackPointD].KeyBindPath="[VSA4]";
	m_CommandList[VGSCommandType_SelfAttackPointD].MenuString=MenuString_SelfAttackPointD;
	m_CommandList[VGSCommandType_SelfAttackPointD].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfAttackPointE].ChatString=ChatString_SelfAttackPointE;
	m_CommandList[VGSCommandType_SelfAttackPointE].KeyBind='Five';
    m_CommandList[VGSCommandType_SelfAttackPointE].KeyBindPath="[VSA5]";
	m_CommandList[VGSCommandType_SelfAttackPointE].MenuString=MenuString_SelfAttackPointE;
	m_CommandList[VGSCommandType_SelfAttackPointE].VGSScope=VGSScope_Team;

	// Self defend
	m_CommandList[VGSCommandType_SelfDefendBase].ChatString=ChatString_SelfDefendBase;
	m_CommandList[VGSCommandType_SelfDefendBase].KeyBind='B';
    m_CommandList[VGSCommandType_SelfDefendBase].KeyBindPath="[VSDB]";
	m_CommandList[VGSCommandType_SelfDefendBase].MenuString=MenuString_SelfDefendBase;
	m_CommandList[VGSCommandType_SelfDefendBase].VGSScope=VGSScope_Team;
	
	m_CommandList[VGSCommandType_SelfDefend].ChatString=ChatString_SelfDefend;
	m_CommandList[VGSCommandType_SelfDefend].KeyBind='D';
    m_CommandList[VGSCommandType_SelfDefend].KeyBindPath="[VSDD]";
	m_CommandList[VGSCommandType_SelfDefend].MenuString=MenuString_SelfDefend;
	m_CommandList[VGSCommandType_SelfDefend].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfDefendFlag].ChatString=ChatString_SelfDefendFlag;
	m_CommandList[VGSCommandType_SelfDefendFlag].KeyBind='F';
    m_CommandList[VGSCommandType_SelfDefendFlag].KeyBindPath="[VSDF]";
	m_CommandList[VGSCommandType_SelfDefendFlag].MenuString=MenuString_SelfDefendFlag;
	m_CommandList[VGSCommandType_SelfDefendFlag].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfDefendGenerator].ChatString=ChatString_SelfDefendGenerator;
	m_CommandList[VGSCommandType_SelfDefendGenerator].KeyBind='G';
    m_CommandList[VGSCommandType_SelfDefendGenerator].KeyBindPath="[VSDG]";
	m_CommandList[VGSCommandType_SelfDefendGenerator].MenuString=MenuString_SelfDefendGenerator;
	m_CommandList[VGSCommandType_SelfDefendGenerator].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfDefendSensors].ChatString=ChatString_SelfDefendSensors;
	m_CommandList[VGSCommandType_SelfDefendSensors].KeyBind='S';
    m_CommandList[VGSCommandType_SelfDefendSensors].KeyBindPath="[VSDS]";
	m_CommandList[VGSCommandType_SelfDefendSensors].MenuString=MenuString_SelfDefendSensors;
	m_CommandList[VGSCommandType_SelfDefendSensors].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfDefendTurrets].ChatString=ChatString_SelfDefendTurrets;
	m_CommandList[VGSCommandType_SelfDefendTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_SelfDefendTurrets].KeyBindPath="[VSDT]";
	m_CommandList[VGSCommandType_SelfDefendTurrets].MenuString=MenuString_SelfDefendTurrets;
	m_CommandList[VGSCommandType_SelfDefendTurrets].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfDefendVehicle].ChatString=ChatString_SelfDefendVehicle;
	m_CommandList[VGSCommandType_SelfDefendVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_SelfDefendVehicle].KeyBindPath="[VSDV]";
	m_CommandList[VGSCommandType_SelfDefendVehicle].MenuString=MenuString_SelfDefendVehicle;
	m_CommandList[VGSCommandType_SelfDefendVehicle].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfDefendPointA].ChatString=ChatString_SelfDefendPointA;
	m_CommandList[VGSCommandType_SelfDefendPointA].KeyBind='One';
    m_CommandList[VGSCommandType_SelfDefendPointA].KeyBindPath="[VSD1]";
	m_CommandList[VGSCommandType_SelfDefendPointA].MenuString=MenuString_SelfDefendPointA;
	m_CommandList[VGSCommandType_SelfDefendPointA].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfDefendPointB].ChatString=ChatString_SelfDefendPointB;
	m_CommandList[VGSCommandType_SelfDefendPointB].KeyBind='Two';
    m_CommandList[VGSCommandType_SelfDefendPointB].KeyBindPath="[VSD2]";
	m_CommandList[VGSCommandType_SelfDefendPointB].MenuString=MenuString_SelfDefendPointB;
	m_CommandList[VGSCommandType_SelfDefendPointB].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfDefendPointC].ChatString=ChatString_SelfDefendPointC;
	m_CommandList[VGSCommandType_SelfDefendPointC].KeyBind='Three';
    m_CommandList[VGSCommandType_SelfDefendPointC].KeyBindPath="[VSD3]";
	m_CommandList[VGSCommandType_SelfDefendPointC].MenuString=MenuString_SelfDefendPointC;
	m_CommandList[VGSCommandType_SelfDefendPointC].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfDefendPointD].ChatString=ChatString_SelfDefendPointD;
	m_CommandList[VGSCommandType_SelfDefendPointD].KeyBind='Four';
    m_CommandList[VGSCommandType_SelfDefendPointD].KeyBindPath="[VSD4]";
	m_CommandList[VGSCommandType_SelfDefendPointD].MenuString=MenuString_SelfDefendPointD;
	m_CommandList[VGSCommandType_SelfDefendPointD].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfDefendPointE].ChatString=ChatString_SelfDefendPointE;
	m_CommandList[VGSCommandType_SelfDefendPointE].KeyBind='Five';
    m_CommandList[VGSCommandType_SelfDefendPointE].KeyBindPath="[VSD5]";
	m_CommandList[VGSCommandType_SelfDefendPointE].MenuString=MenuString_SelfDefendPointE;
	m_CommandList[VGSCommandType_SelfDefendPointE].VGSScope=VGSScope_Team;

	// Self Repair
	m_CommandList[VGSCommandType_SelfRepairBase].ChatString=ChatString_SelfRepairBase;
	m_CommandList[VGSCommandType_SelfRepairBase].KeyBind='B';
    m_CommandList[VGSCommandType_SelfRepairBase].KeyBindPath="[VSRB]";
	m_CommandList[VGSCommandType_SelfRepairBase].MenuString=MenuString_SelfRepairBase;
	m_CommandList[VGSCommandType_SelfRepairBase].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfRepairGenerator].ChatString=ChatString_SelfRepairGenerator;
	m_CommandList[VGSCommandType_SelfRepairGenerator].KeyBind='G';
    m_CommandList[VGSCommandType_SelfRepairGenerator].KeyBindPath="[VSRG]";
	m_CommandList[VGSCommandType_SelfRepairGenerator].MenuString=MenuString_SelfRepairGenerator;
	m_CommandList[VGSCommandType_SelfRepairGenerator].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfRepairSensors].ChatString=ChatString_SelfRepairSensors;
	m_CommandList[VGSCommandType_SelfRepairSensors].KeyBind='S';
    m_CommandList[VGSCommandType_SelfRepairSensors].KeyBindPath="[VSRS]";
	m_CommandList[VGSCommandType_SelfRepairSensors].MenuString=MenuString_SelfRepairSensors;
	m_CommandList[VGSCommandType_SelfRepairSensors].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfRepairTurrets].ChatString=ChatString_SelfRepairTurrets;
	m_CommandList[VGSCommandType_SelfRepairTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_SelfRepairTurrets].KeyBindPath="[VSRT]";
	m_CommandList[VGSCommandType_SelfRepairTurrets].MenuString=MenuString_SelfRepairTurrets;
	m_CommandList[VGSCommandType_SelfRepairTurrets].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfRepairVehicle].ChatString=ChatString_SelfRepairVehicle;
	m_CommandList[VGSCommandType_SelfRepairVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_SelfRepairVehicle].KeyBindPath="[VSRV]";
	m_CommandList[VGSCommandType_SelfRepairVehicle].MenuString=MenuString_SelfRepairVehicle;
	m_CommandList[VGSCommandType_SelfRepairVehicle].VGSScope=VGSScope_Team;

	// Self task
	m_CommandList[VGSCommandType_SelfTaskCover].ChatString=ChatString_SelfTaskCover;
	m_CommandList[VGSCommandType_SelfTaskCover].KeyBind='C';
    m_CommandList[VGSCommandType_SelfTaskCover].KeyBindPath="[VSTC]";
	m_CommandList[VGSCommandType_SelfTaskCover].MenuString=MenuString_SelfTaskCover;
	m_CommandList[VGSCommandType_SelfTaskCover].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfTaskDefenses].ChatString=ChatString_SelfTaskDefenses;
	m_CommandList[VGSCommandType_SelfTaskDefenses].KeyBind='D';
    m_CommandList[VGSCommandType_SelfTaskDefenses].KeyBindPath="[VSTD]";
	m_CommandList[VGSCommandType_SelfTaskDefenses].MenuString=MenuString_SelfTaskDefenses;
	m_CommandList[VGSCommandType_SelfTaskDefenses].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfTaskForcefield].ChatString=ChatString_SelfTaskForcefield;
	m_CommandList[VGSCommandType_SelfTaskForcefield].KeyBind='F';
    m_CommandList[VGSCommandType_SelfTaskForcefield].KeyBindPath="[VSTF]";
	m_CommandList[VGSCommandType_SelfTaskForcefield].MenuString=MenuString_SelfTaskForcefield;
	m_CommandList[VGSCommandType_SelfTaskForcefield].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfTaskOnIt].ChatString=ChatString_SelfTaskOnIt;
	m_CommandList[VGSCommandType_SelfTaskOnIt].KeyBind='O';
    m_CommandList[VGSCommandType_SelfTaskOnIt].KeyBindPath="[VSTO]";
	m_CommandList[VGSCommandType_SelfTaskOnIt].MenuString=MenuString_SelfTaskOnIt;
	m_CommandList[VGSCommandType_SelfTaskOnIt].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfTaskDeploySensors].ChatString=ChatString_SelfTaskDeploySensors;
	m_CommandList[VGSCommandType_SelfTaskDeploySensors].KeyBind='S';
    m_CommandList[VGSCommandType_SelfTaskDeploySensors].KeyBindPath="[VSTS]";
	m_CommandList[VGSCommandType_SelfTaskDeploySensors].MenuString=MenuString_SelfTaskDeploySensors;
	m_CommandList[VGSCommandType_SelfTaskDeploySensors].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfTaskDeployTurrets].ChatString=ChatString_SelfTaskDeployTurrets;
	m_CommandList[VGSCommandType_SelfTaskDeployTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_SelfTaskDeployTurrets].KeyBindPath="[VSTT]";
	m_CommandList[VGSCommandType_SelfTaskDeployTurrets].MenuString=MenuString_SelfTaskDeployTurrets;
	m_CommandList[VGSCommandType_SelfTaskDeployTurrets].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_SelfTaskVehicle].ChatString=ChatString_SelfTaskVehicle;
	m_CommandList[VGSCommandType_SelfTaskVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_SelfTaskVehicle].KeyBindPath="[VSTV]";
	m_CommandList[VGSCommandType_SelfTaskVehicle].MenuString=MenuString_SelfTaskVehicle;
	m_CommandList[VGSCommandType_SelfTaskVehicle].VGSScope=VGSScope_Team;

	// Self Upgrade
	m_CommandList[VGSCommandType_SelfUpgradeGenerator].ChatString=ChatString_SelfUpgradeGenerator;
	m_CommandList[VGSCommandType_SelfUpgradeGenerator].KeyBind='G';
    m_CommandList[VGSCommandType_SelfUpgradeGenerator].KeyBindPath="[VSUG]";
	m_CommandList[VGSCommandType_SelfUpgradeGenerator].MenuString=MenuString_SelfUpgradeGenerator;
	m_CommandList[VGSCommandType_SelfUpgradeGenerator].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfUpgradeSensors].ChatString=ChatString_SelfUpgradeSensors;
	m_CommandList[VGSCommandType_SelfUpgradeSensors].KeyBind='S';
    m_CommandList[VGSCommandType_SelfUpgradeSensors].KeyBindPath="[VSUS]";
	m_CommandList[VGSCommandType_SelfUpgradeSensors].MenuString=MenuString_SelfUpgradeSensors;
	m_CommandList[VGSCommandType_SelfUpgradeSensors].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_SelfUpgradeTurrets].ChatString=ChatString_SelfUpgradeTurrets;
	m_CommandList[VGSCommandType_SelfUpgradeTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_SelfUpgradeTurrets].KeyBindPath="[VSUT]";
	m_CommandList[VGSCommandType_SelfUpgradeTurrets].MenuString=MenuString_SelfUpgradeTurrets;
	m_CommandList[VGSCommandType_SelfUpgradeTurrets].VGSScope=VGSScope_Team;

	// Target
	m_CommandList[VGSCommandType_TargetAcquired].ChatString=ChatString_TargetAcquired;
	m_CommandList[VGSCommandType_TargetAcquired].KeyBind='A';
    m_CommandList[VGSCommandType_TargetAcquired].KeyBindPath="[VTA]";
	m_CommandList[VGSCommandType_TargetAcquired].MenuString=MenuString_TargetAcquired;
	m_CommandList[VGSCommandType_TargetAcquired].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetBase].ChatString=ChatString_TargetBase;
	m_CommandList[VGSCommandType_TargetBase].KeyBind='B';
    m_CommandList[VGSCommandType_TargetBase].KeyBindPath="[VTB]";
	m_CommandList[VGSCommandType_TargetBase].MenuString=MenuString_TargetBase;
	m_CommandList[VGSCommandType_TargetBase].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetDestroyed].ChatString=ChatString_TargetDestroyed;
	m_CommandList[VGSCommandType_TargetDestroyed].KeyBind='D';
    m_CommandList[VGSCommandType_TargetDestroyed].KeyBindPath="[VTD]";
	m_CommandList[VGSCommandType_TargetDestroyed].MenuString=MenuString_TargetDestroyed;
	m_CommandList[VGSCommandType_TargetDestroyed].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetFlag].ChatString=ChatString_TargetFlag;
	m_CommandList[VGSCommandType_TargetFlag].KeyBind='F';
    m_CommandList[VGSCommandType_TargetFlag].KeyBindPath="[VTF]";
	m_CommandList[VGSCommandType_TargetFlag].MenuString=MenuString_TargetFlag;
	m_CommandList[VGSCommandType_TargetFlag].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetFireOnMy].ChatString=ChatString_TargetFireOnMy;
	m_CommandList[VGSCommandType_TargetFireOnMy].KeyBind='M';
    m_CommandList[VGSCommandType_TargetFireOnMy].KeyBindPath="[VTM]";
	m_CommandList[VGSCommandType_TargetFireOnMy].MenuString=MenuString_TargetFireOnMy;
	m_CommandList[VGSCommandType_TargetFireOnMy].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetNeed].ChatString=ChatString_TargetNeed;
	m_CommandList[VGSCommandType_TargetNeed].KeyBind='N';
    m_CommandList[VGSCommandType_TargetNeed].KeyBindPath="[VTN]";
	m_CommandList[VGSCommandType_TargetNeed].MenuString=MenuString_TargetNeed;
	m_CommandList[VGSCommandType_TargetNeed].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetSensors].ChatString=ChatString_TargetSensors;
	m_CommandList[VGSCommandType_TargetSensors].KeyBind='S';
    m_CommandList[VGSCommandType_TargetSensors].KeyBindPath="[VTS]";
	m_CommandList[VGSCommandType_TargetSensors].MenuString=MenuString_TargetSensors;
	m_CommandList[VGSCommandType_TargetSensors].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetTurret].ChatString=ChatString_TargetTurret;
	m_CommandList[VGSCommandType_TargetTurret].KeyBind='T';
    m_CommandList[VGSCommandType_TargetTurret].KeyBindPath="[VTT]";
	m_CommandList[VGSCommandType_TargetTurret].MenuString=MenuString_TargetTurret;
	m_CommandList[VGSCommandType_TargetTurret].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetVehicle].ChatString=ChatString_TargetVehicle;
	m_CommandList[VGSCommandType_TargetVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_TargetVehicle].KeyBindPath="[VTV]";
	m_CommandList[VGSCommandType_TargetVehicle].MenuString=MenuString_TargetVehicle;
	m_CommandList[VGSCommandType_TargetVehicle].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TargetWait].ChatString=ChatString_TargetWait;
	m_CommandList[VGSCommandType_TargetWait].KeyBind='W';
    m_CommandList[VGSCommandType_TargetWait].KeyBindPath="[VTW]";
	m_CommandList[VGSCommandType_TargetWait].MenuString=MenuString_TargetWait;
	m_CommandList[VGSCommandType_TargetWait].VGSScope=VGSScope_Team;

	// Upgrade
	m_CommandList[VGSCommandType_UpgradeGenerator].ChatString=ChatString_UpgradeGenerator;
	m_CommandList[VGSCommandType_UpgradeGenerator].KeyBind='G';
    m_CommandList[VGSCommandType_UpgradeGenerator].KeyBindPath="[VUG]";
	m_CommandList[VGSCommandType_UpgradeGenerator].MenuString=MenuString_UpgradeGenerator;
	m_CommandList[VGSCommandType_UpgradeGenerator].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_UpgradeSensors].ChatString=ChatString_UpgradeSensors;
	m_CommandList[VGSCommandType_UpgradeSensors].KeyBind='S';
    m_CommandList[VGSCommandType_UpgradeSensors].KeyBindPath="[VUS]";
	m_CommandList[VGSCommandType_UpgradeSensors].MenuString=MenuString_UpgradeSensors;
	m_CommandList[VGSCommandType_UpgradeSensors].VGSScope=VGSScope_Team;

	m_CommandList[VGSCommandType_UpgradeTurrets].ChatString=ChatString_UpgradeTurrets;
	m_CommandList[VGSCommandType_UpgradeTurrets].KeyBind='T';
    m_CommandList[VGSCommandType_UpgradeTurrets].KeyBindPath="[VUT]";
	m_CommandList[VGSCommandType_UpgradeTurrets].MenuString=MenuString_UpgradeTurrets;
	m_CommandList[VGSCommandType_UpgradeTurrets].VGSScope=VGSScope_Team;

	// Warn
	m_CommandList[VGSCommandType_WarnEnemies].ChatString=ChatString_WarnEnemies;
	m_CommandList[VGSCommandType_WarnEnemies].KeyBind='E';
    m_CommandList[VGSCommandType_WarnEnemies].KeyBindPath="[VWE]";
	m_CommandList[VGSCommandType_WarnEnemies].MenuString=MenuString_WarnEnemies;
	m_CommandList[VGSCommandType_WarnEnemies].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_WarnVehicle].ChatString=ChatString_WarnVehicle;
	m_CommandList[VGSCommandType_WarnVehicle].KeyBind='V';
    m_CommandList[VGSCommandType_WarnVehicle].KeyBindPath="[VWV]";
	m_CommandList[VGSCommandType_WarnVehicle].MenuString=MenuString_WarnVehicle;
	m_CommandList[VGSCommandType_WarnVehicle].VGSScope=VGSScope_Team;

	// Very Quick
	m_CommandList[VGSCommandType_TeamYes].ChatString=ChatString_TeamYes;
	m_CommandList[VGSCommandType_TeamYes].KeyBind='Y';
    m_CommandList[VGSCommandType_TeamYes].KeyBindPath="[VVY]";
	m_CommandList[VGSCommandType_TeamYes].MenuString=MenuString_TeamYes;
	m_CommandList[VGSCommandType_TeamYes].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamNo].ChatString=ChatString_TeamNo;
	m_CommandList[VGSCommandType_TeamNo].KeyBind='N';
    m_CommandList[VGSCommandType_TeamNo].KeyBindPath="[VVN]";
	m_CommandList[VGSCommandType_TeamNo].MenuString=MenuString_TeamNo;
	m_CommandList[VGSCommandType_TeamNo].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamAnytime].ChatString=ChatString_TeamAnytime;
	m_CommandList[VGSCommandType_TeamAnytime].KeyBind='A';
    m_CommandList[VGSCommandType_TeamAnytime].KeyBindPath="[VVA]";
	m_CommandList[VGSCommandType_TeamAnytime].MenuString=MenuString_TeamAnytime;
	m_CommandList[VGSCommandType_TeamAnytime].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamBaseSecure].ChatString=ChatString_TeamBaseSecure;
	m_CommandList[VGSCommandType_TeamBaseSecure].KeyBind='B';
    m_CommandList[VGSCommandType_TeamBaseSecure].KeyBindPath="[VVB]";
	m_CommandList[VGSCommandType_TeamBaseSecure].MenuString=MenuString_TeamBaseSecure;
	m_CommandList[VGSCommandType_TeamBaseSecure].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamCeaseFire].ChatString=ChatString_TeamCeaseFire;
	m_CommandList[VGSCommandType_TeamCeaseFire].KeyBind='C';
    m_CommandList[VGSCommandType_TeamCeaseFire].KeyBindPath="[VVC]";
	m_CommandList[VGSCommandType_TeamCeaseFire].MenuString=MenuString_TeamCeaseFire;
	m_CommandList[VGSCommandType_TeamCeaseFire].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamDontKnow].ChatString=ChatString_TeamDontKnow;
	m_CommandList[VGSCommandType_TeamDontKnow].KeyBind='D';
    m_CommandList[VGSCommandType_TeamDontKnow].KeyBindPath="[VVD]";    
	m_CommandList[VGSCommandType_TeamDontKnow].MenuString=MenuString_TeamDontKnow;
	m_CommandList[VGSCommandType_TeamDontKnow].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamHelp].ChatString=ChatString_TeamHelp;
	m_CommandList[VGSCommandType_TeamHelp].KeyBind='H';
    m_CommandList[VGSCommandType_TeamHelp].KeyBindPath="[VVH]";
	m_CommandList[VGSCommandType_TeamHelp].MenuString=MenuString_TeamHelp;
	m_CommandList[VGSCommandType_TeamHelp].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamMove].ChatString=ChatString_TeamMove;
	m_CommandList[VGSCommandType_TeamMove].KeyBind='M';
    m_CommandList[VGSCommandType_TeamMove].KeyBindPath="[VVM]";
	m_CommandList[VGSCommandType_TeamMove].MenuString=MenuString_TeamMove;
	m_CommandList[VGSCommandType_TeamMove].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamSorry].ChatString=ChatString_TeamSorry;
	m_CommandList[VGSCommandType_TeamSorry].KeyBind='S';
    m_CommandList[VGSCommandType_TeamSorry].KeyBindPath="[VVS]";
	m_CommandList[VGSCommandType_TeamSorry].MenuString=MenuString_TeamSorry;
	m_CommandList[VGSCommandType_TeamSorry].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamThanks].ChatString=ChatString_TeamThanks;
	m_CommandList[VGSCommandType_TeamThanks].KeyBind='T';
    m_CommandList[VGSCommandType_TeamThanks].KeyBindPath="[VVT]";
	m_CommandList[VGSCommandType_TeamThanks].MenuString=MenuString_TeamThanks;
	m_CommandList[VGSCommandType_TeamThanks].VGSScope=VGSScope_Team;
		
	m_CommandList[VGSCommandType_TeamWait].ChatString=ChatString_TeamWait;
	m_CommandList[VGSCommandType_TeamWait].KeyBind='W';
    m_CommandList[VGSCommandType_TeamWait].KeyBindPath="[VVW]";
	m_CommandList[VGSCommandType_TeamWait].MenuString=MenuString_TeamWait;
	m_CommandList[VGSCommandType_TeamWait].VGSScope=VGSScope_Team;
}

function string GetContextLocationString(EVGSContextLocation Loc, bool bEnemyLocation)
{
	switch( Loc )
	{
		case VGSContext_InsideBase: return bEnemyLocation ? ChatString_WarnContext_EnemyInsideEnemyBase : ChatString_WarnContext_EnemyInsideOurBase;
		case VGSContext_AroundBase: return bEnemyLocation ? ChatString_WarnContext_EnemyAroundEnemyBase : ChatString_WarnContext_EnemyAroundOurBase;
		case VGSContext_BehindBase: return bEnemyLocation ? ChatString_WarnContext_EnemyBehindEnemyBase : ChatString_WarnContext_EnemyBehindOurBase;
		case VGSContext_Midfield: return ChatString_WarnContext_EnemyInMidfield;
		case VGSContext_NearGenerator: return bEnemyLocation ? ChatString_WarnContext_EnemyNearEnemyGenerator : ChatString_WarnContext_EnemyNearOurGenerator;
		case VGSContext_NearFlag: return bEnemyLocation ? ChatString_WarnContext_EnemyNearEnemyFlag : ChatString_WarnContext_EnemyNearOurFlag;
		case VGSContext_NearBaseTurret: return bEnemyLocation ? ChatString_WarnContext_EnemyNearEnemyBaseTurret : ChatString_WarnContext_EnemyNearOurBaseTurret;
		case VGSContext_NearVehiclePad: return bEnemyLocation ? ChatString_WarnContext_EnemyNearEnemyVehiclePad : ChatString_WarnContext_EnemyNearOurVehiclePad;
		default: return ChatString_WarnContext_EnemyNearby; 
	}
}

defaultproperties
{
   ChatString_GlobalYes="Yes."
   ChatString_GlobalNo="No."
   ChatString_GlobalHi="Hi."
   ChatString_GlobalBye="Bye."
   ChatString_GlobalOoops="Ooops."
   ChatString_GlobalQuiet="Quiet!"
   ChatString_GlobalShazbot="Shazbot!"
   ChatString_GlobalWoohoo="Woohoo!"
   ChatString_GlobalComplimentAwesome="Awesome!"
   ChatString_GlobalComplimentGoodGame="Good game"
   ChatString_GlobalComplimentNiceMove="Nice move!"
   ChatString_GlobalComplimentYouRock="You Rock!"
   ChatString_GlobalComplimentGreatShot="Great shot!"
   ChatString_GlobalRespondAnyTime="Any time."
   ChatString_GlobalRespondDontKnow="I don't know."
   ChatString_GlobalRespondThanks="Thanks."
   ChatString_GlobalRespondWait="Wait."
   ChatString_GlobalTauntAww="Aww, that's too bad!"
   ChatString_GlobalTauntObnoxious="Is that the best you can do?"
   ChatString_GlobalTauntBrag="I am the greatest!"
   ChatString_GlobalTauntSarcasm="THAT was graceful!"
   ChatString_GlobalTauntLearn="When will you learn?"
   ChatString_Attack="Attack!"
   ChatString_AttackBase="Attack the enemy base!"
   ChatString_AttackChase="Chase the enemy flag carrier!"
   ChatString_AttackDisrupt="Disrupt the enemy defense!"
   ChatString_AttackFlag="Get the enemy flag!"
   ChatString_AttackGenerator="Destroy the enemy generator!"
   ChatString_AttackReinforce="Reinforce the offense!"
   ChatString_AttackSensors="Destroy enemy sensors!"
   ChatString_AttackTurrets="Destroy enemy turrets!"
   ChatString_AttackVehicle="Destroy the enemy vehicle!"
   ChatString_AttackWait="Wait for my signal before attacking!"
   ChatString_AttackPointA="Attack point A!"
   ChatString_AttackPointB="Attack point B!"
   ChatString_AttackPointC="Attack point C!"
   ChatString_AttackPointD="Attack point D!"
   ChatString_AttackPointE="Attack point E!"
   ChatString_DefendBase="Defend our base!"
   ChatString_DefendFlagCarrier="Defend the flag carrier!"
   ChatString_DefendEntrances="Defend the entrances!"
   ChatString_DefendFlag="Defend our flag!"
   ChatString_DefendGenerator="Defend our generator!"
   ChatString_DefendMe="Cover me!"
   ChatString_DefendReinforce="Reinforce our defense!"
   ChatString_DefendSensors="Defend our sensors!"
   ChatString_DefendTurrets="Defend our turrets!"
   ChatString_DefendVehicle="Defend our vehicle!"
   ChatString_DefendPointA="Defend point A!"
   ChatString_DefendPointB="Defend point B!"
   ChatString_DefendPointC="Defend point C!"
   ChatString_DefendPointD="Defend point D!"
   ChatString_DefendPointE="Defend point E!"
   ChatString_RepairGenerator="Repair our generator!"
   ChatString_RepairSensors="Repair our sensors!"
   ChatString_RepairTurrets="Repair our turrets!"
   ChatString_RepairVehicle="Repair the vehicle!"
   ChatString_BaseClear="Our base is clear."
   ChatString_EnemyInBase="The enemy is in our base."
   ChatString_BaseRetake="Retake our base!"
   ChatString_BaseSecure="Secure our base!"
   ChatString_CommandAcknowledged="Acknowledged."
   ChatString_CommandCompleted="Completed."
   ChatString_CommandDeclined="Declined."
   ChatString_CommandAssignment="What's my assignment?"
   ChatString_EnemyDisarray="The enemy is in disarray."
   ChatString_EnemyGeneratorDestroyed="The enemy generator is destroyed."
   ChatString_EnemySensorsDestroyed="The enemy sensors are destroyed."
   ChatString_EnemyTurretsDestroyed="The enemy turrets are destroyed."
   ChatString_EnemyVehicleDestroyed="The enemy vehicle is destroyed."
   ChatString_FlagDefend="Defend our flag!"
   ChatString_FlagIHave="I have the flag!"
   ChatString_FlagGiveMe="Give me the flag!"
   ChatString_FlagRetrieve="Retrieve our flag!"
   ChatString_FlagSelfRetrieve="I'll retrieve our flag!"
   ChatString_FlagSecure="Our flag is secure."
   ChatString_FlagTake="Take the flag from me!"
   ChatString_NeedCover="Need covering fire."
   ChatString_NeedDriver="I need a driver."
   ChatString_NeedEscort="I need an escort."
   ChatString_NeedHoldVehicle="Hold that vehicle! I'm coming!"
   ChatString_NeedRide="I need a ride!"
   ChatString_NeedSupport="I need support!"
   ChatString_NeedVehicleReady="Vehicle ready. Need a ride?"
   ChatString_NeedWhereTo="Where to?"
   ChatString_SelfAttack="I will attack."
   ChatString_SelfAttackBase="I will attack the enemy base."
   ChatString_SelfAttackFlag="I'll go for the enemy flag."
   ChatString_SelfAttackGenerator="I'll attack the enemy generator."
   ChatString_SelfAttackSensors="I'll attack the enemy sensors."
   ChatString_SelfAttackTurrets="I'll attack the enemy turrets."
   ChatString_SelfAttackVehicle="I'll attack the enemy vehicle."
   ChatString_SelfAttackPointA="I'll attack point A."
   ChatString_SelfAttackPointB="I'll attack point B."
   ChatString_SelfAttackPointC="I'll attack point C."
   ChatString_SelfAttackPointD="I'll attack point D."
   ChatString_SelfAttackPointE="I'll attack point E."
   ChatString_SelfDefendBase="I will defend our base."
   ChatString_SelfDefend="I will defend."
   ChatString_SelfDefendFlag="I will defend our flag."
   ChatString_SelfDefendGenerator="I'll defend our generator."
   ChatString_SelfDefendSensors="I'll defend our sensors."
   ChatString_SelfDefendTurrets="I'll defend our turrets."
   ChatString_SelfDefendVehicle="I'll defend our vehicle."
   ChatString_SelfDefendPointA="I'll defend point A."
   ChatString_SelfDefendPointB="I'll defend point B."
   ChatString_SelfDefendPointC="I'll defend point C."
   ChatString_SelfDefendPointD="I'll defend point D."
   ChatString_SelfDefendPointE="I'll defend point E."
   ChatString_SelfRepairBase="I'll repair our base."
   ChatString_SelfRepairGenerator="I'll repair our generator."
   ChatString_SelfRepairSensors="I'll repair our sensors."
   ChatString_SelfRepairTurrets="I'll repair our turrets."
   ChatString_SelfRepairVehicle="I'll repair the vehicle."
   ChatString_SelfTaskCover="I'll cover you."
   ChatString_SelfTaskDefenses="I'll set up defenses."
   ChatString_SelfTaskForcefield="I'll deploy forcefields."
   ChatString_SelfTaskOnIt="I'm on it."
   ChatString_SelfTaskDeploySensors="I'm deploying sensors."
   ChatString_SelfTaskDeployTurrets="I'm deploying turrets."
   ChatString_SelfTaskVehicle="I'll get a vehicle ready."
   ChatString_SelfUpgradeGenerator="I'll upgrade our generator."
   ChatString_SelfUpgradeSensors="I'll upgrade our sensors."
   ChatString_SelfUpgradeTurrets="I'll upgrade our base turrets."
   ChatString_TargetAcquired="Target acquired."
   ChatString_TargetBase="Target the enemy base! I'm in position."
   ChatString_TargetDestroyed="Target destroyed."
   ChatString_TargetFlag="Target the enemy flag! I'm in position."
   ChatString_TargetFireOnMy="Fire on my target!"
   ChatString_TargetNeed="I need a target painted!"
   ChatString_TargetSensors="Target the sensors! I'm in position."
   ChatString_TargetTurret="Target the turret! I'm in position."
   ChatString_TargetVehicle="Target the vehicle! I'm in position."
   ChatString_TargetWait="Wait! I'll be in range soon."
   ChatString_UpgradeGenerator="Upgrade our generator!"
   ChatString_UpgradeSensors="Upgrade our sensors!"
   ChatString_UpgradeTurrets="Upgrade our base turrets!"
   ChatString_WarnEnemies="Incoming hostiles!"
   ChatString_WarnVehicle="Incoming enemy vehicle!"
   ChatString_WarnContext_EnemyInsideOurBase="spotted inside our base."
   ChatString_WarnContext_EnemyInsideEnemyBase="spotted inside the enemy base."
   ChatString_WarnContext_EnemyAroundOurBase="spotted around our base."
   ChatString_WarnContext_EnemyAroundEnemyBase="spotted around the enemy base."
   ChatString_WarnContext_EnemyBehindOurBase="spotted behind our base."
   ChatString_WarnContext_EnemyBehindEnemyBase="spotted behind the enemy base."
   ChatString_WarnContext_EnemyInMidfield="spotted in the midfield."
   ChatString_WarnContext_EnemyNearOurGenerator="spotted near our generator."
   ChatString_WarnContext_EnemyNearEnemyGenerator="spotted near the enemy generator."
   ChatString_WarnContext_EnemyNearOurFlag="spotted near our flag base."
   ChatString_WarnContext_EnemyNearEnemyFlag="spotted near the enemy flag base."
   ChatString_WarnContext_EnemyNearOurBaseTurret="spotted near our base turret."
   ChatString_WarnContext_EnemyNearEnemyBaseTurret="spotted near the enemy base turret."
   ChatString_WarnContext_EnemyNearOurVehiclePad="spotted near our vehicle pad."
   ChatString_WarnContext_EnemyNearEnemyVehiclePad="spotted near the enemy vehicle pad."
   ChatString_WarnContext_EnemyNearby="spotted nearby."
   ChatString_WarnContext_ActorLightPawn="Light armored hostile"
   ChatString_WarnContext_ActorMediumPawn="Medium armored hostile"
   ChatString_WarnContext_ActorHeavyPawn="Heavy armored hostile"
   ChatString_WarnContext_ActorTurret="Enemy turret"
   ChatString_WarnContext_ActorSensor="Enemy sensor"
   ChatString_WarnContext_ActorVehicle="Enemy vehicle"
   ChatString_WarnContext_ActorDeployable="Enemy deployable"
   ChatString_TeamYes="Yes."
   ChatString_TeamNo="No."
   ChatString_TeamAnytime="Anytime."
   ChatString_TeamBaseSecure="Is our base secure?"
   ChatString_TeamCeaseFire="Cease fire!"
   ChatString_TeamDontKnow="I don't know."
   ChatString_TeamHelp="Help!"
   ChatString_TeamMove="Move!"
   ChatString_TeamSorry="Sorry."
   ChatString_TeamThanks="Thanks."
   ChatString_TeamWait="Wait."
   MenuString_GlobalYes="Yes"
   MenuString_GlobalNo="No"
   MenuString_GlobalHi="Hi"
   MenuString_GlobalBye="Bye"
   MenuString_GlobalOoops="Ooops"
   MenuString_GlobalQuiet="Quiet"
   MenuString_GlobalShazbot="Shazbot"
   MenuString_GlobalWoohoo="Woohoo"
   MenuString_GlobalComplimentAwesome="Awesome"
   MenuString_GlobalComplimentGoodGame="Good game"
   MenuString_GlobalComplimentNiceMove="Nice move"
   MenuString_GlobalComplimentYouRock="You Rock"
   MenuString_GlobalComplimentGreatShot="Great shot"
   MenuString_GlobalRespondAnyTime="Any time"
   MenuString_GlobalRespondDontKnow="Don't know"
   MenuString_GlobalRespondThanks="Thanks"
   MenuString_GlobalRespondWait="Wait"
   MenuString_GlobalTauntAww="Aww..."
   MenuString_GlobalTauntObnoxious="Best you can do?"
   MenuString_GlobalTauntBrag="I am the greatest!"
   MenuString_GlobalTauntSarcasm="THAT was graceful!"
   MenuString_GlobalTauntLearn="When will you learn?"
   MenuString_Attack="Attack"
   MenuString_AttackBase="Base"
   MenuString_AttackChase="Chase"
   MenuString_AttackDisrupt="Disrupt"
   MenuString_AttackFlag="Flag"
   MenuString_AttackGenerator="Generator"
   MenuString_AttackReinforce="Reinforce"
   MenuString_AttackSensors="Sensors"
   MenuString_AttackTurrets="Turrets"
   MenuString_AttackVehicle="Vehicle"
   MenuString_AttackWait="Wait"
   MenuString_AttackPointA="Point A"
   MenuString_AttackPointB="Point B"
   MenuString_AttackPointC="Point C"
   MenuString_AttackPointD="Point D"
   MenuString_AttackPointE="Point E"
   MenuString_DefendBase="Base"
   MenuString_DefendFlagCarrier="Flag carrier"
   MenuString_DefendEntrances="Entrances"
   MenuString_DefendFlag="Flag"
   MenuString_DefendGenerator="Generator"
   MenuString_DefendMe="Me"
   MenuString_DefendReinforce="Reinforce"
   MenuString_DefendSensors="Sensors"
   MenuString_DefendTurrets="Turrets"
   MenuString_DefendVehicle="Vehicle"
   MenuString_DefendPointA="Point A"
   MenuString_DefendPointB="Point B"
   MenuString_DefendPointC="Point C"
   MenuString_DefendPointD="Point D"
   MenuString_DefendPointE="Point E"
   MenuString_RepairGenerator="Generator"
   MenuString_RepairSensors="Sensors"
   MenuString_RepairTurrets="Turrets"
   MenuString_RepairVehicle="Vehicle"
   MenuString_BaseClear="Clear"
   MenuString_EnemyInBase="Enemy in base"
   MenuString_BaseRetake="Retake"
   MenuString_BaseSecure="Secure"
   MenuString_CommandAcknowledged="Acknowledged"
   MenuString_CommandCompleted="Completed"
   MenuString_CommandDeclined="Declined"
   MenuString_CommandAssignment="Assignment?"
   MenuString_EnemyDisarray="Disarray"
   MenuString_EnemyGeneratorDestroyed="Generator destroyed"
   MenuString_EnemySensorsDestroyed="Sensors destroyed"
   MenuString_EnemyTurretsDestroyed="Turrets destroyed"
   MenuString_EnemyVehicleDestroyed="Vehicle destroyed"
   MenuString_FlagDefend="Defend"
   MenuString_FlagIHave="I have the flag"
   MenuString_FlagGiveMe="Give me"
   MenuString_FlagRetrieve="Retrieve"
   MenuString_FlagSelfRetrieve="Self retrieve"
   MenuString_FlagSecure="Flag is secure"
   MenuString_FlagTake="Take"
   MenuString_NeedCover="Covering fire"
   MenuString_NeedDriver="Driver"
   MenuString_NeedEscort="Escort"
   MenuString_NeedHoldVehicle="Hold vehicle"
   MenuString_NeedRide="I need a ride"
   MenuString_NeedSupport="Support"
   MenuString_NeedVehicleReady="Vehicle ready"
   MenuString_NeedWhereTo="Where to?"
   MenuString_SelfAttack="Attack"
   MenuString_SelfAttackBase="Base"
   MenuString_SelfAttackFlag="Flag"
   MenuString_SelfAttackGenerator="Generator"
   MenuString_SelfAttackSensors="Sensors"
   MenuString_SelfAttackTurrets="Turrets"
   MenuString_SelfAttackVehicle="Vehicle"
   MenuString_SelfAttackPointA="Point A"
   MenuString_SelfAttackPointB="Point B"
   MenuString_SelfAttackPointC="Point C"
   MenuString_SelfAttackPointD="Point D"
   MenuString_SelfAttackPointE="Point E"
   MenuString_SelfDefendBase="Base"
   MenuString_SelfDefend="Defend"
   MenuString_SelfDefendFlag="Flag"
   MenuString_SelfDefendGenerator="Generator"
   MenuString_SelfDefendSensors="Sensors"
   MenuString_SelfDefendTurrets="Turrets"
   MenuString_SelfDefendVehicle="Vehicle"
   MenuString_SelfDefendPointA="Point A"
   MenuString_SelfDefendPointB="Point B"
   MenuString_SelfDefendPointC="Point C"
   MenuString_SelfDefendPointD="Point D"
   MenuString_SelfDefendPointE="Point E"
   MenuString_SelfRepairBase="Base"
   MenuString_SelfRepairGenerator="Generator"
   MenuString_SelfRepairSensors="Sensors"
   MenuString_SelfRepairTurrets="Turrets"
   MenuString_SelfRepairVehicle="Vehicle"
   MenuString_SelfTaskCover="Cover"
   MenuString_SelfTaskDefenses="Set up defenses"
   MenuString_SelfTaskForcefield="Deploy forcefields"
   MenuString_SelfTaskOnIt="On it"
   MenuString_SelfTaskDeploySensors="Deploy sensors"
   MenuString_SelfTaskDeployTurrets="Deploy turrets"
   MenuString_SelfTaskVehicle="Vehicle"
   MenuString_SelfUpgradeGenerator="Generator"
   MenuString_SelfUpgradeSensors="Sensors"
   MenuString_SelfUpgradeTurrets="Turrets"
   MenuString_TargetAcquired="Acquired"
   MenuString_TargetBase="Base"
   MenuString_TargetDestroyed="Destroyed"
   MenuString_TargetFlag="Flag"
   MenuString_TargetFireOnMy="Fire on my target"
   MenuString_TargetNeed="Need"
   MenuString_TargetSensors="Sensors"
   MenuString_TargetTurret="Turret"
   MenuString_TargetVehicle="Vehicle"
   MenuString_TargetWait="Wait"
   MenuString_UpgradeGenerator="Generator"
   MenuString_UpgradeSensors="Sensors"
   MenuString_UpgradeTurrets="Turrets"
   MenuString_WarnEnemies="Enemies"
   MenuString_WarnVehicle="Vehicle"
   MenuString_TeamYes="Yes"
   MenuString_TeamNo="No"
   MenuString_TeamAnytime="Anytime"
   MenuString_TeamBaseSecure="Base secure?"
   MenuString_TeamCeaseFire="Cease fire"
   MenuString_TeamDontKnow="Don't know"
   MenuString_TeamHelp="Help!"
   MenuString_TeamMove="Move"
   MenuString_TeamSorry="Sorry"
   MenuString_TeamThanks="Thanks"
   MenuString_TeamWait="Wait"
   Name="Default__TrVGSCommandList"
   ObjectArchetype=Object'Core.Default__Object'
}
