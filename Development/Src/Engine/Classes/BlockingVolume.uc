//=============================================================================
// BlockingVolume:  a bounding volume
// used to block certain classes of actors
// primary use is to provide collision for non-zero extent traces around static meshes
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class BlockingVolume extends Volume
	native
	placeable;

/** GameCameras ignore BlockingVolumes with bBlockCamera=false */
var() bool bBlockCamera;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**	Handling Toggle event from Kismet. */
simulated function OnToggle(SeqAct_Toggle Action)
{
	// Turn ON
	if (Action.InputLinks[0].bHasImpulse)
	{
		CollisionComponent.SetBlockRigidBody( TRUE );
	}
	// Turn OFF
	else if (Action.InputLinks[1].bHasImpulse)
	{
		CollisionComponent.SetBlockRigidBody( FALSE );
	}
	// Toggle
	else if (Action.InputLinks[2].bHasImpulse)
	{
		CollisionComponent.SetBlockRigidBody( !CollisionComponent.BlockRigidBody );
	}

	Super.OnToggle( Action );
}

cpptext
{
	UBOOL IgnoreBlockingBy( const AActor *Other ) const;

}


defaultproperties
{
   bBlockCamera=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
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
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   bWorldGeometry=True
   bBlockActors=True
   CollisionComponent=BrushComponent0
   Name="Default__BlockingVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
