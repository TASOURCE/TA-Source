/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
class SplineLoftActorMovable extends SplineLoftActor
	placeable
	native(Spline);

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyMeshLightEnvironment
      Name="MyMeshLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
   End Object
   MeshLightEnvironment=MyMeshLightEnvironment
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__SplineLoftActor:Sprite'
      Sprite=Texture2D'EditorResources.Spline.T_Loft_Spline'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.500000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__SplineLoftActor:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=MyMeshLightEnvironment
   Physics=PHYS_Interpolating
   bStatic=False
   bNoDelete=True
   bMovable=True
   Name="Default__SplineLoftActorMovable"
   ObjectArchetype=SplineLoftActor'Engine.Default__SplineLoftActor'
}
