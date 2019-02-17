//=============================================================================
// VehicleMovementEffect
//  Is the visual effect that is spawned by someone on a vehicle
//  
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class UDKVehicleMovementEffect extends Actor
	native;

/** The static mesh that can be used as a speed effect*/
var staticmeshcomponent AirEffect;

/** slower than this will disable the effect*/
var float MinVelocityForAirEffect;

/** At this speed the air effect is at full level */
var float MaxVelocityForAirEffect;

/** the param in the material(0) of the AirEffect to scale from 0-1*/
var name AirEffectScalar;

/** Max change per second of AirCurrentLevel */
var float AirMaxDelta;

/** Current level of the air effect */
var float AirCurrentLevel;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Begin Object Class=StaticMeshComponent Name=AerialMesh
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
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   AirEffect=AerialMesh
   MinVelocityForAirEffect=15000.000000
   MaxVelocityForAirEffect=850000.000000
   AirEffectScalar="Wind_Opacity"
   AirMaxDelta=0.050000
   Components(0)=AerialMesh
   CollisionType=COLLIDE_CustomDefault
   Name="Default__UDKVehicleMovementEffect"
   ObjectArchetype=Actor'Engine.Default__Actor'
}
