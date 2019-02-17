/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SkyLightToggleable extends SkyLight
	native(Light)
	ClassGroup(Lights,SkyLights)
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

cpptext
{
public:
	/**
	 * Returns true if the light supports being toggled off and on on-the-fly
	 *
	 * @return For 'toggleable' lights, returns true
	 **/
	virtual UBOOL IsToggleable() const
	{
		// SkyLightToggleable supports being toggled on the fly!
		return TRUE;
	}

}


defaultproperties
{
   Begin Object Class=SkyLightComponent Name=SkyLightComponent0 Archetype=SkyLightComponent'Engine.Default__SkyLight:SkyLightComponent0'
      UseDirectLightMap=True
      bCanAffectDynamicPrimitivesOutsideDynamicChannel=True
      Name="SkyLightComponent0"
      ObjectArchetype=SkyLightComponent'Engine.Default__SkyLight:SkyLightComponent0'
   End Object
   LightComponent=SkyLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__SkyLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_SkyLight'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SkyLight:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=SkyLightComponent0
   TickGroup=TG_DuringAsyncWork
   bStatic=False
   bHardAttach=True
   Name="Default__SkyLightToggleable"
   ObjectArchetype=SkyLight'Engine.Default__SkyLight'
}
