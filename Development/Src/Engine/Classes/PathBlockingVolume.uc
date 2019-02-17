/**
 * this volume only blocks the path builder - it has no gameplay collision
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PathBlockingVolume extends Volume
	native
	placeable;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
#if WITH_EDITOR
	virtual void SetCollisionForPathBuilding(UBOOL bNowPathBuilding);
#endif

}


defaultproperties
{
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      bDisableAllRigidBody=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   bWorldGeometry=True
   bCollideActors=False
   bBlockActors=True
   CollisionComponent=BrushComponent0
   Name="Default__PathBlockingVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
