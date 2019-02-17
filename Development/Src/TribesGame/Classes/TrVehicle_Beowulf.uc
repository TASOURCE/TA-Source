class TrVehicle_Beowulf extends TrVehicle_Tank
	notplaceable;

defaultproperties
{
   m_FireCameraShake=CameraShake'TribesGame.Default__TrVehicle_Beowulf:TankFireShake'
   m_bUsesArmoredMultiplier=True
   m_VehicleType=VEHICLE_Beowulf
   m_fBoostMultiplier=1.250000
   r_fMaxPowerPool=80.000000
   m_fPowerPoolRechargeRate=8.000000
   m_fPawnMaxDamageSpeed=1600.000000
   m_fPawnMinDamage=500.000000
   m_fPawnMaxDamage=1000.000000
   m_fDivingMaxSpeedMultiplier=1.100000
   Begin Object Class=UTAmbientSoundComponent Name=BoostLoopSound
      Name="BoostLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTAmbientSoundComponent'
   End Object
   m_AudioComponentBoostSound=BoostLoopSound
   m_sName="Beowulf"
   m_DustEffects(0)=(MaterialType="Dirt")
   m_DustEffects(1)=(MaterialType="Grass")
   m_DustEffects(2)=(MaterialType="Snow")
   m_DustEffects(3)=(MaterialType="Water")
   m_sWeapon1Name="Main Gun"
   m_sWeapon2Name="Mounted Chaingun"
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
   Seats(0)=(GunClass=Class'TribesGame.TrVehicleWeapon_BeowulfPilot',GunSocket=("PilotGun"),GunPivotPoints=("turretRotate"),WeaponEffects=((SocketName="WSO_Emit01",Offset=(X=-35.000000,Y=-3.000000,Z=0.000000),Scale3D=(X=3.000000,Y=6.000000,Z=6.000000))),TurretControls=("turretRotate","TurretPitch"),CameraTag="ViewSocket",CameraBaseOffset=(X=-65.000000,Y=0.000000,Z=30.000000),CameraOffset=-500.000000,ViewPitchMin=-5000.000000,ViewPitchMax=5000.000000,SeatOffset=(X=-30.000000,Y=0.000000,Z=-5.000000),SeatSocket="Seat_Driver",SeatMotionAudio=TurretTwistSound,m_vIdealExitLocation=(X=0.000000,Y=0.000000,Z=200.000000),m_TurretRecoilControlNames=("TurretRotateRecoil","TurretRecoil"),m_fTurnInterpSpeed=5.000000)
   Seats(1)=(GunClass=Class'TribesGame.TrVehicleWeapon_BeowulfGunner',GunSocket=("GunnerGun"),GunPivotPoints=("turretTopPivot"),TurretVarPrefix="Gunner",WeaponEffects=((SocketName="WSO_Emit02",Offset=(X=-35.000000,Y=-3.000000,Z=0.000000),Scale3D=(X=3.000000,Y=6.000000,Z=6.000000))),TurretControls=("turretTopRotate","TurretTopPitch"),CameraTag="GunnerViewSocket",CameraBaseOffset=(X=0.000000,Y=0.000000,Z=10.000000),CameraOffset=-30.000000,ViewPitchMin=-7500.000000,ViewPitchMax=11500.000000,SeatOffset=(X=-30.000000,Y=0.000000,Z=-5.000000),SeatSocket="Seat_Top",SeatMotionAudio=GunnerTwistSound,m_vIdealExitLocation=(X=0.000000,Y=0.000000,Z=200.000000),m_TurretRecoilControlNames=("TurretTopRotateRecoil","TurretTopPitchRecoil"),m_fTurnInterpSpeed=5.000000)
   VehicleSounds(0)=(SoundStartTag="DamageEffectsMediumStart",SoundEndTag="DamageEffectsMediumEnd")
   VehicleSounds(1)=(SoundStartTag="DamageEffectsHeavyStart",SoundEndTag="DamageEffectsHeavyEnd")
   VehicleEffects(0)=(EffectStartTag="DamageEffectsMediumStart",EffectEndTag="DamageEffectsMediumEnd",bRestartRunning=False,EffectSocket="FX_Root")
   VehicleEffects(1)=(EffectStartTag="DamageEffectsHeavyStart",EffectEndTag="DamageEffectsHeavyEnd",bRestartRunning=False,EffectSocket="FX_Root")
   VehicleEffects(2)=(EffectStartTag="MuzzleFlashPilot",EffectSocket="WSO_Emit01")
   VehicleEffects(3)=(EffectStartTag="MuzzleFlashGunner",EffectSocket="WSO_Emit02")
   Begin Object Class=TrSVehicleSimTank Name=SimObject
      m_fVelocityChangeDamping=0.050000
      MaxEngineTorque=7000.000000
      EngineDamping=3.500000
      InsideTrackTorqueFactor=0.225000
      TurnInPlaceThrottle=0.450000
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
      bHoverWheel=True
      SteerFactor=1.000000
      BoneName="RB_tire"
      BoneOffset=(X=-80.000000,Y=48.000000,Z=-20.000000)
      WheelRadius=55.000000
      SuspensionTravel=55.000000
      Side=SIDE_Right
      LongSlipFactor=200.000000
      HandbrakeLongSlipFactor=175.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="RBWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(0)=RBWheel
   Begin Object Class=UTHoverWheel Name=RMWheel
      bHoverWheel=True
      BoneName="RM_tire"
      BoneOffset=(X=24.000000,Y=48.000000,Z=-20.000000)
      WheelRadius=55.000000
      SuspensionTravel=45.000000
      Side=SIDE_Right
      LongSlipFactor=200.000000
      HandbrakeLongSlipFactor=175.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="RMWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(1)=RMWheel
   Begin Object Class=UTHoverWheel Name=RFWheel
      bHoverWheel=True
      SteerFactor=1.000000
      BoneName="RF_tire"
      BoneOffset=(X=95.000000,Y=48.000000,Z=-20.000000)
      WheelRadius=55.000000
      SuspensionTravel=45.000000
      Side=SIDE_Right
      LongSlipFactor=200.000000
      HandbrakeLongSlipFactor=175.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="RFWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(2)=RFWheel
   Begin Object Class=UTHoverWheel Name=LBWheel
      bHoverWheel=True
      SteerFactor=1.000000
      BoneName="LB_tire"
      BoneOffset=(X=-40.000000,Y=-48.000000,Z=-20.000000)
      WheelRadius=55.000000
      SuspensionTravel=45.000000
      Side=SIDE_Left
      LongSlipFactor=200.000000
      HandbrakeLongSlipFactor=175.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="LBWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(3)=LBWheel
   Begin Object Class=UTHoverWheel Name=LMWheel
      bHoverWheel=True
      BoneName="LM_tire"
      BoneOffset=(X=24.000000,Y=-48.000000,Z=-20.000000)
      WheelRadius=55.000000
      SuspensionTravel=45.000000
      Side=SIDE_Left
      LongSlipFactor=200.000000
      HandbrakeLongSlipFactor=175.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="LMWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(4)=LMWheel
   Begin Object Class=UTHoverWheel Name=LFWheel
      bHoverWheel=True
      SteerFactor=1.000000
      BoneName="LF_tire"
      BoneOffset=(X=95.000000,Y=-48.000000,Z=-20.000000)
      WheelRadius=55.000000
      SuspensionTravel=45.000000
      Side=SIDE_Left
      LongSlipFactor=200.000000
      HandbrakeLongSlipFactor=175.000000
      HandbrakeLatSlipFactor=1000.000000
      Name="LFWheel"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(5)=LFWheel
   COMOffset=(X=0.000000,Y=0.000000,Z=-70.000000)
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle_Tank:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle_Tank:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'TribesGame.Default__TrVehicle_Beowulf:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle_Tank:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle_Tank:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'TribesGame.Default__TrVehicle_Beowulf:MyStayUprightConstraintInstance'
   MaxSpeed=1000.000000
   Begin Object Class=AudioComponent Name=BeowulfEngineSound
      bShouldRemainActiveIfDropped=True
      Name="BeowulfEngineSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   EngineSound=BeowulfEngineSound
   EngineStartOffsetSecs=0.500000
   bDriverIsVisible=True
   GroundSpeed=750.000000
   BaseEyeHeight=110.000000
   EyeHeight=110.000000
   Health=8000
   HealthMax=8000
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle_Tank:SVehicleMesh'
      AnimSets(0)=None
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_Beowulf:MyLightEnvironment'
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
      CollisionHeight=40.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Translation=(X=-40.000000,Y=0.000000,Z=40.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrVehicle_Tank:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   Components(2)=MyLightEnvironment
   Begin Object Class=AudioComponent Name=TurretTwistSound
      Name="TurretTwistSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   Components(3)=TurretTwistSound
   Begin Object Class=AudioComponent Name=GunnerTwistSound
      Name="GunnerTwistSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   Components(4)=GunnerTwistSound
   Components(5)=SimObject
   Components(6)=BeowulfEngineSound
   Components(7)=BoostLoopSound
   CollisionComponent=SVehicleMesh
   Name="Default__TrVehicle_Beowulf"
   ObjectArchetype=TrVehicle_Tank'TribesGame.Default__TrVehicle_Tank'
}
