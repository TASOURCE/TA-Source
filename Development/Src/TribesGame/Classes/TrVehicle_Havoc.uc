class TrVehicle_Havoc extends TrVehicle_BaseFlying
	notplaceable;

/** The pitch angle to aim the bomber */
var float m_fPitchAimAngle;
var float m_fPitchAimAngleRotation;

simulated function PostBeginPlay()
{
	m_fPitchAimAngleRotation = m_fPitchAimAngle * (32768.f / 180.f);
	super.PostBeginPlay();
}

function rotator GetWeaponAim(UTVehicleWeapon VWeapon)
{
	local rotator AimAngle;

	AimAngle.Yaw = Rotation.Yaw;
	AimAngle.Pitch = m_fPitchAimAngleRotation;
	AimAngle.Roll = 0;

	return AimAngle;
}

defaultproperties
{
   m_fPitchAimAngle=-45.000000
   LeftEngineParticles(0)=(SocketToAttach="Thruster_FL")
   LeftEngineParticles(1)=(SocketToAttach="Thruster_L")
   MidEngineParticles(0)=(bIsAttachedToBoost=True,SocketToAttach="Thruster_C")
   RightEngineParticles(0)=(SocketToAttach="Thruster_FR")
   RightEngineParticles(1)=(SocketToAttach="Thruster_R")
   LeftContrailParticles(0)=(SocketToAttach="FX_ConTrail_L")
   RightContrailParticles(0)=(SocketToAttach="FX_ConTrail_R")
   m_bFreeLook=True
   m_bCanAutoLevelVehicle=False
   m_bUsesArmoredMultiplier=True
   m_VehicleType=VEHICLE_Havoc
   m_fBoostMultiplier=1.500000
   r_fMaxPowerPool=70.000000
   m_fPowerPoolRechargeRate=7.000000
   m_fWallMaxDamage=800.000000
   Begin Object Class=UTAmbientSoundComponent Name=BoostLoopSound
      Name="BoostLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTAmbientSoundComponent'
   End Object
   m_AudioComponentBoostSound=BoostLoopSound
   m_sName="Havoc"
   m_DustEffects(0)=(MaterialType="Dirt")
   m_DustEffects(1)=(MaterialType="Grass")
   m_DustEffects(2)=(MaterialType="Snow")
   m_DustEffects(3)=(MaterialType="Water")
   bMustBeUpright=False
   bDropDetailWhenDriving=True
   bFindGroundExit=False
   bRotateCameraUnderVehicle=True
   bNoZSmoothing=False
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_BaseFlying:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_BaseFlying:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   HornSounds(0)=None
   HornSounds(1)=None
   LookSteerSensitivity=5.000000
   LookSteerDamping=0.070000
   LookSteerDeadZone=500.000000
   IconCoords=(U=989.000000,V=24.000000,UL=43.000000,VL=48.000000)
   DefaultFOV=90.000000
   CameraLag=0.020000
   bEjectKilledBodies=True
   bHomingTarget=True
   bEjectPassengersWhenFlipped=False
   bTakeWaterDamageWhileDriving=False
   bUseAlternatePaths=False
   UpsideDownDamagePerSec=0.000000
   MaxGroundEffectDist=256.000000
   GroundEffectDistParameterName="DistToGround"
   Seats(0)=(GunClass=Class'TribesGame.TrVehicleWeapon_HavocPilot',GunSocket=("PilotGun01"),WeaponEffects=((SocketName="PilotGun01",Offset=(X=-35.000000,Y=-3.000000,Z=0.000000),Scale3D=(X=3.000000,Y=6.000000,Z=6.000000)),(SocketName="PilotGun02",Offset=(X=-35.000000,Y=-3.000000,Z=0.000000),Scale3D=(X=3.000000,Y=6.000000,Z=6.000000))),CameraTag="ViewSocket",CameraBaseOffset=(X=20.000000,Y=0.000000,Z=-25.000000),CameraOffset=-700.000000,CameraZoomTag="ViewSocket",bSeatVisible=True,SeatBone="Seat_Driver",SeatSocket="Seat_Driver",DriverDamageMult=0.500000,SeatIconPOS=(X=0.460000,Y=0.450000),m_SeatAnimInfo=((bClearAnimSet=True)))
   Seats(1)=(CameraTag="ViewSocket",CameraBaseOffset=(X=-700.000000,Y=0.000000,Z=0.000000),ViewPitchMin=-16500.000000,ViewPitchMax=18000.000000,bSeatVisible=True,SeatBone="passengerFrontLeft",SeatOffset=(X=29.000000,Y=0.000000,Z=32.000000),SeatSocket="Seat_2",DriverDamageMult=0.500000,SeatIconPOS=(X=0.460000,Y=0.450000),m_SeatAnimInfo=(,(bIsArmorDependent=True,ArmorType=2)),m_bAttachPawnDirectly=True,m_fViewYawLimit=18500.000000,m_vRidingPassengerMeshOffset=(X=-25.000000,Y=0.000000,Z=-23.000000),m_vIdealExitLocation=(X=0.000000,Y=-75.000000,Z=20.000000))
   Seats(2)=(CameraTag="ViewSocket",CameraBaseOffset=(X=-500.000000,Y=0.000000,Z=0.000000),ViewPitchMin=-16500.000000,ViewPitchMax=18000.000000,bSeatVisible=True,SeatBone="passengerFrontRight",SeatOffset=(X=29.000000,Y=0.000000,Z=32.000000),SeatSocket="Seat_3",DriverDamageMult=0.500000,SeatIconPOS=(X=0.460000,Y=0.450000),m_SeatAnimInfo=(,(bIsArmorDependent=True,ArmorType=2)),m_bAttachPawnDirectly=True,m_fViewYawLimit=18500.000000,m_vRidingPassengerMeshOffset=(X=-25.000000,Y=0.000000,Z=-23.000000),m_vIdealExitLocation=(X=0.000000,Y=75.000000,Z=20.000000))
   Seats(3)=(CameraTag="ViewSocket",CameraBaseOffset=(X=-500.000000,Y=0.000000,Z=0.000000),ViewPitchMin=-16500.000000,ViewPitchMax=18000.000000,bSeatVisible=True,SeatBone="passengerBackLeft",SeatOffset=(X=29.000000,Y=0.000000,Z=32.000000),SeatSocket="Seat_4",DriverDamageMult=0.500000,SeatIconPOS=(X=0.460000,Y=0.450000),m_SeatAnimInfo=(,(bIsArmorDependent=True,ArmorType=2)),m_bAttachPawnDirectly=True,m_fViewYawLimit=18500.000000,m_vRidingPassengerMeshOffset=(X=-25.000000,Y=0.000000,Z=-23.000000),m_vIdealExitLocation=(X=0.000000,Y=-75.000000,Z=20.000000))
   Seats(4)=(CameraTag="ViewSocket",CameraBaseOffset=(X=-500.000000,Y=0.000000,Z=0.000000),ViewPitchMin=-16500.000000,ViewPitchMax=18000.000000,bSeatVisible=True,SeatBone="passengerBackRight",SeatOffset=(X=29.000000,Y=0.000000,Z=32.000000),SeatSocket="Seat_5",DriverDamageMult=0.500000,SeatIconPOS=(X=0.460000,Y=0.450000),m_SeatAnimInfo=(,(bIsArmorDependent=True,ArmorType=2)),m_bAttachPawnDirectly=True,m_fViewYawLimit=18500.000000,m_vRidingPassengerMeshOffset=(X=-25.000000,Y=0.000000,Z=-23.000000),m_vIdealExitLocation=(X=0.000000,Y=75.000000,Z=20.000000))
   VehicleSounds(0)=(SoundStartTag="DamageEffectsMediumStart",SoundEndTag="DamageEffectsMediumEnd")
   VehicleSounds(1)=(SoundStartTag="DamageEffectsHeavyStart",SoundEndTag="DamageEffectsHeavyEnd")
   Begin Object Class=TrVehicleSimChopperFlat Name=SimObject
      bShouldStabilizeRotation=True
      PitchGain=(PGain=5.000000,DGain=1.300000,IGain=3.500000)
      RollGain=(PGain=5.000000,DGain=1.300000,IGain=3.500000)
      MaxThrustForce=450.000000
      MaxReverseForce=175.000000
      LongDamping=0.600000
      MaxStrafeForce=680.000000
      LatDamping=0.700000
      DirectionChangeForce=500.000000
      MaxRiseForce=275.000000
      UpDamping=0.080000
      TurnTorqueFactor=1300.000000
      TurnTorqueMax=405.000000
      TurnDamping=0.300000
      MaxYawRate=0.800000
      PitchTorqueFactor=250.000000
      PitchTorqueMax=400.000000
      PitchDamping=0.150000
      RollTorqueMax=1100.000000
      RollDamping=0.100000
      StopThreshold=100.000000
      MaxRandForce=10.000000
      RandForceInterval=3.000000
      bAllowZThrust=True
      bFullThrustOnDirectionChange=True
      bStabilizeStops=True
      StabilizationForceMultiplier=0.200000
      HardLimitAirSpeedScale=1.000000
      Name="SimObject"
      ObjectArchetype=TrVehicleSimChopperFlat'TribesGame.Default__TrVehicleSimChopperFlat'
   End Object
   SimObj=SimObject
   COMOffset=(X=200.000000,Y=0.000000,Z=0.000000)
   bStayUpright=True
   bCanFlip=True
   StayUprightRollResistAngle=10.000000
   StayUprightPitchResistAngle=10.000000
   StayUprightStiffness=450.000000
   StayUprightDamping=50.000000
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle_BaseFlying:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle_BaseFlying:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'TribesGame.Default__TrVehicle_Havoc:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle_BaseFlying:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle_BaseFlying:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'TribesGame.Default__TrVehicle_Havoc:MyStayUprightConstraintInstance'
   MaxSpeed=2400.000000
   UprightLiftStrength=30.000000
   UprightTorqueStrength=30.000000
   UprightTime=1.250000
   Begin Object Class=AudioComponent Name=havocEngineSound
      bShouldRemainActiveIfDropped=True
      Name="havocEngineSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   EngineSound=havocEngineSound
   EngineStartOffsetSecs=0.500000
   bDriverIsVisible=True
   bSeparateTurretFocus=True
   bFollowLookDir=True
   bHasHandbrake=True
   bScriptedRise=True
   ExitRadius=160.000000
   bCanFly=True
   bCanStrafe=True
   MeleeRange=-100.000000
   GroundSpeed=2000.000000
   AirSpeed=2400.000000
   BaseEyeHeight=110.000000
   EyeHeight=110.000000
   Health=6000
   HealthMax=6000
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle_BaseFlying:SVehicleMesh'
      AnimSets(0)=None
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_Havoc:MyLightEnvironment'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle_BaseFlying:SVehicleMesh'
   End Object
   Mesh=SVehicleMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrVehicle_BaseFlying:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Translation=(X=-40.000000,Y=0.000000,Z=40.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrVehicle_BaseFlying:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   Components(2)=MyLightEnvironment
   Components(3)=SimObject
   Components(4)=havocEngineSound
   Components(5)=BoostLoopSound
   CollisionComponent=SVehicleMesh
   Name="Default__TrVehicle_Havoc"
   ObjectArchetype=TrVehicle_BaseFlying'TribesGame.Default__TrVehicle_BaseFlying'
}
