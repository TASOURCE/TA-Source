/**
 * Those are the devices used by deployables, owned by the deployable
 * The device is spawned in server side view Deployable postBeginPlay
 * Its owner is set to the TrDeployable and instigator is the TrPawn instigator of the Deployable
 */
class TrSubDevice_Turret extends TrSubDevice;

simulated function vector GetPhysicalFireStartLoc(optional vector AimDir)
{
    return TrTurretPawn(Instigator).m_OwnerDeployable.GetWeaponStartTraceLocation();
}

simulated function float GetFireInterval(byte FireModeNum)
{
	local float BaseInterval;
	local TrDeployable_Turret TurretOwner;

	// Get the base firing rate.
	BaseInterval = super.GetFireInterval(FireModeNum);

	// If we don't have a turret owner, base interval.
	TurretOwner = TrDeployable_Turret(Owner);
	if (TurretOwner == none)
		return BaseInterval;

	// Modify our firing rate by the delta value.
	return BaseInterval - TurretOwner.m_fDeltaFireInterval;
}

defaultproperties
{
   m_FireCameraShake=CameraShake'TribesGame.Default__TrSubDevice_Turret:FireCameraShake'
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrSubDevice_Turret:ForceFeedbackWaveformShooting1'
   InstantHitDamage(0)=150.000000
   InstantHitDamage(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrSubDevice:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrSubDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrSubDevice:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrSubDevice:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrSubDevice_Turret"
   ObjectArchetype=TrSubDevice'TribesGame.Default__TrSubDevice'
}
