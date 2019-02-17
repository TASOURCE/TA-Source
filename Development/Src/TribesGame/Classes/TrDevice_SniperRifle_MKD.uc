/**
 * Also known as the BXT1
 */
class TrDevice_SniperRifle_MKD extends TrDevice_SniperRifle;

defaultproperties
{
   r_fAimChargeTime=2.800000
   Begin Object Class=AudioComponent Name=ScopeChargeSound Archetype=AudioComponent'TribesGame.Default__TrDevice_SniperRifle:ScopeChargeSound'
      Name="ScopeChargeSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDevice_SniperRifle:ScopeChargeSound'
   End Object
   m_ScopeChargeSound=ScopeChargeSound
   DBWeaponId=8407
   DBXPActivityId=126
   InfoPanelDescription="The BXT1-A does more damage the longer you are in Scope. This variant has a slower charge time, but can fire more shots before reloading."
   InfoPanelFireRate=1
   InfoPanelClipSize=2
   UpgradeDescription(0)="+10 AMMO"
   Upgrades(0)=(DatabaseItemId=8421,Modifications=((Value=10.000000)))
   Upgrades(1)=(DatabaseItemId=8422)
   Upgrades(2)=(DatabaseItemId=8423)
   Upgrades(3)=(DatabaseItemId=8424)
   m_sContentDataClassName="TribesGameContent.TrDevice_SniperRifle_MKD_Content"
   MaxAmmoCount=5
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SniperRifle_MKD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_SniperRifle_MKD'
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_SniperRifle_MKD'
   InstantHitDamageTypes(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_SniperRifle:FirstPersonMesh'
      FOV=60.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_SniperRifle:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="BXT-1A Rifle"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_SniperRifle:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_SniperRifle:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=ScopeChargeSound
   Name="Default__TrDevice_SniperRifle_MKD"
   ObjectArchetype=TrDevice_SniperRifle'TribesGame.Default__TrDevice_SniperRifle'
}
