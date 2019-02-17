/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class FogVolumeConeDensityInfo extends FogVolumeDensityInfo
	showcategories(Movement)
	native(FogVolume)
	abstract;

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

}


defaultproperties
{
   Begin Object Class=FogVolumeConeDensityComponent Name=FogVolumeComponent0
      PreviewCone=DrawLightConeComponent'Engine.Default__FogVolumeConeDensityInfo:DrawCone0'
      Name="FogVolumeComponent0"
      ObjectArchetype=FogVolumeConeDensityComponent'Engine.Default__FogVolumeConeDensityComponent'
   End Object
   DensityComponent=FogVolumeComponent0
   Begin Object Class=StaticMeshComponent Name=AutomaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__FogVolumeDensityInfo:AutomaticMeshComponent0'
      StaticMesh=StaticMesh'EngineMeshes.Cube'
      WireframeColor=(B=200,G=100,R=100,A=255)
      ReplacementPrimitive=None
      bIgnoreOwnerHidden=True
      bUseAsOccluder=False
      bSelectable=False
      bAcceptsStaticDecals=False
      bAcceptsDynamicDecals=False
      CastShadow=False
      bCastDynamicShadow=False
      bAcceptsLights=False
      bAcceptsDynamicLights=False
      BlockRigidBody=False
      Name="AutomaticMeshComponent0"
      ObjectArchetype=StaticMeshComponent'Engine.Default__FogVolumeDensityInfo:AutomaticMeshComponent0'
   End Object
   AutomaticMeshComponent=AutomaticMeshComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__FogVolumeDensityInfo:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__FogVolumeDensityInfo:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=AutomaticMeshComponent0
   Begin Object Class=DrawLightConeComponent Name=DrawCone0
      ConeColor=(B=255,G=255,R=200,A=255)
      ReplacementPrimitive=None
      Name="DrawCone0"
      ObjectArchetype=DrawLightConeComponent'Engine.Default__DrawLightConeComponent'
   End Object
   Components(2)=DrawCone0
   Components(3)=FogVolumeComponent0
   Name="Default__FogVolumeConeDensityInfo"
   ObjectArchetype=FogVolumeDensityInfo'Engine.Default__FogVolumeDensityInfo'
}
