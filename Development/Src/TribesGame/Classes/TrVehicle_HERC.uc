class TrVehicle_HERC extends TrVehicle_Tank
	notplaceable;

defaultproperties
{
   m_FireCameraShake=CameraShake'TribesGame.Default__TrVehicle_HERC:TankFireShake'
   m_bUsesArmoredMultiplier=True
   m_VehicleType=VEHICLE_HERC
   m_fDivingMaxSpeedMultiplier=1.100000
   m_sName="HERC"
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_Tank:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_Tank:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   HornSounds(0)=None
   HornSounds(1)=None
   DefaultFOV=80.000000
   CameraLag=0.020000
   bEjectKilledBodies=True
   bHomingTarget=True
   Seats(0)=(GunClass=Class'TribesGame.TrVehicleWeapon_HERCPilot',GunSocket=("PilotGun"),WeaponEffects=((SocketName="PilotGun",Offset=(X=-35.000000,Y=-3.000000,Z=0.000000),Scale3D=(X=3.000000,Y=6.000000,Z=6.000000))),TurretControls=("turretRotate","TurretPitch"),CameraTag="ViewSocket",CameraBaseOffset=(X=0.000000,Y=0.000000,Z=250.000000),CameraOffset=-1500.000000,ViewPitchMin=-7000.000000,ViewPitchMax=7000.000000,SeatBone="Seat_Driver",SeatOffset=(X=-30.000000,Y=0.000000,Z=-5.000000),SeatSocket="Seat_Driver",SeatIconPOS=(X=0.460000,Y=0.450000),m_vIdealExitLocation=(X=0.000000,Y=0.000000,Z=200.000000),m_TurretRecoilControlNames=("TurretRotateRecoil","TurretRecoil"),m_fTurnInterpSpeed=5.000000)
   Seats(1)=(GunClass=Class'TribesGame.TrVehicleWeapon_HERCGunner',GunSocket=("GunnerGun1","GunnerGun2"),TurretVarPrefix="Gunner",WeaponEffects=((SocketName="GunnerGun",Offset=(X=-35.000000,Y=-3.000000,Z=0.000000),Scale3D=(X=3.000000,Y=6.000000,Z=6.000000))),TurretControls=("turretTopRotate","TurretTopPitch"),CameraTag="GunnerViewSocket",CameraBaseOffset=(X=0.000000,Y=0.000000,Z=250.000000),CameraOffset=-1500.000000,ViewPitchMin=-9000.000000,ViewPitchMax=4000.000000,SeatBone="Seat_Gunner",SeatOffset=(X=-30.000000,Y=0.000000,Z=-5.000000),SeatSocket="Seat_Gunner",SeatIconPOS=(X=0.460000,Y=0.450000),m_vIdealExitLocation=(X=0.000000,Y=0.000000,Z=200.000000),m_fTurnInterpSpeed=5.000000)
   VehicleSounds(0)=(SoundStartTag="DamageEffectsMediumStart",SoundEndTag="DamageEffectsMediumEnd")
   VehicleSounds(1)=(SoundStartTag="DamageEffectsHeavyStart",SoundEndTag="DamageEffectsHeavyEnd")
   Begin Object Class=TrSVehicleSimTank Name=SimObject
      MaxEngineTorque=5000.000000
      EngineDamping=4.000000
      InsideTrackTorqueFactor=0.250000
      TurnInPlaceThrottle=0.500000
      StopThreshold=50.000000
      WheelSuspensionStiffness=200.000000
      WheelSuspensionDamping=20.000000
      WheelSuspensionBias=0.050000
      WheelLongExtremumSlip=1.500000
      Name="SimObject"
      ObjectArchetype=TrSVehicleSimTank'TribesGame.Default__TrSVehicleSimTank'
   End Object
   SimObj=SimObject
   Begin Object Class=UTHoverWheel Name=RBWheel
      bPoweredWheel=True
      SteerFactor=1.000000
      BoneName="RB_tire"
      BoneOffset=(X=-110.000000,Y=180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Right
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="RBWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(0)=RBWheel
   Begin Object Class=UTHoverWheel Name=RBWheel01
      bPoweredWheel=True
      SteerFactor=1.000000
      BoneName="RB_tire"
      BoneOffset=(X=-370.000000,Y=180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Right
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="RBWheel01"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(1)=RBWheel01
   Begin Object Class=UTHoverWheel Name=RMWheel
      bPoweredWheel=True
      BoneName="RM_tire"
      BoneOffset=(X=0.000000,Y=180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Right
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="RMWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(2)=RMWheel
   Begin Object Class=UTHoverWheel Name=RFWheel
      bPoweredWheel=True
      SteerFactor=1.000000
      BoneName="RF_tire"
      BoneOffset=(X=110.000000,Y=180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Right
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="RFWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(3)=RFWheel
   Begin Object Class=UTHoverWheel Name=RFWheel01
      bPoweredWheel=True
      SteerFactor=1.000000
      BoneName="RF_tire"
      BoneOffset=(X=350.000000,Y=180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Right
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="RFWheel01"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(4)=RFWheel01
   Begin Object Class=UTHoverWheel Name=LBWheel
      bPoweredWheel=True
      SteerFactor=1.000000
      BoneName="LB_tire"
      BoneOffset=(X=-110.000000,Y=-180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Left
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="LBWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(5)=LBWheel
   Begin Object Class=UTHoverWheel Name=LBWheel01
      bPoweredWheel=True
      SteerFactor=1.000000
      BoneName="LB_tire"
      BoneOffset=(X=-370.000000,Y=-180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Left
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="LBWheel01"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(6)=LBWheel01
   Begin Object Class=UTHoverWheel Name=LMWheel
      bPoweredWheel=True
      BoneName="LM_tire"
      BoneOffset=(X=0.000000,Y=-180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Left
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="LMWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(7)=LMWheel
   Begin Object Class=UTHoverWheel Name=LFWheel
      bPoweredWheel=True
      SteerFactor=1.000000
      BoneName="LF_tire"
      BoneOffset=(X=110.000000,Y=-180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Left
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="LFWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(8)=LFWheel
   Begin Object Class=UTHoverWheel Name=LFWheel01
      bPoweredWheel=True
      SteerFactor=1.000000
      BoneName="LF_tire"
      BoneOffset=(X=350.000000,Y=-180.000000,Z=-30.000000)
      WheelRadius=80.000000
      SuspensionTravel=45.000000
      Side=SIDE_Left
      LongSlipFactor=250.000000
      HandbrakeLongSlipFactor=250.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="LFWheel01"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(9)=LFWheel01
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle_Tank:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle_Tank:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'TribesGame.Default__TrVehicle_HERC:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle_Tank:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle_Tank:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'TribesGame.Default__TrVehicle_HERC:MyStayUprightConstraintInstance'
   Begin Object Class=AudioComponent Name=hercEngineSound
      bShouldRemainActiveIfDropped=True
      Name="hercEngineSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   EngineSound=hercEngineSound
   EngineStartOffsetSecs=0.500000
   bDriverIsVisible=True
   BaseEyeHeight=110.000000
   EyeHeight=110.000000
   Health=14200
   HealthMax=14200
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle_Tank:SVehicleMesh'
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_HERC:MyLightEnvironment'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle_Tank:SVehicleMesh'
   End Object
   Mesh=SVehicleMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrVehicle_Tank:CollisionCylinder'
      CollisionHeight=300.000000
      CollisionRadius=600.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrVehicle_Tank:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   Components(2)=MyLightEnvironment
   Components(3)=SimObject
   Components(4)=hercEngineSound
   CollisionComponent=SVehicleMesh
   Name="Default__TrVehicle_HERC"
   ObjectArchetype=TrVehicle_Tank'TribesGame.Default__TrVehicle_Tank'
}
