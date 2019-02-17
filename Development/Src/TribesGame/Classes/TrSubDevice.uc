/**
 * Those are the devices used by deployables, owned by the deployable
 * The device is spawned in server side view Deployable postBeginPlay
 * Its owner is set to the TrDeployable and instigator is the TrPawn instigator of the Deployable
 */
class TrSubDevice extends TrDevice;

//Subdevice used by m_WeaponHolder of the deployable, should be reset just as how its owner being reset
function Reset()
{
    super(Actor).Reset();
}

//Assume subdevice owner is TrDeployable, and will use its m_Touched player as the valid target here
simulated function ImpactInfo CalcWeaponFire(vector StartTrace, vector EndTrace, optional out array<ImpactInfo> ImpactList, optional vector Extent)
{
    local ImpactInfo traceImpact;
    local TrDeployable depOwner;

    depOwner = TrTurretPawn(owner).m_OwnerDeployable;

    //`log(self@"CalcWeaponFire"@Owner@depOwner.m_TouchedPlayer);

    if (depOwner != None && depOwner.m_TouchedPlayer != None)
    {
        traceImpact.HitActor	= depOwner.m_TouchedPlayer;
	    traceImpact.HitLocation = depOwner.m_TouchedPlayer.Location;
	
	    // Add this hit to the ImpactList
	    ImpactList[ImpactList.Length] = traceImpact;
        return traceImpact;
    }
    
    return super.CalcWeaponFire(StartTrace, EndTrace, ImpactList, Extent);
}

defaultproperties
{
   m_FireCameraShake=CameraShake'TribesGame.Default__TrSubDevice:FireCameraShake'
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrSubDevice:ForceFeedbackWaveformShooting1'
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrSubDevice"
   ObjectArchetype=TrDevice'TribesGame.Default__TrDevice'
}
