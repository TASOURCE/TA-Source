/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTGib_Vehicle extends UTGib
	abstract;


var float TimeBeforeGibExplosionEffect;

/** Effect to have when gib is first spawned.  Actually happens at TimeBeforeGibExplosionEffect after being spawned **/
var ParticleSystem PS_GibExplosionEffect;

/** PS to attach and trail behind the gib **/
var ParticleSystem PS_GibTrailEffect;

/** Played when the Gib has been spawned **/
var SoundCue LoopedSound;

var name BurnName;
var float BurnDuration;

var MaterialInstanceTimeVarying MITV;

var class<UTVehicle> OwningClass;



simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	CreateAudioComponent( LoopedSound, TRUE, TRUE );
}


simulated function ActivateGibExplosionEffect()
{
	local int TeamNum;
	local ParticleSystemComponent PSC_Trail;

	if(WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}
	if ( Instigator != None )
	{
		TeamNum = Instigator.GetTeamNum();
	}
	if( TeamNum > 1 )
	{
		TeamNum = 0;
	}

	if( OwningClass.default.BurnOutMaterial[TeamNum] != None )
	{
		GibMeshComp.SetMaterial( 0, OwningClass.default.BurnOutMaterial[TeamNum] );
	}

	// don't spawn the particle system
	//$$BE Added check for none on the particle systems.
	/*if(WorldInfo.TimeSeconds - GibMeshComp.LastRenderTime < 1.0)
	{*/
		if (PS_GibExplosionEffect != none)
		{
			WorldInfo.MyEmitterPool.SpawnEmitter( PS_GibExplosionEffect, Location, Rotation );
		}
		
		if (PS_GibTrailEffect != none)
		{
			//$$BE Re-did this gibtraileffect thingy.
			// we can't use the pool for trails as they have a long (infi) duration
			//WorldInfo.MyEmitterPool.SpawnEmitter( PS_GibTrailEffect, Location, Rotation, self );
			/*PSC_Trail = new(self) class'ParticleSystemComponent';
			PSC_Trail.SetTemplate( PS_GibTrailEffect );
			AttachComponent( PSC_Trail );*/
			PSC_Trail = WorldInfo.MyEmitterPool.SpawnEmitterCustomLifetime(PS_GibTrailEffect);
			PSC_Trail.SetAbsolute(false, false, false);
			PSC_Trail.SetLODLevel(WorldInfo.bDropDetail ? 1 : 0);
			PSC_Trail.bUpdateComponentInTick = true;
			AttachComponent(PSC_Trail);
		}
	//}

	// if the vehicle could be close to us go ahead and do the MITV so that gibs near us will burn out nicely
	/*if(WorldInfo.TimeSeconds - GibMeshComp.LastRenderTime < 3.0)
	{	
		MITV = GibMeshComp.CreateAndSetMaterialInstanceTimeVarying( 0 );
		MITV.SetScalarStartTime( 'BurnTime', (LifeSpan-(BurnDuration-(FRand()*1.0f))) );
		//`log( "BurnDuration: " $ BurnDuration $ " LifeSpan: " $ LifeSpan $ " MITV: " $ MITV.Parent );
	}*/
}

defaultproperties
{
   TimeBeforeGibExplosionEffect=0.100000
   BurnName="BurnTime"
   BurnDuration=3.500000
   Begin Object Class=DynamicLightEnvironmentComponent Name=GibLightEnvironmentComp Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTGib:GibLightEnvironmentComp'
      AmbientShadowColor=(R=0.300000,G=0.300000,B=0.300000,A=1.000000)
      AmbientGlow=(R=0.500000,G=0.500000,B=0.500000,A=1.000000)
      bCastShadows=False
      Name="GibLightEnvironmentComp"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTGib:GibLightEnvironmentComp'
   End Object
   GibLightEnvironment=GibLightEnvironmentComp
   Components(0)=GibLightEnvironmentComp
   Name="Default__UTGib_Vehicle"
   ObjectArchetype=UTGib'UTGame.Default__UTGib'
}
