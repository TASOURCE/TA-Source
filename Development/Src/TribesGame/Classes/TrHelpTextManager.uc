class TrHelpTextManager extends Actor
	config(HelpText);

/** Whether to ever show help text messages. */
var globalconfig bool m_bShowHelpTexts;

/** Controls whether the player has ever seen this message. */
var globalconfig bool m_bSuppressSkiingHowTo;
var globalconfig bool m_bSuppressGeneratorDescriptionLevel1;
var globalconfig bool m_bSuppressGeneratorDescriptionLevel2;
var globalconfig bool m_bSuppressGeneratorDescriptionLevel3;
var globalconfig bool m_bSuppressGeneratorDescriptionLevel4;
var globalconfig bool m_bSuppressJetpackHowTo;
var globalconfig bool m_bSuppressOutOfAmmoNotifier;
var globalconfig bool m_bSuppressOffhandReminder;
var globalconfig bool m_bSuppressCTFFlagDescription;
var globalconfig bool m_bSuppressHoldingEnemyFlagDescription;
var globalconfig bool m_bSuppressRabbitFlagDescription;
var globalconfig bool m_bSuppressHoldingRabbitFlagDescription;
var globalconfig bool m_bSuppressInventoryStationDescription;
var globalconfig bool m_bSuppressVehicleStationDescription;
var globalconfig bool m_bSuppressBaseTurretDescriptionLevel1;
var globalconfig bool m_bSuppressBaseTurretDescriptionLevel2;
var globalconfig bool m_bSuppressBaseTurretDescriptionLevel3;
var globalconfig bool m_bSuppressBaseTurretDescriptionLevel4;
var globalconfig bool m_bSuppressRadarSensorDescriptionLevel1;
var globalconfig bool m_bSuppressRadarSensorDescriptionLevel2;
var globalconfig bool m_bSuppressRadarSensorDescriptionLevel3;
var globalconfig bool m_bSuppressRadarSensorDescriptionLevel4;
var globalconfig bool m_bSuppressRepairStationDescription;
var globalconfig bool m_bSuppressArmoredTargetDescription;
var globalconfig bool m_bSuppressCreditsDescription;
var globalconfig bool m_bSuppressYouCanPickupPassengerReminder;
var globalconfig bool m_bSuppressConduitDescription;
var globalconfig bool m_bSuppressSpotTargetReminder;
var globalconfig bool m_bSuppressChangingClassDescription;
var globalconfig bool m_bSuppressChangingClassHowTo;

/** On-screen help text. */
var localized string m_HelpTextSkiingHowTo;
var localized string m_HelpTextGeneratorDescriptionLevel1;
var localized string m_HelpTextGeneratorDescriptionLevel2;
var localized string m_HelpTextGeneratorDescriptionLevel3;
var localized string m_HelpTextGeneratorDescriptionLevel4;
var localized string m_HelpTextJetpackHowTo;
var localized string m_HelpTextOutOfAmmoNotifier;
var localized string m_HelpTextOffhandReminder;
var localized string m_HelpTextCTFFlagDescription;
var localized string m_HelpTextHoldingEnemyFlagDescription;
var localized string m_HelpTextRabbitFlagDescription;
var localized string m_HelpTextHoldingRabbitFlagDescription;
var localized string m_HelpTextInventoryStationDescription;
var localized string m_HelpTextVehicleStationDescription;
var localized string m_HelpTextBaseTurretDescriptionLevel1;
var localized string m_HelpTextBaseTurretDescriptionLevel2;
var localized string m_HelpTextBaseTurretDescriptionLevel3;
var localized string m_HelpTextBaseTurretDescriptionLevel4;
var localized string m_HelpTextRadarSensorDescriptionLevel1;
var localized string m_HelpTextRadarSensorDescriptionLevel2;
var localized string m_HelpTextRadarSensorDescriptionLevel3;
var localized string m_HelpTextRadarSensorDescriptionLevel4;
var localized string m_HelpTextRepairStationDescription;
var localized string m_HelpTextArmoredTargetDescription;
var localized string m_HelpTextCreditsDescription;
var localized string m_HelpTextYouCanPickupPassengerReminder;
var localized string m_HelpTextConduitDescription;
var localized string m_HelpTextSpotTargetReminder;
var localized string m_HelpTextChangingClassDescription;
var localized string m_HelpTextChangingClassHowTo;

/** On-screen help text menu title. */
var localized string m_HelpTextSkiingHowToMenuTitle;
var localized string m_HelpTextGeneratorDescriptionMenuTitleLevel1;
var localized string m_HelpTextGeneratorDescriptionMenuTitleLevel2;
var localized string m_HelpTextGeneratorDescriptionMenuTitleLevel3;
var localized string m_HelpTextGeneratorDescriptionMenuTitleLevel4;
var localized string m_HelpTextJetpackHowToMenuTitle;
var localized string m_HelpTextOutOfAmmoNotifierMenuTitle;
var localized string m_HelpTextOffhandReminderMenuTitle;
var localized string m_HelpTextCTFFlagDescriptionMenuTitle;
var localized string m_HelpTextHoldingEnemyFlagDescriptionMenuTitle;
var localized string m_HelpTextRabbitFlagDescriptionMenuTitle;
var localized string m_HelpTextHoldingRabbitFlagDescriptionMenuTitle;
var localized string m_HelpTextInventoryStationDescriptionMenuTitle;
var localized string m_HelpTextVehicleStationDescriptionMenuTitle;
var localized string m_HelpTextBaseTurretDescriptionMenuTitleLevel1;
var localized string m_HelpTextBaseTurretDescriptionMenuTitleLevel2;
var localized string m_HelpTextBaseTurretDescriptionMenuTitleLevel3;
var localized string m_HelpTextBaseTurretDescriptionMenuTitleLevel4;
var localized string m_HelpTextRadarSensorDescriptionMenuTitleLevel1;
var localized string m_HelpTextRadarSensorDescriptionMenuTitleLevel2;
var localized string m_HelpTextRadarSensorDescriptionMenuTitleLevel3;
var localized string m_HelpTextRadarSensorDescriptionMenuTitleLevel4;
var localized string m_HelpTextRepairStationDescriptionMenuTitle;
var localized string m_HelpTextArmoredTargetDescriptionMenuTitle;
var localized string m_HelpTextCreditsDescriptionMenuTitle;
var localized string m_HelpTextYouCanPickupPassengerReminderMenuTitle;
var localized string m_HelpTextConduitDescriptionMenuTitle;
var localized string m_HelpTextSpotTargetReminderMenuTitle;
var localized string m_HelpTextChangingClassDescriptionMenuTitle;
var localized string m_HelpTextChangingClassHowToMenuTitle;

var localized string m_LocalizedSuppressString;

