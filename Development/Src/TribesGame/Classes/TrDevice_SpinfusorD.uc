/**
 * 
 */
class TrDevice_SpinfusorD extends TrDevice_Spinfusor;

defaultproperties
{
   DBWeaponId=7446
   DBXPActivityId=164
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_SpinfusorD:FireCameraShake'
   m_TinyWeaponsOffset=(X=9.000000,Y=3.000000,Z=-4.000000)
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=55.000000),Scale=2.650000)
   InfoPanelDescription="The Spinfusor MKD has been modified for a larger radius."
   InfoPanelDamage=6
   InfoPanelRadius=5
   Upgrades(0)=(DatabaseItemId=8076,Modifications=((ModType=37)))
   Upgrades(1)=(DatabaseItemId=8077,Modifications=((ModType=73)))
   Upgrades(2)=(DatabaseItemId=8078,Modifications=((ModType=37)))
   m_sContentDataClassName="TribesGameContent.TrDevice_SpinfusorD_Content"
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice_SpinfusorD:ForceFeedbackShootingMedium'
   AttachmentClass=Class'TribesGame.TrAttachment_SpinfusorD'
   MuzzleFlashColor=(B=200,G=255,R=170,A=255)
   MuzzleFlashLightClass=Class'TribesGame.TrMortarMuzzleFlashLight'
   PlayerViewOffset=(X=-1.000000,Y=0.000000,Z=-6.000000)
   SmallWeaponsOffset=(X=4.000000,Y=2.000000,Z=2.000000)
   WeaponProjectiles(0)=Class'TribesGame.TrProj_SpinfusorD'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Spinfusor MKD"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Spinfusor:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_SpinfusorD"
   ObjectArchetype=TrDevice_Spinfusor'TribesGame.Default__TrDevice_Spinfusor'
}
