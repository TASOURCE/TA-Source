/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DirectionalLight extends Light
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

cpptext
{
public:
	/**
	 * This will determine which icon should be displayed for this light.
	 **/
	virtual void DetermineAndSetEditorIcon();

	/**
	 * Called from within SpawnActor, setting up the default value for the Lightmass light source angle.
	 */
	virtual void Spawned();

}


defaultproperties
{
   Begin Object Class=DirectionalLightComponent Name=DirectionalLightComponent0
      UseDirectLightMap=True
      Name="DirectionalLightComponent0"
      ObjectArchetype=DirectionalLightComponent'Engine.Default__DirectionalLightComponent'
   End Object
   LightComponent=DirectionalLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Light:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Directional_Stationary_UserSelected'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Light:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=DirectionalLightComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__ArrowComponent'
   End Object
   Components(2)=ArrowComponent0
   Rotation=(Pitch=-16384,Yaw=0,Roll=0)
   Name="Default__DirectionalLight"
   ObjectArchetype=Light'Engine.Default__Light'
}