/**
 * Anything added to this list should correspond with the
 * m_HelpTextConfig array in defaultproperties!
 */
enum EHelpTextType
{
	HelpText_SkiingHowTo,
	HelpText_GeneratorDescriptionLevel1,
	HelpText_GeneratorDescriptionLevel2,
	HelpText_GeneratorDescriptionLevel3,
	HelpText_GeneratorDescriptionLevel4,
	HelpText_JetpackHowTo,
	HelpText_OutOfAmmoNotifier,
	HelpText_OffhandReminder,
	HelpText_CTFFlagDescription,
	HelpText_HoldingEnemyFlagDescription,
	HelpText_RabbitFlagDescription,
	HelpText_HoldingRabbitFlagDescription,
	HelpText_InventoryStationDescription,
	HelpText_VehicleStationDescription,
	HelpText_BaseTurretDescriptionLevel1,
	HelpText_BaseTurretDescriptionLevel2,
	HelpText_BaseTurretDescriptionLevel3,
	HelpText_BaseTurretDescriptionLevel4,
	HelpText_RadarSensorDescriptionLevel1,
	HelpText_RadarSensorDescriptionLevel2,
	HelpText_RadarSensorDescriptionLevel3,
	HelpText_RadarSensorDescriptionLevel4,
	HelpText_RepairStationDescription,
	HelpText_ArmoredTargetDescription,
	HelpText_CreditsDescription,
	HelpText_YouCanPickupPassengerReminder,
	HelpText_ConduitDescription,
	HelpText_SpotTargetReminder,
	HelpText_ChangingClassDescription,
	HelpText_ChangingClassHowTo,
};

// Timers
var float m_OffhandReminderInitialTime;
var float m_OffhandReminderRecursiveTime;
var float m_SpotTargetReminderInitialTime;
var float m_SpotTargetReminderRecursiveTime;


struct HelpTextInfo
{
	/** For mapping the text, audio, etc that needs to be shown. */
	var EHelpTextType HelpTextType;

	/** Sort order for the help text queue. */
	var int Priority;

	/** When removed from the queue, suppress forever? */
	var bool bSelfSuppress;
};

/** Configuration for the help text. */
var array<HelpTextInfo> m_HelpTextConfig;

/** Queue of help texts we want to display to the player. */
var array<EHelpTextType> m_HelpTextQueue;

struct HelpTextTypeRemovalTimerInfo
{
	var EHelpTextType HelpTextTypeToRemove;
	var float RemainingTime;
	var bool bSuppress;
};
var array<HelpTextTypeRemovalTimerInfo> m_HelpTextTypesToRemoveOnTimers;

function PostBeginPlay()
{
	InitHelpTextManager();
}

function InitHelpTextManager()
{
	//$$ML: Reset the config for the trade show build.
	//ResetConfig();
	
	if( CheckDestroy() )
	{
		return;
	}

	// Start timers.
	if( !m_bSuppressOffhandReminder )
	{
		OffhandReminderTimer();
	}
	if( !m_bSuppressSpotTargetReminder )
	{
		SpotTargetReminderTimer();
	}
}

function LevelLoadCompleted()
{
	local Actor A;
	local TrPowerGenerator TrPG;
	local TrDeployable_BaseTurret TrDBT;
	local TrDeployable_RadarSensor TrDRS;
	
	if( CheckDestroy() )
	{
		return;
	}

	// Assign collision proxies to actors we wish to get help texts from.
	foreach DynamicActors(class'Actor',A)
	{
		TrPG = TrPowerGenerator(A);
		TrDBT = TrDeployable_BaseTurret(A);
		TrDRS = TrDeployable_RadarSensor(A);

		if (TrPG != none)
		{
			// Generators Level 1
			if( !m_bSuppressGeneratorDescriptionLevel1 )
			{
				TrPG.SpawnHelpTextCollisionProxy(HelpText_GeneratorDescriptionLevel1);
			}
			// Generators Level 2
			if( !m_bSuppressGeneratorDescriptionLevel2 )
			{
				TrPG.SpawnHelpTextCollisionProxy(HelpText_GeneratorDescriptionLevel2);
			}
			// Generators Level 3
			if( !m_bSuppressGeneratorDescriptionLevel3 )
			{
				TrPG.SpawnHelpTextCollisionProxy(HelpText_GeneratorDescriptionLevel3);
			}
			// Generators Level 4
			if( !m_bSuppressGeneratorDescriptionLevel4 )
			{
				TrPG.SpawnHelpTextCollisionProxy(HelpText_GeneratorDescriptionLevel4);
			}
		}
		// CTF Flag Base
		else if( !m_bSuppressCTFFlagDescription && A.IsA('TrCTFBase') )
		{
			TrCTFBase(A).SpawnHelpTextCollisionProxy(HelpText_CTFFlagDescription);
		}
		// Rabbit Flag Base
		else if( !m_bSuppressRabbitFlagDescription && A.IsA('TrRabbitBase') )
		{
			TrRabbitBase(A).SpawnHelpTextCollisionProxy(HelpText_RabbitFlagDescription);
		}
		// Inventory Station
		else if( !m_bSuppressInventoryStationDescription && A.IsA('TrInventoryStation') )
		{
			TrInventoryStation(A).SpawnHelpTextCollisionProxy(HelpText_InventoryStationDescription);
		}
		// Vehicle Station
		else if( !m_bSuppressVehicleStationDescription && A.IsA('TrVehicleStation') )
		{
			TrVehicleStation(A).SpawnHelpTextCollisionProxy(HelpText_VehicleStationDescription);
		}
		else if (TrDBT != none)
		{
			// Base Turret Level 1
			if( !m_bSuppressBaseTurretDescriptionLevel1 )
			{
				TrDBT.SpawnHelpTextCollisionProxy(HelpText_BaseTurretDescriptionLevel1);
			}
			// Base Turret Level 2
			if( !m_bSuppressBaseTurretDescriptionLevel2 )
			{
				TrDBT.SpawnHelpTextCollisionProxy(HelpText_BaseTurretDescriptionLevel2);
			}
			// Base Turret Level 3
			if( !m_bSuppressBaseTurretDescriptionLevel3 )
			{
				TrDBT.SpawnHelpTextCollisionProxy(HelpText_BaseTurretDescriptionLevel3);
			}
			// Base Turret Level 4
			if( !m_bSuppressBaseTurretDescriptionLevel4 )
			{
				TrDBT.SpawnHelpTextCollisionProxy(HelpText_BaseTurretDescriptionLevel4);
			}
		}
		else if (TrDRS != none)
		{
			// Radar Sensor Level 1
			if( !m_bSuppressRadarSensorDescriptionLevel1 )
			{
				TrDRS.SpawnHelpTextCollisionProxy(HelpText_RadarSensorDescriptionLevel1);
			}
			// Radar Sensor Level 2
			if( !m_bSuppressRadarSensorDescriptionLevel2 )
			{
				TrDRS.SpawnHelpTextCollisionProxy(HelpText_RadarSensorDescriptionLevel2);
			}
			// Radar Sensor Level 3
			if( !m_bSuppressRadarSensorDescriptionLevel3 )
			{
				TrDRS.SpawnHelpTextCollisionProxy(HelpText_RadarSensorDescriptionLevel3);
			}
			// Radar Sensor Level 4
			if( !m_bSuppressRadarSensorDescriptionLevel4 )
			{
				TrDRS.SpawnHelpTextCollisionProxy(HelpText_RadarSensorDescriptionLevel4);
			}
		}
		// Repair Station
		else if( !m_bSuppressRepairStationDescription && A.IsA('TrRepairStation') )
		{
			TrRepairStation(A).SpawnHelpTextCollisionProxy(HelpText_RepairStationDescription);
		}
	}
}

