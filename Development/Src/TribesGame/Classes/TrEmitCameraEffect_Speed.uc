class TrEmitCameraEffect_Speed extends UDKEmitCameraEffect
	native;

/** Change the rotation of the emitter based on view? */
var() bool m_bUpdateRotation;

/** Change location based on pawn's velocity? */
var() bool m_bUpdateLocationBasedOnVelocity;

var() AudioComponent m_WeatherAC;

/** Stereo sound for the weather effects. */
var() SoundCue m_WeatherSound;

/** Fade in time for weather sound. */
var() float m_fFadeInWeatherSoundTime;

/** Fade out time for weather sound. */
var() float m_fFadeOutWeatherSoundTime;

/** Given updated camera information, adjust this effect to display appropriately. */
native function UpdateLocation( const out vector CamLoc, const out rotator CamRot, float CamFOVDeg );

function Activate()
{
	super.Activate();

	/*
	if( m_WeatherSound != none )
	{
		if( m_WeatherAC == none )
		{
			m_WeatherAC = new(self) class'AudioComponent';
			AttachComponent(m_WeatherAC);
			m_WeatherAC.SoundCue = m_WeatherSound;
		}

		if( m_WeatherAC != none )
		{
			m_WeatherAC.FadeIn(m_fFadeInWeatherSoundTime, 1.f);
		}
	}
*/
}

function Deactivate()
{
	super.Deactivate();

	/*
	if( m_WeatherAC != none )
	{
		m_WeatherAC.FadeOut(m_fFadeOutWeatherSoundTime, 0.f);
	}
*/
}

defaultproperties
{
   m_bUpdateRotation=True
   m_bUpdateLocationBasedOnVelocity=True
   m_fFadeInWeatherSoundTime=0.500000
   m_fFadeOutWeatherSoundTime=0.500000
   DistFromCamera=200.000000
   Begin Object Class=ParticleSystemComponent Name=ParticleSystemComponent0 Archetype=ParticleSystemComponent'UDKBase.Default__UDKEmitCameraEffect:ParticleSystemComponent0'
      ReplacementPrimitive=None
      Name="ParticleSystemComponent0"
      ObjectArchetype=ParticleSystemComponent'UDKBase.Default__UDKEmitCameraEffect:ParticleSystemComponent0'
   End Object
   ParticleSystemComponent=ParticleSystemComponent0
   bDestroyOnSystemFinish=False
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
   LifeSpan=0.000000
   Name="Default__TrEmitCameraEffect_Speed"
   ObjectArchetype=UDKEmitCameraEffect'UDKBase.Default__UDKEmitCameraEffect'
}
