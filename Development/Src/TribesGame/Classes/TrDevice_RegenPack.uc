/**
 *
 */
class TrDevice_RegenPack extends TrDevice_Pack;

defaultproperties
{
   DBWeaponId=7831
   DBXPActivityId=228
   m_EffectInfo(0)=(effectClass=Class'TribesGame.TrEffect_RegenBuff',Type=ET_Equip)
   m_nIconIndex=13
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_RegenPack:FireCameraShake'
   InfoPanelDescription="Reduces the delay until Health Regeneration starts when out of combat."
   UpgradeDescription(0)="-3% REGENERATION\nDELAY"
   UpgradeDescription(1)="-3% REGENERATION\nDELAY"
   UpgradeDescription(2)="-3% REGENERATION\nDELAY"
   Upgrades(0)=(IconId=10,DatabaseItemId=8089,Modifications=((ModType=49,Value=0.030000)))
   Upgrades(1)=(IconId=10,DatabaseItemId=8090,Modifications=((ModType=49,Value=0.030000)))
   Upgrades(2)=(IconId=10,DatabaseItemId=8091,Modifications=((ModType=49,Value=0.030000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_RegenPack_Content"
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
   ItemName="Health Regen Pack"
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
   Name="Default__TrDevice_RegenPack"
   ObjectArchetype=TrDevice_Pack'TribesGame.Default__TrDevice_Pack'
}
