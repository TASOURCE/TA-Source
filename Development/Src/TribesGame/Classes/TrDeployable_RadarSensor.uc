/**
 * 
 */
class TrDeployable_RadarSensor extends TrDeployable_Sensor;

/** How long between blips. */
var float m_fBlipIntervalTime;

simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

    super.ApplyServerSettings();

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if (TrGRI == none || TrGRI.r_ServerConfig == none)
		return;

    m_bHurtByFriendlyFire = TrGRI.r_ServerConfig.bFriendlyFireBaseAssets;
}

simulated function bool ReceivesPowerFromGenerator()
{
	return m_bReceivesPowerFromGenerator;
}

simulated function SpawnHelpTextCollisionProxy(EHelpTextType HelpTextType)
{
	local TrCollisionProxy_HelpText SpawnedCollisionProxy;

	SpawnedCollisionProxy = Spawn(class'TrCollisionProxy_HelpText', self,, Location,,,true);
	if( SpawnedCollisionProxy != none )
	{
		SpawnedCollisionProxy.ShouldShowHelpText_Delegate = ShouldShowHelpText;
		SpawnedCollisionProxy.m_HelpTextType = HelpTextType;
		SpawnedCollisionProxy.m_CylinderComponent.SetCylinderSize(700.0, 700.0);
	}
}

simulated function bool ShouldShowHelpText(EHelpTextType HelpTextType)
{
	if (HelpTextType == HelpText_RadarSensorDescriptionLevel1 && r_nUpgradeLevel == 1)
	{
		return true;
	}
	else if (HelpTextType == HelpText_RadarSensorDescriptionLevel2 && r_nUpgradeLevel == 2)
	{
		return true;
	}
	else if (HelpTextType == HelpText_RadarSensorDescriptionLevel3 && r_nUpgradeLevel == 3)
	{
		return true;
	}
	else if (HelpTextType == HelpText_RadarSensorDescriptionLevel4 && r_nUpgradeLevel == 4)
	{
		return true;
	}

	return false;
}

simulated state BlownUp
{
    simulated event BeginState( Name PreviousStateName )
    {
        local TrPlayerController TrPC;

        TrPC = TrPlayerController(m_LastDamager);

        if( Role == ROLE_Authority )
        {
			// Give credits and an accolade to the player who took it down
			if (TrPC != none)
			{
                AddDamageAssistance(TrPC, 99999999);
				m_LastDamager = none;
			}
        }

        super.BeginState(PreviousStateName);
    }

	function RadarBlip();

    simulated event EndState( Name NextStateName )
    {
        if( Role == ROLE_Authority )
        {
			// Give credits and an accolade to the player who healed it
			if (TrPlayerController(m_LastDamager) != none)
			{
				TrPlayerController(m_LastDamager).m_AccoladeManager.RepairedBase();
				m_LastDamager = none;
			}
        }

        super.EndState(NextStateName);
    }
}

simulated function Texture2D GetMarker()
{
	if (r_bIsPowered )
	{
		switch( r_nUpgradeLevel )
		{
			case 1: return class'TrHUD'.default.BaseSensorLevel1;
			case 2: return class'TrHUD'.default.BaseSensorLevel2;
			case 3: return class'TrHUD'.default.BaseSensorLevel3;
			case 4: return class'TrHUD'.default.BaseSensorLevel4;
			case 5: return class'TrHUD'.default.BaseSensorLevel5;
		}
	}
	else
	{
		switch( r_nUpgradeLevel )
		{
			case 1: return class'TrHUD'.default.BaseSensorLevel1_Down;
			case 2: return class'TrHUD'.default.BaseSensorLevel2_Down;
			case 3: return class'TrHUD'.default.BaseSensorLevel3_Down;
			case 4: return class'TrHUD'.default.BaseSensorLevel4_Down;
			case 5: return class'TrHUD'.default.BaseSensorLevel5_Down;
		}
	}

	return class'TrHUD'.default.BaseNoPower;
}

function SetPowered(bool bEnabled)
{
	if( bEnabled )
	{
		SetTimer(m_fBlipIntervalTime, true, 'RadarBlip');
	}
	else
	{
		ClearTimer('RadarBlip');
	}

	super.SetPowered(bEnabled);
}

function RadarBlip()
{
	local TrGameReplicationInfo TrGRI;

	if( Role == ROLE_Authority && WorldInfo != none )
	{
		TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
		if( TrGRI != none )
		{
			TrGRI.Blip();
		}
	}
}

simulated function bool IsDeployed()
{
	return true;
}

function GiveDestroyAccolade(TrPlayerController TrPC)
{
    TrPC.m_AccoladeManager.KilledBaseRadar();
}

function ReleaseOutOfSightEnemies();

