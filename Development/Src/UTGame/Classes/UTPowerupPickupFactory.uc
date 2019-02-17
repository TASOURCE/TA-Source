/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTPowerupPickupFactory extends UTPickupFactory
	abstract;

/** adds weapon overlay material this powerup uses (if any) to the GRI in the correct spot
 *  @see UTPawn.WeaponOverlayFlags, UTWeapon::SetWeaponOverlayFlags
 */
simulated function AddWeaponOverlay(UTGameReplicationInfo GRI)
{
	local class<UTInventory> UTInvClass;

	UTInvClass = class<UTInventory>(InventoryType);
	if (UTInvClass != None)
	{
		UTInvClass.static.AddWeaponOverlay(GRI);
	}
}

function SpawnCopyFor( Pawn Recipient )
{
	if ( UTPlayerReplicationInfo(Recipient.PlayerReplicationInfo) != None )
	{
		UTPlayerReplicationInfo(Recipient.PlayerReplicationInfo).IncrementPickupStat(GetPickupStatName());
	}
	Recipient.MakeNoise(0.5);

	super.SpawnCopyFor(Recipient);
}

defaultproperties
{
   Begin Object Class=DynamicLightEnvironmentComponent Name=PickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPickupFactory:PickupLightEnvironment'
      bCastShadows=False
      bDynamic=False
      Name="PickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPickupFactory:PickupLightEnvironment'
   End Object
   LightEnvironment=PickupLightEnvironment
   PickUpWaveForm=ForceFeedbackWaveform'UTGame.Default__UTPowerupPickupFactory:ForceFeedbackWaveformPickUp'
   bRotatingPickup=True
   bIsSuperItem=True
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
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTPowerupPickupFactory:PickupLightEnvironment'
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
   bMovable=True
   CollisionComponent=CollisionCylinder
   Name="Default__UTPowerupPickupFactory"
   ObjectArchetype=UTPickupFactory'UTGame.Default__UTPickupFactory'
}