event Tick(float DeltaTime)
{
	UpdateTypesToRemoveOnTimers(DeltaTime);
}

/** Destroys this object if all help items are suppressed. */
function bool CheckDestroy()
{
	local TrPlayerController TrPC;

	if( !UnsuppressedHelpTextsExist() )
	{
		// If all help texts are suppressed, then destroy this help text manager.
		TrPC = TrPlayerController(Owner);
		if( TrPC != none )
		{
			TrPC.m_HelpTextManager = none;
		}

		Destroy();
		return true;
	}
	return false;
}

function bool IsSuppressed(EHelpTextType RequestedType)
{
	switch( RequestedType )
	{
		case HelpText_SkiingHowTo:
			if( m_bSuppressSkiingHowTo ) return true;
			break;
		case HelpText_GeneratorDescriptionLevel1:
			if( m_bSuppressGeneratorDescriptionLevel1 ) return true;
			break;
		case HelpText_GeneratorDescriptionLevel2:
			if( m_bSuppressGeneratorDescriptionLevel2 ) return true;
			break;
		case HelpText_GeneratorDescriptionLevel3:
			if( m_bSuppressGeneratorDescriptionLevel3 ) return true;
			break;
		case HelpText_GeneratorDescriptionLevel4:
			if( m_bSuppressGeneratorDescriptionLevel4 ) return true;
			break;
		case HelpText_JetpackHowTo:
			if( m_bSuppressJetpackHowTo ) return true;
			break;
		case HelpText_OutOfAmmoNotifier:
			if( m_bSuppressOutOfAmmoNotifier ) return true;
			break;
		case HelpText_OffhandReminder:
			if( m_bSuppressOffhandReminder ) return true;
			break;
		case HelpText_CTFFlagDescription:
			if( m_bSuppressCTFFlagDescription ) return true;
			break;
		case HelpText_HoldingEnemyFlagDescription:
			if( m_bSuppressHoldingEnemyFlagDescription ) return true;
			break;
		case HelpText_RabbitFlagDescription:
			if( m_bSuppressRabbitFlagDescription ) return true;
			break;
		case HelpText_HoldingRabbitFlagDescription:
			if( m_bSuppressHoldingRabbitFlagDescription ) return true;
			break;
		case HelpText_InventoryStationDescription:
			if( m_bSuppressInventoryStationDescription ) return true;
			break;
		case HelpText_VehicleStationDescription:
			if( m_bSuppressVehicleStationDescription ) return true;
			break;
		case HelpText_BaseTurretDescriptionLevel1:
			if( m_bSuppressBaseTurretDescriptionLevel1 ) return true;
			break;
		case HelpText_BaseTurretDescriptionLevel2:
			if( m_bSuppressBaseTurretDescriptionLevel2 ) return true;
			break;
		case HelpText_BaseTurretDescriptionLevel3:
			if( m_bSuppressBaseTurretDescriptionLevel3 ) return true;
			break;
		case HelpText_BaseTurretDescriptionLevel4:
			if( m_bSuppressBaseTurretDescriptionLevel4 ) return true;
			break;
		case HelpText_RadarSensorDescriptionLevel1:
			if( m_bSuppressRadarSensorDescriptionLevel1 ) return true;
			break;
		case HelpText_RadarSensorDescriptionLevel2:
			if( m_bSuppressRadarSensorDescriptionLevel2 ) return true;
			break;
		case HelpText_RadarSensorDescriptionLevel3:
			if( m_bSuppressRadarSensorDescriptionLevel3 ) return true;
			break;
		case HelpText_RadarSensorDescriptionLevel4:
			if( m_bSuppressRadarSensorDescriptionLevel4 ) return true;
			break;
		case HelpText_RepairStationDescription:
			if( m_bSuppressRepairStationDescription ) return true;
			break;
		case HelpText_ArmoredTargetDescription:
			if( m_bSuppressArmoredTargetDescription ) return true;
			break;
		case HelpText_CreditsDescription:
			if( m_bSuppressCreditsDescription ) return true;
			break;
		case HelpText_YouCanPickupPassengerReminder:
			if( m_bSuppressYouCanPickupPassengerReminder ) return true;
			break;
		case HelpText_ConduitDescription:
			if( m_bSuppressConduitDescription ) return true;
			break;
		case HelpText_SpotTargetReminder:
			if( m_bSuppressSpotTargetReminder ) return true;
			break;
		case HelpText_ChangingClassDescription:
			if( m_bSuppressChangingClassDescription ) return true;
			break;
		case HelpText_ChangingClassHowTo:
			if( m_bSuppressChangingClassHowTo ) return true;
			break;
	}

	return false;
}

/** 
 *  Called by gameplay code to request showing help text. Filter whether we need to 
 *  actually display the text here.
 *  Returns FALSE if the text is already suppressed.
 */
function bool RequestHelpText(EHelpTextType RequestedType)
{
	local EHelpTextType OldTopHelpText;
	local bool bSendTopToHUD;

	// Ignore the request if we don't want to show help texts.
	if( !m_bShowHelpTexts )
	{
		return false;
	}

	// Ignore the request if we've already suppressed this type.
	if( IsSuppressed(RequestedType) )
	{
		return false;
	}

	if( m_HelpTextQueue.Length == 0 )
	{
		// If there is nothing on the queue push the new item on and get out.
		m_HelpTextQueue.AddItem(RequestedType);
		bSendTopToHUD = true;
	}
	else
	{
		OldTopHelpText = m_HelpTextQueue[0];

		// Add the requested type to the queue if it isn't already there.
		if( m_HelpTextQueue.Find(RequestedType) == INDEX_NONE )
		{
			m_HelpTextQueue.AddItem(RequestedType);
			m_HelpTextQueue.Sort(HelpTextQueueSort);
		}

		bSendTopToHUD = OldTopHelpText != m_HelpTextQueue[0];
	}

	// If a timer to remove the top is active, don't update the HUD just yet. The timer will update it.
	if( bSendTopToHUD && (m_HelpTextTypesToRemoveOnTimers.Length == 0 || m_HelpTextTypesToRemoveOnTimers[0].HelpTextTypeToRemove != m_HelpTextQueue[0]) )
	{
		// There is a new top of the queue, so update HUD.
		UpdateHUD();
	}
	return true;
}

