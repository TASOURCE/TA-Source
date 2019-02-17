class TrPowerGenerator extends TrGameObjective
    abstract;

/** When this amount of damage has been dealt to a morph target, it is fully morphed. */
var() float m_fMaxMorphDamage;

/** The time (in seconds) before auto-restoring back to full health and shielded. */
var() float m_fAutoRestoreHealthTime;

/** Whether auto-restoring health is enabled */
var() bool m_bAutoRestoreHealthEnabled;

/** The generator comes back online when this timestamp is tripped. */
var repnotify int   r_nDowntimeRemaining;
var transient float m_fAutoRestoreHealthTimeStamp;

/** Interp speed for fully healing (how fast the generator 'unbends.' */
var() float m_fAutoRestoreHealthEffectsInterpSpeed;

/** Is the generator morphing back to full health? */
var transient bool m_bFullyRestoringHealthEffects;

/** List of objectives this generator powers. */
var transient array<TrGameObjective> m_PoweredObjectives;

/** Scales the generator animations. */
var AnimNodeScalePlayRate m_AnimNodeScale;

/** Interp speed for scaling animation. */
var float m_fAnimInterpSpeed;

/** List of team blockers this generator powers. */
var() array<TrTeamBlockerStaticMeshActor> m_PoweredTeamBlockers;

replication
{
    if (bNetDirty && Role == ROLE_Authority)
        r_nDowntimeRemaining;
}

simulated function ApplyServerSettings()
{
	local TrGameReplicationInfo TrGRI;

    super.ApplyServerSettings();

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if (TrGRI == none || TrGRI.r_ServerConfig == none)
		return;

	// Should auto-regen be enabled?
	m_bAutoRestoreHealthEnabled = m_bAutoRestoreHealthEnabled && TrGRI.r_ServerConfig.bGeneratorAutoRegen;
    m_bDestroyable = TrGRI.r_ServerConfig.bGenDestroyable;
    m_bHurtByFriendlyFire = TrGRI.r_ServerConfig.bFriendlyFireBaseAssets;

	super.ApplyServerSettings();
}

simulated event ReplicatedEvent( name VarName )
{
    Super.ReplicatedEvent(VarName);

    if( VarName == 'r_nDowntimeRemaining' )
    {
        if (r_nDowntimeRemaining > 0)
        {
            m_fAutoRestoreHealthTimeStamp = (WorldInfo.TimeSeconds + m_fAutoRestoreHealthTime);
        }
        else
        {
            m_fAutoRestoreHealthTimeStamp = 0;
        }

        UpdateGeneratorDowntime();
    }
}

simulated function bool ShouldShowHelpText(EHelpTextType HelpTextType)
{
	if (HelpTextType == HelpText_GeneratorDescriptionLevel1 && r_nUpgradeLevel == 1)
	{
		return true;
	}
	else if (HelpTextType == HelpText_GeneratorDescriptionLevel2 && r_nUpgradeLevel == 2)
	{
		return true;
	}
	else if (HelpTextType == HelpText_GeneratorDescriptionLevel3 && r_nUpgradeLevel == 3)
	{
		return true;
	}
	else if (HelpTextType == HelpText_GeneratorDescriptionLevel4 && r_nUpgradeLevel == 4)
	{
		return true;
	}

	return false;
}

simulated event PostBeginPlay()
{
    local TrGameObjective O;

    Super.PostBeginPlay();

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // Set the animation tree containing morph targets.
		m_Mesh.SetAnimTreeTemplate(default.m_Mesh.AnimTreeTemplate);
    }

    if( Role == ROLE_Authority )
    {
        // Build a list of objectives this generator powers.
        ForEach WorldInfo.AllNavigationPoints(class'TrGameObjective',O)
        {
            if( (O.DefenderTeamIndex == DefenderTeamIndex) && (O != self) && (O.ReceivesPowerFromGenerator()) )
            {
                m_PoweredObjectives.AddItem(O);
            }
        }
    }
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == m_Mesh && m_Mesh.Animations != none )
    {
		m_AnimNodeScale = AnimNodeScalePlayRate(m_Mesh.Animations.FindAnimNode('AnimScale'));
    }
}

