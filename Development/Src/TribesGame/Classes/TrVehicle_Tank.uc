class TrVehicle_Tank extends TrVehicle
	notplaceable
	abstract;

/**
 * This is some crazy replication magic! See https://udn.epicgames.com/Three/PropertyOverview, AUDKVehicle::SeatWeaponRotation, and UTVehicle.uc.
 *  the 'XXX' in XXXFlashLocation must match the TurretVarPrefix defined in a non-pilot/driver seat.
 */
var repnotify vector GunnerFlashLocation;
var repnotify rotator GunnerWeaponRotation;
var	repnotify byte GunnerFlashCount;
var repnotify byte GunnerFiringMode;

/** Camera shake when the main gun fires. */
var() editinline CameraShake m_FireCameraShake;

/** How far players around this tank will shake. */
var() float m_CameraShakeEffectiveRadius;

replication
{
	if (bNetDirty && Role == ROLE_Authority)
		GunnerFlashLocation;

	if ((!IsSeatControllerReplicationViewer(1) || bDemoRecording) && Role == ROLE_Authority)
		GunnerFlashCount, GunnerFiringMode, GunnerWeaponRotation;
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    local int i, j;

	super.PostInitAnimTree(SkelComp);

    if( SkelComp == Mesh )
    {
		// Cache the list of recoil controllers.
		for(i = 0; i < Seats.Length; i++ )
		{
			for(j = 0; j < Seats[i].m_TurretRecoilControlNames.Length; j++ )
			{
				Seats[i].m_TurretRecoilControls.AddItem(GameSkelCtrl_Recoil(SkelComp.FindSkelControl(Seats[i].m_TurretRecoilControlNames[j])));
			}
		}
    }
}

simulated function VehicleWeaponFireEffects(vector HitLocation, int SeatIndex)
{
	local TrPlayerController PC;
	local int i;
	local float Dist;

	super.VehicleWeaponFireEffects(HitLocation, SeatIndex);

	// Fire the turret recoil controls.
	for(i = 0; i < Seats[SeatIndex].m_TurretRecoilControls.Length; i++ )
	{
		if (Seats[SeatIndex].m_TurretRecoilControls[i] != none)
		{
			Seats[SeatIndex].m_TurretRecoilControls[i].bPlayRecoil = true;
		}
	}

	if( SeatIndex == 0 )
	{
		PC = TrPlayerController(Controller);
		if( PC != none )
		{
			PC.PlayCameraShake(,,m_FireCameraShake);
		}
		else
		{
			PC = TrPlayerController(GetALocalPlayerController());
			if( PC != none )
			{
				Dist = VSize(PC.ViewTarget.Location - Location);
				PC.PlayCameraShake(,FClamp(1.0 - Dist/m_CameraShakeEffectiveRadius, 0.0, 1.0), m_FireCameraShake);
			}
		}
	}
}

simulated function ProcessViewRotationBasedOnSeat(int SeatIndex, float DeltaTime, out rotator out_ViewRotation, out rotator out_DeltaRot)
{
	local int i, MaxDelta;
	local float MaxDeltaDegrees, SeatViewPitchMax, SeatViewPitchMin;

	if( !(SeatIndex < Seats.Length) )
	{
		return;
	}

	// Clamp player rotation to turret rotation speed
	for (i = 0; i < Seats[SeatIndex].TurretControllers.length; i++)
	{
		MaxDeltaDegrees = FMax(MaxDeltaDegrees, Seats[SeatIndex].TurretControllers[i].LagDegreesPerSecond);
	}
	
	if (MaxDeltaDegrees > 0.0)
	{
		MaxDelta = int(MaxDeltaDegrees * 182.0444 * DeltaTime);
		out_DeltaRot.Pitch = (out_DeltaRot.Pitch >= 0) ? Min(out_DeltaRot.Pitch, MaxDelta) : Max(out_DeltaRot.Pitch, -MaxDelta);
		out_DeltaRot.Yaw = (out_DeltaRot.Yaw >= 0) ? Min(out_DeltaRot.Yaw, MaxDelta) : Max(out_DeltaRot.Yaw, -MaxDelta);
		out_DeltaRot.Roll = (out_DeltaRot.Roll >= 0) ? Min(out_DeltaRot.Roll, MaxDelta) : Max(out_DeltaRot.Roll, -MaxDelta);
	}

	// Add Delta Rotation
	out_ViewRotation	+= out_DeltaRot;
	out_DeltaRot		 = rot(0,0,0);

	// Limit Player View Pitch
	SeatViewPitchMin = Seats[SeatIndex].ViewPitchMin;
	SeatViewPitchMax = Seats[SeatIndex].ViewPitchMax;
	out_ViewRotation = LimitViewRotation(out_ViewRotation, SeatViewPitchMin, SeatViewPitchMax);
}

