/**
 * 
 */
class TrDevice_TCN4SMG_MKD extends TrDevice_TCN4SMG;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_TCN4SMG:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_TCN4SMG:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=8410
   DBXPActivityId=153
   m_nCarriedAmmo=160
   m_nMaxCarriedAmmo=160
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_TCN4SMG_MKD:FireCameraShake'
   InfoPanelDescription="This TCN4 modification was first seen used by Technician Titus Rockwind, who desired a weapon that had the stopping power to drop a Bioderm and not blow himself up in the process."
   InfoPanelDamage=4
   InfoPanelFireRate=8
   InfoPanelClipSize=4
   UpgradeDescription(0)="+40 AMMO"
   UpgradeDescription(2)="+40 AMMO"
   Upgrades(0)=(DatabaseItemId=8433,Modifications=((Value=40.000000)))
   Upgrades(1)=(DatabaseItemId=8434)
   Upgrades(2)=(DatabaseItemId=8435,Modifications=((Value=40.000000)))
   Upgrades(3)=(DatabaseItemId=8436)
   m_sContentDataClassName="TribesGameContent.TrDevice_TCN4SMG_MKD_Content"
   MaxAmmoCount=20
   AttachmentClass=Class'TribesGame.TrAttachment_TCN4SMG_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_TCN4SMG_MKD'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.150000
   FireInterval(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_TCN4SMG:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_TCN4SMG:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Rockwind TCN4"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_TCN4SMG:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_TCN4SMG:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Name="Default__TrDevice_TCN4SMG_MKD"
   ObjectArchetype=TrDevice_TCN4SMG'TribesGame.Default__TrDevice_TCN4SMG'
}
