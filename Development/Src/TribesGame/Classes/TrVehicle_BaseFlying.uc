class TrVehicle_BaseFlying extends TrVehicle
	notplaceable
	native;

struct native FlyingParticleEffects
{
	/** Whether this effect is attached to the boost status */
	var bool                    bIsAttachedToBoost;

	/** The socket to attach the effect to. */
	var name                    SocketToAttach;

	/** The ParticleSystem to use as a template. */
	var ParticleSystem          ParticleTemplate;

	/** The actual attached effect. */
	var ParticleSystemComponent ParticleEffect;
};

/** The left engine particle systems */
var(Effects) array<FlyingParticleEffects>   LeftEngineParticles;

/** The middle engine particle systems */
var(Effects) array<FlyingParticleEffects>   MidEngineParticles;

/** The right engine particle systems */
var(Effects) array<FlyingParticleEffects>   RightEngineParticles;

/** The con-trail particle systems */
var(Effects) array<FlyingParticleEffects>   LeftContrailParticles;
var(Effects) array<FlyingParticleEffects>   RightContrailParticles;

/** The current build-up of normal thrust */
var float m_fThrustBuildUp;
var float m_fThrustInvDuration;

/** The current build-up of normal thrust */
var float m_fBoostThrustBuildUp;
var float m_fBoostThrustInvDuration;

/** Whether free-look is enabled */
var bool m_bFreeLook;

/** Whether zoom auto-levels vehicle */
var bool m_bCanAutoLevelVehicle;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated event PostBeginPlay()
{
	CreateParticleSystems();

	super.PostBeginPlay();
}

simulated function CreateParticleSystems()
{
	local int i;

	for (i = 0; i < LeftEngineParticles.Length; i++)
	{
		// Do we have a valid template?
		if (LeftEngineParticles[i].ParticleTemplate != none)
		{
			// Create, attach, and activate the particle system.
			LeftEngineParticles[i].ParticleEffect = new(self) class'UTParticleSystemComponent';
			LeftEngineParticles[i].ParticleEffect.SetTemplate(LeftEngineParticles[i].ParticleTemplate);
			LeftEngineParticles[i].ParticleEffect.ActivateSystem();

			Mesh.AttachComponentToSocket(LeftEngineParticles[i].ParticleEffect, LeftEngineParticles[i].SocketToAttach);
		}
	}

	for (i = 0; i < MidEngineParticles.Length; i++)
	{
		// Do we have a valid template?
		if (MidEngineParticles[i].ParticleTemplate != none)
		{
			// Create, attach, and activate the particle system.
			MidEngineParticles[i].ParticleEffect = new(self) class'UTParticleSystemComponent';
			MidEngineParticles[i].ParticleEffect.SetTemplate(MidEngineParticles[i].ParticleTemplate);
			MidEngineParticles[i].ParticleEffect.ActivateSystem();

			Mesh.AttachComponentToSocket(MidEngineParticles[i].ParticleEffect, MidEngineParticles[i].SocketToAttach);
		}
	}

	for (i = 0; i < RightEngineParticles.Length; i++)
	{
		// Do we have a valid template?
		if (RightEngineParticles[i].ParticleTemplate != none)
		{
			// Create, attach, and activate the particle system.
			RightEngineParticles[i].ParticleEffect = new(self) class'UTParticleSystemComponent';
			RightEngineParticles[i].ParticleEffect.SetTemplate(RightEngineParticles[i].ParticleTemplate);
			RightEngineParticles[i].ParticleEffect.ActivateSystem();

			Mesh.AttachComponentToSocket(RightEngineParticles[i].ParticleEffect, RightEngineParticles[i].SocketToAttach);
		}
	}

	for (i = 0; i < LeftContrailParticles.Length; i++)
	{
		// Do we have a valid template?
		if (LeftContrailParticles[i].ParticleTemplate != none)
		{
			// Create and attach the particle.
			LeftContrailParticles[i].ParticleEffect = new(self) class'UTParticleSystemComponent';
			LeftContrailParticles[i].ParticleEffect.SetTemplate(LeftContrailParticles[i].ParticleTemplate);

			Mesh.AttachComponentToSocket(LeftContrailParticles[i].ParticleEffect, LeftContrailParticles[i].SocketToAttach);
		}
	}

	for (i = 0; i < RightContrailParticles.Length; i++)
	{
		// Do we have a valid template?
		if (RightContrailParticles[i].ParticleTemplate != none)
		{
			// Create and attach the particle.
			RightContrailParticles[i].ParticleEffect = new(self) class'UTParticleSystemComponent';
			RightContrailParticles[i].ParticleEffect.SetTemplate(RightContrailParticles[i].ParticleTemplate);

			Mesh.AttachComponentToSocket(RightContrailParticles[i].ParticleEffect, RightContrailParticles[i].SocketToAttach);
		}
	}
}

