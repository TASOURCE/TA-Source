/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SpotLight extends Light
	native(Light)
	ClassGroup(Lights,SpotLights)
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
   Begin Object Class=SpotLightComponent Name=SpotLightComponent0
      PreviewInnerCone=DrawLightConeComponent'Engine.Default__SpotLight:DrawInnerCone0'
      PreviewOuterCone=DrawLightConeComponent'Engine.Default__SpotLight:DrawOuterCone0'
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightRadius0'
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightSourceRadius0'
      CastDynamicShadows=False
      UseDirectLightMap=True
      LightingChannels=(Dynamic=False)
      LightAffectsClassification=LAC_STATIC_AFFECTING
      Name="SpotLightComponent0"
      ObjectArchetype=SpotLightComponent'Engine.Default__SpotLightComponent'
   End Object
   LightComponent=SpotLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Light:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Spot_Stationary_Statics'
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
   Begin Object Class=DrawLightConeComponent Name=DrawInnerCone0
      ReplacementPrimitive=None
      Name="DrawInnerCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__DrawLightConeComponent'
   End Object
   Components(2)=DrawInnerCone0
   Begin Object Class=DrawLightConeComponent Name=DrawOuterCone0
      ConeColor=(B=255,G=255,R=200,A=255)
      ReplacementPrimitive=None
      Name="DrawOuterCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__DrawLightConeComponent'
   End Object
   Components(3)=DrawOuterCone0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightSourceRadius0
      SphereColor=(B=0,G=239,R=231,A=255)
      ReplacementPrimitive=None
      Name="DrawLightSourceRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__DrawLightRadiusComponent'
   End Object
   Components(4)=DrawLightSourceRadius0
   Components(5)=SpotLightComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=255,G=200,R=150,A=255)
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(6)=ArrowComponent0
   Rotation=(Pitch=-16384,Yaw=0,Roll=0)
   Name="Default__SpotLight"
   ObjectArchetype=Light'Engine.Default__Light'
}
