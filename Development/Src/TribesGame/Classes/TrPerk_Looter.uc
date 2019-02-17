class TrPerk_Looter extends TrPerk;

defaultproperties
{
   DBWeaponId=8158
   DBXPActivityId=241
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_Looter:FireCameraShake'
   InfoPanelDescription="Get 50% more ammo from ammo drops."
   UpgradeDescription(0)="+25% AMMO\nFROM DROPS"
   UpgradeDescription(1)="+25% AMMO\nFROM DROPS"
   UpgradeDescription(2)="+1 BELT AMMO\nFROM DROPS"
   Upgrades(0)=(IconId=9,DatabaseItemId=8185,Modifications=((ModType=34,Value=0.250000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8186,Modifications=((ModType=34,Value=0.250000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8187,Modifications=((ModType=61,Value=1.000000)))
   BaseMod=(Modifications=((ModType=34,Value=0.500000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_Looter"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_Looter:ForceFeedbackWaveformShooting1'
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPerk:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPerk:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Looter"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrPerk:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrPerk:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrPerk_Looter"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