simulated event Tick(float DeltaTime)
{
    Super.Tick(DeltaTime);

    if( m_bFullyRestoringHealthEffects )
    {
        PlayRestoreHealthEffects(DeltaTime);
    }

	if( WorldInfo.NetMode != NM_DedicatedServer && GetStateName() != 'BlownUp' )
	{
		// Start up the animation by scaling it up.
		if( m_AnimNodeScale != none && m_AnimNodeScale.ScaleByValue < 1.0 )
		{
			m_AnimNodeScale.ScaleByValue = FClamp(FInterpTo(m_AnimNodeScale.ScaleByValue, 1.0, DeltaTime, m_fAnimInterpSpeed), 0.0, 1.0);
		}
	}
}

/**
 * Called whenever the generator is damaged.
 * Network: Local Player or Clients
 */
simulated function PlayDamageHealthEffects(int DamageAmount, int HitBoneIndex)
{
    local MorphNodeWeight MorphNode;
    local name MaterialParameterName, BoneName;
    local float CurrentParameterValue;
    
    BoneName = m_Mesh.GetBoneName(HitBoneIndex);

    // Play damage effects.
	if( DamageAmount > 0 )
	{
		if( GetHealthAmount() <= m_fShieldHealthPercentage )
		{
			if( BoneName != '' )
			{
				// Make sure the morph nodes are named how the bone names are in the AnimTree!
				MorphNode = MorphNodeWeight(m_Mesh.FindMorphNode(BoneName));

				// Morph the side we just damaged.
				if( MorphNode != None && MorphNode.NodeWeight < 1.f )
				{
					MorphNode.SetNodeWeight(FClamp(MorphNode.NodeWeight + (DamageAmount / m_fMaxMorphDamage), 0.f, 1.f));
				}

				// Damage the material.
				MaterialParameterName = name("SCL_Damage_" $ string(BoneName));
				if( m_ObjectiveMIC != None )
				{
					m_ObjectiveMIC.GetScalarParameterValue(MaterialParameterName, CurrentParameterValue);
					if( CurrentParameterValue < 1.f )
					{
						m_ObjectiveMIC.SetScalarParameterValue(MaterialParameterName, FClamp(CurrentParameterValue + (DamageAmount / m_fMaxMorphDamage), 0.f, 1.f));
					}
				}
			}
			else 
			{
				// No specific bone was found, do general damage.
				DamageAllMorphs((float(DamageAmount) / 6.f) / m_fMaxMorphDamage);
			}
		}
    }
	else if( DamageAmount < 0 )
	{
		DamageAllMorphs((float(DamageAmount) / 6.f) / m_fMaxMorphDamage);
	}
}


simulated function DoRepairs(int HealAmount, Controller EventInstigator, Actor DamageCauser, class<DamageType> DamageType, TraceHitInfo HitInfo)
{
	// If we aren't blown up, undo morph damage.
	if (Role == ROLE_Authority && r_Health < r_MaxHealth && !IsInState('BlownUp'))
	{
		DamageAllMorphs((float(HealAmount) / 10.f) / m_fMaxMorphDamage);
	}

	super.DoRepairs(HealAmount, EventInstigator, DamageCauser, DamageType, HitInfo);
}

