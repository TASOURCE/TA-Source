/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
//=============================================================================
// Ammo.
//=============================================================================
class UTAmmoPickupFactory extends UTItemPickupFactory
	ClassGroup(Pickups,Ammo)
	abstract;

/** The amount of ammo to give */
var int AmmoAmount;

/** The class of the weapon this ammo is for. */
var class<UTWeapon> TargetWeapon;

function SpawnCopyFor( Pawn Recipient )
{
	if ( UTInventoryManager(Recipient.InvManager) != none )
	{
		UTInventoryManager(Recipient.InvManager).AddAmmoToWeapon(AmmoAmount, TargetWeapon);
	}

	Recipient.PlaySound(PickupSound);
	Recipient.MakeNoise(0.2);

	if (PlayerController(Recipient.Controller) != None)
	{
		PlayerController(Recipient.Controller).ReceiveLocalizedMessage(MessageClass,,,,Class);
	}
}

simulated static function UpdateHUD(UTHUD H)
{
	local Weapon CurrentWeapon;

	Super.UpdateHUD(H);

	if ( H.PawnOwner != None )
	{
		CurrentWeapon = H.PawnOwner.Weapon;
		if ( CurrentWeapon == None )
			return;
	}

	if ( Default.TargetWeapon == CurrentWeapon.Class )
		H.LastAmmoPickupTime = H.LastPickupTime;
}

auto state Pickup
{
	/* ValidTouch()
	 Validate touch (if valid return true to let other pick me up and trigger event).
	*/
	function bool ValidTouch( Pawn Other )
	{
		if ( !Super.ValidTouch(Other) )
		{
			return false;
		}

		if ( UTInventoryManager(Other.InvManager) != none)
		  return UTInventoryManager(Other.InvManager).NeedsAmmo(TargetWeapon);

		return true;
	}

	/* DetourWeight()
	value of this path to take a quick detour (usually 0, used when on route to distant objective, but want to grab inventory for example)
	*/
	function float DetourWeight(Pawn P,float PathWeight)
	{
		local UTWeapon W;

		W = UTWeapon(P.FindInventoryType(TargetWeapon));
		if ( W != None )
		{
			return W.DesireAmmo(true) * MaxDesireability / PathWeight;
		}
		return 0;
	}
}

function float BotDesireability(Pawn P, Controller C)
{
	local UTWeapon W;
	local UTBot Bot;
	local float Result;

	Bot = UTBot(C);
	if (Bot != None && !Bot.bHuntPlayer)
	{
		W = UTWeapon(P.FindInventoryType(TargetWeapon));
		if ( W != None )
		{
			Result = W.DesireAmmo(false) * MaxDesireability;
			// increase desireability for the bot's favorite weapon
			if (ClassIsChildOf(TargetWeapon, Bot.FavoriteWeapon))
			{
				Result *= 1.5;
			}
		}
	}
	return Result;
}

defaultproperties
{
   PickupMessage="Ammo"
   Begin Object Class=DynamicLightEnvironmentComponent Name=PickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTItemPickupFactory:PickupLightEnvironment'
      bCastShadows=False
      bDynamic=False
      Name="PickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTItemPickupFactory:PickupLightEnvironment'
   End Object
   LightEnvironment=PickupLightEnvironment
   PickUpWaveForm=ForceFeedbackWaveform'UTGame.Default__UTAmmoPickupFactory:ForceFeedbackWaveformPickUp'
   MaxDesireability=0.200000
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTItemPickupFactory:CollisionCylinder'
      CollisionHeight=9.600000
      CollisionRadius=24.000000
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
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTAmmoPickupFactory:PickupLightEnvironment'
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
   Begin Object Class=StaticMeshComponent Name=AmmoMeshComp
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTAmmoPickupFactory:PickupLightEnvironment'
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      CollideActors=False
      BlockActors=False
      BlockZeroExtent=False
      BlockNonZeroExtent=False
      BlockRigidBody=False
      Scale=1.800000
      Name="AmmoMeshComp"
      ObjectArchetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
   End Object
   Components(4)=AmmoMeshComp
   CollisionComponent=CollisionCylinder
   Name="Default__UTAmmoPickupFactory"
   ObjectArchetype=UTItemPickupFactory'UTGame.Default__UTItemPickupFactory'
}
