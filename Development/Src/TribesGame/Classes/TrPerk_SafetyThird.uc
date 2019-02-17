class TrPerk_SafetyThird extends TrPerk;

defaultproperties
{
   DBWeaponId=8163
   DBXPActivityId=245
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_SafetyThird:FireCameraShake'
   InfoPanelDescription="+1 Belt Ammo. (Grenades, Mines, Etc)."
   UpgradeDescription(0)="+5% BELT ITEM\nRADIUS"
   UpgradeDescription(1)="+5% BELT ITEM\nRADIUS"
   UpgradeDescription(2)="+1 MINE\nDEPLOYED"
   Upgrades(0)=(IconId=9,DatabaseItemId=8212,Modifications=((ModType=55,Value=0.050000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8213,Modifications=((ModType=55,Value=0.050000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8214,Modifications=((ModType=14,Value=1.000000)))
   BaseMod=(Modifications=((ModType=29,Value=1.000000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_SafetyThird"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_SafetyThird:ForceFeedbackWaveformShooting1'
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
   ItemName="Safety Third"
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
   Name="Default__TrPerk_SafetyThird"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
