/**
 * 
 */
class TrDevice_ArmoredClaymore extends TrDevice_Claymore;

defaultproperties
{
   DBWeaponId=8240
   DBXPActivityId=212
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=53.000000),Rotation=(Pitch=-3640,Yaw=-4096,Roll=0),Scale=3.000000)
   m_InGamePaperDollInfo=(Scale=2.750000)
   InfoPanelDescription="The Motion Mine detonates in a 360 degree radius, but only on enemies traveling over 120kph. It has a slightly smaller range than a Claymore, but covers a larger area."
   InfoPanelRadius=5
   Upgrades(0)=(DatabaseItemId=8262)
   Upgrades(1)=(DatabaseItemId=8263)
   Upgrades(2)=(DatabaseItemId=8264)
   m_sContentDataClassName="TribesGameContent.TrDevice_ArmoredClaymore_Content"
   AttachmentClass=Class'TribesGame.TrAttachment_ArmoredClaymore'
   WeaponProjectiles(0)=Class'TribesGame.TrProj_ArmoredClaymore'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Motion Mine"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Claymore:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_ArmoredClaymore"
   ObjectArchetype=TrDevice_Claymore'TribesGame.Default__TrDevice_Claymore'
}