/** Removes the help text entry from the queue. If it isn't on the top then it shouldn't be suppressed. */
function RemoveHelpText(EHelpTextType TypeToRemove, optional float Time, optional bool bDoNotSuppress)
{
	local bool bTypeToRemoveIsOnTop;
	local HelpTextTypeRemovalTimerInfo TimerInfo;

	if( m_HelpTextQueue.Length == 0 ) return;

	if( m_HelpTextQueue[0] == TypeToRemove )
	{
		bTypeToRemoveIsOnTop = true;
	}

	if( bTypeToRemoveIsOnTop )
	{   
		if( Time > 0.0 )
		{
			TimerInfo.HelpTextTypeToRemove = TypeToRemove;
			TimerInfo.RemainingTime = Time;
			TimerInfo.bSuppress = !bDoNotSuppress;
			m_HelpTextTypesToRemoveOnTimers.AddItem(TimerInfo);
		}
		else
		{
			// Remove the entry from the queue
			m_HelpTextQueue.RemoveItem(TypeToRemove);

			// If self suppressing, remove it for good.
			if( m_HelpTextConfig[TypeToRemove].bSelfSuppress )
			{
				SuppressHelpText(TypeToRemove);
			}

			UpdateHUD();
		}
	}
	else
	{
		// Removal is not on top, remove it from the list immediately.
		m_HelpTextQueue.RemoveItem(TypeToRemove);
	}
}

/** Marks a help text type as suppressed and updates the .ini.*/
function SuppressHelpText(EHelpTextType TypeToSuppress)
{
	// Flag this type as suppressed.
	switch( TypeToSuppress )
	{
		case HelpText_SkiingHowTo:
			m_bSuppressSkiingHowTo = true;
			break;
		case HelpText_GeneratorDescriptionLevel1:
			m_bSuppressGeneratorDescriptionLevel1 = true;
			break;
		case HelpText_GeneratorDescriptionLevel2:
			m_bSuppressGeneratorDescriptionLevel2 = true;
			break;
		case HelpText_GeneratorDescriptionLevel3:
			m_bSuppressGeneratorDescriptionLevel3 = true;
			break;
		case HelpText_GeneratorDescriptionLevel4:
			m_bSuppressGeneratorDescriptionLevel4 = true;
			break;
		case HelpText_JetpackHowTo:
			m_bSuppressJetpackHowTo = true;
			break;
		case HelpText_OutOfAmmoNotifier:
			m_bSuppressOutOfAmmoNotifier = true;
			break;
		case HelpText_OffhandReminder:
			m_bSuppressOffhandReminder = true;
			break;
		case HelpText_CTFFlagDescription:
			m_bSuppressCTFFlagDescription = true;
			break;
		case HelpText_HoldingEnemyFlagDescription:
			m_bSuppressHoldingEnemyFlagDescription = true;
			break;
		case HelpText_RabbitFlagDescription:
			m_bSuppressRabbitFlagDescription = true;
			break;
		case HelpText_HoldingRabbitFlagDescription:
			m_bSuppressHoldingRabbitFlagDescription = true;
			break;
		case HelpText_InventoryStationDescription:
			m_bSuppressInventoryStationDescription = true;
			break;
		case HelpText_VehicleStationDescription:
			m_bSuppressVehicleStationDescription = true;
			break;
		case HelpText_BaseTurretDescriptionLevel1:
			m_bSuppressBaseTurretDescriptionLevel1 = true;
			break;
		case HelpText_BaseTurretDescriptionLevel2:
			m_bSuppressBaseTurretDescriptionLevel2 = true;
			break;
		case HelpText_BaseTurretDescriptionLevel3:
			m_bSuppressBaseTurretDescriptionLevel3 = true;
			break;
		case HelpText_BaseTurretDescriptionLevel4:
			m_bSuppressBaseTurretDescriptionLevel4 = true;
			break;
		case HelpText_RadarSensorDescriptionLevel1:
			m_bSuppressRadarSensorDescriptionLevel1 = true;
			break;
		case HelpText_RadarSensorDescriptionLevel2:
			m_bSuppressRadarSensorDescriptionLevel2 = true;
			break;
		case HelpText_RadarSensorDescriptionLevel3:
			m_bSuppressRadarSensorDescriptionLevel3 = true;
			break;
		case HelpText_RadarSensorDescriptionLevel4:
			m_bSuppressRadarSensorDescriptionLevel4 = true;
			break;
		case HelpText_RepairStationDescription:
			m_bSuppressRepairStationDescription = true;
			break;
		case HelpText_ArmoredTargetDescription:
			m_bSuppressArmoredTargetDescription = true;
			break;
		case HelpText_CreditsDescription:
			m_bSuppressCreditsDescription = true;
			break;
		case HelpText_YouCanPickupPassengerReminder:
			m_bSuppressYouCanPickupPassengerReminder = true;
			break;
		case HelpText_ConduitDescription:
			m_bSuppressConduitDescription = true;
			break;
		case HelpText_SpotTargetReminder:
			m_bSuppressSpotTargetReminder = true;
			break;
		case HelpText_ChangingClassDescription:
			m_bSuppressChangingClassDescription = true;
			break;
		case HelpText_ChangingClassHowTo:
			m_bSuppressChangingClassHowTo = true;
			break;
	}

	SaveConfig();
	CheckDestroy();
}

