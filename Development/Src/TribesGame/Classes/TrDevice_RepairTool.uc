/**
 * 
 */
class TrDevice_RepairTool extends TrDevice_ConstantFire;

var float m_fRepairPercentage;
var float m_fPawnRepairPercentage;
var float m_fVehicleRepairPercentage;
var ParticleSystemComponent m_pscRepairEffect;
var private bool m_bIsBehindView;
var private float m_fDisplayOn;
var private float m_fTargetHealth;
var private vector m_Tangent;
var vector m_Location;

simulated function bool CanActorBeRepaired(Actor HitActor)
{
	return HitActor != none && Owner != none && HitActor.bCanBeDamaged;
}

simulated function float GetActorHealth(Actor HitActor)
{
	local Pawn PHit;
	local TrGameObjective GOHit;

	GOHit = TrGameObjective(HitActor);
	PHit = Pawn(HitActor);

	if (HitActor != none && HitActor.bCanBeDamaged)
	{
		if (PHit != none && PHit.HealthMax > 0)
			return float(PHit.Health) / float(PHit.HealthMax);
		else if (GOHit != none && GOHit.r_MaxHealth > 0)
			return GOHit.GetHealthAmount();
		else
			return -1;
	}
	else
		return -1;
}

/** called to display target health */
simulated function int GetAmmoCount()
{
	return FMax(FFloor(m_fTargetHealth * 100.0f), 0.0f);
}

/** called when constant fire has ended */
simulated function OnEndConstantFire()
{
	local TrPawn TrP;

	// Notify the weapon attachment that it has stopped firing.
	TrP = TrPawn(Instigator);
	if (TrP != none)
	{
		TrP.WeaponStoppedFiring(self, false);
	}

	super.OnEndConstantFire();

	KillRepairEffect();
}

/** called when constant fire has started */
simulated function OnStartConstantFire()
{
	SpawnRepairEffect();
}

simulated function InstantFire()
{
	local vector StartTrace, EndTrace;
	local Array<ImpactInfo>	ImpactList;
	local ImpactInfo RealImpact, NearImpact;
	local int i, FinalImpactIndex;

	// define range to use for CalcWeaponFire()
	StartTrace = InstantFireStartTrace();
	EndTrace = InstantFireEndTrace(StartTrace);
	bUsingAimingHelp = false;
	// Perform shot
	RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
	FinalImpactIndex = ImpactList.length - 1;

	if (FinalImpactIndex >= 0 && (ImpactList[FinalImpactIndex].HitActor == None || !ImpactList[FinalImpactIndex].HitActor.bProjTarget))
	{
		// console aiming help
		NearImpact = InstantAimHelp(StartTrace, EndTrace, RealImpact);
		if ( NearImpact.HitActor != None )
		{
			bUsingAimingHelp = true;
			ImpactList[FinalImpactIndex] = NearImpact;
		}
	}

	for (i = 0; i < ImpactList.length; i++)
	{
		ProcessInstantHit_Internal(CurrentFireMode, ImpactList[i]);
	}

	m_nCarriedAmmo = GetAmmoCount();
}

simulated function ProcessInstantHit_Internal(byte FiringMode, ImpactInfo Impact, optional bool bHeadShot)
{
	local TrPawn POwner;

	POwner = TrPawn(Owner);

	// If we didn't hit an actor, or if they can't be repaired... don't do shit!
	if (!CanActorBeRepaired(Impact.HitActor))
	{
		return;
	}

	if (Role == ROLE_Authority && POwner != none)
	{
		SetFlashLocation(Impact.HitLocation);
		POwner.SetFlashNormal(Impact.HitNormal);
	}

	super.ProcessInstantHit_Internal(FiringMode, Impact, bHeadShot);

	m_fTargetHealth = GetActorHealth(Impact.HitActor);
}

