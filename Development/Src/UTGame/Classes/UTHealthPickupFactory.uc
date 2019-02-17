/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTHealthPickupFactory extends UTItemPickupFactory
	ClassGroup(Pickups,Health)
	abstract;

var		int					HealingAmount;
var		bool				bSuperHeal;

simulated static function UpdateHUD(UTHUD H)
{
	Super.UpdateHUD(H);
	H.LastHealthPickupTime = H.LastPickupTime;
}

function SpawnCopyFor( Pawn Recipient )
{
	// Give health to recipient
	Recipient.Health += HealAmount(Recipient);

	if ( UTPlayerReplicationInfo(Recipient.PlayerReplicationInfo) != None )
	{
		UTPlayerReplicationInfo(Recipient.PlayerReplicationInfo).IncrementPickupStat(GetPickupStatName());
	}

	super.SpawnCopyFor(Recipient);
}

function int HealAmount(Pawn Recipient)
{
	local UTPawn UTP;

	if (bSuperHeal)
	{
		UTP = UTPawn(Recipient);
		if (UTP != None)
		{
			return FClamp(UTP.SuperHealthMax - Recipient.Health, 0, HealingAmount);
		}
	}
	return FClamp(Recipient.HealthMax - Recipient.Health, 0, HealingAmount);
}

//=============================================================================
// Pickup state: this inventory item is sitting on the ground.

auto state Pickup
{
	/* DetourWeight()
	value of this path to take a quick detour (usually 0, used when on route to distant objective, but want to grab inventory for example)
	*/
	function float DetourWeight(Pawn Other,float PathWeight)
	{
		local int Heal;

		Heal = HealAmount(Other);

		if ( UTBot(Other.Controller).PriorityObjective() && (Other.Health > 65) )
			return (0.01 * Heal)/PathWeight;
		return (0.02 * Heal)/PathWeight;
	}

	/* ValidTouch()
	 Validate touch (if valid return true to let other pick me up and trigger event).
	*/
	function bool ValidTouch( Pawn Other )
	{
		if ( !Super.ValidTouch(Other) )
		{
			return false;
		}

		// superhealth can always be picked up in DM (to deny it to other players)
		if ( bSuperHeal && !WorldInfo.Game.bTeamGame )
		{
			return true;
		}

		// does Other need health?
		return ( HealAmount(Other) > 0 );
	}
}

function float BotDesireability(Pawn P, Controller C)
{
	local float desire;

	desire = HealAmount(P);

	if ( (P.Weapon == None) || (P.Weapon.AIRating > 0.5) )
		desire *= 1.7;
	if ( bSuperHeal || (P.Health < 45) )
	{
		//
		desire = FMin(0.025 * desire, 2.2);
		if (bSuperHeal && !WorldInfo.Game.bTeamGame && UTBot(C) != None && UTBot(C).Skill >= 4.0)
		{
			// high skill bots keep considering powerups that they don't need if they can still pick them up
			// to deny the enemy any chance of getting them
			desire = FMax(desire, 0.001);
		}
		return desire;
	}
	else
	{
		if ( desire > 6 )
			desire = FMax(desire,25);
		else if (UTBot(C) != None && UTBot(C).bHuntPlayer)
			return 0;
		return ( FMin(0.017 * desire, 2.0) );
	}
}

defaultproperties
{
   HealingAmount=20
   PickupMessage="Health Pack"
   UseHintMessage="A first aid kit is a collection of supplies and equipment for use in giving first aid. First aid kits may be made up of different contents depending on who has assembled the kit and for what purpose."
   Begin Object Class=DynamicLightEnvironmentComponent Name=PickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTItemPickupFactory:PickupLightEnvironment'
      bCastShadows=False
      bDynamic=False
      Name="PickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTItemPickupFactory:PickupLightEnvironment'
   End Object
   LightEnvironment=PickupLightEnvironment
   PickupStatName="PICKUPS_HEALTH"
   PickUpWaveForm=ForceFeedbackWaveform'UTGame.Default__UTHealthPickupFactory:ForceFeedbackWaveformPickUp'
   BaseBrightEmissive=(R=2.000000,G=50.000000,B=10.000000,A=1.000000)
   BaseDimEmissive=(R=0.200000,G=5.000000,B=1.000000,A=0.000000)
   MaxDesireability=0.700000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTItemPickupFactory:CollisionCylinder'
      CollisionHeight=44.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTItemPickupFactory:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'UTGame.Default__UTItemPickupFactory:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'UTGame.Default__UTItemPickupFactory:PathRenderer'
   End Object
   Components(1)=PathRenderer
   Components(2)=PickupLightEnvironment
   Begin Object Class=StaticMeshComponent Name=BaseMeshComp Archetype=StaticMeshComponent'UTGame.Default__UTItemPickupFactory:BaseMeshComp'
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTHealthPickupFactory:PickupLightEnvironment'
      MaxDrawDistance=7000.000000
      CachedMaxDrawDistance=7000.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      CollideActors=False
      Name="BaseMeshComp"
      ObjectArchetype=StaticMeshComponent'UTGame.Default__UTItemPickupFactory:BaseMeshComp'
   End Object
   Components(3)=BaseMeshComp
   Begin Object Class=StaticMeshComponent Name=HealthPickUpMesh
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTHealthPickupFactory:PickupLightEnvironment'
      MaxDrawDistance=4500.000000
      CachedMaxDrawDistance=4500.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      CollideActors=False
      BlockActors=False
      BlockRigidBody=False
      Name="HealthPickUpMesh"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(4)=HealthPickUpMesh
   CollisionComponent=CollisionCylinder
   Name="Default__UTHealthPickupFactory"
   ObjectArchetype=UTItemPickupFactory'UTGame.Default__UTItemPickupFactory'
}
