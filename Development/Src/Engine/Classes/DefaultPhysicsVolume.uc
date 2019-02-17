//=============================================================================
// DefaultPhysicsVolume:  the default physics volume for areas of the level with
// no physics volume specified
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class DefaultPhysicsVolume extends PhysicsVolume
	native
	notplaceable
	transient;

event Destroyed()
{
	;
	assert(false);
}

defaultproperties
{
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
   TickGroup=TG_DuringAsyncWork
   bStatic=False
   bNoDelete=False
   CollisionComponent=BrushComponent0
   Name="Default__DefaultPhysicsVolume"
   ObjectArchetype=PhysicsVolume'Engine.Default__PhysicsVolume'
}
