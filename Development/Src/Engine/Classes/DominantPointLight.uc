/**
 * Dominant version of PointLight that generates static shadowmaps.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DominantPointLight extends PointLight
	native(Light)
	ClassGroup(Lights, PointLights)
	placeable;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/**
	 * Returns true if the light supports being toggled off and on on-the-fly
	 **/
	virtual UBOOL IsToggleable() const
	{
		return TRUE;
	}

}


defaultproperties
{
   Begin Object Class=DominantPointLightComponent Name=DominantPointLightComponent0
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__DominantPointLight:DrawLightRadius0'
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__DominantPointLight:DrawLightSourceRadius0'
      bAllowPreShadow=True
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="DominantPointLightComponent0"
      ObjectArchetype=DominantPointLightComponent'Engine.Default__DominantPointLightComponent'
   End Object
   LightComponent=DominantPointLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__PointLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Point_Stationary_DynamicsAndStatics'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__PointLight:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightRadius0'
      ReplacementPrimitive=None
      Name="DrawLightRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightRadius0'
   End Object
   Components(1)=DrawLightRadius0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightSourceRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightSourceRadius0'
      SphereColor=(B=0,G=239,R=231,A=255)
      ReplacementPrimitive=None
      Name="DrawLightSourceRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightSourceRadius0'
   End Object
   Components(2)=DrawLightSourceRadius0
   Components(3)=DominantPointLightComponent0
   bStatic=False
   bHardAttach=True
   Name="Default__DominantPointLight"
   ObjectArchetype=PointLight'Engine.Default__PointLight'
}
