/**
 *  Automatically fires this device when the pawn switches to it (useful for grenades, melee, etc).
 */ 
class TrDevice_AutoFire extends TrDevice
	native;

/** Amount of time between fire button pressed and actual release of the projectile. */
var float m_fBuildupTime;

/** This device will be switched to after thi auto fire device fires.*/
var TrDevice m_PostFireDevice;

/** If the weapon holder dies while building up a fire, the amount of time within the buildup in which the device is still fired. (i.e. pulling a pin on a grenade). */
var float m_fPullPinTime;

/** Is the current fire a 'pull pin fire?'*/
var transient bool m_bPullPinFire;

simulated function float GetBuildUpTime()
{
	local TrPawn TrP;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float BuildupTime;

	BuildupTime = m_fBuildupTime;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				// Weapon switch skill/perk.
				BuildupTime *= 1.0 - VM.m_fFasterThrowBeltBuffPct;
			}
		}
	}
	return BuildupTime;
}

simulated function float GetEquipTime()
{
	return EquipTime;
}

simulated function float GetPutDownTime()
{
	return PutDownTime;
}

simulated state WeaponEquipping
{
	simulated function bool CanViewZoom()
	{
		return true;
	}
}

simulated state WeaponFiring
{
ignores StartFire;
    simulated function RefireCheckTimer()
	{
        ;
        if( Role == ROLE_Authority )
        {
			ClearTimer('RefireCheckTimer');
			if( m_bAllowReloads )
			{
				GotoState('DeviceReloading');
			}
			else
			{
				EnableWeaponReadyToFire();
				GotoState('Inactive');
				SwitchToPostFireDevice();
			}
        }
    }

	simulated function bool CanViewZoom()
	{
		return false;
	}
}

// Automatically start in active state.
simulated state Active
{
    simulated event BeginState(Name PreviousStateName)
    {
        Super.BeginState(PreviousStateName);
        
        // Immediately start a fire.
        StartFire(0);
    }

	simulated function bool CanBeginFireNow(byte FireModeNum)
	{
		return HasAmmo(FireModeNum);
	}

    simulated function bool DoAutoReload();

	simulated function bool CanViewZoom()
	{
		return false;
	}
}

simulated function PlayFireAnimation(byte FireModeNum)
{
	// Play fire animation.
    if( m_DeviceAnimNode != None )
    {
        m_DeviceAnimNode.PlayOffhand(m_fBuildupTime / GetBuildUpTime());
    }
}

// Player has requested to throw out the offhand and it is waiting for its buildup time to expire.
simulated state Buildup
{
ignores BeginFire, Activate, StartFire;
    
    simulated event BeginState(Name PreviousStateName)
	{
        local TrPawn TrP;

		// Subtract the ammo instantly
		if (Role == ROLE_Authority)
		{
			m_nCarriedAmmo -= ShotCost[0];
			UpdateReplicatedCarriedAmmo();
		}

        Mesh.SetHidden(false);
        SetTimer(GetBuildUpTime(), false);
		PlayFireAnimation(0);
		ShakeView();

        // Spawn the 3rd Person Attachment
        TrP = TrPawn(Instigator);
	    if (Role == ROLE_Authority && TrP != None)
	    {
            TrP.CurrentWeaponAttachmentClass = AttachmentClass;
	    }
    }

	function HolderDied()
	{
		if( (m_fPullPinTime >= 0.0) && (IsTimerActive()) && ((GetBuildUpTime() - GetRemainingTimeForTimer()) > m_fPullPinTime) )
		{
			// Holder had 'pulled the pin,' so carry out the fire.
			ClearTimer();
			m_bPullPinFire = true;
			GotoState('WeaponFiring');

			super.HolderDied();
		}
	}

    simulated event Timer()
    {
        GotoState('WeaponFiring');
    }

	simulated function bool CanViewZoom()
	{
		return false;
	}
}

simulated function FireAmmunition()
{
	// Bypass the animation and effects in TrDevice.FireAmmunition().
	super(UTWeapon).FireAmmunition();
}

simulated state DeviceReloading
{
    simulated function BeginAReload()
    {
        if( Role == ROLE_Authority )
        {
			// Authority is reloading, so don't let clients even attempt to fire if the server
			// isn't ready. Or else the client can become out of sync and 'dry fire'
			r_bIsReloading = true;

            // Simply perform the reload (no animation or timing).
            Reload();
        }
    }

    function Reload()
    {
        local int ammoLoaded;
        local float TimeAfterReload, ReloadTime;

		ReloadTime = GetReloadTime(Instigator.PlayerReplicationInfo, r_eEquipAt);

		;

        if (Role==ROLE_Authority)
        {
            ammoLoaded = ShotCost[0];
	        if (ammoLoaded!=0)
	        {
				// increment magazine content
			    AddAmmo(ammoLoaded);
            }
            
            // Reload is done, see what to do next.
            TimeAfterReload = ReloadTime * (1.f - m_fPctTimeBeforeReload);
            if( TimeAfterReload > 0.f )
            {
                SetTimer(TimeAfterReload, false, 'OnReloadComplete');
            }
            else
            {
                OnReloadComplete();
            }
        }

		SwitchToPostFireDevice();
    }

	simulated function bool CanViewZoom()
	{
		return false;
	}
}