simulated function DamageAllMorphs(float DamageAmount)
{
	local int i;
    local AnimTree AnimationTree;
	local MorphNodeWeight MorphNode;
	local float CurrentParameterValue;

	// Damage all morphs.
	AnimationTree = AnimTree(m_Mesh.Animations);
	for(i=0; i<AnimationTree.RootMorphNodes.Length; i++ )
	{
		MorphNode = MorphNodeWeight(AnimationTree.RootMorphNodes[i]);
		if( MorphNode != None )//&& MorphNode.NodeWeight < 1.0 )
		{
			MorphNode.SetNodeWeight(FClamp(MorphNode.NodeWeight + DamageAmount, 0.f, 1.f));
		}
	}

	// Damage all material parameters.
	if( m_ObjectiveMIC != None )
	{
		m_ObjectiveMIC.GetScalarParameterValue('SCL_Damage_Back', CurrentParameterValue);
		m_ObjectiveMIC.SetScalarParameterValue('SCL_Damage_Back', FClamp(CurrentParameterValue + DamageAmount, 0.f, 1.f));

		m_ObjectiveMIC.GetScalarParameterValue('SCL_Damage_Front', CurrentParameterValue);
		m_ObjectiveMIC.SetScalarParameterValue('SCL_Damage_Front', FClamp(CurrentParameterValue + DamageAmount, 0.f, 1.f));

		m_ObjectiveMIC.GetScalarParameterValue('SCL_Damage_Left', CurrentParameterValue);
		m_ObjectiveMIC.SetScalarParameterValue('SCL_Damage_Left', FClamp(CurrentParameterValue + DamageAmount, 0.f, 1.f));

		m_ObjectiveMIC.GetScalarParameterValue('SCL_Damage_Right', CurrentParameterValue);
		m_ObjectiveMIC.SetScalarParameterValue('SCL_Damage_Right', FClamp(CurrentParameterValue + DamageAmount, 0.f, 1.f));

		m_ObjectiveMIC.GetScalarParameterValue('SCL_Damage_Top', CurrentParameterValue);
		m_ObjectiveMIC.SetScalarParameterValue('SCL_Damage_Top', FClamp(CurrentParameterValue + DamageAmount, 0.f, 1.f));
	}
}

/**
 * Called whenever the health for this objective has been changed.
 * Network: Local Player or Clients
 */
simulated function PlayRestoreHealthEffects(float DeltaTime)
{
    local int i;
    local MorphNodeWeight MorphNode;
    local AnimTree AnimationTree;
    local bool bFullyRestored;
    local float CurrentParameterValue;

    bFullyRestored = true;

    // 'Unbend' the damaged mesh.
    AnimationTree = AnimTree(m_Mesh.Animations);
    for(i=0; i<AnimationTree.RootMorphNodes.Length; i++ )
    {
        MorphNode = MorphNodeWeight(AnimationTree.RootMorphNodes[i]);
        if( MorphNode != None )
        {
            MorphNode.SetNodeWeight(FInterpTo(MorphNode.NodeWeight, 0, DeltaTime, m_fAutoRestoreHealthEffectsInterpSpeed));

            if( MorphNode.NodeWeight > 0.f )
            {
                bFullyRestored = false;
            }
        }
    }

    // Blend out the damaged material.
	if (m_ObjectiveMIC != none)
	{
		for(i=0; i<m_ObjectiveMIC.ScalarParameterValues.Length; i++ )
		{        
			if( InStr(Caps(string(m_ObjectiveMIC.ScalarParameterValues[i].ParameterName)), "SCL_DAMAGE_") != -1 )
			{
				m_ObjectiveMIC.GetScalarParameterValue(m_ObjectiveMIC.ScalarParameterValues[i].ParameterName, CurrentParameterValue);
				if( CurrentParameterValue > 0.f )
				{
					CurrentParameterValue = FInterpTo(CurrentParameterValue, 0, DeltaTime, m_fAutoRestoreHealthEffectsInterpSpeed);
					m_ObjectiveMIC.SetScalarParameterValue(m_ObjectiveMIC.ScalarParameterValues[i].ParameterName, CurrentParameterValue);

					if( CurrentParameterValue > 0.f )
					{
						bFullyRestored = false;
					}
				}
			}
		}
	}

    m_bFullyRestoringHealthEffects = !bFullyRestored;
}

simulated function UpdateGeneratorDowntime()
{
    local TrGameReplicationInfo TrGRI;
    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI == none) return;

	if (TrGRI.r_ServerConfig != none && !TrGRI.r_ServerConfig.bGeneratorAutoRegen)
	{
		TrGRI.GeneratorDowntime[DefenderTeamIndex] = 0;
	}
    else
    {
    	TrGRI.GeneratorDowntime[DefenderTeamIndex] = r_nDowntimeRemaining;
    }
}

