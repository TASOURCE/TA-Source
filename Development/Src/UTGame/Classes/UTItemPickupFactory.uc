/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTItemPickupFactory extends UTPickupFactory
	abstract;

var		SoundCue			PickupSound;
var		localized string	PickupMessage;			// Human readable description when picked up.
var		float				RespawnTime;

/** Human readable string describing the use of this item (for UI) */
var		localized string	UseHintMessage;

simulated function InitializePickup()
{
	InitPickupMeshEffects();
}

static function string GetLocalString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2
	)
{
	return Default.PickupMessage;
}

/**
 * Give the benefit of this pickup to the recipient
 */
function SpawnCopyFor( Pawn Recipient )
{
	Recipient.PlaySound( PickupSound );
	Recipient.MakeNoise(0.2);

	if ( PlayerController(Recipient.Controller) != None )
	{
		PlayerController(Recipient.Controller).ReceiveLocalizedMessage(MessageClass,,,,class);
	}
}

// Set up respawn waiting if desired.
//
function SetRespawn()
{
	if( WorldInfo.Game.ShouldRespawn(self) )
		StartSleeping();
	else
		GotoState('Disabled');
}

function float GetRespawnTime()
{
	return RespawnTime;
}

function float BotDesireability(Pawn P, Controller C)
{
	return 0.0;
}

defaultproperties
{
   RespawnTime=30.000000
   Begin Object Class=DynamicLightEnvironmentComponent Name=PickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPickupFactory:PickupLightEnvironment'
      bCastShadows=False
      bDynamic=False
      Name="PickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPickupFactory:PickupLightEnvironment'
   End Object
   LightEnvironment=PickupLightEnvironment
   PickUpWaveForm=ForceFeedbackWaveform'UTGame.Default__UTItemPickupFactory:ForceFeedbackWaveformPickUp'
   InventoryType=Class'UTGame.UTPickupInventory'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTPickupFactory:CollisionCylinder'
      CollisionHeight=44.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTPickupFactory:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'UTGame.Default__UTPickupFactory:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'UTGame.Default__UTPickupFactory:PathRenderer'
   End Object
   Components(1)=PathRenderer
   Components(2)=PickupLightEnvironment
   Begin Object Class=StaticMeshComponent Name=BaseMeshComp Archetype=StaticMeshComponent'UTGame.Default__UTPickupFactory:BaseMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTItemPickupFactory:PickupLightEnvironment'
      MaxDrawDistance=7000.000000
      CachedMaxDrawDistance=7000.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      CollideActors=False
      Name="BaseMeshComp"
      ObjectArchetype=StaticMeshComponent'UTGame.Default__UTPickupFactory:BaseMeshComp'
   End Object
   Components(3)=BaseMeshComp
   CollisionComponent=CollisionCylinder
   MessageClass=Class'UTGame.UTPickupMessage'
   Name="Default__UTItemPickupFactory"
   ObjectArchetype=UTPickupFactory'UTGame.Default__UTPickupFactory'
}
