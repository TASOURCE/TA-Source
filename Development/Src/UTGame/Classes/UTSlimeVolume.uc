/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTSlimeVolume extends WaterVolume
	placeable;

defaultproperties
{
   bPainCausing=True
   TerminalVelocity=1500.000000
   DamagePerSec=7.000000
   DamageType=Class'UTGame.UTDmgType_Lava'
   FluidFriction=5.000000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__WaterVolume:BrushComponent0'
      ReplacementPrimitive=None
      RBChannel=RBCC_Water
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__WaterVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__UTSlimeVolume"
   ObjectArchetype=WaterVolume'Engine.Default__WaterVolume'
}
