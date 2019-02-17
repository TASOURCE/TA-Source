class TrVehicle_GravCycle extends TrVehicle
	notplaceable;

defaultproperties
{
   m_bImprovedLagSupport=False
   m_bUsesArmoredMultiplier=True
   m_fBoostMultiplier=1.500000
   r_fMaxPowerPool=100.000000
   m_fPawnMaxDamageSpeed=1900.000000
   m_fPawnMaxDamage=2400.000000
   m_fWallMaxDamage=300.000000
   m_fDivingMaxSpeedMultiplier=1.200000
   Begin Object Class=UTAmbientSoundComponent Name=BoostLoopSound
      Name="BoostLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTAmbientSoundComponent'
   End Object
   m_AudioComponentBoostSound=BoostLoopSound
   m_sName="Grav Cycle"
   m_DustEffects(0)=(MaterialType="Dirt")
   m_DustEffects(1)=(MaterialType="Grass")
   m_DustEffects(2)=(MaterialType="Snow")
   m_DustEffects(3)=(MaterialType="Water")
   Begin Object Class=UTParticleSystemComponent Name=GravCycleDust
      bAutoActivate=False
      ReplacementPrimitive=None
      AbsoluteTranslation=True
      AbsoluteRotation=True
      Name="GravCycleDust"
      ObjectArchetype=UTParticleSystemComponent'UTGame.Default__UTParticleSystemComponent'
   End Object
   m_DustPSC=GravCycleDust
   m_sWeapon1Name="Bomblet Launcher"
   bCanCarryFlag=True
   bRagdollDriverOnDarkwalkerHorn=True
   bNoZSmoothing=False
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   MaxDesireability=0.600000
   HornSounds(0)=None
   HornSounds(1)=None
   SpawnRadius=125.000000
   DefaultFOV=90.000000
   CameraLag=0.020000
   bEjectKilledBodies=True
   bHomingTarget=True
   bTakeWaterDamageWhileDriving=False
   MaxGroundEffectDist=256.000000
   GroundEffectDistParameterName="DistToGround"
   Seats(0)=(GunClass=Class'TribesGame.TrVehicleWeapon_GravCyclePilot',GunSocket=("PilotGun01","PilotGun02"),WeaponEffects=((SocketName="PilotGun01",Offset=(X=-35.000000,Y=-3.000000,Z=0.000000),Scale3D=(X=3.000000,Y=6.000000,Z=6.000000)),(SocketName="PilotGun02",Offset=(X=-35.000000,Y=-3.000000,Z=0.000000),Scale3D=(X=3.000000,Y=6.000000,Z=6.000000))),CameraTag="ViewSocket",CameraBaseOffset=(X=-20.000000,Y=0.000000,Z=10.000000),CameraOffset=-250.000000,bSeatVisible=True,SeatBone="Driver",SeatSocket="Seat_Driver",DriverDamageMult=0.750000,SeatIconPOS=(X=0.460000,Y=0.450000),m_SeatAnimInfo=((bClearAnimSet=True),(bIsArmorDependent=True,bClearAnimSet=True,ArmorType=2)),m_vIdealExitLocation=(X=0.000000,Y=0.000000,Z=150.000000))
   Seats(1)=(CameraTag="ViewSocket",CameraBaseOffset=(X=-20.000000,Y=0.000000,Z=10.000000),CameraOffset=-250.000000,ViewPitchMin=-9000.000000,ViewPitchMax=18000.000000,bSeatVisible=True,SeatBone="Passenger",SeatOffset=(X=-70.000000,Y=0.000000,Z=50.000000),SeatSocket="Seat_Rear",DriverDamageMult=0.750000,SeatIconPOS=(X=0.460000,Y=0.450000),m_SeatAnimInfo=((bIsFactionDependent=True,bClearAnimSet=True),(bIsFactionDependent=True,bClearAnimSet=True,TeamType=1),(bIsArmorDependent=True,bIsFactionDependent=True,bClearAnimSet=True,ArmorType=2),(bIsArmorDependent=True,bIsFactionDependent=True,bClearAnimSet=True,ArmorType=2,TeamType=1)),m_bAttachPawnDirectly=True,m_vRidingPassengerMeshOffset=(X=70.000000,Y=0.000000,Z=-50.000000),m_vIdealExitLocation=(X=0.000000,Y=0.000000,Z=150.000000),FlagSocketName="Seat_Rear",FlagOffset=(X=0.000000,Y=0.000000,Z=120.000000),FlagRotation=(Pitch=0,Yaw=32768,Roll=0),ValidFlagSeat=True)
   VehicleSounds(0)=(SoundStartTag="DamageEffectsMediumStart",SoundEndTag="DamageEffectsMediumEnd")
   VehicleSounds(1)=(SoundStartTag="DamageEffectsHeavyStart",SoundEndTag="DamageEffectsHeavyEnd")
   CustomGravityScaling=0.800000
   DamageParamScaleLevels(0)=(DamageParamName="Damage1",Scale=5.000000)
   DamageParamScaleLevels(1)=(DamageParamName="Damage2",Scale=5.000000)
   DamageParamScaleLevels(2)=(DamageParamName="Damage3",Scale=5.000000)
   DamageParamScaleLevels(3)=(DamageParamName="Damage4",Scale=5.000000)
   DamageMorphTargets(0)=(MorphNodeName="GravCycle_Damage_Back",InfluenceBone="F_impact",Health=400,DamagePropNames=("Damage1"))
   DamageMorphTargets(1)=(MorphNodeName="GravCycle_Damage_Front",InfluenceBone="B_impact",Health=400,DamagePropNames=("Damage2"))
   DamageMorphTargets(2)=(MorphNodeName="GravCycle_Damage_Right",InfluenceBone="R_impact",Health=250,DamagePropNames=("Damage3"))
   DamageMorphTargets(3)=(MorphNodeName="GravCycle_Damage_Left",InfluenceBone="L_impact",Health=250,DamagePropNames=("Damage4"))
   VehicleEffects(0)=(EffectStartTag="DamageEffectsMediumStart",EffectEndTag="DamageEffectsMediumEnd",bRestartRunning=False,EffectSocket="FX_Damaged")
   VehicleEffects(1)=(EffectStartTag="DamageEffectsHeavyStart",EffectEndTag="DamageEffectsHeavyEnd",bRestartRunning=False,EffectSocket="FX_Damaged")
   VehicleEffects(2)=(EffectStartTag="MuzzleFlashPilot",EffectSocket="WSO_Emit01")
   ObjectiveGetOutDist=750.000000
   Begin Object Class=TrSVehicleSimHover Name=SimObject
      RollGain=(PGain=10.000000,DGain=2.000000,IGain=5.000000)
      bShouldStabilizeRotation=True
      MaxThrustForce=1100.000000
      MaxReverseForce=100.000000
      LongDamping=0.150000
      LatDamping=0.400000
      DirectionChangeForce=1100.000000
      TurnTorqueFactor=7000.000000
      TurnTorqueMax=2000.000000
      TurnDamping=0.400000
      MaxYawRate=100000.000000
      PitchTorqueFactor=200.000000
      PitchTorqueMax=18.000000
      PitchDamping=0.100000
      RollTorqueTurnFactor=1500.000000
      RollTorqueStrafeFactor=110.000000
      RollTorqueMax=2000.000000
      RollDamping=0.200000
      RandForceInterval=0.400000
      bFullThrustOnDirectionChange=True
      bStabilizeStops=True
      StabilizationForceMultiplier=0.300000
      WheelSuspensionStiffness=75.000000
      WheelSuspensionDamping=20.000000
      Name="SimObject"
      ObjectArchetype=TrSVehicleSimHover'TribesGame.Default__TrSVehicleSimHover'
   End Object
   SimObj=SimObject
   Begin Object Class=UTHoverWheel Name=BThruster
      bHoverWheel=True
      SteerFactor=1.000000
      SkelControlName="B_Tire_Cont"
      BoneName="B_tire"
      BoneOffset=(X=0.000000,Y=0.000000,Z=-25.000000)
      WheelRadius=40.000000
      SuspensionTravel=20.000000
      SuspensionSpeed=10.000000
      LongSlipFactor=0.000000
      LatSlipFactor=0.000000
      HandbrakeLongSlipFactor=0.000000
      HandbrakeLatSlipFactor=0.000000
      Name="BThruster"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(0)=BThruster
   Begin Object Class=UTHoverWheel Name=FThruster
      bHoverWheel=True
      SteerFactor=1.000000
      SkelControlName="F_Tire_Cont"
      BoneName="handleSteering"
      BoneOffset=(X=25.000000,Y=0.000000,Z=-65.000000)
      WheelRadius=40.000000
      SuspensionTravel=20.000000
      SuspensionSpeed=10.000000
      LongSlipFactor=0.000000
      LatSlipFactor=0.000000
      HandbrakeLongSlipFactor=0.000000
      HandbrakeLatSlipFactor=0.000000
      Name="FThruster"
      ObjectArchetype=UTHoverWheel'UTGame.Default__UTHoverWheel'
   End Object
   Wheels(1)=FThruster
   COMOffset=(X=-25.000000,Y=0.000000,Z=-75.000000)
   bStayUpright=True
   bCanFlip=True
   StayUprightRollResistAngle=10.000000
   StayUprightPitchResistAngle=25.000000
   StayUprightStiffness=450.000000
   StayUprightDamping=50.000000
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'TribesGame.Default__TrVehicle_GravCycle:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'TribesGame.Default__TrVehicle_GravCycle:MyStayUprightConstraintInstance'
   UprightLiftStrength=30.000000
   UprightTorqueStrength=30.000000
   Begin Object Class=AudioComponent Name=GravCycleEngineSound
      bShouldRemainActiveIfDropped=True
      Name="GravCycleEngineSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   EngineSound=GravCycleEngineSound
   EngineStartOffsetSecs=0.300000
   bDriverIsVisible=True
   bFollowLookDir=True
   bScriptedRise=True
   ExitRadius=160.000000
   MomentumMult=3.200000
   MeleeRange=-100.000000
   GroundSpeed=2500.000000
   AirSpeed=2500.000000
   BaseEyeHeight=110.000000
   EyeHeight=110.000000
   Health=1400
   HealthMax=1400
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle:SVehicleMesh'
      AnimSets(0)=None
      MorphSets(0)=None
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_GravCycle:MyLightEnvironment'
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
      CollisionHeight=40.000000
      CollisionRadius=100.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Translation=(X=-40.000000,Y=0.000000,Z=40.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrVehicle:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   Components(2)=MyLightEnvironment
   Components(3)=GravCycleDust
   Components(4)=SimObject
   Components(5)=GravCycleEngineSound
   Components(6)=BoostLoopSound
   CollisionComponent=SVehicleMesh
   Name="Default__TrVehicle_GravCycle"
   ObjectArchetype=TrVehicle'TribesGame.Default__TrVehicle'
}
