/**
 * 
 */
class TrDevice_AssaultRifle_MKD extends TrDevice_AssaultRifle;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_AssaultRifle:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_AssaultRifle:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=8406
   DBXPActivityId=150
   m_nLowAmmoWarning=6
   m_nCarriedAmmo=120
   m_nMaxCarriedAmmo=120
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_AssaultRifle_MKD:FireCameraShake'
   InfoPanelDescription="The custom rifle made famous by Marshal Gast, this weapon uses a larger caliber round but has a smaller clip size."
   InfoPanelDamage=3
   InfoPanelClipSize=4
   UpgradeDescription(0)="+40 AMMO"
   UpgradeDescription(2)="+40 AMMO"
   Upgrades(0)=(DatabaseItemId=8429,Modifications=((Value=40.000000)))
   Upgrades(1)=(DatabaseItemId=8430)
   Upgrades(2)=(DatabaseItemId=8431,Modifications=((Value=40.000000)))
   Upgrades(3)=(DatabaseItemId=8432)
   m_sContentDataClassName="TribesGameContent.TrDevice_AssaultRifle_MKD_Content"
   MaxAmmoCount=20
   AttachmentClass=Class'TribesGame.TrAttachment_AssaultRifle_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_AssaultRifle_MKD'
   WeaponProjectiles(1)=()
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
   ItemName="Gast's Rifle"
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
   Name="Default__TrDevice_AssaultRifle_MKD"
   ObjectArchetype=TrDevice_AssaultRifle'TribesGame.Default__TrDevice_AssaultRifle'
}
