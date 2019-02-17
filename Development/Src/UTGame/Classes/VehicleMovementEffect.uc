//=============================================================================
// VehicleMovementEffect
//  Is the visual effect that is spawned by someone on a vehicle
//  
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class VehicleMovementEffect extends UDKVehicleMovementEffect;

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=AerialMesh Archetype=StaticMeshComponent'UDKBase.Default__UDKVehicleMovementEffect:AerialMesh'
      ReplacementPrimitive=None
      MaxDrawDistance=7500.000000
      CachedMaxDrawDistance=7500.000000
      bOnlyOwnerSee=True
      CastShadow=False
      bAcceptsLights=False
      CollideActors=False
      BlockActors=False
      BlockRigidBody=False
      AbsoluteRotation=True
      Name="AerialMesh"
      ObjectArchetype=StaticMeshComponent'UDKBase.Default__UDKVehicleMovementEffect:AerialMesh'
   End Object
   AirEffect=AerialMesh
   Components(0)=AerialMesh
   Name="Default__VehicleMovementEffect"
   ObjectArchetype=UDKVehicleMovementEffect'UDKBase.Default__UDKVehicleMovementEffect'
}
