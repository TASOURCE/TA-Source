/**
 * 
 */
class TrDevice_ChainGun extends TrDevice_ConstantFire;

/** Timing for spinup and spindown */
var float m_fBuildupTime;

var float m_fCurrSpinTime;

/** Sounds for spinup and spindown */
var(Sounds) AudioComponent m_AudioComponentWeaponSpin;

var TrSkelControl_SpinControl m_BarrelSpinControl;

var repnotify int r_BuffedMaxAmmo;

var bool m_bHasClip;

replication
{
	if( bNetDirty && bNetOwner && Role == ROLE_Authority )
		r_BuffedMaxAmmo;
}

simulated event ReplicatedEvent(name VarName)
{   
    if(VarName == 'r_BuffedMaxAmmo')
    {
		if( !m_bHasClip )
		{
			MaxAmmoCount = r_BuffedMaxAmmo;
			m_nMaxCarriedAmmo = r_BuffedMaxAmmo;
		}
        return;
    }
    super.ReplicatedEvent(VarName);
}


simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	local PlayerReplicationInfo PRI;

	if( Instigator != none )
	{
		PRI = Instigator.PlayerReplicationInfo;
	}

    if (SkelComp == Mesh)
    {
        m_BarrelSpinControl = TrSkelControl_SpinControl(SkelComp.FindSkelControl('SpinControl'));
		if (m_BarrelSpinControl != none)
		{
			m_BarrelSpinControl.m_fSpinDownTime = GetBuildupTime(PRI, true);
			m_BarrelSpinControl.m_fSpinUpTime = GetBuildupTime(PRI, true);
		}
    }

    Super.PostInitAnimTree(SkelComp);
}

simulated event Tick(float DeltaTime)
{
	super.Tick(DeltaTime);

	if( m_fCurrSpinTime > 0.f )
	{
		UpdateSoundModulation();
	}
}

simulated function UpdateSoundModulation()
{
	local PlayerReplicationInfo PRI;

	if( Instigator != none )
	{
		PRI = Instigator.PlayerReplicationInfo;
	}

	if( m_AudioComponentWeaponSpin != none )
	{
		m_AudioComponentWeaponSpin.SetFloatParameter('PitchModulation', m_fCurrSpinTime / GetBuildupTime(PRI, false));
		m_AudioComponentWeaponSpin.SetFloatParameter('VolumeModulation', m_fCurrSpinTime / GetBuildupTime(PRI, false));
	}
}

/** 
 *  Returns the buildup time with perks/skills added. 
 *  @bForInterpSpeed: Determines how we calculate the buildup time (skel control uses it for
 *                    interp speed rather than a real time.
 *  */
simulated static function float GetBuildupTime(PlayerReplicationInfo PRI, bool bForInterpSpeed)
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float BuildupTime;

	BuildupTime = default.m_fBuildupTime;

	TrPRI = TrPlayerReplicationInfo(PRI);
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none )
		{
			if( bForInterpSpeed )
			{
				BuildupTime *= 1.0 + VM.m_fBuildupBuffPct;
			}
			else
			{
				BuildupTime *= 1.0 - VM.m_fBuildupBuffPct;
			}
		}
	}

	return BuildupTime;
}

simulated function PlayBuildupAnimation()
{
	// Play buildup animation.
    if( m_DeviceAnimNode != None && m_DeviceAnimNode.m_bPlayBuildUp )
    {
        m_DeviceAnimNode.PlayBuildup(GetBuildupTime(Instigator.PlayerReplicationInfo, false));
    }
}


