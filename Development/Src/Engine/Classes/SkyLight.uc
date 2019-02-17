/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SkyLight extends Light
	native(Light)
	ClassGroup(Lights,SkyLights)
	placeable;

defaultproperties
{
   Begin Object Class=SkyLightComponent Name=SkyLightComponent0
      UseDirectLightMap=True
      bCanAffectDynamicPrimitivesOutsideDynamicChannel=True
      Name="SkyLightComponent0"
      ObjectArchetype=SkyLightComponent'Engine.Default__SkyLightComponent'
   End Object
   LightComponent=SkyLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Light:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_SkyLight'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Light:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=SkyLightComponent0
   Name="Default__SkyLight"
   ObjectArchetype=Light'Engine.Default__Light'
}
