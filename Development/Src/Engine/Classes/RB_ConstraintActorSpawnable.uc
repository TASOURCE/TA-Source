/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


/** RB_ConstraintActor spawnable during gameplay */
class RB_ConstraintActorSpawnable extends RB_ConstraintActor
	notplaceable;

defaultproperties
{
   Begin Object Class=RB_ConstraintSetup Name=MyConstraintSetup
      Name="MyConstraintSetup"
      ObjectArchetype=RB_ConstraintSetup'Engine.Default__RB_ConstraintSetup'
   End Object
   ConstraintSetup=RB_ConstraintSetup'Engine.Default__RB_ConstraintActorSpawnable:MyConstraintSetup'
   Begin Object Class=RB_ConstraintInstance Name=MyConstraintInstance Archetype=RB_ConstraintInstance'Engine.Default__RB_ConstraintActor:MyConstraintInstance'
      Name="MyConstraintInstance"
      ObjectArchetype=RB_ConstraintInstance'Engine.Default__RB_ConstraintActor:MyConstraintInstance'
   End Object
   ConstraintInstance=RB_ConstraintInstance'Engine.Default__RB_ConstraintActorSpawnable:MyConstraintInstance'
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__RB_ConstraintActor:Sprite'
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
   bNoDelete=False
   Name="Default__RB_ConstraintActorSpawnable"
   ObjectArchetype=RB_ConstraintActor'Engine.Default__RB_ConstraintActor'
}
