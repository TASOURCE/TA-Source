//=============================================================================
// VolumePathNode
// Useful for flying or swimming
// Defines "reachable" area by growing collision cylinder from initial
// radius/height specified by LD, until an obstruction is reached.
// VolumePathNodes can reach any NavigationPath within their volume, as
// well as other VolumePathNodes with overlapping cylinders.
// NavigationPoints directly below the volumepathnode cylinder will also
// be tested for connectivity during path building.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class VolumePathNode extends PathNode
	native;

/** when path building, the cylinder starts at this size and does traces/point checks to refine
 * to a size that isn't embedded in world geometry
 * can be modified by LDs to adjust building behavior
 */
var() float StartingRadius, StartingHeight;

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

cpptext
{
	virtual UBOOL ReachedBy(APawn* P, const FVector& TestPosition, const FVector& Dest);
	virtual UBOOL ShouldBeBased();
	virtual void InitForPathFinding();
#if WITH_EDITOR
	virtual void addReachSpecs(AScout *Scout, UBOOL bOnlyChanged);
	virtual void ReviewPath(APawn* Scout);
	virtual UBOOL CanPrunePath(INT index);
#endif

}


defaultproperties
{
   StartingRadius=2000.000000
   StartingHeight=2000.000000
   bNoAutoConnect=True
   bNotBased=True
   bFlyingPreferred=True
   bVehicleDestination=True
   bBuildLongPaths=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__PathNode:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__PathNode:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__PathNode:Sprite'
      Sprite=Texture2D'EditorResources.VolumePath'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__PathNode:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__PathNode:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__PathNode:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__PathNode:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__PathNode:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__PathNode:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__PathNode:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionComponent=CollisionCylinder
   Name="Default__VolumePathNode"
   ObjectArchetype=PathNode'Engine.Default__PathNode'
}
