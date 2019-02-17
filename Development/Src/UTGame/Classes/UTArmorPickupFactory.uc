/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTArmorPickupFactory extends UTItemPickupFactory
	ClassGroup(Pickups,Armor)
	abstract;

var int		ShieldAmount;

simulated static function UpdateHUD(UTHUD H)
{
	Super.UpdateHUD(H);
	H.LastArmorPickupTime = H.LastPickupTime;
}

simulated function PostBeginPlay()
{
	if(!bPickupHidden)
	{
		SetPickupVisible();
	}
	Super.PostBeginPlay();
}

function SpawnCopyFor( Pawn Recipient )
{
	if ( UTPawn(Recipient) == None )
		return;

	if ( UTPlayerReplicationInfo(Recipient.PlayerReplicationInfo) != None )
	{
		UTPlayerReplicationInfo(Recipient.PlayerReplicationInfo).IncrementPickupStat(GetPickupStatName());
	}

	// Give armor to recipient
	Recipient.MakeNoise(0.2);
	AddShieldStrength(UTPawn(Recipient));
	super.SpawnCopyFor(Recipient);
}

/** CanUseShield()
returns how many shield units P could use
*/
function int CanUseShield(UTPawn P)
{
	return 0;
}

/** AddShieldStrength()
add shield to appropriate P armor type.
*/
function AddShieldStrength(UTPawn P);

//=============================================================================
// Pickup state: this inventory item is sitting on the ground.

auto state Pickup
{
	/* DetourWeight()
	value of this path to take a quick detour (usually 0, used when on route to distant objective, but want to grab inventory for example)
	*/
	function float DetourWeight(Pawn P,float PathWeight)
	{
		local float Need;
		local UTPawn Other;

		Other = UTPawn(P);
		if ( Other == None )
			return 0;
		Need = CanUseShield(Other);
		if ( UTBot(Other.Controller).PriorityObjective() && (Need < 0.4 * ShieldAmount) )
			return (0.005 * MaxDesireability * Need)/PathWeight;
		if ( Need <= 0 )
		{
			if ( !WorldInfo.Game.bTeamGame )
				Need = 0.5;
			else
				return 0;
		}
		else if ( !WorldInfo.Game.bTeamGame )
			Need = FMax(Need,0.6);
		return (0.013 * MaxDesireability * Need)/PathWeight;
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

		// does Other need armor?
		return ( (CanUseShield(UTPawn(Other)) > 0) || !WorldInfo.Game.bTeamGame );
	}
}

function float BotDesireability(Pawn Bot, Controller C)
{
	local float Desire;

	if ( UTPawn(Bot) == None )
		return 0;

	Desire = (0.013 * MaxDesireability * CanUseShield(UTPawn(Bot)));
	if (!WorldInfo.Game.bTeamGame && UTBot(C) != None && UTBot(C).Skill >= 4.0)
	{
		// high skill bots keep considering powerups that they don't need if they can still pick them up
		// to deny the enemy any chance of getting them
		Desire = FMax(Desire, 0.001);
	}
	return Desire;
}

defaultproperties
{
   ShieldAmount=20
   PickupMessage="Armor"
   UseHintMessage="Armor is protective covering used to prevent damage from being inflicted to an individual through use of direct contact weapons, projectiles, or a potentionally dangerous environment."
   Begin Object Class=DynamicLightEnvironmentComponent Name=PickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTItemPickupFactory:PickupLightEnvironment'
      bCastShadows=False
      bDynamic=False
      Name="PickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTItemPickupFactory:PickupLightEnvironment'
   End Object
   LightEnvironment=PickupLightEnvironment
   PickupStatName="PICKUPS_ARMOR"
   PickUpWaveForm=ForceFeedbackWaveform'UTGame.Default__UTArmorPickupFactory:ForceFeedbackWaveformPickUp'
   bRotatingPickup=True
   BaseBrightEmissive=(R=25.000000,G=25.000000,B=1.000000,A=1.000000)
   BaseDimEmissive=(R=1.000000,G=1.000000,B=0.010000,A=1.000000)
   YawRotationRate=24000.000000
   bPredictRespawns=True
   MaxDesireability=1.500000
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
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTArmorPickupFactory:PickupLightEnvironment'
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
   Begin Object Class=StaticMeshComponent Name=ArmorPickUpComp
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTArmorPickupFactory:PickupLightEnvironment'
      MaxDrawDistance=8000.000000
      CachedMaxDrawDistance=8000.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      CollideActors=False
      Name="ArmorPickUpComp"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(4)=ArmorPickUpComp
   CollisionComponent=CollisionCylinder
   Name="Default__UTArmorPickupFactory"
   ObjectArchetype=UTItemPickupFactory'UTGame.Default__UTItemPickupFactory'
}