/** Forward help texts to the HUD. */
function UpdateHUD()
{
	local string BodyText, TitleText, PageString, SuppressString;
	local TrPlayerController TrPC;
	local TrHUD TrH;

	TrPC = TrPlayerController(Owner);

	if( TrPC == none || TrPC.myHUD == none )
	{
		return;
	}

	if( m_HelpTextQueue.Length > 0 )
	{
		//`log("SENDING"@m_HelpTextQueue[0]@"TO HUD");
		switch( m_HelpTextQueue[0] )
		{
			case HelpText_SkiingHowTo:
				BodyText = m_HelpTextSkiingHowTo;
				TitleText = m_HelpTextSkiingHowToMenuTitle;
				break;
			case HelpText_GeneratorDescriptionLevel1:
				BodyText = m_HelpTextGeneratorDescriptionLevel1;
				TitleText = m_HelpTextGeneratorDescriptionMenuTitleLevel1;
				break;
			case HelpText_GeneratorDescriptionLevel2:
				BodyText = m_HelpTextGeneratorDescriptionLevel2;
				TitleText = m_HelpTextGeneratorDescriptionMenuTitleLevel2;
				break;
			case HelpText_GeneratorDescriptionLevel3:
				BodyText = m_HelpTextGeneratorDescriptionLevel3;
				TitleText = m_HelpTextGeneratorDescriptionMenuTitleLevel3;
				break;
			case HelpText_GeneratorDescriptionLevel4:
				BodyText = m_HelpTextGeneratorDescriptionLevel4;
				TitleText = m_HelpTextGeneratorDescriptionMenuTitleLevel4;
				break;
			case HelpText_JetpackHowTo:
				BodyText = m_HelpTextJetpackHowTo;
				TitleText = m_HelpTextJetpackHowToMenuTitle;
				break;
			case HelpText_OutOfAmmoNotifier:
				BodyText = m_HelpTextOutOfAmmoNotifier;
				TitleText = m_HelpTextOutOfAmmoNotifierMenuTitle;
				break;
			case HelpText_OffhandReminder:
				BodyText = m_HelpTextOffhandReminder;
				TitleText = m_HelpTextOffhandReminderMenuTitle;
				break;
			case HelpText_CTFFlagDescription:
				BodyText = m_HelpTextCTFFlagDescription;
				TitleText = m_HelpTextCTFFlagDescriptionMenuTitle;
				break;
			case HelpText_HoldingEnemyFlagDescription:
				BodyText = m_HelpTextHoldingEnemyFlagDescription;
				TitleText = m_HelpTextHoldingEnemyFlagDescriptionMenuTitle;
				break;
			case HelpText_RabbitFlagDescription:
				BodyText = m_HelpTextRabbitFlagDescription;
				TitleText = m_HelpTextRabbitFlagDescriptionMenuTitle;
				break;
			case HelpText_HoldingRabbitFlagDescription:
				BodyText = m_HelpTextHoldingRabbitFlagDescription;
				TitleText = m_HelpTextHoldingRabbitFlagDescriptionMenuTitle;
				break;
			case HelpText_InventoryStationDescription:
				BodyText = m_HelpTextInventoryStationDescription;
				TitleText = m_HelpTextInventoryStationDescriptionMenuTitle;
				break;
			case HelpText_VehicleStationDescription:
				BodyText = m_HelpTextVehicleStationDescription;
				TitleText = m_HelpTextVehicleStationDescriptionMenuTitle;
				break;
			case HelpText_BaseTurretDescriptionLevel1:
				BodyText = m_HelpTextBaseTurretDescriptionLevel1;
				TitleText = m_HelpTextBaseTurretDescriptionMenuTitleLevel1;
				break;
			case HelpText_BaseTurretDescriptionLevel2:
				BodyText = m_HelpTextBaseTurretDescriptionLevel2;
				TitleText = m_HelpTextBaseTurretDescriptionMenuTitleLevel2;
				break;
			case HelpText_BaseTurretDescriptionLevel3:
				BodyText = m_HelpTextBaseTurretDescriptionLevel3;
				TitleText = m_HelpTextBaseTurretDescriptionMenuTitleLevel3;
				break;
			case HelpText_BaseTurretDescriptionLevel4:
				BodyText = m_HelpTextBaseTurretDescriptionLevel4;
				TitleText = m_HelpTextBaseTurretDescriptionMenuTitleLevel4;
				break;
			case HelpText_RadarSensorDescriptionLevel1:
				BodyText = m_HelpTextRadarSensorDescriptionLevel1;
				TitleText = m_HelpTextRadarSensorDescriptionMenuTitleLevel1;
				break;
			case HelpText_RadarSensorDescriptionLevel2:
				BodyText = m_HelpTextRadarSensorDescriptionLevel2;
				TitleText = m_HelpTextRadarSensorDescriptionMenuTitleLevel2;
				break;
			case HelpText_RadarSensorDescriptionLevel3:
				BodyText = m_HelpTextRadarSensorDescriptionLevel3;
				TitleText = m_HelpTextRadarSensorDescriptionMenuTitleLevel3;
				break;
			case HelpText_RadarSensorDescriptionLevel4:
				BodyText = m_HelpTextRadarSensorDescriptionLevel4;
				TitleText = m_HelpTextRadarSensorDescriptionMenuTitleLevel4;
				break;
			case HelpText_RepairStationDescription:
				BodyText = m_HelpTextRepairStationDescription;
				TitleText = m_HelpTextRepairStationDescriptionMenuTitle;
				break;
			case HelpText_ArmoredTargetDescription:
				BodyText = m_HelpTextArmoredTargetDescription;
				TitleText = m_HelpTextArmoredTargetDescriptionMenuTitle;
				break;
			case HelpText_CreditsDescription:
				BodyText = m_HelpTextCreditsDescription;
				TitleText = m_HelpTextCreditsDescriptionMenuTitle;
				break;
			case HelpText_YouCanPickupPassengerReminder:
				BodyText = m_HelpTextYouCanPickupPassengerReminder;
				TitleText = m_HelpTextYouCanPickupPassengerReminderMenuTitle;
				break;
			case HelpText_ConduitDescription:
				BodyText = m_HelpTextConduitDescription;
				TitleText = m_HelpTextConduitDescriptionMenuTitle;
				break;
			case HelpText_SpotTargetReminder:
				BodyText = m_HelpTextSpotTargetReminder;
				TitleText = m_HelpTextSpotTargetReminderMenuTitle;
				break;
			case HelpText_ChangingClassDescription:
				BodyText = m_HelpTextChangingClassDescription;
				TitleText = m_HelpTextChangingClassDescriptionMenuTitle;
				break;
			case HelpText_ChangingClassHowTo:
				BodyText = m_HelpTextChangingClassHowTo;
				TitleText = m_HelpTextChangingClassHowToMenuTitle;
				break;
		}
	
		BodyText = FormatText(BodyText);
		PageString = (m_HelpTextQueue[0] + 1)$"/"$m_HelpTextConfig.Length;
		SuppressString = FormatText(m_LocalizedSuppressString);

		TrH = TrHUD(TrPC.myHUD);
		if( TrPC.AllowHelpTextToDisplay() && TrH != none )
		{
			TrH.AddToHelpText(TitleText, BodyText, -1, PageString, SuppressString);
		}
	}
	else
	{
		TrHUD(TrPC.myHUD).ClearHelpText();
	}
}

/** 
 *  Takes a string and replaces any bindings with the user's preference.
 *  Keybinds should be commands wrapped in @s and a $ before the actual name.
 *  Ex: "Press and hold @$GBA_DoSki@ to ski" results in "Press and hold 'SpaceBar' to ski"
 */