simulated function SetInputs(float InForward, float InStrafe, float InUp)
{
	Throttle = InForward;
	Steering = InStrafe;
	Rise = InUp;

	Steering = FClamp(Steering * ConsoleSteerScale, -1.0, 1.0);

	if (Throttle < 0)
		Throttle = -0.1f;
}

simulated function VehicleCalcCamera(float DeltaTime, int SeatIndex, out vector out_CamLoc, out rotator out_CamRot, out vector CamStart, optional bool bPivotOnly)
{
	local vector CamPos, CamDir, HitLocation, FirstHitLocation, HitNormal, CamRotX, CamRotY, CamRotZ, SafeLocation, X, Y, Z;
	local actor HitActor;
	local float NewCamStartZ;
	local UTPawn P;
	local bool bObstructed, bInsideVehicle;
	local TrPlayerController TrPC;
	local bool bIsZoomed;

	// Only set the zoom flag if the seat isn't visible.
	TrPC = TrPlayerController(GetControllerForSeatIndex(SeatIndex));
	if (TrPC != none && TrPC.GetZoomedState() != ZST_NotZoomed && !Seats[SeatIndex].bSeatVisible)
	{
		bIsZoomed = true;
	}

	Mesh.SetOwnerNoSee(bIsZoomed);
	if ( (UTPawn(Driver) != None) && !Driver.bHidden && Driver.Mesh.bOwnerNoSee )
		UTPawn(Driver).SetMeshVisibility(true);

	// Handle the fixed view
	P = UTPawn(Seats[SeatIndex].SeatPawn.Driver);
	if (P != None && P.bFixedView)
	{
		out_CamLoc = P.FixedViewLoc;
		out_CamRot = P.FixedViewRot;
		return;
	}

	CamStart = GetCameraStart(SeatIndex);
	//`log("CamStart"@CamStart);

	// Get the rotation
	if ( (Seats[SeatIndex].SeatPawn.Controller != None) && !bSpectatedView  )
	{
		if (m_bFreeLook)
		{
			out_CamRot = Seats[SeatIndex].SeatPawn.Controller.Rotation;

			// Limit pitch.
			if( out_CamRot.Pitch > 16834 )
			{
				out_CamRot.Pitch = 16834;
			}
			else if( out_CamRot.Pitch < -16834 )
			{
				out_CamRot.Pitch = -16834;
			}
		}
		else
		{
			out_CamRot = Rotation;
		}

		out_CamRot.Roll = 0.0f;
	}

	// support debug 3rd person cam
	if (P != None)
	{
		P.ModifyRotForDebugFreeCam(out_CamRot);
	}

	GetAxes(out_CamRot, CamRotX, CamRotY, CamRotZ);
	CamStart += (Seats[SeatIndex].SeatPawn.EyeHeight + LookForwardDist * FMax(0,(1.0 - CamRotZ.Z)))* CamRotZ;

	/* if bNoFollowJumpZ, Z component of Camera position is fixed during a jump */
	if ( bNoFollowJumpZ )
	{
		NewCamStartZ = CamStart.Z;
		if ( (Velocity.Z > 0) && !HasWheelsOnGround() && (OldCamPosZ != 0) )
		{
			// upward part of jump. Fix camera Z position.
			bFixedCamZ = true;
			if ( OldPositions.Length > 0 )
				OldPositions[OldPositions.Length-1].Position.Z += (OldCamPosZ - CamStart.Z);
			CamStart.Z = OldCamPosZ;
			if ( NewCamStartZ - CamStart.Z > 64 )
				CamStart.Z = NewCamStartZ - 64;
		}
		else if ( bFixedCamZ )
		{
			// Camera z position is being fixed, now descending
			if ( HasWheelsOnGround() || (CamStart.Z <= OldCamPosZ) )
			{
				// jump has ended
				if ( DeltaTime >= 0.1 )
				{
					// all done
					bFixedCamZ = false;
				}
				else
				{
					// Smoothly return to normal camera mode.
					CamStart.Z = 10*DeltaTime*CamStart.Z + (1 - 10*DeltaTime)*OldCamPosZ;
					if ( abs(NewCamStartZ - CamStart.Z) < 1.f )
						bFixedCamZ = false;
				}
			}
			else
			{
				// descending from jump, still in the air, so fix camera Z position
				if ( OldPositions.Length > 0 )
					OldPositions[OldPositions.Length-1].Position.Z += (OldCamPosZ - CamStart.Z);
				CamStart.Z = OldCamPosZ;
			}
		}
	}

	// Trace up to the view point to make sure it's not obstructed.
	if ( Seats[SeatIndex].CameraSafeOffset == vect(0,0,0) )
	{
		SafeLocation = Location;
	}
	else
	{
	    GetAxes(Rotation, X, Y, Z);
	    SafeLocation = Location + Seats[SeatIndex].CameraSafeOffset.X * X + Seats[SeatIndex].CameraSafeOffset.Y * Y + Seats[SeatIndex].CameraSafeOffset.Z * Z;
	}
	// DrawDebugSphere(SafeLocation, 16, 10, 255, 0, 255, FALSE);
	// DrawDebugSphere(CamStart, 16, 10, 255, 255, 0, FALSE);

	HitActor = Trace(HitLocation, HitNormal, CamStart, SafeLocation, false, vect(12, 12, 12));
	if ( HitActor != None)
	{
			bObstructed = true;
			CamStart = HitLocation;
			//`log("obstructed 0");
	}

	OldCamPosZ = CamStart.Z;
	if (bPivotOnly)
	{
		out_CamLoc = CamStart;
		return;
	}

	// Calculate the optimal camera position
	if (bIsZoomed)
	{
		CamDir = CamRotX * Seats[SeatIndex].CameraZoomOffset * SeatCameraScale;
	}
	else
	{
		CamDir = CamRotX * Seats[SeatIndex].CameraOffset * SeatCameraScale;
	}

	// keep camera from going below vehicle
	if ( !bRotateCameraUnderVehicle && (CamDir.Z < 0) )
	{
		CamDir *= (VSize(CamDir) - abs(CamDir.Z))/(VSize(CamDir) + abs(CamDir.Z));
	}

	CamPos = CamStart + CamDir;

	// Adjust for obstructions
	HitActor = Trace(HitLocation, HitNormal, CamPos, CamStart, false, vect(12, 12, 12));

	if ( HitActor != None )
	{
		out_CamLoc = HitLocation;
		bObstructed = true;
		//`log("obstructed 2");
	}
	else
	{
		out_CamLoc = CamPos;
	}
	if ( !bRotateCameraUnderVehicle && (CamDir.Z < 0) && TraceComponent( FirstHitLocation, HitNormal, CollisionComponent, out_CamLoc, CamStart, vect(0,0,0)) )
	{
		// going through vehicle - it's ok if outside collision on other side
		if ( !TraceComponent( HitLocation, HitNormal, CollisionComponent, CamStart, out_CamLoc, vect(0,0,0)) )
		{
			// end point is inside collision - that's bad
			out_CamLoc = FirstHitLocation;
			bObstructed = true;
			bInsideVehicle = true;
			//`log("obstructed 1");
		}
	}

	// if trace doesn't hit collisioncomponent going back in, it means we are inside the collision box
	// in which case we want to hide the vehicle
	if ( !bCameraNeverHidesVehicle && bObstructed )
	{
		bInsideVehicle = bInsideVehicle
						|| !TraceComponent( HitLocation, HitNormal, CollisionComponent, SafeLocation, out_CamLoc, vect(0,0,0))
						|| (VSizeSq(HitLocation - out_CamLoc) < MinCameraDistSq);
		Mesh.SetOwnerNoSee(bInsideVehicle);
		if ( (UTPawn(Driver) != None) && !Driver.bHidden && (Driver.Mesh.bOwnerNoSee != Mesh.bOwnerNoSee) )
		{
			// Handle the main player mesh
			Driver.Mesh.SetOwnerNoSee(Mesh.bOwnerNoSee);
		}
	}
}

defaultproperties
{
   m_fThrustInvDuration=0.500000
   m_fBoostThrustInvDuration=1.500000
   m_bCanAutoLevelVehicle=True
   m_bBoostRequiresThrust=True
   bReducedFallingCollisionDamage=True
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   bNoZDampingInAir=False
   ContrailColorParameterName="ContrailColor"
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'TribesGame.Default__TrVehicle:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'TribesGame.Default__TrVehicle_BaseFlying:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'TribesGame.Default__TrVehicle:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'TribesGame.Default__TrVehicle_BaseFlying:MyStayUprightConstraintInstance'
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrVehicle:SVehicleMesh'
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrVehicle_BaseFlying:MyLightEnvironment'
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
   CollisionComponent=SVehicleMesh
   Name="Default__TrVehicle_BaseFlying"
   ObjectArchetype=TrVehicle'TribesGame.Default__TrVehicle'
}
