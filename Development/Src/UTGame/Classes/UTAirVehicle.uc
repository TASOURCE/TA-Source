/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


/** base class for vehicles that fly or hover */
class UTAirVehicle extends UTVehicle
	abstract;

var bool bAutoLand;
var float PushForce;	// for AI when landing;

var localized string RadarLockMessage;				/** Displayed when enemy raptor fires locked missile at you */

var float LastRadarLockWarnTime;

simulated event LockOnWarning(UDKProjectile IncomingMissile)
{
	SendLockOnMessage(1);
}

simulated function SetDriving(bool bNewDriving)
{
	if (bAutoLand && !bNewDriving && !bChassisTouchingGround && Health > 0)
	{
		if (Role == ROLE_Authority)
		{
			GotoState('AutoLanding');
		}
	}
	else
	{
		Super.SetDriving(bNewDriving);
	}
}

/** state to automatically land when player jumps out while high above land */
state AutoLanding
{
	simulated function SetDriving(bool bNewDriving)
	{
		if ( bNewDriving )
		{
			GotoState('Auto');
			Global.SetDriving(bNewDriving);
		}
	}

	function bool Died(Controller Killer, class<DamageType> DamageType, vector HitLocation)
	{
		if (Global.Died(Killer, DamageType, HitLocation))
		{
			SetDriving(false);
			return true;
		}
		else
		{
			return false;
		}
	}

	function Tick(float DeltaTime)
	{
		local actor HitActor;
		local vector HitNormal, HitLocation;

		if (bChassisTouchingGround)
		{
			GotoState('Auto');
			SetDriving(false);
		}
		else
		{
			HitActor = Trace(HitLocation, HitNormal, Location - vect(0,0,2500), Location, false);
			if ( Velocity.Z < -1200 )
				OutputRise = 1.0;
			else if ( HitActor == None )
				OutputRise = -1.0;
			else if ( VSize(HitLocation - Location) < -2*Velocity.Z )
			{
				if ( Velocity.Z > -100 )
					OutputRise = 0;
				else
					OutputRise = 1.0;
			}
			else if ( Velocity.Z > -500 )
				OutputRise = -0.4;
			else
				OutputRise = -0.1;
		}
	}
}

//==============================
// AI interface
function bool RecommendLongRangedAttack()
{
	return true;
}

function bool Dodge(eDoubleClickDir DoubleClickMove)
{
	if ( FRand() < 0.7 )
	{
		VehicleMovingTime = WorldInfo.TimeSeconds + 1;
		Rise = 1;
	}
	return false;
}

defaultproperties
{
   bAutoLand=True
   bMustBeUpright=False
   bDropDetailWhenDriving=True
   bFindGroundExit=False
   bReducedFallingCollisionDamage=True
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTVehicle:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTVehicle:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   IconCoords=(U=989.000000,V=24.000000,UL=43.000000,VL=48.000000)
   LookForwardDist=100.000000
   bHomingTarget=True
   bNoZDampingInAir=False
   bEjectPassengersWhenFlipped=False
   bJostleWhileDriving=True
   bFloatWhenDriven=True
   bUseAlternatePaths=False
   UpsideDownDamagePerSec=0.000000
   ContrailColorParameterName="ContrailColor"
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'UTGame.Default__UTVehicle:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'UTGame.Default__UTVehicle:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'UTGame.Default__UTAirVehicle:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'UTGame.Default__UTVehicle:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'UTGame.Default__UTVehicle:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'UTGame.Default__UTAirVehicle:MyStayUprightConstraintInstance'
   bTurnInPlace=True
   bFollowLookDir=True
   bCanFly=True
   bCanStrafe=True
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'UTGame.Default__UTVehicle:SVehicleMesh'
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTAirVehicle:MyLightEnvironment'
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
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTVehicle:SVehicleMesh'
   End Object
   Mesh=SVehicleMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTVehicle:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTVehicle:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   Components(2)=MyLightEnvironment
   CollisionComponent=SVehicleMesh
   Name="Default__UTAirVehicle"
   ObjectArchetype=UTVehicle'UTGame.Default__UTVehicle'
}