simulated state Active
{
	simulated event Tick(float DeltaTime)
	{
		local bool hasRepairHit;
		local Actor HitActor;
		local Vector End, Tangent;

		super.Tick(DeltaTime);

		if (m_DeviceAnimNode != none && Instigator != none && Instigator.Controller != none)
		{
			hasRepairHit = GetRepairEndAndTangent(End, Tangent, HitActor);
			m_fTargetHealth = GetActorHealth(HitActor);
			UpdateDamageMaterial();

			if (hasRepairHit)
			{
				m_DeviceAnimNode.PlayAltIdle();
			}
			else
			{
				m_DeviceAnimNode.PlayIdle();
			}
		}
	}
}

// Firing state for constant firing weapons, i.e. Repair targeter.
simulated state WeaponConstantFiring
{
	simulated event Tick(float DeltaTime)
	{
		super.Tick(DeltaTime);
		
		UpdateRepairEffect(DeltaTime);
	}
}

simulated function bool GetRepairEndAndTangent(out Vector EndLocation, out Vector Tangent, optional out Actor HitActor)
{
	local Vector StartTrace, EndTrace;
	local ImpactInfo TestImpact;

	// Calculate the start position, aim direction, and end of the trace for the Repair.
	StartTrace = InstantFireStartTrace();
	EndTrace = InstantFireEndTrace(StartTrace);

	// Perform a trace and find the real end point.
	TestImpact = CalcWeaponFire(StartTrace, EndTrace);
	EndTrace = TestImpact.HitLocation;

	// Pass it back out.
	EndLocation = EndTrace;
	Tangent = TestImpact.HitNormal;
	HitActor = TestImpact.HitActor;

	return CanActorBeRepaired(TestImpact.HitActor);
}

simulated function KillRepairEffect()
{
	if (m_AudioComponentWeaponLoop.IsPlaying() && m_AudioComponentWeaponLoop.FadeOutTargetVolume != 0.0f)
	{
		m_AudioComponentWeaponLoop.FadeOut(WeaponFireFadeTime, 0.0f);
	}

	m_fTargetHealth = -1;
	UpdateDamageMaterial();

	if (m_pscRepairEffect != none)
	{
		m_pscRepairEffect.DeactivateSystem();
		m_pscRepairEffect = none;
	}
}

simulated function bool HasViewModeSwitched()
{
	local TrPlayerController PController;
	local TrPawn POwner;

	// Get the owner.
	POwner = TrPawn(Instigator);
	if (POwner == none)
		return false;

	// Get the controller.
	PController = TrPlayerController(POwner.Controller);
	if (PController == none)
		return false;

	return PController.bBehindView != m_bIsBehindView;
}

simulated function SpawnRepairEffect()
{
	local bool hasRepairHit;
	local SkeletalMeshComponent MeshAttach;
	local TrPlayerController PController;
	local TrPawn POwner;
	local Vector End, Tangent;

	hasRepairHit = GetRepairEndAndTangent(End, Tangent);
	Tangent = vect(0,0,0);

	// Get the owner.
	POwner = TrPawn(Instigator);
	if (POwner == none)
		return;

	// Get the controller.
	PController = TrPlayerController(POwner.Controller);
	if (PController == none)
		return;

	// Spawn the Repair effect for clients only.
	if (PController.IsLocalPlayerController() && hasRepairHit)
	{
		m_AudioComponentWeaponLoop.FadeIn(WeaponFireFadeTime, 1.0f);

		if (PController.bBehindView)
			MeshAttach = TrDeviceAttachment(POwner.CurrentWeaponAttachment).Mesh;
		else
			MeshAttach = SkeletalMeshComponent(Mesh);

		if (m_pscRepairEffect == none || HasViewModeSwitched())
		{
			m_pscRepairEffect = WorldInfo.MyEmitterPool.SpawnEmitterMeshAttachment(m_TracerBeamTemplate, MeshAttach, 'WSO_Emit_01', true,,);
			m_pscRepairEffect.SetDepthPriorityGroup(SDPG_Foreground);
			m_pscRepairEffect.SetTickGroup(TG_EffectsUpdateWork);
			m_pscRepairEffect.SetVectorParameter('TracerTangent', Tangent);
			m_pscRepairEffect.SetVectorParameter('TracerEnd', End);

			// Store for determing if a switch happened.
			m_bIsBehindView = PController.bBehindView;
		}
	}
	else
	{
		if (m_AudioComponentWeaponLoop.IsPlaying() && m_AudioComponentWeaponLoop.FadeOutTargetVolume != 0.0f)
		{
			m_AudioComponentWeaponLoop.FadeOut(WeaponFireFadeTime, 0.0f);
		}
	}

	m_Location = End;
	m_Tangent = Tangent;
}

