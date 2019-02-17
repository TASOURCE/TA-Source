/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class DecalActor extends DecalActorBase
	native(Decal)
	placeable;

defaultproperties
{
   Begin Object Class=DecalComponent Name=NewDecalComponent Archetype=DecalComponent'Engine.Default__DecalActorBase:NewDecalComponent'
      bStaticDecal=True
      DecalTransform=DecalTransform_OwnerAbsolute
      ReplacementPrimitive=None
      Name="NewDecalComponent"
      ObjectArchetype=DecalComponent'Engine.Default__DecalActorBase:NewDecalComponent'
   End Object
   Decal=NewDecalComponent
   Components(0)=NewDecalComponent
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DecalActorBase:Sprite'
      Sprite=Texture2D'EditorResources.S_DecalActorIcon'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.150000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DecalActorBase:Sprite'
   End Object
   Components(1)=Sprite
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__DecalActorBase:ArrowComponent0'
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__DecalActorBase:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   Name="Default__DecalActor"
   ObjectArchetype=DecalActorBase'Engine.Default__DecalActorBase'
}
