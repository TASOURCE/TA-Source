/**
 * UTKillZVolume
 * Kills pawns using KillZ interface
 *
 *
* Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTKillZVolume extends PhysicsVolume
    placeable;

var() class<DamageType> KillZDamageType;

event ActorEnteredVolume(Actor Other)
{
	if (!Other.bStatic)
	{
		KillActor(Other);
	}
}

event PawnEnteredVolume(Pawn Other)
{
	KillActor(Other);
}

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	if (!Other.bStatic)
	{
		KillActor(Other);
	}
}

simulated event KillActor(Actor Other)
{
	if ( !Other.bScriptInitialized )
	{
		// warn if actor was spawned in killz volume (bad)
		;
	}
	Other.FellOutOfWorld(KillZDamageType);
	if ( UTPawn(Other) != None )
	{
		UTPawn(Other).bStopDeathCamera = true;
	}
	else if ( UTVehicle(Other) != None )
	{
		UTVehicle(Other).bStopDeathCamera = true;
	}
}

defaultproperties
{
   KillZDamageType=Class'Engine.KillZDamageType'
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__PhysicsVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionComponent=BrushComponent0
   Name="Default__UTKillZVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}
