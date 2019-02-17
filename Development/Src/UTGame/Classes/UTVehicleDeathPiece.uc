/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTVehicleDeathPiece extends UTGib_Vehicle
	notplaceable;


var ParticleSystemComponent PSC;

/** We need to skip the UTGib_Vehicle PreBeginPlay because UTGib_Vehicle tries to ChooseGib which we don't want to do **/
simulated event PreBeginPlay()
{
	Super(Actor).PreBeginPlay();
}

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=GibLightEnvironmentComp Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTGib_Vehicle:GibLightEnvironmentComp'
      AmbientShadowColor=(R=0.300000,G=0.300000,B=0.300000,A=1.000000)
      AmbientGlow=(R=0.500000,G=0.500000,B=0.500000,A=1.000000)
      bCastShadows=False
      Name="GibLightEnvironmentComp"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTGib_Vehicle:GibLightEnvironmentComp'
   End Object
   GibLightEnvironment=GibLightEnvironmentComp
   Begin Object Class=UTGibStaticMeshComponent Name=VehicleGibStaticMeshComp
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTVehicleDeathPiece:GibLightEnvironmentComp'
      CachedMaxDrawDistance=8000.000000
      ScriptRigidBodyCollisionThreshold=1.000000
      Name="VehicleGibStaticMeshComp"
      ObjectArchetype=UTGibStaticMeshComponent'UTGame.Default__UTGibStaticMeshComponent'
   End Object
   GibMeshComp=VehicleGibStaticMeshComp
   Components(0)=GibLightEnvironmentComp
   Components(1)=VehicleGibStaticMeshComp
   CollisionComponent=VehicleGibStaticMeshComp
   Name="Default__UTVehicleDeathPiece"
   ObjectArchetype=UTGib_Vehicle'UTGame.Default__UTGib_Vehicle'
}
