/**
 * Toggleable version of PointLight.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class PointLightToggleable extends PointLight
	native(Light)
	ClassGroup(Lights,PointLights)
	placeable;

struct CheckpointRecord
{
	var bool bEnabled;
};

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

function bool ShouldSaveForCheckpoint()
{
	return (RemoteRole != ROLE_None);
}

function CreateCheckpointRecord(out CheckpointRecord Record)
{
	Record.bEnabled = bEnabled;
}

function ApplyCheckpointRecord(const out CheckpointRecord Record)
{
	bEnabled = Record.bEnabled;
	LightComponent.SetEnabled(bEnabled);
	ForceNetRelevant();
}

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
		// PointLightToggleable supports being toggled on the fly!
		return TRUE;
	}

}


defaultproperties
{
   Begin Object Class=PointLightComponent Name=PointLightComponent0 Archetype=PointLightComponent'Engine.Default__PointLight:PointLightComponent0'
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__PointLightToggleable:DrawLightRadius0'
      LightmassSettings=(IndirectLightingScale=0.000000)
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__PointLightToggleable:DrawLightSourceRadius0'
      CastDynamicShadows=False
      LightingChannels=(Dynamic=False)
      LightAffectsClassification=LAC_STATIC_AFFECTING
      Name="PointLightComponent0"
      ObjectArchetype=PointLightComponent'Engine.Default__PointLight:PointLightComponent0'
   End Object
   LightComponent=PointLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__PointLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Point_Toggleable_Statics'
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
   Components(3)=PointLightComponent0
   TickGroup=TG_DuringAsyncWork
   bStatic=False
   bHardAttach=True
   Name="Default__PointLightToggleable"
   ObjectArchetype=PointLight'Engine.Default__PointLight'
}
