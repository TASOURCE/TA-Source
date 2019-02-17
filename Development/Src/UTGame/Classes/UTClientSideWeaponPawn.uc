/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


/** used on non-owning clients when driving a UTWeaponPawn, as those aren't replicated for performance reasons
 * but lots of code looks for Pawn.DrivenVehicle so we need something there
 */
class UTClientSideWeaponPawn extends UTWeaponPawn;

simulated function PreBeginPlay();

simulated function AttachDriver(Pawn P)
{
	Driver = P;
	bDriving = true;
	Super.AttachDriver(P);
}

simulated function DetachDriver(Pawn P)
{
	Super.DetachDriver(P);
	Destroy();
}

simulated function Tick(float DeltaTime)
{
	Super.Tick(DeltaTime);

	// make sure we get destroyed when no longer in use
	if (Driver == None || Driver.bDeleteMe || Driver.DrivenVehicle != self)
	{
		Destroy();
	}
}

defaultproperties
{
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'UTGame.Default__UTWeaponPawn:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'UTGame.Default__UTWeaponPawn:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'UTGame.Default__UTClientSideWeaponPawn:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'UTGame.Default__UTWeaponPawn:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'UTGame.Default__UTWeaponPawn:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'UTGame.Default__UTClientSideWeaponPawn:MyStayUprightConstraintInstance'
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'UTGame.Default__UTWeaponPawn:SVehicleMesh'
      bUseSingleBodyPhysics=1
      bForceDiscardRootMotion=True
      ReplacementPrimitive=None
      RBChannel=RBCC_Vehicle
      MotionBlurScale=0.000000
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      bNotifyRigidBodyCollision=True
      RBCollideWithChannels=(Default=True,Vehicle=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      ScriptRigidBodyCollisionThreshold=250.000000
      Name="SVehicleMesh"
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTWeaponPawn:SVehicleMesh'
   End Object
   Mesh=SVehicleMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTWeaponPawn:CollisionCylinder'
      CollisionHeight=0.000000
      CollisionRadius=0.000000
      ReplacementPrimitive=None
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTWeaponPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   CollisionComponent=SVehicleMesh
   Name="Default__UTClientSideWeaponPawn"
   ObjectArchetype=UTWeaponPawn'UTGame.Default__UTWeaponPawn'
}
