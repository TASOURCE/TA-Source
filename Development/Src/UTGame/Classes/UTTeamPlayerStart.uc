/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTTeamPlayerStart extends UDKTeamPlayerStart;

defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UDKBase.Default__UDKTeamPlayerStart:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UDKBase.Default__UDKTeamPlayerStart:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UDKBase.Default__UDKTeamPlayerStart:Sprite'
      Sprite=Texture2D'EditorResources.S_Player'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UDKBase.Default__UDKTeamPlayerStart:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=SpriteComponent Name=Sprite2 Archetype=SpriteComponent'UDKBase.Default__UDKTeamPlayerStart:Sprite2'
      Sprite=Texture2D'EditorResources.Bad'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite2"
      ObjectArchetype=SpriteComponent'UDKBase.Default__UDKTeamPlayerStart:Sprite2'
   End Object
   Components(1)=Sprite2
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'UDKBase.Default__UDKTeamPlayerStart:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'UDKBase.Default__UDKTeamPlayerStart:Arrow'
   End Object
   Components(2)=Arrow
   Components(3)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'UDKBase.Default__UDKTeamPlayerStart:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'UDKBase.Default__UDKTeamPlayerStart:PathRenderer'
   End Object
   Components(4)=PathRenderer
   CollisionComponent=CollisionCylinder
   Name="Default__UTTeamPlayerStart"
   ObjectArchetype=UDKTeamPlayerStart'UDKBase.Default__UDKTeamPlayerStart'
}
