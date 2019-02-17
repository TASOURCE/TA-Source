/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PointLight extends Light
	native(Light)
	ClassGroup(Lights,PointLights)
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

cpptext
{
#if WITH_EDITOR
	// AActor interface.
	virtual void EditorApplyScale(const FVector& DeltaScale, const FMatrix& ScaleMatrix, const FVector* PivotLocation, UBOOL bAltDown, UBOOL bShiftDown, UBOOL bCtrlDown);
#endif
	/**
	 * This will determine which icon should be displayed for this light.
	 **/
	virtual void DetermineAndSetEditorIcon();

	/**
	 * Called after this actor has been pasted into a level.  Attempts to catch cases where designers are pasting in really old
	 * T3D data that was created when component instancing wasn't working correctly.
	 */
	virtual void PostEditImport();

	/**
	 * Called from within SpawnActor, setting up the default value for the Lightmass light source radius.
	 */
	virtual void Spawned();

}


defaultproperties
{
   Begin Object Class=PointLightComponent Name=PointLightComponent0
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightRadius0'
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__PointLight:DrawLightSourceRadius0'
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
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightRadius0
      ReplacementPrimitive=None
      Name="DrawLightRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__DrawLightRadiusComponent'
   End Object
   Components(1)=DrawLightRadius0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightSourceRadius0
      SphereColor=(B=0,G=239,R=231,A=255)
      ReplacementPrimitive=None
      Name="DrawLightSourceRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__DrawLightRadiusComponent'
   End Object
   Components(2)=DrawLightSourceRadius0
   Components(3)=PointLightComponent0
   Name="Default__PointLight"
   ObjectArchetype=Light'Engine.Default__Light'
}
