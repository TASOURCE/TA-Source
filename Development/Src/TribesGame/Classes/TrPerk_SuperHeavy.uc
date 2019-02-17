/**
 * 
 */
class TrPerk_SuperHeavy extends TrPerk;

defaultproperties
{
   DBWeaponId=8166
   DBXPActivityId=258
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_SuperHeavy:FireCameraShake'
   InfoPanelDescription="Increases mass by 40%, making it harder to be knocked back when flag blocking. Final unlock damages enemies that run into you."
   UpgradeDescription(0)="+20% MASS"
   UpgradeDescription(1)="+20% MASS"
   UpgradeDescription(2)="BODY BLOCK\nCAUSES\nDAMAGE"
   Upgrades(0)=(IconId=9,DatabaseItemId=8197,Modifications=((ModType=3,Value=0.200000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8198,Modifications=((ModType=3,Value=0.200000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8199,Modifications=((ModType=7,Value=1.000000)))
   BaseMod=(Modifications=((ModType=3,Value=0.400000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_SuperHeavy"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_SuperHeavy:ForceFeedbackWaveformShooting1'
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
   ItemName="Super Heavy"
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
   Name="Default__TrPerk_SuperHeavy"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
