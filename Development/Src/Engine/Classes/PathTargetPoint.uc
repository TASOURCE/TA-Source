/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PathTargetPoint extends KeyPoint
	native(AI);

/**
 * replaces IsA(NavigationPoint) check for primitivecomponents 
 */
native function bool ShouldBeHiddenBySHOW_NavigationNodes();

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
      Sprite=Texture2D'EditorResources.PathTarget'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.350000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=ArrowComponent Name=Arrow
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(1)=Arrow
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=73.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   Components(2)=CollisionCylinder
   bStatic=False
   bHidden=False
   bNoDelete=True
   CollisionComponent=CollisionCylinder
   SupportedEvents(4)=Class'Engine.SeqEvent_AIReachedRouteActor'
   Name="Default__PathTargetPoint"
   ObjectArchetype=Keypoint'Engine.Default__Keypoint'
}