simulated function UpdateGeneratorPower(bool bPowered)
{
	local TrGameObjective TrGO;
    local TrGameReplicationInfo TrGRI;
	local TrTeamBlockerStaticMeshActor TrTB;
	local TrGame TrG;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI == none || Role != ROLE_Authority) return;

    if (bPowered)
    	TrGRI.GeneratorPower[DefenderTeamIndex] = 1;
    else
    	TrGRI.GeneratorPower[DefenderTeamIndex] = 0;

	// Are we powered?
	r_bIsPowered = bPowered;
	bNetDirty = true;
	TrGRI.bNetDirty = true;

    // Update the power status of objectives powered by us.
	foreach m_PoweredObjectives(TrGO)
	{
		TrGO.SetPowered(bPowered);
	}

	// Update the power status of team blockers powered by us.
	foreach m_PoweredTeamBlockers(TrTB)
	{
		if (bPowered)
		{
			TrTB.EnableBlocking();
		}
		else
		{
			TrTB.DisableBlocking();
		}
	}

	// Tell the game about the power change.
	TrG = TrGame(WorldInfo.Game);
	if( TrG != none )
	{
		TrG.OnGeneratorPowerChange(self);
	}
}

simulated function AutoRestoreHealth(bool bFullyRestore);

simulated state Critical
{
    simulated event BeginState( Name PreviousStateName )
    {
        Super.BeginState(PreviousStateName);
        if( m_ObjectiveMIC != None )
        {
            m_ObjectiveMIC.SetScalarParameterValue('SCL_GeneratorHealthCritical', 1.f);
        }

		TriggerEventClass(class'TrSeqEvent_Generator', self, 2);
    }

    simulated event EndState( Name NextStateName )
    {
        Super.EndState(NextStateName);
        if( m_ObjectiveMIC != None && NextStateName != 'BlownUp' )
        {
            m_ObjectiveMIC.SetScalarParameterValue('SCL_GeneratorHealthCritical', 0.f);
        }
    }
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

        Super.BeginState(PreviousStateName);

        if( m_ObjectiveMIC != None )
        {
            m_ObjectiveMIC.SetScalarParameterValue('SCL_GeneratorHealthCritical', 1.f);
        }

        TriggerEventClass(class'TrSeqEvent_Generator', self, 1);

        if( Role == ROLE_Authority )
        {
            Stats.AddGeneratorDestruction();

			BroadcastLocalizedMessage(class'TrGeneratorMessage', DefenderTeamIndex, None, None);

			// After a period of time has passed, restore full health to the generator on its own (if we are allowed to).
			if (m_bAutoRestoreHealthEnabled)
			{
				r_nDowntimeRemaining = m_fAutoRestoreHealthTime;
				m_fAutoRestoreHealthTimeStamp = (WorldInfo.TimeSeconds + m_fAutoRestoreHealthTime);
				bForceNetUpdate=true;
			}
			else
			{
				r_nDowntimeRemaining = -1;
				bForceNetUpdate=true;
			}
        }

        UpdateGeneratorPower(false);
    }

    simulated event EndState( Name NextStateName )
    {
        if( m_ObjectiveMIC != None && NextStateName != 'Critical' )
        {
            m_ObjectiveMIC.SetScalarParameterValue('SCL_GeneratorHealthCritical', 0.f);
        }

        TriggerEventClass(class'TrSeqEvent_Generator', self, 0);

        if( Role == ROLE_Authority )
        {
			// Give credits and an accolade to the player who healed it
			if (TrPlayerController(m_LastDamager) != none)
			{
				TrPlayerController(m_LastDamager).m_AccoladeManager.RepairedBase();
				m_LastDamager = none;
			}
        }

        UpdateGeneratorPower(true);
    }

    /**
     * Restores full health to the generator.
     * Network: Server
     */
    simulated function AutoRestoreHealth(bool bFullyRestore)
    {
        if (bFullyRestore)
        {           
			m_LastDamager = none;

            m_bFullyRestoringHealthEffects = true;

			if (Role == ROLE_Authority)
			{
				r_bInDestroyedState = false;
				PlayDestroyedEffects();
				r_Health = r_MaxHealth;
				bForceNetUpdate=true;
			}
        }

		BroadcastLocalizedMessage(class'TrGeneratorMessage', 2+DefenderTeamIndex, None, None);

        GotoState('Active');
    }

    simulated event Tick(float DeltaTime)
    {
        Global.Tick(DeltaTime);

		// Is auto-restore enabled?
		if (m_bAutoRestoreHealthEnabled)
		{
			if( WorldInfo.TimeSeconds > m_fAutoRestoreHealthTimeStamp )
			{
				// Auto restore time is up, bring the generator back online.
				if( Role == ROLE_Authority )
				{
					r_nDowntimeRemaining = 0;
					bForceNetUpdate=true;
				}
				AutoRestoreHealth(true);
			}
			else if (Role == ROLE_Authority)
			{
				if (r_nDowntimeRemaining != m_fAutoRestoreHealthTimeStamp - WorldInfo.TimeSeconds)
				{
					r_nDowntimeRemaining = m_fAutoRestoreHealthTimeStamp - WorldInfo.TimeSeconds;
					bForceNetUpdate=true;
				}
			}

			if( WorldInfo.NetMode != NM_DedicatedServer )
			{
				// Stop the animation by scaling it down.
				if( m_AnimNodeScale != none && m_AnimNodeScale.ScaleByValue > 0.0 )
				{
					m_AnimNodeScale.ScaleByValue = FClamp(FInterpTo(m_AnimNodeScale.ScaleByValue, 0.0, DeltaTime, m_fAnimInterpSpeed), 0.0, 1.0);
				}
			}
		}
    }

    simulated function OnHealthChanged(bool wasDamage)
    {
        if( r_Health >= r_nRepairHealthThreshold )
		{
			if( Role == ROLE_Authority )
			{
				r_bInDestroyedState = false;
				PlayDestroyedEffects();
				r_nDowntimeRemaining = 0;
				bForceNetUpdate=true;
			}

			AutoRestoreHealth(r_MaxHealth == r_nRepairHealthThreshold);
		}

		global.OnHealthChanged(wasDamage);
    }
}

