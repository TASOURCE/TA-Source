/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTEmitCameraEffect extends UDKEmitCameraEffect
	abstract;
	
	// REMOVE

defaultproperties
{
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'UDKBase.Default__UDKEmitCameraEffect:ParticleSystemComponent0'
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'UDKBase.Default__UDKEmitCameraEffect:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UDKBase.Default__UDKEmitCameraEffect:Sprite'
      Sprite=Texture2D'EditorResources.S_Emitter'
      bIsScreenSizeScaled=True
      ScreenSize=0.002500
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UDKBase.Default__UDKEmitCameraEffect:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=ParticleSystemComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'UDKBase.Default__UDKEmitCameraEffect:ArrowComponent0'
      ArrowColor=(B=128,G=255,R=0,A=255)
      ArrowSize=1.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'UDKBase.Default__UDKEmitCameraEffect:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   Name="Default__UTEmitCameraEffect"
   ObjectArchetype=UDKEmitCameraEffect'UDKBase.Default__UDKEmitCameraEffect'
}
