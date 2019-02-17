class TrPerk_PotentialEnergy extends TrPerk;

defaultproperties
{
   DBWeaponId=8160
   DBXPActivityId=255
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_PotentialEnergy:FireCameraShake'
   InfoPanelDescription="When you take AOE damage, a portion of the damage is also converted into extra energy. (You still take full damage)."
   UpgradeDescription(0)="+10% TRANSFER\nRATIO"
   UpgradeDescription(1)="+10% TRANSFER\nRATIO"
   UpgradeDescription(2)="NOW WORKS\nON FALL\nDAMAGE"
   Upgrades(0)=(IconId=9,DatabaseItemId=8200,Modifications=((ModType=81,Value=0.005000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8201,Modifications=((ModType=81,Value=0.005000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8202,Modifications=((ModType=78,Value=1.000000)))
   BaseMod=(Modifications=((ModType=22,Value=1.000000),(ModType=81,Value=0.050000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_PotentialEnergy"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_PotentialEnergy:ForceFeedbackWaveformShooting1'
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
   ItemName="Potential Energy"
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
   Name="Default__TrPerk_PotentialEnergy"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