simulated state WeaponFullAutoBuildup
{
	simulated event Tick(float DeltaTime)
	{
		local PlayerReplicationInfo PRI;

		if( Instigator != none )
		{
			PRI = Instigator.PlayerReplicationInfo;
		}

		global.Tick(DeltaTime);

		m_fCurrSpinTime += DeltaTime;

		if (m_fCurrSpinTime >= GetBuildupTime(PRI, false))
		{
			if (ShouldRefire())
			{
				GotoState('WeaponConstantFiring');
			}
			else
			{
				GotoState('WeaponFullAutoCooldown');
			}

			m_fCurrSpinTime = GetBuildupTime(PRI, false);
		}
	}

    simulated function bool CanFireOffhandNow()
    {
        return false;
    }

	simulated function BeginState(Name PreviousStateName)
	{
		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			if (m_BarrelSpinControl != none)
			{
				m_BarrelSpinControl.Spin(true);
			}

			PlayBuildupAnimation();

			UpdateSoundModulation();
			if( !m_AudioComponentWeaponSpin.IsPlaying() )
			{
				m_AudioComponentWeaponSpin.Play();
			}
		}
	}

	simulated function EndState(Name NextStateName)
	{
		if (NextStateName != 'WeaponFullAutoCooldown' && NextStateName != 'WeaponConstantFiring')
		{
			m_AudioComponentWeaponSpin.Stop();
		}

		super.EndState(NextStateName);
	}

	simulated function bool IsFiring()
	{
		return false;
	}

	simulated function bool CanViewZoom()
	{
		return m_bAllowFireWhileZoomed;
	}

	simulated function EndFire(byte FireModeNum)
	{
		global.EndFire(FireModeNum);

		GotoState('WeaponFullAutoCooldown');
	}
}

simulated state WeaponConstantFiring
{
	simulated function EndState(Name NextStateName)
	{
		if (NextStateName != 'WeaponFullAutoCooldown' && NextStateName != 'WeaponFullAutoBuildup')
		{
			m_AudioComponentWeaponSpin.Stop();
		}

		super.EndState(NextStateName);
	}
}

simulated state WeaponFullAutoCooldown extends Active
{
    simulated function bool CanFireOffhandNow()
    {
        return false;
    }

	simulated function BeginState(Name PreviousStateName)
	{
		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			if (m_BarrelSpinControl != none)
			{
				m_BarrelSpinControl.Spin(false);
			}

			if( m_DeviceAnimNode != None && m_DeviceAnimNode.m_bPlayBuildUp )
			{
				m_DeviceAnimNode.PlayIdle();
			}
		}
	}

	simulated function EndState(Name NextStateName)
	{
		super.EndState(NextStateName);

		if( NextStateName != 'WeaponFullAutoBuildup' )
		{
			m_AudioComponentWeaponSpin.Stop();
		}
	}

	simulated event Tick(float DeltaTime)
	{
		Global.Tick(DeltaTime);

		m_fCurrSpinTime -= DeltaTime;

		if (m_fCurrSpinTime <= 0.0f)
		{
			if (ShouldRefire())
				GotoState('WeaponFullAutoBuildup');
			else
				GotoState('Active');

			m_fCurrSpinTime = 0.0f;
		}
	}

	simulated function bool IsFiring()
	{
		return false;
	}

	simulated function bool CanViewZoom()
	{
		return m_bAllowFireWhileZoomed;
	}
}

// called when this device becomes the active weapon of a pawn
simulated function OnSwitchToWeapon()
{
	// Reset spin time.
	m_fCurrSpinTime = 0.0;
	
	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( m_BarrelSpinControl != none )
		{
			m_BarrelSpinControl.Spin(false);
		}
	}

	if (m_AudioComponentWeaponSpin != none)
	{
		m_AudioComponentWeaponSpin.Stop();
	}

	super.OnSwitchToWeapon();
}

simulated function PlayWeaponPutDown()
{
	// Reset spin time.
	m_fCurrSpinTime = 0.0;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( m_BarrelSpinControl != none )
		{
			m_BarrelSpinControl.Spin(false);
		}
	}

	if (m_AudioComponentWeaponSpin != none)
	{
		m_AudioComponentWeaponSpin.Stop();
	}

	super.PlayWeaponPutDown();
}

simulated function BuffMaxCarriedAmmo(int Amount)
{
	// Since chaingun uses just a single clip for all shots, we need to increase
	// MaxAmmoCount as well.
	if( !m_bHasClip )
	{
		MaxAmmoCount += Amount;
	}

	super.BuffMaxCarriedAmmo(Amount);

	if( !m_bHasClip )
	{
		if( Role == ROLE_Authority )
		{
			r_BuffedMaxAmmo = MaxAmmoCount;
			bNetDirty = true;
		}
	}
}