function int AddCarriedAmmo(int Amount)
{
	m_nCarriedAmmo = Clamp(m_nCarriedAmmo + Amount, 0, m_nMaxCarriedAmmo);

	if (Role == ROLE_Authority)
	{
		UpdateReplicatedCarriedAmmo();
	}

    return m_nCarriedAmmo;
}

// No inactive reloading.
function PerformInactiveReload();

simulated function bool HasAmmo( byte FireModeNum, optional int Amount )
{
    local TrPawn trp;

	if( FireModeNum != 0 )
	{
		return false;
	}

    if (FireModeNum < m_PowerPoolCost.Length && m_PowerPoolCost[FireModeNum] > 0)
    {
        trp = TrPawn(Instigator);
        
        if (trp != None)
        {
            if (m_PowerPoolCost[FireModeNum] <= trp.m_fCurrentPowerPool)
            {
                return (true);
            }
        }

        return (false);
    }

	if (Amount==0)
		return (m_nCarriedAmmo >= ShotCost[FireModeNum]);
	else
		return (m_nCarriedAmmo >= Amount);
}

simulated function StartFire(byte FireModeNum)
{
    if( (ShotCost[0] > 0 && m_nCarriedAmmo > 0) || ShotCost[0] == 0.f )
    {
        super.StartFire(FireModeNum);
    }
}

simulated function SetPostFireDevice(TrDevice PostFireDevice)
{
    m_PostFireDevice = PostFireDevice;
}

simulated function SwitchToPostFireDevice()
{
	if (Instigator != none && Instigator.InvManager != none)
	{
		Instigator.InvManager.SetCurrentWeapon(m_PostFireDevice);
	}
}

simulated event OnAnimEnd(AnimNodeSequence SeqNode, float PlayedTime, float ExcessTime)
{
    if( SeqNode != None && SeqNode.AnimSeqName == 'Fire' )
    {
        Mesh.SetHidden(true);
    }
}

simulated function bool CanFireNow()
{
	// We can't fire now if we are in the refire check time.
	if (IsTimerActive('RefireCheckTimer'))
		return false;

	// We have enough ammo.
    if ((ShotCost[0] > 0 && m_nCarriedAmmo > 0) || ShotCost[0] == 0.f)
        return true;

    return false;
}

/** This prevents switching away from this weapon. */
simulated function bool DoOverrideNextWeapon()
{
	return true;
}

/** This prevents switching away from this weapon. */
simulated function bool DoOverridePrevWeapon()
{
	return true;
}

/** Don't allow auto devices to fire when this one is firing. */
simulated function bool CanAutoDeviceFireNow()
{
    return false;
}

/** No manual reloads. */
simulated function RequestReload();
simulated function OnClientReloaded();
simulated function ClientFinishedReload();
function OnReloadComplete()
{
    GotoState('Inactive');
}

// Remote clients know to fire because CurrentWeaponAttachmentClass gets set
// during the buildup. Rather than overriding ProjectileFire (for grenades, etc) 
// to not flash, we just don't allow flashing.
simulated function IncrementFlashCount();

simulated function bool CanViewZoom()
{
	return false;
}

simulated function ConsumeAmmo(byte FireModeNum)
{
}

simulated function ConsumeAmmo_Internal(byte FireModeNum)
{
}

simulated function Projectile ProjectileFire()
{
	local Projectile P;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	P = super.ProjectileFire();

	// Increase the damage radius if a perk or skill allows it.
	TrPRI = TrPlayerReplicationInfo(Instigator.PlayerReplicationInfo);
	if( P != none && TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none )
		{
			P.DamageRadius *= 1.0 + VM.m_fOffhandDamageRadiusBuffPct;
		}
	}

	if( P != none && m_bPullPinFire )
	{
		// If the fire was 'pull pin', drop the projectile straight down because the pawn never
		// had the chance to 'throw' it.
		P.Velocity = vect(0,0,0);

		// Reset m_bPullPinFire just in case we ever get back to firing this device again.
		m_bPullPinFire = false;
	}

	return P;
}

simulated function OnSwitchAwayFromWeapon()
{
	if (InvManager != none)
	{
		InvManager.ClearAllPendingFire(self);
	}

	super.OnSwitchAwayFromWeapon();
}

simulated function HolderEnteredVehicle()
{
	SwitchToPostFireDevice();
}

defaultproperties
{
   m_fBuildupTime=0.700000
   m_fPullPinTime=-1.000000
   DBWeaponTypeId=2
   m_fAccuracyLossOnJump=0.000000
   m_fAccuracyLossOnWeaponSwitch=0.000000
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.000000
   m_fAccuracyCorrectionRate=1.000000
   m_nReticuleIndex=17
   m_fReloadTime=0.000000
   m_FireCameraShake=None
   m_MainMenuPaperDollInfo=(CharacterLightingContrastFactor=1.000000)
   m_InGamePaperDollInfo=(Rotation=(Pitch=-4004,Yaw=-16384,Roll=0),Scale=4.300000)
   WeaponFireWaveForm=None
   InventoryGroup=1
   MuzzleFlashSocket=
   MuzzleFlashLightClass=None
   FiringStatesArray(0)="Buildup"
   FiringStatesArray(1)=()
   FireInterval(0)=0.200000
   FireInterval(1)=()
   EquipTime=0.010000
   PutDownTime=0.010000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_AutoFire"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
