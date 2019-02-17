/**
 * 
 */
class TrDevice_Blink extends TrDevice_Pack;

/** Local space impulse. */
var() Vector m_vBlinkImpulse;

/** Min Z impulse when blinking. */
var() float m_fMinZImpulse;

/** How much each blink costs for energy. */
var float m_fPowerPoolCost;

/** How long before this pack can be activated again. */
var float m_fCooldownTime;

/** Timestamp for last activation. */
var transient float m_fLastActivationTimestamp;

/** Speed at which the pawn will not get as strong of a boost. */
var float m_fSpeedCapThreshold;

/** Speed at which a smooth interpolation to the speed cap percent occurs. */
var float m_fSpeedCapThresholdStart;

/** Percent to reduce the effectiveness if at or above the speed cap. */
var float m_fSpeedCapPct;

simulated function ToggleActivate()
{
    local TrPawn aPawn;
	local TrPlayerController TrPC;

	// Do not activate if we are driving a vehicle or on a vehicle.
    aPawn = TrPawn(Instigator);
	if (aPawn == None || (aPawn.Base != none && aPawn.Base.IsA('TrVehicle')) || aPawn.DrivenVehicle != none)
    {
        return;
    }

	// Time the pack's ability to activate.
	if( m_fLastActivationTimestamp + m_fCooldownTime > WorldInfo.TimeSeconds )
	{
		return;
	}
	
	TrPC = TrPlayerController(aPawn.Controller);
	if( TrPC == none )
	{
		return;
	}

	TrPC.PerformBlink();

	m_fLastActivationTimestamp = WorldInfo.TimeSeconds;
}

simulated function OnBlink(float PercentEffectiveness)
{
	local float VMMultiplier;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local TrPawn aPawn;

    aPawn = TrPawn(Instigator);
	if( aPawn == none || aPawn.Controller == none )
    {
        return;
    }

	VMMultiplier = 1.0;

	// Apply skill/perk.
	TrPRI = TrPlayerReplicationInfo(aPawn.PlayerReplicationInfo);
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none )
		{
			VMMultiplier = 1.0 - VM.m_fPackEnergyCostBuffPct;
		}
	}

	aPawn.ConsumePowerPool(m_fPowerPoolCost * VMMultiplier);
	aPawn.SyncClientCurrentPowerPool();
}

simulated function vector GetBlinkImpulse()
{
	local Vector BlinkImpulse;
	local TrPawn aPawn;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	BlinkImpulse = default.m_vBlinkImpulse;

	aPawn = TrPawn(Instigator);
	if (aPawn != None )
    {
		// Apply skill/perk.
		TrPRI = TrPlayerReplicationInfo(aPawn.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				BlinkImpulse *= 1.0 + VM.m_fBlinkPackPotencyBuffPct;
			}
		}
    }

	return BlinkImpulse;
}

defaultproperties
{
   m_vBlinkImpulse=(X=1000.000000,Y=0.000000,Z=0.000000)
   m_fMinZImpulse=250.000000
   m_fPowerPoolCost=90.000000
   m_fCooldownTime=0.800000
   m_fSpeedCapThreshold=1800.000000
   m_fSpeedCapThresholdStart=1100.000000
   m_fSpeedCapPct=0.200000
   DBWeaponId=7822
   DBXPActivityId=230
   m_nIconIndex=6
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_Blink:FireCameraShake'
   InfoPanelDescription="The Thrust pack gives a Pathfinder crazy acceleration, using energy to launch the Pathfinder forward."
   UpgradeDescription(0)="-6% ENERGY\nDRAIN"
   UpgradeDescription(1)="INCREASE\nTHRUST\nPOTENCY"
   UpgradeDescription(2)="-6% ENERGY\nDRAIN"
   Upgrades(0)=(IconId=2,DatabaseItemId=7876,Modifications=((ModType=33,Value=0.060000)))
   Upgrades(1)=(IconId=1,DatabaseItemId=7877,Modifications=((ModType=42,Value=0.150000)))
   Upgrades(2)=(IconId=2,DatabaseItemId=7878,Modifications=((ModType=33,Value=0.060000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_BlinkPack_Content"
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Thrust"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Blink"
   ObjectArchetype=TrDevice_Pack'TribesGame.Default__TrDevice_Pack'
}
