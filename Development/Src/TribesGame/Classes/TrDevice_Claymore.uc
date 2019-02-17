/**
 * 
 */
class TrDevice_Claymore extends TrDevice_AutoFire;

/** Manipulates world Z placement of the projectile. */
var() float m_fWorldZPlacementOffset;

simulated function vector GetPhysicalFireStartLoc(optional vector AimDir)
{
	local Vector V;

	V = super.GetPhysicalFireStartLoc(AimDir);

	V.Z += m_fWorldZPlacementOffset;

	return V;
}

/**
 * Fires a projectile.
 * Spawns the projectile, but also increment the flash count for remote client effects.
 * Network: Local Player and Server
 */
simulated function Projectile ProjectileFire()
{
	local vector		RealStartLoc;
	local TrProjectile	SpawnedProjectile;
	local Rotator       R;

	// tell remote clients that we fired, to trigger effects
	IncrementFlashCount();

	if( Role == ROLE_Authority )
	{
		// this is the location where the projectile is spawned.
		RealStartLoc = GetPhysicalFireStartLoc();

		// Spawn projectile
		R = Instigator.Rotation;
		R.Pitch = 0;
		R.Roll = 0;
		SpawnedProjectile = TrProjectile(Spawn(GetProjectileClass(),,, RealStartLoc, R));
		if( SpawnedProjectile != None && !SpawnedProjectile.bDeleteMe )
		{
			SpawnedProjectile.InitProjectile( Vector(GetAdjustedAim( RealStartLoc )) );
		}

		DestroyOldestProjectileOverLimit(SpawnedProjectile);

		// Return it up the line
		return SpawnedProjectile;
	}

	return None;
}

defaultproperties
{
   m_fWorldZPlacementOffset=-50.000000
   m_fPullPinTime=0.200000
   DBWeaponId=7421
   DBXPActivityId=213
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_nCarriedAmmo=1
   m_nMaxCarriedAmmo=1
   m_nIconIndex=20
   m_MainMenuPaperDollInfo=(Rotation=(Pitch=0,Yaw=0,Roll=0),Scale=1.500000)
   m_InGamePaperDollInfo=(Rotation=(Pitch=0,Yaw=0,Roll=0),Scale=1.500000)
   InfoPanelDescription="Claymores are directional mines very effective at base defense."
   InfoPanelDamage=8
   InfoPanelRadius=6
   InfoPanelFireRate=5
   InfoPanelClipSize=-1
   UpgradeDescription(0)="+1 AMMO"
   UpgradeDescription(1)="+10% RADIUS"
   UpgradeDescription(2)="+20% DAMAGE\nVERSUS\nARMORED"
   Upgrades(0)=(IconId=4,DatabaseItemId=7943,Modifications=((ModType=29,Value=1.000000)))
   Upgrades(1)=(IconId=7,DatabaseItemId=7944,Modifications=((ModType=55,Value=0.100000)))
   Upgrades(2)=(IconId=5,DatabaseItemId=7945,Modifications=((ModType=68,Value=0.200000)))
   m_sContentDataClassName="TribesGameContent.TrDevice_Claymore_Content"
   ShotCost(0)=1
   ShotCost(1)=()
   AttachmentClass=Class'TribesGame.TrAttachment_Claymore'
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=()
   WeaponProjectiles(0)=Class'TribesGame.TrProj_Claymore'
   WeaponProjectiles(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:FirstPersonMesh'
      FOV=65.000000
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Scale=1.500000
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Claymore Mine"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Claymore"
   ObjectArchetype=TrDevice_AutoFire'TribesGame.Default__TrDevice_AutoFire'
}
