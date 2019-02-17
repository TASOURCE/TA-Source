/**
 * 
 */
class TrDevice_SAP20 extends TrDevice_PhaseRifle;

defaultproperties
{
   m_MaxEnergyConsumed=95.000000
   DBWeaponId=8254
   DBXPActivityId=268
   m_TinyWeaponsOffset=(X=13.000000,Y=4.500000,Z=-4.500000)
   InfoPanelDescription="The SAP20 deals more base damage than the Phase Rifle, but consumes more energy and has fewer charges before a reload is required."
   InfoPanelDamage=7
   InfoPanelFireRate=2
   Upgrades(0)=(DatabaseItemId=8305)
   Upgrades(1)=(DatabaseItemId=8306)
   Upgrades(2)=(IconId=4,DatabaseItemId=8307)
   Upgrades(3)=(DatabaseItemId=8308)
   m_sContentDataClassName="TribesGameContent.TrDevice_SAP20_Content"
   MaxAmmoCount=2
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SAP20:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_SAP20'
   PlayerViewOffset=(X=4.000000,Y=1.200000,Z=-4.500000)
   SmallWeaponsOffset=(X=8.000000,Y=4.000000,Z=1.500000)
   InstantHitDamage(0)=100.000000
   InstantHitDamage(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_SAP20'
   InstantHitDamageTypes(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_PhaseRifle:FirstPersonMesh'
      FOV=60.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_PhaseRifle:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="SAP20"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_PhaseRifle:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_PhaseRifle:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_SAP20"
   ObjectArchetype=TrDevice_PhaseRifle'TribesGame.Default__TrDevice_PhaseRifle'
}
