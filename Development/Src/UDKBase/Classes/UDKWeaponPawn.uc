/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKWeaponPawn extends UDKVehicleBase
	native
	nativereplication
	notplaceable;

/** MyVehicle points to the vehicle that houses this WeaponPawn and is replicated */
var repnotify UDKVehicle MyVehicle;

/** MyVehicleWeapon points to the weapon associated with this WeaponPawn and is replicated */
var repnotify UDKWeapon MyVehicleWeapon;

/** An index in to the Seats array of the vehicle housing this WeaponPawn.  It is replicated */
var repnotify int MySeatIndex;

replication
{
	if (Role == ROLE_Authority)
		MySeatIndex, MyVehicle, MyVehicleWeapon;
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * @param RequestedBy - the Actor requesting the target location
 * @param bRequestAlternateLoc (optional) - return a secondary target location if there are multiple
 * @return the optimal location to fire weapons at this actor
 */
simulated native function vector GetTargetLocation(optional Actor RequestedBy, optional bool bRequestAlternateLoc) const;

defaultproperties
{
   Begin Object Class=RB_StayUprightSetup Name=MyStayUprightSetup Archetype=RB_StayUprightSetup'UDKBase.Default__UDKVehicleBase:MyStayUprightSetup'
      Name="MyStayUprightSetup"
      ObjectArchetype=RB_StayUprightSetup'UDKBase.Default__UDKVehicleBase:MyStayUprightSetup'
   End Object
   StayUprightConstraintSetup=RB_StayUprightSetup'UDKBase.Default__UDKWeaponPawn:MyStayUprightSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyStayUprightConstraintInstance Archetype=RB_ConstraintInstance'UDKBase.Default__UDKVehicleBase:MyStayUprightConstraintInstance'
      Name="MyStayUprightConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'UDKBase.Default__UDKVehicleBase:MyStayUprightConstraintInstance'
   End Object
   StayUprightConstraintInstance=RB_ConstraintInstance'UDKBase.Default__UDKWeaponPawn:MyStayUprightConstraintInstance'
   Begin Object Class=SkeletalMeshComponent Name=SVehicleMesh Archetype=SkeletalMeshComponent'UDKBase.Default__UDKVehicleBase:SVehicleMesh'
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
      ObjectArchetype=SkeletalMeshComponent'UDKBase.Default__UDKVehicleBase:SVehicleMesh'
   End Object
   Mesh=SVehicleMesh
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UDKBase.Default__UDKVehicleBase:CollisionCylinder'
      CollisionHeight=78.000000
      CollisionRadius=34.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UDKBase.Default__UDKVehicleBase:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Components(1)=SVehicleMesh
   CollisionComponent=SVehicleMesh
   Name="Default__UDKWeaponPawn"
   ObjectArchetype=UDKVehicleBase'UDKBase.Default__UDKVehicleBase'
}