simulated function Rotator LimitViewRotation(Rotator LimitViewRotation, float LimitViewPitchMin, float LimitViewPitchMax)
{
	local int BaseViewPitch;
	local Rotator OrigRot,AdjustedRot;

	// Calculate the difference in views.
	OrigRot = Normalize(Rotation);
	AdjustedRot = Normalize(LimitViewRotation);
	AdjustedRot = Normalize(AdjustedRot - OrigRot);

	// Calculate the pitch to use for height limitation based on our in-line yaw.
	BaseViewPitch = Rotation.Pitch + (-Rotation.Pitch - Rotation.Pitch) * (Abs(AdjustedRot.Yaw) / 32768.0);

	LimitViewRotation.Pitch = LimitViewRotation.Pitch & 65535;

    if( LimitViewRotation.Pitch > (BaseViewPitch+LimitViewPitchMax) &&
		LimitViewRotation.Pitch < (BaseViewPitch+65535+LimitViewPitchMin) )
	{
		if( LimitViewRotation.Pitch < 32768 )
		{
			LimitViewRotation.Pitch = BaseViewPitch + LimitViewPitchMax;
		}
		else
		{
			LimitViewRotation.Pitch = BaseViewPitch + 65535 + LimitViewPitchMin;
		}
	}

	return LimitViewRotation;
}

defaultproperties
{
   m_FireCameraShake=CameraShake'TribesGame.Default__TrVehicle_Tank:TankFireShake'
   m_CameraShakeEffectiveRadius=1400.000000
   bNoZSmoothing=False
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   MaxDesireability=0.600000
   SpawnRadius=125.000000
   bTakeWaterDamageWhileDriving=False
   MaxGroundEffectDist=256.000000
   GroundEffectDistParameterName="DistToGround"
   CustomGravityScaling=0.800000
   ObjectiveGetOutDist=750.000000
   COMOffset=(X=0.000000,Y=0.000000,Z=-40.000000)
   bStayUpright=True
   bCanFlip=True
   StayUprightRollResistAngle=5.000000
   StayUprightPitchResistAngle=5.000000
   StayUprightStiffness=450.000000
   StayUprightDamping=20.000000
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'TribesGame.Default__TrVehicle_Tank:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'TribesGame.Default__TrVehicle_Tank:MyStayUprightConstraintInstance'
   UprightLiftStrength=4000.000000
   UprightTorqueStrength=400.000000
   bTurnInPlace=True
   bSeparateTurretFocus=True
   bFollowLookDir=True
   bScriptedRise=True
   ExitRadius=160.000000
   MomentumMult=3.200000
   bCanStrafe=True
   MeleeRange=-100.000000
   GroundSpeed=800.000000
   AirSpeed=800.000000
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle:SVehicleMesh'
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_Tank:MyLightEnvironment'
      RBChannel=RBCC_Vehicle
      MotionBlurScale=0.000000
      bAllowAmbientOcclusion=False
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      bNotifyRigidBodyCollision=True
      RBCollideWithChannels=(Default=True,Vehicle=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      ScriptRigidBodyCollisionThreshold=250.000000
      Name="SVehicleMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle:SVehicleMesh'
   End Object
   Mesh=SVehicleMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrVehicle:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrVehicle:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   Components(2)=MyLightEnvironment
   CollisionComponent=SVehicleMesh
   Name="Default__TrVehicle_Tank"
   ObjectArchetype=TrVehicle'TribesGame.Default__TrVehicle'
}