// TakeDammage Override so we can see if this deployable should be invulnerbale
simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, 
				 class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    local int i;
    local int playerCount;
    local TrGameReplicationInfo TrGRI;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none && TrGRI.r_ServerConfig != none)
    {
        for (i = 0; i < TrGRI.PRIArray.Length; i++)
        {
            if (TrGRI.PRIArray[i].GetTeamNum() < 2)
            {
                playerCount++;
            }
        }

        if (playerCount < TrGRI.r_ServerConfig.BaseDestructionLimit)
        {
            return;
        }
    }

    super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
}

function AwardUpgradeAssists()
{
    local int i;

    for (i = 0; i < m_Upgraders.Length; i++)
    {
        if (m_Upgraders[i] != none && GetTeamNum() == m_Upgraders[i].GetTeamNum())
        {
            m_Upgraders[i].m_AccoladeManager.QueueAccolade(m_AssistAccolade);
        }
    }
}

defaultproperties
{
   m_fBlipIntervalTime=3.500000
   m_fDetectionZOffset=96.000000
   m_fTimeToDeploySecs=0.000000
   m_bRequireLOS=False
   m_bUsesArmoredMultiplier=True
   m_bCanBeSpottedByVGS=False
   m_bBlocksFriendlies=True
   m_fDamageRadius=10000.000000
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:XRayMesh'
      Materials(0)=None
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:XRayMesh'
   End Object
   m_XRayMesh=XRayMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_Sensor:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_Sensor:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable_RadarSensor:ObjectiveMesh.AnimNodeSeq0'
      AnimSets(0)=None
      bHasPhysicsAssetInstance=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_RadarSensor:MyLightEnvironment'
      Scale=2.000000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=2000
   m_nCriticalHealthThreshold=200
   r_nRepairHealthThreshold=1000
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable_Sensor:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_sScreenName="Radar Sensor"
   m_bInstantOnlineSound=True
   m_bHasPromptText=True
   m_bIsUpgradeable=True
   m_bShowObjectivesForcesMarker=True
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable_Sensor:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   m_fPromptMessageTime=10.000000
   m_nPromptMessageSwitch=1
   m_UpgradeList(0)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=2,UpgradeCreditCost=1500,NewValue=4000.000000,PropertyName="r_MaxHealth")
   m_UpgradeList(1)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=2,NewValue=2000.000000,PropertyName="r_nRepairHealthThreshold")
   m_UpgradeList(2)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyFloatClassProperty',UpgradeLevel=2,NewValue=13000.000000,PropertyName="r_fNewDetectionRadius")
   m_UpgradeList(3)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=3,UpgradeCreditCost=1500,NewValue=6000.000000,PropertyName="r_MaxHealth")
   m_UpgradeList(4)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=3,NewValue=3000.000000,PropertyName="r_nRepairHealthThreshold")
   m_UpgradeList(5)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyFloatClassProperty',UpgradeLevel=3,NewValue=16000.000000,PropertyName="r_fNewDetectionRadius")
   m_UpgradeList(6)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=4,UpgradeCreditCost=2000,NewValue=8000.000000,PropertyName="r_MaxHealth")
   m_UpgradeList(7)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=4,NewValue=4000.000000,PropertyName="r_nRepairHealthThreshold")
   m_UpgradeList(8)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyFloatClassProperty',UpgradeLevel=4,NewValue=19000.000000,PropertyName="r_fNewDetectionRadius")
   m_UpgradeList(9)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=5,UpgradeCreditCost=2000,NewValue=10000.000000,PropertyName="r_MaxHealth")
   m_UpgradeList(10)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=5,NewValue=5000.000000,PropertyName="r_nRepairHealthThreshold")
   m_UpgradeList(11)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyFloatClassProperty',UpgradeLevel=5,NewValue=22000.000000,PropertyName="r_fNewDetectionRadius")
   m_AssistAccolade=Class'TribesGame.TrAccolade_BaseAssist'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrDeployable_Sensor:CollisionCylinder'
      CollisionHeight=65.000000
      CollisionRadius=80.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      BlockRigidBody=True
      Translation=(X=0.000000,Y=0.000000,Z=65.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrDeployable_Sensor:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrDeployable_Sensor:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrDeployable_Sensor:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrDeployable_Sensor:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrDeployable_Sensor:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Components(5)=ShieldMesh
   Components(6)=OnlineSound
   Components(7)=CriticalSound
   Components(8)=ShieldHitSound
   Components(9)=PowerDownSound
   Components(10)=DestroyedSound
   bMovable=False
   bBlockActors=True
   CollisionComponent=CollisionCylinder
   Name="Default__TrDeployable_RadarSensor"
   ObjectArchetype=TrDeployable_Sensor'TribesGame.Default__TrDeployable_Sensor'
}
