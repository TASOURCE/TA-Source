/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class FogVolumeSphericalDensityInfo extends FogVolumeDensityInfo
	showcategories(Movement)
	native(FogVolume)
	placeable;

defaultproperties
{
   Begin Object Class=FogVolumeSphericalDensityComponent Name=FogVolumeComponent0
      PreviewSphereRadius=DrawLightRadiusComponent'Engine.Default__FogVolumeSphericalDensityInfo:DrawSphereRadius0'
      Name="FogVolumeComponent0"
      ObjectArchetype=FogVolumeSphericalDensityComponent'Engine.Default__FogVolumeSphericalDensityComponent'
   End Object
   DensityComponent=FogVolumeComponent0
   Begin Object Class=StaticMeshComponent Name=AutomaticMeshComponent0 Archetype=StaticMeshComponent'Engine.Default__FogVolumeDensityInfo:AutomaticMeshComponent0'
      StaticMesh=StaticMesh'EngineMeshes.Sphere'
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
      CollideActors=False
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
   Begin Object Class=DrawLightRadiusComponent Name=DrawSphereRadius0
      ReplacementPrimitive=None
      Name="DrawSphereRadius0"
      ObjectArchetype=DrawLightRadiusComponent'Engine.Default__DrawLightRadiusComponent'
   End Object
   Components(2)=DrawSphereRadius0
   Components(3)=FogVolumeComponent0
   Name="Default__FogVolumeSphericalDensityInfo"
   ObjectArchetype=FogVolumeDensityInfo'Engine.Default__FogVolumeDensityInfo'
}
