/**
 * Structure defining information about a particular 'family' (eg. Heavy Armor)
 */

class TrFamilyInfo extends UTFamilyInfo
	dependsOn(TrPawn)
    dependsOn(TrObject)
    abstract
    native;

struct native DeviceSelectionList
{
	var TR_EQUIP_POINT EquipPoint;
    var class<TrDevice> DeviceClass;
	var string ContentDeviceClassString;
};

const TR_MAX_FACTION_NBR  = 3;      //no faction, Blood Eagle, Diamond Sword
//const TR_MAX_SLOTS_TO_EQUIP = 15;    //equippable slot have the device selection

var array<DeviceSelectionList> DevSelectionList;
var array<class<TrVehicle> > VehicleSelectionList;
var array<class<TrVehicle> > PassengerSelectionList;

// Skin
var class<TrSkin> DefaultSkinClass;

// Jetpack
var() vector2d  m_vAirControlReductionRange;    // X=Speed below which max air control is used, Y=Speed above which min air control is used.
var() vector2d  m_vAirControlMultiplier;        // X=Corresponds to air control used on low end of m_vAirControlReductionRange.
var() float     m_fFlightAcceleration;          // How much to accelerate when jetting.
var() float		m_fJetpackInitAccelMultiplier;  // Multiplier for an initial jetpack boost
var() float		m_fJetpackInitTotalTime;        // The amount of time before the initial jetpack boost wears off.
var() float     m_fJetpackPowerPoolCost;        // The amount of power pool units / sec used while jetting.
var() float     m_fJetpackPowerPoolTickRate;    // How often (secs) to consume power. Controls the timer on the controller.
var() float     m_fJetpackInitialCost;          // The amount of power pool units initiating the jetpack uses.

// Jetpack effects
var() ParticleSystem m_fJetpackRibbonTemplate;  // Particle template for the jetpack ribbon.
var() ParticleSystem m_fJetpackThrustTemplate;  // Particle template for the jetpack thrust.
var() array<Name> m_nmJetpackThrustEffectSockets;// Sockets to thrust from.

// Ski thruster effects
var() array<name> m_nmSkiThrusterEffectSockets; // Sockets to ski thrust from.

// Footstep effects
var() array<name> m_nmFootstepEffectSockets;    // Sockets to play footstep particles from. 0 = left foot, 1 = right foot

// Powerpool
var() float     r_fMaxPowerPool;            // Amount of power the pawn can have.
var() float     m_fPowerPoolRechargeRate;   // How fast to recharge power.

var() float     m_fHealthPoolRechargeRate;   // How fast to recharge power.
var() float     m_fSecondsBeforeAutoHeal;    // How long before health starts restoring?

// health pool
var() float     m_fLowHealthThreshold;      // Health percentage (0-100) at or below this value will trigger the low health effects.

var() float		m_fMaxGroundSpeed;			// max ground speed (walking)
var() float		m_nMaxHealthPool;			// max health pool

var() float     m_fVehicleSpeedInheritPercent;   // Amount of speed to inherit from the vehicle

var() float     m_fCollisionHeight;
var() float     m_fCollisionRadius;

// headshot values
var float       m_fHeadRadius;
var float       m_fHeadHeightOffset;
var name        m_nmHeadBone;

var() float     m_fPassengerMeshScale;      // Mesh scale when the riding passenger of a vehicle (direct attach).

/** Body mesh seen by first person view. */
var SkeletalMesh m_FirstPersonBodyMesh;

/** Hands mesh seen by the first person view. */
var SkeletalMesh m_FirstPersonHandsMesh;

/** Version of the 3p mesh that is authored for gibbing. */
var SkeletalMesh m_GibMesh;
var PhysicsAsset m_GibPhysicsAsset;
var ParticleSystem m_GibMeshParticleTemplate;

/** 3P morph target used for overlay mesh. */
var MorphTargetSet m_OverlayMorphTarget;

