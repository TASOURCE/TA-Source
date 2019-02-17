/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTWeaponPickupLight extends Light
	placeable;

defaultproperties
{
   Begin Object Class=PointLightComponent Name=PointLightComponent0
      Radius=128.000000
      Brightness=4.000000
      LightColor=(B=200,G=244,R=251,A=0)
      CastDynamicShadows=False
      UseDirectLightMap=True
      LightingChannels=(Dynamic=False)
      LightAffectsClassification=LAC_STATIC_AFFECTING
      Name="PointLightComponent0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLightComponent'
   End Object
   LightComponent=PointLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Light:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Point_Stationary_Statics'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Light:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=PointLightComponent0
   DrawScale=0.250000
   Name="Default__UTWeaponPickupLight"
   ObjectArchetype=Light'Engine.Default__Light'
}
