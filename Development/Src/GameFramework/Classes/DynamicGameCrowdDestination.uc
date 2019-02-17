/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Moveable version of GameCrowdDestination
 * 
 */
class DynamicGameCrowdDestination extends GameCrowdDestination;

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'GameFramework.Default__GameCrowdDestination:CollisionCylinder'
      CollisionHeight=40.000000
      CollisionRadius=200.000000
      CylinderColor=(B=0,G=255,R=0,A=255)
      bDrawBoundingBox=False
      bDrawNonColliding=True
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'GameFramework.Default__GameCrowdDestination:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'GameFramework.Default__GameCrowdDestination:Sprite'
      Sprite=Texture2D'EditorResources.Crowd.T_Crowd_Destination'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'GameFramework.Default__GameCrowdDestination:Sprite'
   End Object
   Components(1)=Sprite
   Begin Object Class=GameDestinationConnRenderingComponent Name=ConnectionRenderer Archetype=GameDestinationConnRenderingComponent'GameFramework.Default__GameCrowdDestination:ConnectionRenderer'
      ReplacementPrimitive=None
      Name="ConnectionRenderer"
      ObjectArchetype=GameDestinationConnRenderingComponent'GameFramework.Default__GameCrowdDestination:ConnectionRenderer'
   End Object
   Components(2)=ConnectionRenderer
   bStatic=False
   CollisionComponent=CollisionCylinder
   Name="Default__DynamicGameCrowdDestination"
   ObjectArchetype=GameCrowdDestination'GameFramework.Default__GameCrowdDestination'
}
