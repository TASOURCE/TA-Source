/**
 * Toggleable version of DirectionalLight.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DirectionalLightToggleable extends DirectionalLight
	native(Light)
	ClassGroup(Lights, DirectionalLights)
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
public:
	/**
	 * This will determine which icon should be displayed for this light.
	 **/
	virtual void DetermineAndSetEditorIcon();

	/** 
	 * Static affecting Toggleables can't have UseDirectLightmaps=TRUE  So even tho they are not "free" 
	 * lightmapped data, they still are classified as static as it is the best they can be.
	 **/
	virtual void SetValuesForLight_StaticAffecting();

	/**
	 * Returns true if the light supports being toggled off and on on-the-fly
	 *
	 * @return For 'toggleable' lights, returns true
	 **/
	virtual UBOOL IsToggleable() const
	{
		// DirectionalLightToggleable supports being toggled on the fly!
		return TRUE;
	}

}


defaultproperties
{
   Begin Object Class=DirectionalLightComponent Name=DirectionalLightComponent0 Archetype=DirectionalLightComponent'Engine.Default__DirectionalLight:DirectionalLightComponent0'
      LightmassSettings=(IndirectLightingScale=0.000000)
      LightAffectsClassification=LAC_DYNAMIC_AND_STATIC_AFFECTING
      Name="DirectionalLightComponent0"
      ObjectArchetype=DirectionalLightComponent'Engine.Default__DirectionalLight:DirectionalLightComponent0'
   End Object
   LightComponent=DirectionalLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__DirectionalLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Directional_Toggleable_DynamicsAndStatics'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__DirectionalLight:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=DirectionalLightComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__DirectionalLight:ArrowComponent0'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__DirectionalLight:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   TickGroup=TG_DuringAsyncWork
   bStatic=False
   bHardAttach=True
   Name="Default__DirectionalLightToggleable"
   ObjectArchetype=DirectionalLight'Engine.Default__DirectionalLight'
}