function string FormatText(string InString)
{
	local array<string> Pieces;
	local int i;
	local string BindName, CommandString, ReturnString;
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(Owner);

	ParseStringIntoArray(InString, Pieces, "@", true);

	for( i = 0; i < Pieces.Length; i++ )
	{
		if( Left(Pieces[i],1) == "$" )
		{
			// Replace word with actual keybind.
			CommandString = Right(Pieces[i],Len(Pieces[i]) - 1);
			BindName = TrPC.PlayerInput.GetBindNameFromCommandScript(CommandString);
			Pieces[i] = BindName;
		}
	}

	JoinArray(Pieces, ReturnString, "'");
	return ReturnString;
}

/** Delegate for sorting m_HelpTextQueue by priority. */
function int HelpTextQueueSort(EHelpTextType A, EHelpTextType B)
{
	return m_HelpTextConfig[A].Priority > m_HelpTextConfig[B].Priority ? -1 : 0;
}

/** Return TRUE if there are any unsuppressed help texts. */
function bool UnsuppressedHelpTextsExist()
{
	if( !m_bSuppressSkiingHowTo ||
		!m_bSuppressGeneratorDescriptionLevel1 ||
		!m_bSuppressGeneratorDescriptionLevel2 ||
		!m_bSuppressGeneratorDescriptionLevel3 ||
		!m_bSuppressGeneratorDescriptionLevel4 ||
		!m_bSuppressJetpackHowTo ||
		!m_bSuppressOutOfAmmoNotifier ||
		!m_bSuppressOffhandReminder || 
		!m_bSuppressCTFFlagDescription ||
		!m_bSuppressHoldingEnemyFlagDescription ||
		!m_bSuppressRabbitFlagDescription ||
		!m_bSuppressHoldingRabbitFlagDescription ||
		!m_bSuppressInventoryStationDescription ||
		!m_bSuppressVehicleStationDescription ||
		!m_bSuppressBaseTurretDescriptionLevel1 ||
		!m_bSuppressBaseTurretDescriptionLevel2 ||
		!m_bSuppressBaseTurretDescriptionLevel3 ||
		!m_bSuppressBaseTurretDescriptionLevel4 ||
		!m_bSuppressRadarSensorDescriptionLevel1 ||
		!m_bSuppressRadarSensorDescriptionLevel2 ||
		!m_bSuppressRadarSensorDescriptionLevel3 ||
		!m_bSuppressRadarSensorDescriptionLevel4 ||
		!m_bSuppressRepairStationDescription ||
		!m_bSuppressArmoredTargetDescription ||
		!m_bSuppressCreditsDescription ||
		!m_bSuppressYouCanPickupPassengerReminder ||
		!m_bSuppressConduitDescription ||
		!m_bSuppressSpotTargetReminder ||
		!m_bSuppressChangingClassDescription ||
		!m_bSuppressChangingClassHowTo
		)
	{
		return true;
	}
	return false;
}

/**
 * Timers:
 * These are special cases where the game needs to remind the player about a feature if they have
 * not yet executed it. There are two time periods: 1. 'Initial Time' which is the time it takes
 * for the message to show up for the first time and 2. 'Recursive Time' which is the time it takes
 * to keep reminding the player until they have performed the action.
 * 
 * The timer is began in PostBeginPlay(). When the timer expires, the message attempts to show in the Help 
 * Text. It does not get suppressed however when removed from the queue. The message recurses until the 
 * Clear function associated with the action is called, at which point the Help Text is suppressed.
 */

function OffhandReminderTimer()
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(Owner);
	
	// Don't attempt to show help text if we have no pawn.
	if( TrPC != none && TrPC.Pawn != none )
	{
		// Queue up the message to show but do not suppress it.	
		RequestHelpText(HelpText_OffhandReminder);
		RemoveHelpText(HelpText_OffhandReminder, 4.0, true);
	}

	// Keep attempting to remind the player until they have done the action.
	SetTimer(m_OffhandReminderRecursiveTime, false, 'OffhandReminderTimer');
}

function ClearOffhandReminderTimer()
{
	// Player has performed the action.
	if( !m_bSuppressOffhandReminder )
	{
		ClearTimer('OffhandReminderTimer');
		RemoveHelpText(HelpText_OffhandReminder);
	}
}

function SpotTargetReminderTimer()
{
	local TrPlayerController TrPC;
	local class<TrGame_TrRabbit> RabbitGame;

	if (WorldInfo.GRI == none)
	{
		return;
	}

	TrPC = TrPlayerController(Owner);
	RabbitGame = class<TrGame_TrRabbit>(WorldInfo.GRI.GameClass);

	// Don't display this message in rabbit.
	if( RabbitGame != none )
	{
		return;
	}
	
	// Don't attempt to show help text if we have no pawn.
	if( TrPC != none && TrPC.Pawn != none )
	{
		// Queue up the message to show but do not suppress it.	
		RequestHelpText(HelpText_SpotTargetReminder);
		RemoveHelpText(HelpText_SpotTargetReminder, 6.0, true);
	}

	// Keep attempting to remind the player until they have done the action.
	SetTimer(m_SpotTargetReminderRecursiveTime, false, 'SpotTargetReminderTimer');
}

function ClearSpotTargetReminderTimer()
{
	// Player has performed the action.
	if( !m_bSuppressSpotTargetReminder )
	{
		ClearTimer('SpotTargetReminderTimer');
		RemoveHelpText(HelpText_SpotTargetReminder);
	}
}

function UpdateTypesToRemoveOnTimers(float DeltaTime)
{
	local int i;

	for( i = 0; i < m_HelpTextTypesToRemoveOnTimers.Length; i++ )
	{
		m_HelpTextTypesToRemoveOnTimers[i].RemainingTime -= DeltaTime;

		if( m_HelpTextTypesToRemoveOnTimers[i].RemainingTime <= 0.f )
		{
			m_HelpTextQueue.RemoveItem(m_HelpTextTypesToRemoveOnTimers[i].HelpTextTypeToRemove);

			UpdateHUD();

			m_HelpTextTypesToRemoveOnTimers.Remove(i,1);
		}
	}
}

