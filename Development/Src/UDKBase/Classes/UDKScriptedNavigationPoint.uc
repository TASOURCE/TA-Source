/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
/** Navigation points with pathing interface exposed to script */
class UDKScriptedNavigationPoint extends NavigationPoint
	native
	abstract;

/** If true, calls script event SpecifyEndAnchor() */
var bool bScriptSpecifyEndAnchor;

/** If true, calls script event NotifyAnchorFindingResult() */
var bool bScriptNotifyAnchorFindingResult;

/** Whether path anchor must be reachable by route finder to even try to path toward it */
var bool bAnchorMustBeReachable;
	
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
  * Returns the end anchor to use for path finding when this actor is the goal.
  * Called from C++ if bScriptSpecifyEndAnchor is true.
  */
event NavigationPoint SpecifyEndAnchor(Pawn RouteFinder);

/**
 * Notify actor of anchor finding result.
 * Called from C++ if bScriptNotifyAnchorFindingResult is true.
 * @PARAM EndAnchor is the anchor found
 * @PARAM RouteFinder is the pawn which requested the anchor finding
  */
event NotifyAnchorFindingResult(NavigationPoint EndAnchor, Pawn RouteFinder);

defaultproperties
{
   bAnchorMustBeReachable=True
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__NavigationPoint:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
      Sprite=Texture2D'EditorResources.S_NavP'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'Engine.Default__NavigationPoint:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__NavigationPoint:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'Engine.Default__NavigationPoint:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionComponent=CollisionCylinder
   Name="Default__UDKScriptedNavigationPoint"
   ObjectArchetype=NavigationPoint'Engine.Default__NavigationPoint'
}
