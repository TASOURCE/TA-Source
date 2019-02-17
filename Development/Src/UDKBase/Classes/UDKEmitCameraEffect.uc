/**
 * Base class for emitters which should be attached to the camera (for example blood effects across the screen)
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKEmitCameraEffect extends Emitter
	abstract
	native;

/** How far in front of the camera this emitter should live. */
var() protected float DistFromCamera;

/** Camera this emitter is attached to, will be notified when emitter is destroyed */
var protected UDKPlayerController Cam;

simulated event PostBeginPlay()
{
	// render in front of all in world objects
	ParticleSystemComponent.SetDepthPriorityGroup(SDPG_Foreground);

	super.PostBeginPlay();
}

/**
  * Tell camera to remove this effect when destroyed
  */
function Destroyed()
{
	Cam.RemoveCameraEffect(self);
	super.Destroyed();
}

/** Tell the emitter what camera it is attached to. */
function RegisterCamera( UDKPlayerController inCam )
{
	Cam = inCam;
}

//$$ML:
function Activate()
{
	if( ParticleSystemComponent != none )
	{
		ParticleSystemComponent.ActivateSystem();
		bCurrentlyActive = true;
	}
}

function Deactivate()
{
		ParticleSystemComponent.DeactivateSystem();
		bCurrentlyActive = false;
}
//$$ML: End.

/** Given updated camera information, adjust this effect to display appropriately. */
native function UpdateLocation( const out vector CamLoc, const out rotator CamRot, float CamFOVDeg );

defaultproperties
{
   DistFromCamera=90.000000
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'Engine.Default__Emitter:ParticleSystemComponent0'
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__Emitter:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   bDestroyOnSystemFinish=True
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Emitter:Sprite'
      Sprite=Texture2D'EditorResources.S_Emitter'
      bIsScreenSizeScaled=True
      ScreenSize=0.002500
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Emitter:Sprite'
   End Object
   Components(0)=Sprite
   Components(1)=ParticleSystemComponent0
   Begin Object Class=ArrowComponent Name=ArrowComponent0 Archetype=ArrowComponent'Engine.Default__Emitter:ArrowComponent0'
      ArrowColor=(B=128,G=255,R=0,A=255)
      ArrowSize=1.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="ArrowComponent0"
      ObjectArchetype=ArrowComponent'Engine.Default__Emitter:ArrowComponent0'
   End Object
   Components(2)=ArrowComponent0
   bNoDelete=False
   bNetInitialRotation=True
   LifeSpan=10.000000
   Name="Default__UDKEmitCameraEffect"
   ObjectArchetype=Emitter'Engine.Default__Emitter'
}
