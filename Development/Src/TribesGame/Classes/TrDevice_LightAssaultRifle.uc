/**
 * 
 */
class TrDevice_LightAssaultRifle extends TrDevice_AssaultRifle;

var int m_nShotBurstCount;
var int m_nShotsSoFar;
var transient bool m_bHoldingFire;
var float m_fBurtShotRefireTime;

function OnReloadComplete()
{
	m_nShotsSoFar = 0;

	super(UTWeapon).StopFire(0);
	super.OnReloadComplete();
}

simulated function StopFire(Byte FireModeNum)
{
	m_bHoldingFire = FALSE;
	m_bWantsToFire = FALSE;
}

simulated function StartFire(byte FireModeNum)
{
	m_bHoldingFire = true;

	if( IsTimerActive('RefireTimer') )
	{
		return;
	}

	Super.StartFire(FireModeNum);
}

simulated function RefireTimer()
{
	ClearTimer('RefireTimer');
	if( m_bHoldingFire )
	{
		StartFire(0);
	}
}

simulated function EndFire(byte FireModeNum)
{
	m_nShotsSoFar = 0;

	super.EndFire(FireModeNum);
}

simulated function FireAmmunition()
{
	if (m_nShotsSoFar < m_nShotBurstCount)
	{
		super.FireAmmunition();

		// Increment the shot count.
		m_nShotsSoFar++;
	}
	else
	{
		m_nShotsSoFar = 0;
		super(UTWeapon).StopFire(0);
		SetTimer(m_fBurtShotRefireTime, false, 'RefireTimer');
	}
}

simulated function PlayFiringSound()
{
	if( m_nShotsSoFar == 0 )
	{
		// Only play a sound for the first shot since the bursts are within the sound itself.
		Super.PlayFiringSound();
	}
}

reliable server function ServerStopFire(byte FireModeNum)
{
	// Only stop firing on the server if we have hit a full burst, never stop mid-burst.
	if (m_nShotsSoFar == 0)
	{
		super.ServerStopFire(FireModeNum);
	}
}

defaultproperties
{
   m_nShotBurstCount=3
   m_fBurtShotRefireTime=0.072000
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_AssaultRifle:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_AssaultRifle:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=7438
   DBXPActivityId=167
   m_bAllowFireWhileZoomed=True
   m_nLowAmmoWarning=5
   m_nCarriedAmmo=120
   m_nMaxCarriedAmmo=120
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_LightAssaultRifle:FireCameraShake'
   m_TinyWeaponsOffset=(X=9.000000,Y=1.000000,Z=-5.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=55.000000))
   InfoPanelDescription="The LAR fires a three-round burst, and the Scope allows it to engage targets at great distance."
   InfoPanelDamage=3
   InfoPanelRadius=-7
   InfoPanelClipSize=4
   UpgradeDescription(0)="+42 AMMO"
   UpgradeDescription(1)="+3 CLIP\nSIZE"
   UpgradeDescription(2)="+42 AMMO"
   Upgrades(0)=(DatabaseItemId=7866,Modifications=((ModType=37,Value=42.000000)))
   Upgrades(1)=(DatabaseItemId=7867,Modifications=((ModType=67,Value=3.000000)))
   Upgrades(2)=(DatabaseItemId=7868,Modifications=((ModType=37,Value=42.000000)))
   Upgrades(3)=(DatabaseItemId=7869,Modifications=((ModType=36)))
   m_sContentDataClassName="TribesGameContent.TrDevice_LightAssaultRifle_Content"
   MaxAmmoCount=21
   AttachmentClass=Class'TribesGame.TrAttachment_LightAssaultRifle'
   PlayerViewOffset=(X=5.000000,Y=5.000000,Z=-7.000000)
   SmallWeaponsOffset=(X=10.000000,Y=3.000000,Z=1.500000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_LightAssaultRifle'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.100000
   FireInterval(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AssaultRifle:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AssaultRifle:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Light Assault Rifle"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AssaultRifle:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AssaultRifle:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_LightAssaultRifle"
   ObjectArchetype=TrDevice_AssaultRifle'TribesGame.Default__TrDevice_AssaultRifle'
}
