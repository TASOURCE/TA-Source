/**d
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 Games should create placeable subclasses of WaterVolume for use in game levels.
 */
class WaterVolume extends PhysicsVolume
	notplaceable;

/** Sound played when touched by an actor that can splash */
var() SoundCue  EntrySound;	

/** Effect spawned when touched by an actor that can splash */
var() class<actor> EntryActor;	

/** Sound played when untouched by an actor that can splash */
var() SoundCue  ExitSound;	

/** Effect spawned when untouched by an actor that can splash */
var() class<actor> ExitActor;	

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	Super.Touch(Other, OtherComp, HitLocation, HitNormal);

	if ( Other.CanSplash() )
		PlayEntrySplash(Other);
}

function PlayEntrySplash(Actor Other)
{
	if( EntrySound != None )
	{
		Other.PlaySound(EntrySound);
		if ( Other.Instigator != None )
			Other.MakeNoise(1.0);
	}
	if( EntryActor != None )
	{
		Spawn(EntryActor);
	}
}

event untouch(Actor Other)
{
	if ( Other.CanSplash() )
		PlayExitSplash(Other);
}

function PlayExitSplash(Actor Other)
{
	if ( ExitSound != None )
	{
		Other.PlaySound(ExitSound);
		if ( Other.Instigator != None )
			Other.MakeNoise(1.0);
	}
	if( ExitActor != None )
	{
		Spawn(ExitActor);
	}
}

defaultproperties
{
   bWaterVolume=True
   FluidFriction=2.400000
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
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
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=BrushComponent0
   Name="Default__WaterVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}