var AnimTree     m_3pAnimTreeTemplate; 

var localized string FriendlyName;

var int ClassId;
var int InfoBit;

var TrClassType ClassType;

var localized string ShortDesc;
var localized string ClassDescription;
var localized string Abbreviation;

/** Stats for Class Scene info box */
var float Stat_Range;
var float Stat_Mobility;
var float Stat_AntiArmor;
var float Stat_Difficulty;
var float Stat_Durability;

/** Directly correlates to Pawn.Mass. */
var float m_fMass;

/** Dampen momentum impulses if going fast enough? */
var bool m_bMomentumDampingEnabled;
/** 
 *  If the pawn is going this speed or faster, momentum impulses (such as spinfusor disks) 
 *  are dampened by m_fMomentumDampingPct. 
 */
var float m_fMomentumDampingSpeed;
var float m_fMomentumDampingPct;

/** Max speed acheiveable via jetpacking alone. */
var float m_fFIMaxJettingSpeed;
/** Absolute speed cap for jetting. */
var float m_fFITerminalJettingSpeed;
/** Air Control. */
var float m_fFIAirControl;
/** Air Speed. */
var float m_fFIAirSpeed;
var float m_fFIMaxJetpackBoostGroundspeed;
var float m_fFIMaxStoppingDistance;
var float m_fFIFallVelocityTransfer;
var float m_fFIMaxJetpackThrustSpeed;
var float m_fFIAccelRateAtMaxThrustSpeed;
var float m_fFIForwardJettingPct;

/** Max speed acheiveable via skiing alone. */
var float m_fFIMaxSkiSpeed;
/** Absolute speed cap for skiing.*/
var float m_fFITerminalSkiSpeed;
var float m_fFIPeakSkiControlSpeed;
var float m_fFISkiControlSigmaSquare;
var float m_fFIMaxSkiControlPct;
var float m_fFISkiSlopeGravityBoost;

var int m_IconId;
var int m_IconColor;

/** Deceleration rate for returning to a max speed clamp. */
var float m_fFIMaxSpeedDecelerationRate;

struct native SkillNode
{
	/** Value modifier for this node. */
	var TrValueModifier ValueModifier;

	/** Modified value for the skill or perk. */
	var float Value;

	/** Icon X coordinate for UI. */
	var int IconPosX;

	/** Icon Y coordinate for UI. */
	var int IconPosY;

	/** Icon index. */
	var int IconId;

	/** Parent index in the array of skill nodes for a family info. */
	var int ParentIndex;

	/** Cost to 'unlock' this node. */
	var int Cost;

	structdefaultproperties
	{
		ParentIndex=-1
	}
};

/** Skill tree. Each class defines its own. */
var array<SkillNode> m_SkillGrid;

/** Each index corresponds to an index in the skill tree. */
var localized string m_SkillNodeNames[25];
var localized string m_SkillNodeDescriptions[25];
var localized string m_SkillNodeShortDescriptions[25];

/** FOV for the mesh. */
var float m_fPaperDollFOV;

/** Paperdoll sidekick info. */
var SkeletalMesh m_PaperDollSidekickMesh;
var AnimSet m_PaperDollSidekickAnimset;
var AnimTree m_PaperDollSidekickAnimTree;
var PhysicsAsset m_PaperDollSidekickPhysics;

/** JumpZ */
var float m_FIJumpZ;

/** Accel cap */
var(MaxAccel) float m_fFIAirAccelCapSpeedThreshold;
var(MaxAccel) float m_fFIAirAccelSpeed;
var(MaxAccel) float m_fFISkiAccelCapSpeedThreshold;
var(MaxAccel) float m_fFISkiAccelPct;

/** Values for displaying the main menu paper doll properly. */
var PaperDollInfo m_MainMenuPaperDollInfo;

