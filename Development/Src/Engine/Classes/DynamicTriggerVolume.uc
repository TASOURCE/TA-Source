/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This is a movable trigger volume. It can be moved by matinee, being based on
 * dynamic objects, etc.
 */
class DynamicTriggerVolume extends TriggerVolume
	showcategories(Movement)
	placeable;

/** Is the volume enabled by default? */
var() bool bEnabled;

/**
 * Overriden to set the default collision state. 
 */
simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	SetCollision(bEnabled, bBlockActors);
}

defaultproperties
{
   bEnabled=True
   BrushColor=(B=255,G=255,R=100,A=255)
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__TriggerVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__TriggerVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   bStatic=False
   bAlwaysRelevant=True
   bOnlyDirtyReplication=True
   CollisionComponent=BrushComponent0
   Name="Default__DynamicTriggerVolume"
   ObjectArchetype=TriggerVolume'Engine.Default__TriggerVolume'
}