simulated function UpdateRepairEffect(float DeltaTime)
{
	local bool hasRepairHit;
	local Vector End, Tangent;

	if (m_pscRepairEffect == none)
	{
		SpawnRepairEffect();
		return;
	}

	if (HasViewModeSwitched())
	{
		m_pscRepairEffect.DeactivateSystem();
		m_pscRepairEffect = none;
		SpawnRepairEffect();
		return;
	}

	hasRepairHit = GetRepairEndAndTangent(End, Tangent);

	// Interpolate smoothly from current spot to next spot.
	m_Location = VInterpTo(m_Location, End, DeltaTime, 2);
	m_Tangent = VInterpTo(m_Tangent, Tangent, DeltaTime, 0.25);
	m_Tangent = VInterpTo(m_Tangent, vect(0,0,0), DeltaTime, 0.25);

	// Update the Repair target end position.
	if (hasRepairHit)
	{
		m_pscRepairEffect.SetVectorParameter('TracerTangent', m_Tangent);
		m_pscRepairEffect.SetVectorParameter('TracerEnd', m_Location);
	}
	else
	{
		KillRepairEffect();
	}

	UpdateDamageMaterial();
}

simulated function UpdateDamageMaterial()
{
    local SkeletalMesh SMesh;
	local TrPawn POwner;

	// Get the owner and make sure we are local.
	POwner = TrPawn(Instigator);
	if (POwner == none || POwner.Controller == none || !POwner.Controller.IsLocalPlayerController())
		return;

    SMesh = SkeletalMeshComponent(Mesh).SkeletalMesh;

	MaterialInstanceConstant(SMesh.Materials[1]).SetScalarParameterValue('DisplayOn', 1.0f);
	MaterialInstanceConstant(SMesh.Materials[1]).SetScalarParameterValue('TargetHealth', FMax(m_fTargetHealth, 0.0f));

	// Update the "ammo display" to have the health of our target.
	m_nCarriedAmmo = GetAmmoCount();
}

