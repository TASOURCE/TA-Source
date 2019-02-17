/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

// An ambient sound that can be turned on or off

class AmbientSoundSimpleToggleable extends AmbientSoundSimple
	AutoExpandCategories( AmbientSoundSimpleToggleable )
	native( Sound );

/** used to update status of toggleable level placed ambient sounds on clients */
var repnotify bool bCurrentlyPlaying;

var() bool bFadeOnToggle;
var() float FadeInDuration;
var() float FadeInVolumeLevel;
var() float FadeOutDuration;
var() float FadeOutVolumeLevel;

/** Used to track whether the sound's auto-play setting should be ignored or not */
var transient bool bIgnoreAutoPlay;

struct CheckpointRecord
{
	var bool bCurrentlyPlaying;
};

replication
{
	if( Role == ROLE_Authority )
		bCurrentlyPlaying;
}

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	bCurrentlyPlaying = AudioComponent.bAutoPlay;
}

simulated event ReplicatedEvent(name VarName)
{
	if( VarName == 'bCurrentlyPlaying' )
	{
		if( bCurrentlyPlaying )
		{
			StartPlaying();
		}
		else
		{
			StopPlaying();
		}
	}
	else
	{
		Super.ReplicatedEvent( VarName );
	}
}

simulated function StartPlaying()
{
	if( bFadeOnToggle )
	{
		AudioComponent.FadeIn( FadeInDuration, FadeInVolumeLevel );
	}
	else
	{
		AudioComponent.Play();
	}
	
	bCurrentlyPlaying = TRUE;
}

simulated function StopPlaying()
{
	if( bFadeOnToggle )
	{
		AudioComponent.FadeOut( FadeOutDuration, FadeOutVolumeLevel );
	}
	else
	{
		AudioComponent.Stop();
	}
	
	bCurrentlyPlaying = FALSE;
}

/**
 * Handling Toggle event from Kismet.
 */
simulated function OnToggle( SeqAct_Toggle Action )
{
	if( Action.InputLinks[0].bHasImpulse || ( Action.InputLinks[2].bHasImpulse && !AudioComponent.bWasPlaying ) )
	{
		StartPlaying();
	}
	else
	{
		// The sound has been intentionally toggled off, ignore autoplay from now on
		bIgnoreAutoPlay = TRUE;
		StopPlaying();
	}
	
	// we now need to replicate this Actor so clients get the updated status
	ForceNetRelevant();
}

function CreateCheckpointRecord( out CheckpointRecord Record )
{
	Record.bCurrentlyPlaying = bCurrentlyPlaying;
}

function ApplyCheckpointRecord( const out CheckpointRecord Record )
{
	bCurrentlyPlaying = Record.bCurrentlyPlaying;
	if( bCurrentlyPlaying )
	{
		StartPlaying();
	}
	else
	{
		StopPlaying();
	}
}

defaultproperties
{
   FadeInDuration=1.000000
   FadeInVolumeLevel=1.000000
   FadeOutDuration=1.000000
   Begin Object Class=SoundCue Name=SoundCue0 Archetype=SoundCue'Engine.Default__AmbientSoundSimple:SoundCue0'
      SoundClass="Ambient"
      Name="SoundCue0"
      ObjectArchetype=SoundCue'Engine.Default__AmbientSoundSimple:SoundCue0'
   End Object
   SoundCueInstance=SoundCue'Engine.Default__AmbientSoundSimpleToggleable:SoundCue0'
   Begin Object Class=SoundNodeAmbient Name=SoundNodeAmbient0 Archetype=SoundNodeAmbient'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0'
      Begin Object Class=DistributionFloatUniform Name=DistributionMinRadius ObjName=DistributionMinRadius Archetype=DistributionFloatUniform'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0.DistributionMinRadius'
         Min=400.000000
         Max=400.000000
         Name="DistributionMinRadius"
         ObjectArchetype=DistributionFloatUniform'DistributionMinRadius'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionMaxRadius ObjName=DistributionMaxRadius Archetype=DistributionFloatUniform'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0.DistributionMaxRadius'
         Min=5000.000000
         Max=5000.000000
         Name="DistributionMaxRadius"
         ObjectArchetype=DistributionFloatUniform'DistributionMaxRadius'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionLPFMinRadius ObjName=DistributionLPFMinRadius Archetype=DistributionFloatUniform'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0.DistributionLPFMinRadius'
         Min=1500.000000
         Max=1500.000000
         Name="DistributionLPFMinRadius"
         ObjectArchetype=DistributionFloatUniform'DistributionLPFMinRadius'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionLPFMaxRadius ObjName=DistributionLPFMaxRadius Archetype=DistributionFloatUniform'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0.DistributionLPFMaxRadius'
         Min=2500.000000
         Max=2500.000000
         Name="DistributionLPFMaxRadius"
         ObjectArchetype=DistributionFloatUniform'DistributionLPFMaxRadius'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionPitch ObjName=DistributionPitch Archetype=DistributionFloatUniform'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0.DistributionPitch'
         Min=1.000000
         Max=1.000000
         Name="DistributionPitch"
         ObjectArchetype=DistributionFloatUniform'DistributionPitch'
      End Object
      Begin Object Class=DistributionFloatUniform Name=DistributionVolume ObjName=DistributionVolume Archetype=DistributionFloatUniform'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0.DistributionVolume'
         Min=0.700000
         Max=0.700000
         Name="DistributionVolume"
         ObjectArchetype=DistributionFloatUniform'DistributionVolume'
      End Object
      Name="SoundNodeAmbient0"
      ObjectArchetype=SoundNodeAmbient'Engine.Default__AmbientSoundSimple:SoundNodeAmbient0'
   End Object
   SoundNodeInstance=SoundNodeAmbient'Engine.Default__AmbientSoundSimpleToggleable:SoundNodeAmbient0'
   bAutoPlay=False
   Begin Object Class=AudioComponent Name=AudioComponent0 Archetype=AudioComponent'Engine.Default__AmbientSoundSimple:AudioComponent0'
      bStopWhenOwnerDestroyed=True
      bShouldRemainActiveIfDropped=True
      PreviewSoundRadius=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimpleToggleable:DrawSoundRadius0'
      Name="AudioComponent0"
      ObjectArchetype=AudioComponent'Engine.Default__AmbientSoundSimple:AudioComponent0'
   End Object
   AudioComponent=AudioComponent0
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__AmbientSoundSimple:Sprite'
      Sprite=Texture2D'EditorResources.AmbientSoundIcons.S_Ambient_Sound_Toggleable'
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
      SphereColor=(B=102,G=255,R=255,A=255)
      ReplacementPrimitive=None
      Name="DrawSoundRadius0"
      ObjectArchetype=DrawSoundRadiusComponent'Engine.Default__AmbientSoundSimple:DrawSoundRadius0'
   End Object
   Components(1)=DrawSoundRadius0
   Components(2)=AudioComponent0
   bStatic=False
   bNoDelete=True
   Name="Default__AmbientSoundSimpleToggleable"
   ObjectArchetype=AmbientSoundSimple'Engine.Default__AmbientSoundSimple'
}
