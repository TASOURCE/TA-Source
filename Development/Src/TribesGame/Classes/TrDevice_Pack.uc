/**
 * Special pack behavior, no firing state etc, just activate or deactivate

 */
class TrDevice_Pack extends TrDevice;

/** Default Power pool consumption rate per second */
var() float m_fDefaultPowerPoolCostPerSec;

/** Power pool consumption rate per second for specific armor types. */
struct PowerPoolCostInfo
{
	var() float m_fPowerPoolCostPerSec;
	var() class<TrFamilyInfo> m_TrFamilyInfo;
};
var() array<PowerPoolCostInfo> m_PowerPoolInfo;

/** Cached value of the power pool rate for this device. */
var transient float m_CachedPowerPoolCostPerSec;

simulated function bool UsesPower()
{
	return m_fDefaultPowerPoolCostPerSec > 0.0;
}

simulated function float GetPowerPool(TrPawn aPawn)
{
	local int i;

	// If we don't have a cached powerpool cost, cache one now.
	if( m_CachedPowerPoolCostPerSec == -1.0 )
	{
		// Cache powerpool lookup.
		if( m_PowerPoolInfo.Length > 0 )
		{
			// Look through m_PowerPoolInfo for a match.
			for( i = 0; i < m_PowerPoolInfo.Length; i++	)
			{
				if( m_PowerPoolInfo[i].m_TrFamilyInfo == aPawn.GetCurrCharClassInfo() ||
					ClassIsChildOf(aPawn.GetCurrCharClassInfo(), m_PowerPoolInfo[i].m_TrFamilyInfo) )
				{
					m_CachedPowerPoolCostPerSec = m_fDefaultPowerPoolCostPerSec;
				}
			}

			if( m_CachedPowerPoolCostPerSec == -1.0 )
			{
				// Still no match, go with default value.
				m_CachedPowerPoolCostPerSec = m_fDefaultPowerPoolCostPerSec;
			}
		}
		else
		{
			m_CachedPowerPoolCostPerSec = m_fDefaultPowerPoolCostPerSec;
		}

	}
	return m_CachedPowerPoolCostPerSec;
}

simulated function bool CanBeActive()
{
    //check for energy consumption
    local TrPawn trp;
	
    trp = TrPawn(Instigator);
    
    if (trp != None)
    {
		// Players can't use packs if they are not being controlled.
		if (trp.Controller == none)
			return false;

		if (GetPowerPool(trp) > 0)
		{
			return trp.m_fCurrentPowerPool > 0.99;
		}
    }

    return true;
}

simulated function ConsumePowerPool(float DeltaTime)
{
    local TrPawn trP;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float VMMultiplier;

	VMMultiplier = 1.0;

    trP = TrPawn(Instigator);
	if (trP != none)
	{
		// Apply skill/perk.
		TrPRI = trP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				VMMultiplier = 1.0 - VM.m_fPackEnergyCostBuffPct;
			}
		}

		TrP.ConsumePowerPool(GetPowerPool(trp) * DeltaTime * VMMultiplier);
		TrP.SyncClientCurrentPowerPool();
	}
}

simulated function ToggleActivate()
{
    GotoState('Activated');

    if( Role < ROLE_Authority )
    {
        ServerToggleActivate();
    }
}

reliable server function ServerToggleActivate()
{
    GotoState('Activated');
}

function ForceActivate()
{
	GotoState('Activated');
	ClientForceActive();
}

// In case the server forces the client to activate the pack.
reliable client function ClientForceActive()
{
	GotoState('Activated');
}

// In case the client is out of sync with the energy in the energy pool, force this device off.
reliable client function ClientForceInactive()
{
	GotoState('Inactive');
}

simulated state Activated
{
    simulated function Tick(float DeltaTime)
	{
        if (!CanBeActive())
        {
            GotoState('Inactive');
			
			if( Role == ROLE_Authority )
			{
				ClientForceInactive();
			}
        }
        else
        {
            ConsumePowerPool(DeltaTime);
        }
	}

    simulated event BeginState(Name PreviousStateName)
	{
        ProcessEffect(Instigator, 0, ET_ACTIVE);
        super.BeginState(PreviousStateName);
    }

    simulated event EndState(Name NextStateName)
    {
        ProcessEffect(Instigator, 0, ET_ACTIVE, true);
        super.EndState(NextStateName);
    }

	simulated function ToggleActivate()
	{
		GotoState('Inactive');

		if( Role < ROLE_Authority )
		{
			ServerToggleActivate();
		}
	}

	reliable server function ServerToggleActivate()
	{
		GotoState('Inactive');
	}

	simulated event bool IsFiring()
	{
		return true;
	}
}

// Packs should never fire.
simulated function StartFire(byte FireModeNum);
simulated function StopFire(byte FireModeNum);
simulated function SendToFiringState(byte FireModeNum);

/*
simulated function bool AllowSwitchTo(Weapon NewWeapon)
{
	return false;
}
*/

defaultproperties
{
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Pack:FireCameraShake'
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=60.000000),Rotation=(Pitch=0,Yaw=-5460,Roll=-2730),Scale=3.500000,CharacterLightingContrastFactor=0.800000)
   m_InGamePaperDollInfo=(Translation=(X=120.000000,Y=-50.000000,Z=55.000000),Rotation=(Pitch=4004,Yaw=-16384,Roll=0),Scale=4.000000)
   WeaponFireWaveForm=None
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
   Name="Default__TrDevice_Pack"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
