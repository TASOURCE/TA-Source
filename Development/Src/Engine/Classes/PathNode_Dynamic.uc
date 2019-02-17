//=============================================================================
// PathNode_Dynamic.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//
// Avoid warnings for pathnodes that are based on and should move with an interpactor platform
// When platform moves, this will cause path costs for ReachSpecs be invalid.
// Update in game specific way... Epic usually handles by forcing paths between static/moving networks
// and using bBlocked to allow movement across the networks at the correct time.
//=============================================================================
class PathNode_Dynamic extends PathNode;

simulated event string GetDebugAbbrev()
{
	return "DynPN";
}

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__PathNode:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__PathNode:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__PathNode:Sprite'
      Sprite=Texture2D'EditorResources.S_Pickup'
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
   bStatic=False
   CollisionComponent=CollisionCylinder
   Name="Default__PathNode_Dynamic"
   ObjectArchetype=PathNode'Engine.Default__PathNode'
}
