/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * This is a movable blocking volume. It can be moved by matinee, being based on
 * dynamic objects, etc.
 */
class DynamicBlockingVolume extends BlockingVolume
	native
	showcategories(Movement)
	placeable;

/** Is the volume enabled by default? */
var() bool bEnabled;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

struct CheckpointRecord
{
	var vector Location;
	var rotator Rotation;
	var bool bCollideActors;
	var bool bBlockActors;
	var bool bNeedsReplication;
};

/**
 * Overriden to set the default collision state. 
 */
simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	SetCollision(bEnabled, bBlockActors);
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
	Record.Location = Location;
	Record.Rotation = Rotation;
	Record.bCollideActors = bCollideActors;
	Record.bBlockActors = bBlockActors;
	Record.bNeedsReplication = (RemoteRole != ROLE_None);
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
	if (!bHardAttach)
	{
		SetLocation(Record.Location);
		SetRotation(Record.Rotation);
	}
	// always leave component colliding and just use the Actor flags
	CollisionComponent.SetActorCollision(true, true);
	CollisionComponent.SetTraceBlocking(false, true);
	CollisionComponent.SetBlockRigidBody(Record.bCollideActors);
	SetCollision(Record.bCollideActors, Record.bBlockActors);

	if (Record.bNeedsReplication)
	{
		ForceNetRelevant();
	}
}

cpptext
{
#if WITH_EDITOR
	virtual void CheckForErrors();
#endif

	/**
	 * Force TRACE_LevelGeometry to still work with us even though bWorldGeometry is cleared
	 * bWorldGeometry is cleared so that actors can base properly on moving volumes
	 * 
	 * @param Primitive - the primitive to trace against
	 * 
	 * @param SourceActor - the actor doing the trace
	 * 
	 * @param TraceFlags - misc flags describing the trace
	 */
	virtual UBOOL ShouldTrace(UPrimitiveComponent* Primitive, AActor *SourceActor, DWORD TraceFlags);

}


defaultproperties
{
   bEnabled=True
   BrushColor=(B=100,G=255,R=255,A=255)
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__BlockingVolume:BrushComponent0'
      ReplacementPrimitive=None
      RBChannel=RBCC_BlockingVolume
      bAcceptsLights=True
      CollideActors=True
      BlockActors=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__BlockingVolume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   Physics=PHYS_Interpolating
   bStatic=False
   bWorldGeometry=False
   bAlwaysRelevant=True
   bOnlyDirtyReplication=True
   CollisionComponent=BrushComponent0
   Name="Default__DynamicBlockingVolume"
   ObjectArchetype=BlockingVolume'Engine.Default__BlockingVolume'
}