/** Returns a device class corresponding to an equip point. */
static function class<TrDevice> GetDeviceClassByEquipPoint(TR_EQUIP_POINT EquipPoint)
{
	local int i;

	for(i = 0; i < default.DevSelectionList.Length; i++)
	{
		if( default.DevSelectionList[i].EquipPoint == EquipPoint )
		{
			return default.DevSelectionList[i].DeviceClass;
		}
	}

	return none;
}

/** Returns a device class string corresponding to an equip point. */
static function string GetContentDeviceClassStringByEquipPoint(TR_EQUIP_POINT EquipPoint)
{
	local int i;

	for(i = 0; i < default.DevSelectionList.Length; i++)
	{
		if( default.DevSelectionList[i].EquipPoint == EquipPoint )
		{
			return default.DevSelectionList[i].ContentDeviceClassString;
		}
	}

	return "";
}

defaultproperties
{
   m_vAirControlReductionRange=(X=700.000000,Y=2300.000000)
   m_vAirControlMultiplier=(X=3.700000,Y=1.000000)
   m_fFlightAcceleration=150.000000
   m_fJetpackInitAccelMultiplier=1500.000000
   m_fJetpackInitTotalTime=2.400000
   m_fJetpackPowerPoolCost=30.000000
   m_fJetpackPowerPoolTickRate=0.100000
   m_fJetpackInitialCost=1.000000
   m_nmSkiThrusterEffectSockets(0)="CSO_Thruster1"
   m_nmSkiThrusterEffectSockets(1)="CSO_Thruster2"
   m_nmFootstepEffectSockets(0)="CSO_LFoot"
   m_nmFootstepEffectSockets(1)="CSO_RFoot"
   r_fMaxPowerPool=100.000000
   m_fPowerPoolRechargeRate=13.000000
   m_fHealthPoolRechargeRate=0.100000
   m_fSecondsBeforeAutoHeal=20.000000
   m_fLowHealthThreshold=20.000000
   m_fMaxGroundSpeed=440.000000
   m_nMaxHealthPool=1200.000000
   m_fVehicleSpeedInheritPercent=1.000000
   m_fCollisionHeight=46.000000
   m_fCollisionRadius=24.000000
   m_nmHeadBone="Head"
   m_fPassengerMeshScale=1.000000
   ClassId=-1
   m_fMass=100.000000
   m_fFIMaxJettingSpeed=2500.000000
   m_fFITerminalJettingSpeed=3000.000000
   m_fFIAirControl=0.200000
   m_fFIAirSpeed=550.000000
   m_fFIMaxJetpackBoostGroundspeed=1600.000000
   m_fFIMaxStoppingDistance=500.000000
   m_fFIFallVelocityTransfer=1.000000
   m_fFIMaxJetpackThrustSpeed=1000.000000
   m_fFIAccelRateAtMaxThrustSpeed=16.000000
   m_fFIForwardJettingPct=0.400000
   m_fFIMaxSkiSpeed=2500.000000
   m_fFITerminalSkiSpeed=3000.000000
   m_fFIPeakSkiControlSpeed=1600.000000
   m_fFISkiControlSigmaSquare=100000.000000
   m_fFIMaxSkiControlPct=0.650000
   m_fFISkiSlopeGravityBoost=2.000000
   m_IconId=88
   m_fFIMaxSpeedDecelerationRate=400.000000
   m_FIJumpZ=322.000000
   m_fFIAirAccelCapSpeedThreshold=2600.000000
   m_fFIAirAccelSpeed=325.000000
   m_fFISkiAccelCapSpeedThreshold=1700.000000
   m_fFISkiAccelPct=0.400000
   m_MainMenuPaperDollInfo=(Scale=1.000000,CharacterLightingContrastFactor=1.500000)
   SoundGroupClass=Class'TribesGame.TrPawnSoundGroup'
   DefaultMeshScale=1.000000
   BaseTranslationOffset=-50.000000
   Name="Default__TrFamilyInfo"
   ObjectArchetype=UTFamilyInfo'UTGame.Default__UTFamilyInfo'
}
