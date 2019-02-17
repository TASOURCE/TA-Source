class TrVehicleWeapon_HERCPilot extends TrVehicleWeapon
	HideDropDown;

defaultproperties
{
   DBWeaponId=7403
   m_nReticuleIndex=1
   MaxFinalAimAdjustment=0.500000
   VehicleClass=Class'TribesGame.TrVehicle_HERC'
   bFastRepeater=True
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrVehicleWeapon_HERCPilot:ForceFeedbackWaveformShooting1'
   aimerror=750.000000
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponProjectiles(0)=Class'TribesGame.TrProj_HERCPilot'
   WeaponProjectiles(1)=()
   FireInterval(0)=5.000000
   FireInterval(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon:PickupMesh'
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
      Name="PickupMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrVehicleWeapon_HERCPilot"
   ObjectArchetype=TrVehicleWeapon'TribesGame.Default__TrVehicleWeapon'
}