function ResetConfig()
{
	m_bSuppressSkiingHowTo = false;
	m_bSuppressGeneratorDescriptionLevel1 = false;
	m_bSuppressGeneratorDescriptionLevel2 = false;
	m_bSuppressGeneratorDescriptionLevel3 = false;
	m_bSuppressGeneratorDescriptionLevel4 = false;
	m_bSuppressJetpackHowTo = false;
	m_bSuppressOutOfAmmoNotifier = false;
	m_bSuppressOffhandReminder = false;
	m_bSuppressCTFFlagDescription = false;
	m_bSuppressHoldingEnemyFlagDescription = false;
	m_bSuppressRabbitFlagDescription = false;
	m_bSuppressHoldingRabbitFlagDescription = false;
	m_bSuppressInventoryStationDescription = false;
	m_bSuppressVehicleStationDescription = false;
	m_bSuppressBaseTurretDescriptionLevel1 = false;
	m_bSuppressBaseTurretDescriptionLevel2 = false;
	m_bSuppressBaseTurretDescriptionLevel3 = false;
	m_bSuppressBaseTurretDescriptionLevel4 = false;
	m_bSuppressRadarSensorDescriptionLevel1 = false;
	m_bSuppressRadarSensorDescriptionLevel2 = false;
	m_bSuppressRadarSensorDescriptionLevel3 = false;
	m_bSuppressRadarSensorDescriptionLevel4 = false;
	m_bSuppressRepairStationDescription = false;
	m_bSuppressArmoredTargetDescription = false;
	m_bSuppressCreditsDescription = false;
	m_bSuppressYouCanPickupPassengerReminder = false;
	m_bSuppressConduitDescription = false;
	m_bSuppressSpotTargetReminder = false;
	m_bSuppressChangingClassDescription = false;
	m_bSuppressChangingClassHowTo = false;
	
	SaveConfig();
}

function EnableHelpText(bool bEnabled)
{
	m_bShowHelpTexts = bEnabled;

	// Clear the HUD, if in game.
	m_HelpTextQueue.Remove(0, m_HelpTextQueue.Length-1);
	UpdateHUD();

	SaveConfig();
}