function float ModifyInstantHitDamage(byte FiringMode, ImpactInfo Impact, float damage)
{
	local bool bIsFriendly;
	local float BaseRepair;
	local Pawn PHit;
	local TrGameObjective GOHit;
	local TrDeployable_Turret TurretHit;
	local TrPlayerPawn PPHit;
	local TrPlayerReplicationInfo TrPRI;
	local TrVehicle VHit;
	local TrValueModifier VM;

	if (Impact.HitActor == none)
		return 0.0f;

	// Fetch the value modifier.
	if( Instigator != none )
	{
		TrPRI = TrPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
		}
	}

	// Determine if friendly.
	if (Impact.HitActor.GetTeamNum() == Owner.GetTeamNum())
	{
		bIsFriendly = true;
	}

	GOHit = TrGameObjective(Impact.HitActor);
	PHit = Pawn(Impact.HitActor);
	PPHit = TrPlayerPawn(Impact.HitActor);
	TurretHit = TrDeployable_Turret(Impact.HitActor);
	VHit = TrVehicle(Impact.HitActor);

	// If we are hitting an unfriendly target and we can't damage them, abort.
	if (!bIsFriendly && (VM == none || !VM.m_bCanDamageRepairEnemyObjectives))
	{
		return 0.0f;
	}

	if (!bisFriendly && TurretHit != none)
	{
		TurretHit.m_fLastStallTime = WorldInfo.TimeSeconds;
	}

	if (Impact.HitActor.bCanBeDamaged)
	{
		if (GOHit != none && GOHit.r_MaxHealth > 0)
			BaseRepair = float(GOHit.r_MaxHealth) * m_fRepairPercentage;
		else if (VHit != none && VHit.HealthMax > 0)
			BaseRepair = float(VHit.HealthMax) * m_fVehicleRepairPercentage;
		else if (PPHit != none && PPHit.HealthMax > 0)
			BaseRepair = float(PPHit.HealthMax) * (bIsFriendly ? m_fPawnRepairPercentage : 0.0f);
		else if (PHit != none && PHit.HealthMax > 0)
			BaseRepair = float(PHit.HealthMax) * (bIsFriendly ? m_fRepairPercentage : 0.0f);
	}

	// Add in what our fire interval is.
	BaseRepair *= FireInterval[0];

	// Skill/perk
	if( Instigator != none )
	{
		TrPRI = TrPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none && bIsFriendly )
			{
				BaseRepair *= 1.0 + VM.m_fRepairRateBuffPct;
			}
		}
	}

    return BaseRepair * (bIsFriendly ? -1.0f : 1.0f);
}

simulated function bool HasAnyAmmo()
{
	// Always has "ammo."
	return true;
}

defaultproperties
{
   m_fRepairPercentage=0.030000
   m_fVehicleRepairPercentage=0.060000
   m_fTargetHealth=-1.000000
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_bSoundLinkedWithState=False
   WeaponFireFadeTime=0.200000
   DBWeaponId=7396
   m_eTargetType(0)=TRDTT_Friend
   m_eTargetType(1)=()
   m_bAllowReloads=False
   m_bIsKickbackAdditive=True
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.000000
   m_fAccuracyCorrectionRate=0.000000
   m_nReticuleIndex=15
   m_nIconIndex=15
   m_fKickbackBlendOutTime=5.000000
   m_v2WeaponLagInterpSpeed=(X=3.000000,Y=3.000000)
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RepairTool:FireCameraShake'
   m_TinyWeaponsOffset=(X=13.000000,Y=5.000000,Z=-4.000000)
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=3.800000)
   m_sContentDataClassName="TribesGameContent.TrDevice_RepairTool_Content"
   bSniping=True
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackShootingSmall'
   AttachmentClass=Class'TribesGame.TrAttachment_RepairTool'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashLightClass=Class'TribesGame.TrMuzzleFlashLight_RepairTool'
   MuzzleFlashDuration=0.300000
   PlayerViewOffset=(X=2.000000,Y=0.000000,Z=-8.000000)
   SmallWeaponsOffset=(X=4.000000,Y=-0.500000,Z=3.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=-300,Yaw=0,Roll=0)
   InstantHitDamage(0)=-18.000000
   InstantHitDamage(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_RepairTool'
   InstantHitDamageTypes(1)=()
   FireOffset=(X=20.000000,Y=5.000000,Z=0.000000)
   bInstantHit=True
   WeaponRange=400.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:FirstPersonMesh'
      FOV=65.000000
      AnimSets(0)=None
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Repair Tool"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:PickupMesh'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      ReplacementPrimitive=None
      MaxDrawDistance=6000.000000
      CachedMaxDrawDistance=6000.000000
      MotionBlurScale=0.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      bAllowAmbientOcclusion=False
      Scale=1.250000
      Name="PickupMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_RepairTool"
   ObjectArchetype=TrDevice_ConstantFire'TribesGame.Default__TrDevice_ConstantFire'
}
