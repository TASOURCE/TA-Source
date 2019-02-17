/**
 * Toggleable version of SpotLight.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SpotLightToggleable extends SpotLight
	native(Light)
	ClassGroup(Lights,SpotLights)
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
		// SpotLightToggleable supports being toggled on the fly!
		return TRUE;
	}

}


defaultproperties
{
   Begin Object Class=SpotLightComponent Name=SpotLightComponent0 Archetype=SpotLightComponent'Engine.Default__SpotLight:SpotLightComponent0'
      PreviewInnerCone=DrawLightConeComponent'Engine.Default__SpotLightToggleable:DrawInnerCone0'
      PreviewOuterCone=DrawLightConeComponent'Engine.Default__SpotLightToggleable:DrawOuterCone0'
      PreviewLightRadius=DrawLightRadiusComponent'Engine.Default__SpotLightToggleable:DrawLightRadius0'
      LightmassSettings=(IndirectLightingScale=0.000000)
      PreviewLightSourceRadius=DrawLightRadiusComponent'Engine.Default__SpotLightToggleable:DrawLightSourceRadius0'
      CastDynamicShadows=False
      LightingChannels=(Dynamic=False)
      LightAffectsClassification=LAC_STATIC_AFFECTING
      Name="SpotLightComponent0"
      ObjectArchetype=SpotLightComponent'Engine.Default__SpotLight:SpotLightComponent0'
   End Object
   LightComponent=SpotLightComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__SpotLight:Sprite'
      Sprite=Texture2D'EditorResources.LightIcons.Light_Spot_Toggleable_Statics'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SpotLight:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightRadius0'
      ReplacementPrimitive=None
      Name="DrawLightRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightRadius0'
   End Object
   Components(1)=DrawLightRadius0
   Begin Object Class=DrawLightConeComponent Name=DrawInnerCone0 Archetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawInnerCone0'
      ReplacementPrimitive=None
      Name="DrawInnerCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawInnerCone0'
   End Object
   Components(2)=DrawInnerCone0
   Begin Object Class=DrawLightConeComponent Name=DrawOuterCone0 Archetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawOuterCone0'
      ConeColor=(B=255,G=255,R=200,A=255)
      ReplacementPrimitive=None
      Name="DrawOuterCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__SpotLight:DrawOuterCone0'
   End Object
   Components(3)=DrawOuterCone0
   Begin Object Class=DrawLightRadiusComponent Name=DrawLightSourceRadius0 Archetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightSourceRadius0'
      SphereColor=(B=0,G=239,R=231,A=255)
      ReplacementPrimitive=None
      Name="DrawLightSourceRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__SpotLight:DrawLightSourceRadius0'
   End Object
   Components(4)=DrawLightSourceRadius0
   Components(5)=SpotLightComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__SpotLight:ArrowComponent0'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__SpotLight:ArrowComponent0'
   End Object
   Components(6)=ArrowComponent0
   TickGroup=TG_DuringAsyncWork
   bStatic=False
   bHardAttach=True
   Name="Default__SpotLightToggleable"
   ObjectArchetype=SpotLight'Engine.Default__SpotLight'
}
