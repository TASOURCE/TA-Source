/**
 * Version of UTWaterVolume that can be moved during gameplay (attached to matinee, etc)
 * More expensive, so only use when really needed
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTDynamicWaterVolume extends UTWaterVolume;

defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'UTGame.Default__UTWaterVolume:BrushComponent0'
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
      ObjectArchetype=BrushComponent'UTGame.Default__UTWaterVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   bStatic=False
   CollisionComponent=BrushComponent0
   Name="Default__UTDynamicWaterVolume"
   ObjectArchetype=UTWaterVolume'UTGame.Default__UTWaterVolume'
}
