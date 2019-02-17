/**
 * 
 */
class TrDevice_ChainGun_MKD extends TrDevice_ChainGun;

defaultproperties
{
   Begin Object Class=UTAmbientSoundComponent Name=ChaingunSpinSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ChainGun:ChaingunSpinSound'
      bAllowSpatialization=False
      Name="ChaingunSpinSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ChainGun:ChaingunSpinSound'
   End Object
   m_AudioComponentWeaponSpin=ChaingunSpinSound
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ChainGun:WeaponLoopSound'
      bAllowSpatialization=False
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDevice_ChainGun:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   DBWeaponId=8392
   DBXPActivityId=132
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_ChainGun_MKD:FireCameraShake'
   InfoPanelDescription="If the Chaingun is relentless, the Chain Cannon is the right hand of oblivion. While not technically a cannon, it's been tooled for larger rounds and more damage, resulting in the popular if incorrect name."
   InfoPanelDamage=5
   InfoPanelFireRate=7
   Upgrades(0)=(DatabaseItemId=8443)
   Upgrades(1)=(DatabaseItemId=8444)
   Upgrades(2)=(DatabaseItemId=8445)
   Upgrades(3)=(DatabaseItemId=8446)
   m_sContentDataClassName="TribesGameContent.TrDevice_ChainGun_MKD_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_ChainGun_MKD'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Chaingun_MKD'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.140000
   FireInterval(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ChainGun:FirstPersonMesh'
      FOV=55.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_ChainGun:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Chain Cannon"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ChainGun:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_ChainGun:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Components(0)=WeaponLoopSound
   Components(1)=ChaingunSpinSound
   Name="Default__TrDevice_ChainGun_MKD"
   ObjectArchetype=TrDevice_ChainGun'TribesGame.Default__TrDevice_ChainGun'
}
