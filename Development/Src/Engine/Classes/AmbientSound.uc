/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

// Base ambient sound actor

class AmbientSound extends Keypoint
	AutoExpandCategories( Audio )
	ClassGroup(Sounds)
	native( Sound );

/** Should the audio component automatically play on load? */
var() bool bAutoPlay;

/** Audio component to play */
var( Audio ) editconst const AudioComponent AudioComponent;

/** Is the audio component currently playing? */
var private bool bIsPlaying;

defaultproperties
{
   bAutoPlay=True
   Begin Object Class=AudioComponent Name=AudioComponent0
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSound:DrawSoundRadius0'
      Name="AudioComponent0"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   AudioComponent=AudioComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Keypoint:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=DrawSoundRadiusComponent Name=DrawSoundRadius0
      SphereColor=(B=0,G=153,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__DrawSoundRadiusComponent'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=AudioComponent0
   Name="Default__AmbientSound"
   ObjectArchetype=Keypoint'Engine.Default__Keypoint'
}
