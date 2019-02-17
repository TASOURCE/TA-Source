/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class TriggerVolume extends Volume
	native
	placeable;

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	// match bProjTarget to weapons (zero extent) collision setting
	if (BrushComponent != None)
	{
		bProjTarget = BrushComponent.BlockZeroExtent;
	}
}

simulated function bool StopsProjectile(Projectile P)
{
	return false;
}

defaultproperties
{
   BrushColor=(B=100,G=255,R=100,A=255)
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
   CollisionType=COLLIDE_CustomDefault
   bProjTarget=True
   CollisionComponent=BrushComponent0
   SupportedEvents(1)=Class'Engine.SeqEvent_TakeDamage'
   Name="Default__TriggerVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