function int AddCarriedAmmo(int Amount)
{
	if( !m_bHasClip )
	{
		// Unlike most other devices, only change the clip based on the current clip size 
		// rather than m_nCarriedAmmo.
		m_RemainingAmmoInClip = Clamp(m_RemainingAmmoInClip + Amount, 0, m_nMaxCarriedAmmo);

		UpdateReplicatedCarriedAmmo();
		return m_RemainingAmmoInClip;
	}
	return super.AddCarriedAmmo(Amount);
}

simulated function int GetBasePickupAmmoAmount()
{
	if( !m_bHasClip )
	{
		return default.m_nMaxCarriedAmmo;
	}
	return super.GetBasePickupAmmoAmount();
}

defaultproperties
{
   m_fBuildupTime=1.500000
   Begin Object Class=UTAmbientSoundComponent Name=ChaingunSpinSound
      bAllowSpatialization=False
      Name="ChaingunSpinSound"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTAmbientSoundComponent'
   End Object
   m_AudioComponentWeaponSpin=ChaingunSpinSound
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ConstantFire:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   m_PostFireState="WeaponFullAutoCooldown"
   DBWeaponId=7386
   DBXPActivityId=131
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_bAllowReloads=False
   m_bResumeZoomOnReloadEnd=False
   m_fDefaultAccuracy=0.980000
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.110000
   m_fAccuracyCorrectionRate=0.190000
   m_nReticuleIndex=20
   m_nCarriedAmmo=0
   m_nMaxCarriedAmmo=200
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ChainGun:FireCameraShake'
   m_TinyWeaponsOffset=(X=20.000000,Y=10.000000,Z=-10.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=7.000000,Z=58.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=1.800000)
   m_InGamePaperDollInfo=(Scale=1.800000)
   InfoPanelDescription="The most powerful of the automatic weapons found in the Wilderzone, the chaingun is relentless, with no need to reload."
   InfoPanelDamage=4
   InfoPanelRadius=-3
   InfoPanelFireRate=8
   InfoPanelClipSize=9
   UpgradeDescription(0)="+25 AMMO"
   UpgradeDescription(1)="-15% SPINUP\nTIME"
   UpgradeDescription(2)="+25 AMMO"
   UpgradeDescription(3)="-15% SPINUP\nTIME"
   Upgrades(0)=(IconId=4,DatabaseItemId=8100,Modifications=((ModType=30,Value=25.000000)))
   Upgrades(1)=(IconId=10,DatabaseItemId=8101,Modifications=((ModType=6,Value=0.150000)))
   Upgrades(2)=(IconId=4,DatabaseItemId=8102,Modifications=((ModType=30,Value=25.000000)))
   Upgrades(3)=(IconId=10,DatabaseItemId=8103,Modifications=((ModType=6,Value=0.150000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_ChainGun_Content"
   bSniping=True
   bTargetFrictionEnabled=True
   bTargetAdhesionEnabled=True
   MaxAmmoCount=200
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_ChainGun'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   PlayerViewOffset=(X=8.000000,Y=4.000000,Z=-5.000000)
   SmallWeaponsOffset=(X=18.000000,Y=3.000000,Z=4.000000)
   WideScreenOffsetScaling=1.000000
   WidescreenRotationOffset=(Pitch=-200,Yaw=0,Roll=0)
   FiringStatesArray(0)="WeaponFullAutoBuildup"
   FiringStatesArray(1)=()
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Chaingun'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.110000
   FireInterval(1)=()
   FireOffset=(X=3.000000,Y=0.000000,Z=-0.000000)
   bInstantHit=True
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ConstantFire:FirstPersonMesh'
      FOV=55.000000
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
   ItemName="Chain Gun"
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
   Components(1)=ChaingunSpinSound
   Name="Default__TrDevice_ChainGun"
   ObjectArchetype=TrDevice_ConstantFire'TribesGame.Default__TrDevice_ConstantFire'
}
