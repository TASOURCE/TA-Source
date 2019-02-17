/**
 * 
 */
class TrDevice_HighSpeedStealth extends TrDevice_Stealth;

defaultproperties
{
   DBWeaponId=8243
   m_nIconIndex=1
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_HighSpeedStealth:FireCameraShake'
   Upgrades(0)=(DatabaseItemId=8271)
   Upgrades(1)=(DatabaseItemId=8272)
   Upgrades(2)=(DatabaseItemId=8273)
   m_sContentDataClassName="TribesGameContent.TrDevice_HighSpeedStealth_Content"
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Stealth:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Stealth:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Stealth:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Stealth:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_HighSpeedStealth"
   ObjectArchetype=TrDevice_Stealth'TribesGame.Default__TrDevice_Stealth'
}
