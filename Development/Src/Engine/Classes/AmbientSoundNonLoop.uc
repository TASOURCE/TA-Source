/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
 
// Version of AmbientSoundSimple that picks a random non-looping sound to play.

class AmbientSoundNonLoop extends AmbientSoundSimple
	native( Sound );

defaultproperties
{
   Begin Object Class=SoundCue Name=SoundCue0 Archetype=SoundCue'Engine.Default__AmbientSoundSimple:SoundCue0'
      SoundClass="Ambient"
      Name="SoundCue0"
      ObjectArchetype=SoundCue'Engine.Default__AmbientSoundSimple:SoundCue0'
   End Object
   SoundCueInstance=SoundCue'Engine.Default__AmbientSoundNonLoop:SoundCue0'
   Begin Object Class=SoundNodeAmbientNonLoop Name=SoundNodeAmbientNonLoop0
      Begin Object Class=DistributionFloatUniform Name=DistributionDelayTime ObjName=DistributionDelayTime Archetype=DistributionFloatUniform'Engine.Default__SoundNodeAmbientNonLoop:DistributionDelayTime'
         Min=1.000000
         Max=1.000000
         Name="DistributionDelayTime"
         ObjectArchetype=DistributionFloatUniform'DistributionDelayTime'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionMinRadius ObjName=DistributionMinRadius Archetype=DistributionFloatUniform'Engine.Default__SoundNodeAmbientNonLoop:DistributionMinRadius'
         Min=400.000000
         Max=400.000000
         Name="DistributionMinRadius"
         ObjectArchetype=DistributionFloatUniform'DistributionMinRadius'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionMaxRadius ObjName=DistributionMaxRadius Archetype=DistributionFloatUniform'Engine.Default__SoundNodeAmbientNonLoop:DistributionMaxRadius'
         Min=5000.000000
         Max=5000.000000
         Name="DistributionMaxRadius"
         ObjectArchetype=DistributionFloatUniform'DistributionMaxRadius'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionLPFMinRadius ObjName=DistributionLPFMinRadius Archetype=DistributionFloatUniform'Engine.Default__SoundNodeAmbientNonLoop:DistributionLPFMinRadius'
         Min=1500.000000
         Max=1500.000000
         Name="DistributionLPFMinRadius"
         ObjectArchetype=DistributionFloatUniform'DistributionLPFMinRadius'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionLPFMaxRadius ObjName=DistributionLPFMaxRadius Archetype=DistributionFloatUniform'Engine.Default__SoundNodeAmbientNonLoop:DistributionLPFMaxRadius'
         Min=2500.000000
         Max=2500.000000
         Name="DistributionLPFMaxRadius"
         ObjectArchetype=DistributionFloatUniform'DistributionLPFMaxRadius'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionPitch ObjName=DistributionPitch Archetype=DistributionFloatUniform'Engine.Default__SoundNodeAmbientNonLoop:DistributionPitch'
         Min=1.000000
         Max=1.000000
         Name="DistributionPitch"
         ObjectArchetype=DistributionFloatUniform'DistributionPitch'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionVolume ObjName=DistributionVolume Archetype=DistributionFloatUniform'Engine.Default__SoundNodeAmbientNonLoop:DistributionVolume'
         Min=0.700000
         Max=0.700000
         Name="DistributionVolume"
         ObjectArchetype=DistributionFloatUniform'DistributionVolume'
      End Object
      Name="SoundNodeAmbientNonLoop0"
      ObjectArchetype=SoundNodeAmbientNonLoop'Engine.Default__SoundNodeAmbientNonLoop'
   End Object
   SoundNodeInstance=SoundNodeAmbientNonLoop'Engine.Default__AmbientSoundNonLoop:SoundNodeAmbientNonLoop0'
   Begin Object Class=AudioComponent Name=AudioComponent0 Archetype=AudioComponent'Engine.Default__AmbientSoundSimple:AudioComponent0'
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSoundNonLoop:DrawSoundRadius0'
      Name="AudioComponent0"
      ObjectArchetype=AudioComponent'Engine.Default__AmbientSoundSimple:AudioComponent0'
   End Object
   AudioComponent=AudioComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__AmbientSoundSimple:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound_Non_Loop'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Scale=0.250000
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__AmbientSoundSimple:Sprite'
   End Object
   SpriteComp=Sprite
   Components(0)=Sprite
   Begin Object Class=DrawSoundRadiusComponent Name=DrawSoundRadius0 Archetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimple:DrawSoundRadius0'
      SphereColor=(B=51,G=0,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimple:DrawSoundRadius0'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=AudioComponent0
   DrawScale=2.000000
   Name="Default__AmbientSoundNonLoop"
   ObjectArchetype=AmbientSoundSimple'Engine.Default__AmbientSoundSimple'
}
