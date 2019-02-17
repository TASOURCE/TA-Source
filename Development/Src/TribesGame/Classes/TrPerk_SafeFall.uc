class TrPerk_SafeFall extends TrPerk;

defaultproperties
{
   DBWeaponId=8162
   DBXPActivityId=244
   m_FireCameraShake=CameraShake'TribesGame.Default__TrPerk_SafeFall:FireCameraShake'
   InfoPanelDescription="Reduces Fall Damage by 50%."
   UpgradeDescription(0)="+25% FALL\nREDUCTION"
   UpgradeDescription(1)="+25% FALL\nREDUCTION"
   UpgradeDescription(2)="IMMUNE TO\nVEHICLE\nRUNOVER"
   Upgrades(0)=(IconId=9,DatabaseItemId=8176,Modifications=((ModType=20,Value=0.250000)))
   Upgrades(1)=(IconId=9,DatabaseItemId=8177,Modifications=((ModType=20,Value=0.250000)))
   Upgrades(2)=(IconId=9,DatabaseItemId=8178,Modifications=((ModType=70,Value=1.000000)))
   BaseMod=(Modifications=((ModType=20,Value=0.500000)))
   m_sContentDataClassName="TribesGameContent.TrDeviceContentData_Perk_SafeFall"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPerk_SafeFall:ForceFeedbackWaveformShooting1'
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
   ItemName="Safe Fall"
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
   Name="Default__TrPerk_SafeFall"
   ObjectArchetype=TrPerk'TribesGame.Default__TrPerk'
}