simulated function bool IsGeneratingPower()
{
	return !IsInState('BlownUp');
}

simulated function AddToPoweredObjectives(TrDeployable dep)
{
	m_PoweredObjectives.AddItem(dep);
	dep.SetPowered(IsGeneratingPower());
}

simulated event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
    local int i;
    local int playerCount;
    local TrGameReplicationInfo TrGRI;
	local class<TrDmgType_Base> TrDamageType;

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

	TrDamageType = class<TrDmgType_Base>(DamageType);
	if( TrDamageType != none )
	{
		DamageAmount *= TrDamageType.default.m_fDamageMultiplierAgainstGenerators;
	}

	Super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
}

simulated function Texture2D GetMarker()
{
	if (r_bIsPowered )
	{
		switch( r_nUpgradeLevel )
		{
			case 1: return class'TrHUD'.default.BaseGeneratorLevel1;
			case 2: return class'TrHUD'.default.BaseGeneratorLevel2;
			case 3: return class'TrHUD'.default.BaseGeneratorLevel3;
			case 4: return class'TrHUD'.default.BaseGeneratorLevel4;
			case 5: return class'TrHUD'.default.BaseGeneratorLevel5;
		}
	}
	else
	{
		switch( r_nUpgradeLevel )
		{
			case 1: return class'TrHUD'.default.BaseGeneratorLevel1_Down;
			case 2: return class'TrHUD'.default.BaseGeneratorLevel2_Down;
			case 3: return class'TrHUD'.default.BaseGeneratorLevel3_Down;
			case 4: return class'TrHUD'.default.BaseGeneratorLevel4_Down;
			case 5: return class'TrHUD'.default.BaseGeneratorLevel5_Down;
		}
	}

	return class'TrHUD'.default.BaseNoPower;
}

