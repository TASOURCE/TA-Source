class TrPerk_CloseCombat extends TrPerk;

defaultproperties
{
   DBWeaponId=8156
   DBXPActivityId=240
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_CloseCombat:FireCameraShake'
   InfoPanelDescription="Provides 20% Damage Reduction from all melee attacks, and upgrades for double Backstab damage."
   UpgradeDescription(0)="x2 MELEE\nBACKSTAB\nDAMAGE"
   UpgradeDescription(1)="+20% MELEE\nDAMAGE\nREDUCTION"
   UpgradeDescription(2)="+20% MELEE\nDAMAGE\nREDUCTION"
   Upgrades(0)=(IconId=9,DatabaseItemId=8194,Modifications=((ModType=58,Value=1.000000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8195,Modifications=((ModType=52,Value=0.200000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8196,Modifications=((ModType=52,Value=0.200000)))
   BaseMod=(Modifications=((ModType=52,Value=0.200000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_CloseCombat"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_CloseCombat:ForceFeedbackWaveformShooting1'
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
   ItemName="Close Combat"
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
   Name="Default__TrPerk_CloseCombat"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
