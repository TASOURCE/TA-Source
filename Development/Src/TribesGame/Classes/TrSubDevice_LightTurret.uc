/**
 * Those are the devices used by deployables, owned by the deployable
 * The device is spawned in server side view Deployable postBeginPlay
 * Its owner is set to the TrDeployable and instigator is the TrPawn instigator of the Deployable
 */
class TrSubDevice_LightTurret extends TrSubDevice_Turret;

//The hit fx comes from damage type, need to define TrDamageType_TurretLaser etc so when player got hit, it will play proper fx

defaultproperties
{
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_fAccuracyLossOnShot=0.000000
   m_fAccuracyLossMax=0.000000
   m_fAccuracyCorrectionRate=0.000000
   m_nCarriedAmmo=1
   m_nMaxCarriedAmmo=1
   m_fReloadTime=1.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrSubDevice_LightTurret:FireCameraShake'
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrSubDevice_LightTurret:ForceFeedbackWaveformShooting1'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=165,G=225,R=255,A=255)
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_LightTurret'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.245000
   FireInterval(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_LightTurret'
   InstantHitDamageTypes(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrSubDevice_Turret:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrSubDevice_Turret:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrSubDevice_Turret:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrSubDevice_Turret:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrSubDevice_LightTurret"
   ObjectArchetype=TrSubDevice_Turret'TribesGame.Default__TrSubDevice_Turret'
}