defaultproperties
{
   m_bShowHelpTexts=True
   m_bSuppressJetpackHowTo=True
   m_HelpTextSkiingHowTo="Press and hold @$GBA_DoSki@ to ski."
   m_HelpTextGeneratorDescriptionLevel1="Base generators power various base stations, turrets, and sensors. Press @$GBA_Use@ to upgrade the generator, increase health and reduce offline time. Costs 1500 credits."
   m_HelpTextGeneratorDescriptionLevel2="Base generators power various base stations, turrets, and sensors. Press @$GBA_Use@ to upgrade the generator, increase health and reduce offline time. Costs 1500 credits."
   m_HelpTextGeneratorDescriptionLevel3="Base generators power various base stations, turrets, and sensors. Press @$GBA_Use@ to upgrade the generator, increase health and reduce offline time. Costs 2000 credits."
   m_HelpTextGeneratorDescriptionLevel4="Base generators power various base stations, turrets, and sensors. Press @$GBA_Use@ to upgrade the generator, increase health and reduce offline time. Costs 2000 credits."
   m_HelpTextJetpackHowTo="Press and hold @$GBA_ToggleJumpJetpack@ to jetpack."
   m_HelpTextOutOfAmmoNotifier="You are out of ammo. Visit an inventory station to replenish your ammo."
   m_HelpTextOffhandReminder="You may press @$GBA_ActivateBelt@ to throw a belt item."
   m_HelpTextCTFFlagDescription="Take the enemy flag and return it to your team's base."
   m_HelpTextHoldingEnemyFlagDescription="You have the enemy flag. Capture it by returning it to your base's flag stand."
   m_HelpTextRabbitFlagDescription="The flag carrier is the rabbit. Kill the rabbit to prevent that player from winning."
   m_HelpTextHoldingRabbitFlagDescription="You are the rabbit. Hold on to the flag as long as possible for maximum points."
   m_HelpTextInventoryStationDescription="Inventory stations refresh your ammo and update your class. Press @$GBA_ToggleClassMenu@ to select a new class."
   m_HelpTextVehicleStationDescription="You can purchase vehicles at vehicle stations using credits."
   m_HelpTextBaseTurretDescriptionLevel1="Base turrets are permanent points of defense, but they can be taken offline from enemy fire or by destroying the enemy generator. Press @$GBA_Use@ to upgrade the turret, increase health and reduce fire time. Costs 1500 credits."
   m_HelpTextBaseTurretDescriptionLevel2="Base turrets are permanent points of defense, but they can be taken offline from enemy fire or by destroying the enemy generator. Press @$GBA_Use@ to upgrade the turret, increase health and reduce fire time. Costs 1500 credits."
   m_HelpTextBaseTurretDescriptionLevel3="Base turrets are permanent points of defense, but they can be taken offline from enemy fire or by destroying the enemy generator. Press @$GBA_Use@ to upgrade the turret, increase health and reduce fire time. Costs 2000 credits."
   m_HelpTextBaseTurretDescriptionLevel4="Base turrets are permanent points of defense, but they can be taken offline from enemy fire or by destroying the enemy generator. Press @$GBA_Use@ to upgrade the turret, increase health and reduce fire time. Costs 2000 credits."
   m_HelpTextRadarSensorDescriptionLevel1="Radar sensors expand the detection radius for your base. Press @$GBA_Use@ to upgrade the sensor, increase health and increase detection radius. Costs 1500 credits."
   m_HelpTextRadarSensorDescriptionLevel2="Radar sensors expand the detection radius for your base. Press @$GBA_Use@ to upgrade the sensor, increase health and increase detection radius. Costs 1500 credits."
   m_HelpTextRadarSensorDescriptionLevel3="Radar sensors expand the detection radius for your base. Press @$GBA_Use@ to upgrade the sensor, increase health and increase detection radius. Costs 2000 credits."
   m_HelpTextRadarSensorDescriptionLevel4="Radar sensors expand the detection radius for your base. Press @$GBA_Use@ to upgrade the sensor, increase health and increase detection radius. Costs 2000 credits."
   m_HelpTextRepairStationDescription="Press @$GBA_Use@ to replace your active weapon with a repair gun at Repair Stations."
   m_HelpTextArmoredTargetDescription="You shot an armored target. Armored targets can only be damaged with explosives."
   m_HelpTextCreditsDescription="You accumulate throughout the match. Spend them on vehicles your team's vehicle station."
   m_HelpTextYouCanPickupPassengerReminder="You can pick up passengers in multi-seated vehicles."
   m_HelpTextConduitDescription="Conduits allow you to jetpack without an energy cost."
   m_HelpTextSpotTargetReminder="Spot an enemy target for your teammates by pressing @$GBA_SpotTarget@ when looking at an enemy target."
   m_HelpTextChangingClassDescription="Your class will update after visiting an inventory station or when you respawn again. Press @$GBA_ShowObjectMarkers@ to display your team's stations."
   m_HelpTextChangingClassHowTo="Visit the Class Selection screen by pressing @$GBA_ToggleClassMenu@ in order to change your current class."
   m_HelpTextSkiingHowToMenuTitle="Tip: Skiing"
   m_HelpTextGeneratorDescriptionMenuTitleLevel1="Tip: Power Generator - Mk. 1"
   m_HelpTextGeneratorDescriptionMenuTitleLevel2="Tip: Power Generator - Mk. 2"
   m_HelpTextGeneratorDescriptionMenuTitleLevel3="Tip: Power Generator - Mk. 3"
   m_HelpTextGeneratorDescriptionMenuTitleLevel4="Tip: Power Generator - Mk. 4"
   m_HelpTextJetpackHowToMenuTitle="Tip: Jetpack"
   m_HelpTextOutOfAmmoNotifierMenuTitle="Tip: Out of Ammo"
   m_HelpTextOffhandReminderMenuTitle="Tip: Offhand Weapon"
   m_HelpTextCTFFlagDescriptionMenuTitle="Tip: CTF Flag"
   m_HelpTextHoldingEnemyFlagDescriptionMenuTitle="Tip: Enemy CTF Flag"
   m_HelpTextRabbitFlagDescriptionMenuTitle="Tip: Rabbit Flag"
   m_HelpTextHoldingRabbitFlagDescriptionMenuTitle="Tip: Rabbit"
   m_HelpTextInventoryStationDescriptionMenuTitle="Tip: Inventory Station"
   m_HelpTextVehicleStationDescriptionMenuTitle="Tip: Vehicle Station"
   m_HelpTextBaseTurretDescriptionMenuTitleLevel1="Tip: Base Turret - Mk. 1"
   m_HelpTextBaseTurretDescriptionMenuTitleLevel2="Tip: Base Turret - Mk. 2"
   m_HelpTextBaseTurretDescriptionMenuTitleLevel3="Tip: Base Turret - Mk. 3"
   m_HelpTextBaseTurretDescriptionMenuTitleLevel4="Tip: Base Turret - Mk. 4"
   m_HelpTextRadarSensorDescriptionMenuTitleLevel1="Tip: Radar Sensor - Mk. 1"
   m_HelpTextRadarSensorDescriptionMenuTitleLevel2="Tip: Radar Sensor - Mk. 2"
   m_HelpTextRadarSensorDescriptionMenuTitleLevel3="Tip: Radar Sensor - Mk. 3"
   m_HelpTextRadarSensorDescriptionMenuTitleLevel4="Tip: Radar Sensor - Mk. 4"
   m_HelpTextRepairStationDescriptionMenuTitle="Tip: Repair Station"
   m_HelpTextArmoredTargetDescriptionMenuTitle="Tip: Armored Target"
   m_HelpTextCreditsDescriptionMenuTitle="Tip: Credits"
   m_HelpTextYouCanPickupPassengerReminderMenuTitle="Tip: Passengers"
   m_HelpTextConduitDescriptionMenuTitle="Tip: Conduit"
   m_HelpTextSpotTargetReminderMenuTitle="Tip: Spotting Targets"
   m_HelpTextChangingClassDescriptionMenuTitle="Tip: Changing Classes"
   m_HelpTextChangingClassHowToMenuTitle="Tip: How to Change Classes"
   m_LocalizedSuppressString="Press @$SuppressHelpText@ to suppress"
   m_OffhandReminderInitialTime=60.000000
   m_OffhandReminderRecursiveTime=45.000000
   m_SpotTargetReminderInitialTime=80.000000
   m_SpotTargetReminderRecursiveTime=60.000000
   m_HelpTextConfig(0)=(Priority=2,bSelfSuppress=True)
   m_HelpTextConfig(1)=(HelpTextType=HelpText_GeneratorDescriptionLevel1,Priority=10)
   m_HelpTextConfig(2)=(HelpTextType=HelpText_GeneratorDescriptionLevel2,Priority=10)
   m_HelpTextConfig(3)=(HelpTextType=HelpText_GeneratorDescriptionLevel3,Priority=10)
   m_HelpTextConfig(4)=(HelpTextType=HelpText_GeneratorDescriptionLevel4,Priority=10)
   m_HelpTextConfig(5)=(HelpTextType=HelpText_JetpackHowTo,Priority=1,bSelfSuppress=True)
   m_HelpTextConfig(6)=(HelpTextType=HelpText_OutOfAmmoNotifier,Priority=30)
   m_HelpTextConfig(7)=(HelpTextType=HelpText_OffhandReminder,Priority=20,bSelfSuppress=True)
   m_HelpTextConfig(8)=(HelpTextType=HelpText_CTFFlagDescription,Priority=4)
   m_HelpTextConfig(9)=(HelpTextType=HelpText_HoldingEnemyFlagDescription,Priority=3)
   m_HelpTextConfig(10)=(HelpTextType=HelpText_RabbitFlagDescription,Priority=3)
   m_HelpTextConfig(11)=(HelpTextType=HelpText_HoldingRabbitFlagDescription,Priority=3)
   m_HelpTextConfig(12)=(HelpTextType=HelpText_InventoryStationDescription,Priority=10)
   m_HelpTextConfig(13)=(HelpTextType=HelpText_VehicleStationDescription,Priority=10)
   m_HelpTextConfig(14)=(HelpTextType=HelpText_BaseTurretDescriptionLevel1,Priority=10)
   m_HelpTextConfig(15)=(HelpTextType=HelpText_BaseTurretDescriptionLevel2,Priority=10)
   m_HelpTextConfig(16)=(HelpTextType=HelpText_BaseTurretDescriptionLevel3,Priority=10)
   m_HelpTextConfig(17)=(HelpTextType=HelpText_BaseTurretDescriptionLevel4,Priority=10)
   m_HelpTextConfig(18)=(HelpTextType=HelpText_RadarSensorDescriptionLevel1,Priority=10)
   m_HelpTextConfig(19)=(HelpTextType=HelpText_RadarSensorDescriptionLevel2,Priority=10)
   m_HelpTextConfig(20)=(HelpTextType=HelpText_RadarSensorDescriptionLevel3,Priority=10)
   m_HelpTextConfig(21)=(HelpTextType=HelpText_RadarSensorDescriptionLevel4,Priority=10)
   m_HelpTextConfig(22)=(HelpTextType=HelpText_RepairStationDescription,Priority=10)
   m_HelpTextConfig(23)=(HelpTextType=HelpText_ArmoredTargetDescription,Priority=4)
   m_HelpTextConfig(24)=(HelpTextType=HelpText_CreditsDescription,Priority=15)
   m_HelpTextConfig(25)=(HelpTextType=HelpText_YouCanPickupPassengerReminder,Priority=5)
   m_HelpTextConfig(26)=(HelpTextType=HelpText_ConduitDescription,Priority=5)
   m_HelpTextConfig(27)=(HelpTextType=HelpText_SpotTargetReminder,Priority=40)
   m_HelpTextConfig(28)=(HelpTextType=HelpText_ChangingClassDescription,Priority=3)
   m_HelpTextConfig(29)=(HelpTextType=HelpText_ChangingClassHowTo,Priority=4)
   CollisionType=COLLIDE_CustomDefault
   Name="Default__TrHelpTextManager"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