function GiveDestroyAccolade(TrPlayerController TrPC)
{
    TrPC.m_AccoladeManager.KilledGenerator();
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
   m_fMaxMorphDamage=250.000000
   m_fAutoRestoreHealthTime=300.000000
   m_bAutoRestoreHealthEnabled=True
   m_fAutoRestoreHealthEffectsInterpSpeed=8.000000
   m_fAnimInterpSpeed=2.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
      bDynamic=False
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrGameObjective:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
      AnimSets(0)=None
      MorphSets(0)=None
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPowerGenerator:MyLightEnvironment'
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Scale=2.500000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=6000
   m_nCriticalHealthThreshold=1000
   r_nRepairHealthThreshold=2500
   m_fShieldHealthPercentage=0.800000
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Scale=2.500000
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=96
   m_sScreenName="Generator"
   m_bInstantOnlineSound=True
   m_bVisibilityRequiredForEnemy=False
   m_bHasPromptText=True
   m_bIsUpgradeable=True
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrGameObjective:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   m_fPromptMessageTime=10.000000
   m_nPromptMessageSwitch=1
   m_UpgradeList(0)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=2,UpgradeCreditCost=1500,NewValue=4000.000000,PropertyName="r_nRepairHealthThreshold")
   m_UpgradeList(1)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=2,NewValue=8000.000000,PropertyName="r_MaxHealth")
   m_UpgradeList(2)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyFloatClassProperty',UpgradeLevel=2,NewValue=270.000000,PropertyName="m_fAutoRestoreHealthTime")
   m_UpgradeList(3)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=3,UpgradeCreditCost=1500,NewValue=5000.000000,PropertyName="r_nRepairHealthThreshold")
   m_UpgradeList(4)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=3,NewValue=10000.000000,PropertyName="r_MaxHealth")
   m_UpgradeList(5)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyFloatClassProperty',UpgradeLevel=3,NewValue=240.000000,PropertyName="m_fAutoRestoreHealthTime")
   m_UpgradeList(6)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=4,UpgradeCreditCost=2000,NewValue=6000.000000,PropertyName="r_nRepairHealthThreshold")
   m_UpgradeList(7)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=4,NewValue=12000.000000,PropertyName="r_MaxHealth")
   m_UpgradeList(8)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyFloatClassProperty',UpgradeLevel=4,NewValue=210.000000,PropertyName="m_fAutoRestoreHealthTime")
   m_UpgradeList(9)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=5,UpgradeCreditCost=2000,NewValue=7000.000000,PropertyName="r_nRepairHealthThreshold")
   m_UpgradeList(10)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyIntClassProperty',UpgradeLevel=5,NewValue=14000.000000,PropertyName="r_MaxHealth")
   m_UpgradeList(11)=(UpgradeClass=Class'TribesGame.TrGameObjectiveUpgrade_ModifyFloatClassProperty',UpgradeLevel=5,NewValue=170.000000,PropertyName="m_fAutoRestoreHealthTime")
   m_fObjectiveHealthBarWidth=150.000000
   m_AssistAccolade=Class'TribesGame.TrAccolade_BaseAssist'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrGameObjective:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrGameObjective:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrGameObjective:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=CollisionMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:CollisionMesh'
      bHasPhysicsAssetInstance=True
      ReplacementPrimitive=None
      RBChannel=RBCC_GameplayPhysics
      HiddenGame=True
      HiddenEditor=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Translation=(X=0.000000,Y=0.000000,Z=-50.000000)
      Scale=2.500000
      Name="CollisionMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrGameObjective:CollisionMesh'
   End Object
   Components(5)=CollisionMesh
   Components(6)=ShieldMesh
   Components(7)=OnlineSound
   Components(8)=CriticalSound
   Components(9)=ShieldHitSound
   Components(10)=PowerDownSound
   Components(11)=DestroyedSound
   bAlwaysRelevant=True
   bPostRenderIfNotVisible=True
   bMovable=False
   CollisionComponent=CollisionMesh
   SupportedEvents(5)=Class'TribesGame.TrSeqEvent_Generator'
   Name="Default__TrPowerGenerator"
   ObjectArchetype=TrGameObjective'TribesGame.Default__TrGameObjective'
}
