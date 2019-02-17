/**
 * Version of DominantDirectionalLight that can be rotated in game and doesn't generate precomputed lighting or shadowing.
 * There can only be one dominant directional light in a given level.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DominantDirectionalLightMovable extends DominantDirectionalLight
	native(Light)
	ClassGroup(Lights,DirectionalLights)
	placeable;

// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Begin Object Class=DominantDirectionalLightComponent Name=DominantDirectionalLightComponent0 Archetype=DominantDirectionalLightComponent'Engine.Default__DominantDirectionalLight:DominantDirectionalLightComponent0'
      WholeSceneDynamicShadowRadius=2000.000000
      LightmassSettings=(LightSourceAngle=0.200000)
      bAllowPreShadow=True
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="DominantDirectionalLightComponent0"
      ObjectArchetype=DominantDirectionalLightComponent'Engine.Default__DominantDirectionalLight:DominantDirectionalLightComponent0'
   End Object
   LightComponent=DominantDirectionalLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DominantDirectionalLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Directional_Stationary_DynamicsAndStatics'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DominantDirectionalLight:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__DominantDirectionalLight:ArrowComponent0'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__DominantDirectionalLight:ArrowComponent0'
   End Object
   Components(1)=ArrowComponent0
   Components(2)=DominantDirectionalLightComponent0
   Physics=PHYS_Interpolating
   bMovable=True
   Name="Default__DominantDirectionalLightMovable"
   ObjectArchetype=DominantDirectionalLight'Engine.Default__DominantDirectionalLight'
}
