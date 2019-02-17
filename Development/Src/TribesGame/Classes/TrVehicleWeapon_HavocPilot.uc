class TrVehicleWeapon_HavocPilot extends TrVehicleWeapon_BurstShot
	HideDropDown;

/** The movable decal for the bomb marker */
var MaterialInstanceConstant m_BombMarkerTemplate;
var transient MaterialInstanceConstant m_BombMarkerMIC;
var transient TrEffect_MovableDecal m_BombMarkerDecal;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		// Create the bomb marker MIC.
		if (m_BombMarkerMIC == none)
		{
			m_BombMarkerMIC = new(self) class'MaterialInstanceConstant';
			m_BombMarkerMIC.SetParent(m_BombMarkerTemplate);
		}

		// Create the bomb marker decal.
		if (m_BombMarkerDecal == none)
		{
			m_BombMarkerDecal = Spawn(class'TrEffect_MovableDecal', self, , , rotator(vect(0,0,-1)), , true); 
			m_BombMarkerDecal.Decal.SetGameplayRequired(true);
			m_BombMarkerDecal.Decal.Height = 256;
			m_BombMarkerDecal.Decal.Width = 256;
			m_BombMarkerDecal.Decal.FarPlane = 128;
			m_BombMarkerDecal.Decal.NearPlane = -128;
			m_BombMarkerDecal.Decal.SetDecalMaterial(m_BombMarkerMIC);
		}
	}
}

simulated event Destroyed()
{
	if (m_BombMarkerDecal != none)
	{
		m_BombMarkerDecal.Destroy();
	}

	super.Destroyed();
}

simulated event Tick(float DeltaTime)
{
	local class<TrProjectile> ProjectileClass;
	local rotator FireRotation;
	local vector BombLocation, FireLocation, DamageZRadius, TestHitLocation, TestHitNormal;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		// Get the projectile class and firing location/rotation.
		ProjectileClass = class<TrProjectile>(WeaponProjectiles[0]);
		GetFireStartLocationAndRotation(FireLocation, FireRotation);
		FireRotation = MyVehicle.GetWeaponAim(self);

		// Determine the state of the decal.
		// Reloading.
		if (m_fReloadTimeRemaining >= 0.0f)
		{
			m_BombMarkerMIC.SetScalarParameterValue('DecalState', 0.0f);
		}
		else
		{
			DamageZRadius.Z = ProjectileClass.default.DamageRadius;

			// Too low.
			if (Trace(TestHitLocation, TestHitNormal, MyVehicle.Location - DamageZRadius, MyVehicle.Location) != none)
			{
				m_BombMarkerMIC.SetScalarParameterValue('DecalState', -1.0f);
			}
			// Just right.
			else
			{
				m_BombMarkerMIC.SetScalarParameterValue('DecalState', 1.0f);
			}
		}

		// Determine the shot location and move the decal there.
		BombLocation = ProjectileClass.static.CalculateHitLocation(MyVehicle, vector(FireRotation), FireLocation, MyVehicle.MaxSpeed);
		m_BombMarkerDecal.SetLocation(BombLocation);
	}

	super.Tick(DeltaTime);
}

defaultproperties
{
   m_nBurstShotCount=4
   DBWeaponId=7409
   m_bCanZoom=True
   m_bEndZoomOnReload=False
   m_nLowAmmoWarning=2
   m_nCarriedAmmo=10000
   m_fReloadTime=8.000000
   FireTriggerTags(0)="MuzzleFlashPilot"
   FireTriggerTags(1)="MuzzleFlashPilot"
   MaxFinalAimAdjustment=0.500000
   VehicleClass=Class'TribesGame.TrVehicle_Havoc'
   bFastRepeater=True
   MaxAmmoCount=4
   ShotCost(0)=1
   ShotCost(1)=()
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrVehicleWeapon_HavocPilot:ForceFeedbackWaveformShooting1'
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   aimerror=750.000000
   WeaponFireTypes(0)=EWFT_Projectile
   WeaponFireTypes(1)=EWFT_None
   WeaponProjectiles(0)=Class'TribesGame.TrProj_HavocPilot'
   WeaponProjectiles(1)=()
   FireInterval(0)=0.250000
   FireInterval(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon_BurstShot:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon_BurstShot:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon_BurstShot:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrVehicleWeapon_BurstShot:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrVehicleWeapon_HavocPilot"
   ObjectArchetype=TrVehicleWeapon_BurstShot'TribesGame.Default__TrVehicleWeapon_BurstShot'
}
