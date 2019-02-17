class TrWeatherVolume extends Volume
	placeable;

/** List of emitters that will activate when the local pawn enters the volume and will deactivate
 *  when the local pawn leaves the volum. */
var() array<Emitter> m_WeatherEmitters;

/** If TRUE, will deactivate the player-centric weather effect when the pawn enters the volume. */
var() bool m_DeactivatePawnCentricWeatherOnEnter;

simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
	local TrPlayerController TrPC;
	local int i;
	local TrPlayerPawn TrP;

	TrP = TrPlayerPawn(Other);

	if( TrP != none )
	{
		if( TrP != none && TrP.IsLocallyControlled() )
		{
			for( i = 0; i < m_WeatherEmitters.Length; i++ )
			{
				m_WeatherEmitters[i].ParticleSystemComponent.ActivateSystem();
				m_WeatherEmitters[i].bCurrentlyActive = true;
			}

			TrPC = TrPlayerController(TrP.Controller);
			if( TrPC != none )
			{
				TrPC.PawnEnteredWeatherVolume(m_DeactivatePawnCentricWeatherOnEnter, self);
			}
		}
	}
}

simulated event untouch( Actor Other )
{
	local TrPlayerController TrPC;
	local int i;
	local TrPlayerPawn TrP;

	TrP = TrPlayerPawn(Other);

	if( TrP != none )
	{
		if( TrP != none && TrP.IsLocallyControlled() )
		{
			for( i = 0; i < m_WeatherEmitters.Length; i++ )
			{
				m_WeatherEmitters[i].ParticleSystemComponent.DeactivateSystem();
				m_WeatherEmitters[i].bCurrentlyActive = false;
			}

			TrPC = TrPlayerController(TrP.Controller);
			if( TrPC != none )
			{
				TrPC.PawnLeftWeatherVolume(m_DeactivatePawnCentricWeatherOnEnter, self);
			}
		}
	}
}

defaultproperties
{
   m_DeactivatePawnCentricWeatherOnEnter=True
   BrushColor=(B=120,G=255,R=0,A=0)
   bColored=True
   Begin Object Class=BrushComponent Name=BrushComponent0 Archetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
      ReplacementPrimitive=None
      bAcceptsLights=True
      CollideActors=True
      BlockNonZeroExtent=True
      bDisableAllRigidBody=True
      AlwaysLoadOnClient=True
      AlwaysLoadOnServer=True
      LightingChannels=(bInitialized=True,Dynamic=True)
      Name="BrushComponent0"
      ObjectArchetype=BrushComponent'Engine.Default__Volume:BrushComponent0'
   End Object
   BrushComponent=BrushComponent0
   Components(0)=BrushComponent0
   CollisionType=COLLIDE_CustomDefault
   CollisionComponent=BrushComponent0
   Name="Default__TrWeatherVolume"
   ObjectArchetype=Volume'Engine.Default__Volume'
}
