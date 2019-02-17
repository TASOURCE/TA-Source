//=============================================================================
// The Hinge joint class.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class RB_HingeActor extends RB_ConstraintActor
    placeable;

defaultproperties
{
   Begin Object Class=RB_HingeSetup Name=MyHingeSetup
      Name="MyHingeSetup"
      ObjectArchetype=RB_HingeSetup'Engine.Default__RB_HingeSetup'
   End Object
   ConstraintSetup=RB_HingeSetup'Engine.Default__RB_HingeActor:MyHingeSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyConstraintInstance Archetype=RB_ConstraintInstance'Engine.Default__RB_ConstraintActor:MyConstraintInstance'
      Name="MyConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'Engine.Default__RB_ConstraintActor:MyConstraintInstance'
   End Object
   ConstraintInstance=RB_ConstraintInstance'Engine.Default__RB_HingeActor:MyConstraintInstance'
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__RB_ConstraintActor:Sprite'
      Sprite=Texture2D'EditorResources.S_KHinge'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__RB_ConstraintActor:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=RB_ConstraintDrawComponent Name=MyConDrawComponent Archetype=RB_ConstraintDrawComponent'Engine.Default__RB_ConstraintActor:MyConDrawComponent'
      ReplacementPrimitive=None
      Name="MyConDrawComponent"
      ObjectArchetype=RB_ConstraintDrawComponent'Engine.Default__RB_ConstraintActor:MyConDrawComponent'
   End Object
   Components(1)=MyConDrawComponent
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=64,G=64,R=255,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(2)=ArrowComponent0
   Name="Default__RB_HingeActor"
   ObjectArchetype=RB_ConstraintActor'Engine.Default__RB_ConstraintActor'
}
