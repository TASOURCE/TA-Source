/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTGib_VehiclePiece extends UTGib_Vehicle
	notplaceable;


simulated event PreBeginPlay()
{
	// we skip UTGib as UTGib will do ChooseGib().  For the VehiclePieces we know they are only StaticMeshes 
	// and that StaticMesh is stored in the SkelControl_Damage so when we spawn one of these we call SetGibStaticMesh( Mesh )
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
   Components(0)=GibLightEnvironmentComp
   Name="Default__UTGib_VehiclePiece"
   ObjectArchetype=UTGib_Vehicle'UTGame.Default__UTGib_Vehicle'
}
