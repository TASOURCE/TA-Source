/**
 * this volume only blocks the path builder - it has no gameplay collision
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class NavMeshBoundsVolume extends Volume
	placeable;

defaultproperties
{
   BrushColor=(B=74,G=74,R=74,A=255)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   bCollideActors=False
   CollisionComponent=BrushComponent0
   Name="Default__NavMeshBoundsVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
