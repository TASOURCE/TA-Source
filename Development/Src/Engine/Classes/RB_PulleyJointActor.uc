//=============================================================================
// The Pulley joint class.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================

class RB_PulleyJointActor extends RB_ConstraintActor
    placeable;

defaultproperties
{
   Begin Object Class=RB_PulleyJointSetup Name=MyPulleyJointSetup
      Name="MyPulleyJointSetup"
      ObjectArchetype=RB_PulleyJointSetup'Engine.Default__RB_PulleyJointSetup'
   End Object
   ConstraintSetup=RB_PulleyJointSetup'Engine.Default__RB_PulleyJointActor:MyPulleyJointSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyConstraintInstance Archetype=RB_ConstraintInstance'Engine.Default__RB_ConstraintActor:MyConstraintInstance'
      Name="MyConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'Engine.Default__RB_ConstraintActor:MyConstraintInstance'
   End Object
   ConstraintInstance=RB_ConstraintInstance'Engine.Default__RB_PulleyJointActor:MyConstraintInstance'
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__RB_ConstraintActor:Sprite'
      Sprite=Texture2D'EditorResources.S_KBSJoint'
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
   Name="Default__RB_PulleyJointActor"
   ObjectArchetype=RB_ConstraintActor'Engine.Default__RB_ConstraintActor'
}
