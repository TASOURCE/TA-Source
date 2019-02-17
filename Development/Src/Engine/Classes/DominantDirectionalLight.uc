/**
 * Dominant version of DirectionalLight that generates static shadow maps.
 * There can only be one!
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DominantDirectionalLight extends DirectionalLight
	native(Light)
	ClassGroup(Lights,DirectionalLights)
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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// UObject interface
#if WITH_EDITOR
	virtual void CheckForErrors();
#endif

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
   Begin Object Class=DominantDirectionalLightComponent Name=DominantDirectionalLightComponent0
      LightmassSettings=(LightSourceAngle=0.200000)
      bAllowPreShadow=True
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="DominantDirectionalLightComponent0"
      ObjectArchetype=DominantDirectionalLightComponent'Engine.Default__DominantDirectionalLightComponent'
   End Object
   LightComponent=DominantDirectionalLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DirectionalLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Directional_Stationary_DynamicsAndStatics'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DirectionalLight:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__DirectionalLight:ArrowComponent0'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__DirectionalLight:ArrowComponent0'
   End Object
   Components(1)=ArrowComponent0
   Components(2)=DominantDirectionalLightComponent0
   bStatic=False
   bHardAttach=True
   Name="Default__DominantDirectionalLight"
   ObjectArchetype=DirectionalLight'Engine.Default__DirectionalLight'
}
