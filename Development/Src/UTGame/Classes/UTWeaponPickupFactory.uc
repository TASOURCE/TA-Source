/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTWeaponPickupFactory extends UTPickupFactory
	dependsOn(UTWeaponLocker)
	ClassGroup(Pickups,Weapon);

var() class<UTWeapon> WeaponPickupClass;
var bool bWeaponStay;
/** The glow that emits from the base while the weapon is available */
var ParticleSystemComponent BaseGlow;
/** Used to scale weapon pickup drawscale */
var float WeaponPickupScaling;

var array<PawnToucher> Customers;

/** clientside flag - whether the locker should be displayed as active and having weapons available */
var bool bIsActive;

simulated function InitializePickup()
{
	local int i;

	InventoryType = WeaponPickupClass;
	if ( InventoryType == None )
	{
		GotoState('Disabled');
		return;
	}

	PivotTranslation = WeaponPickupClass.Default.PivotTranslation;

	SetWeaponStay();

	// set up location messages
	if ( WeaponPickupClass.default.bHasLocationSpeech )
	{
		bHasLocationSpeech = true;
		for ( i=0; i<WeaponPickupClass.default.LocationSpeech.Length; i++ )
		{
			LocationSpeech[i] = WeaponPickupClass.default.LocationSpeech[i];
		}
	}

	Super.InitializePickup();
}

simulated function SetPickupVisible()
{
	BaseGlow.SetActive(true);
	Super.SetPickupVisible();
}
simulated function SetPickupHidden()
{
	BaseGlow.DeactivateSystem();
	Super.SetPickupHidden();
}

simulated function SetPickupMesh()
{
	Super.SetPickupMesh();
	if ( PickupMesh != none )
	{
		PickupMesh.SetScale(PickupMesh.Scale * WeaponPickupScaling);
	}
}

simulated event ReplicatedEvent(name VarName)
{
	if (VarName == 'InventoryType')
	{
		if (InventoryType != WeaponPickupClass)
		{
			WeaponPickupClass = class<UTWeapon>(InventoryType);
			Super.ReplicatedEvent(VarName);
		}
	}
	else
	{

		Super.ReplicatedEvent(VarName);
	}
}

function bool CheckForErrors()
{
	if ( Super.CheckForErrors() )
		return true;

	if ( WeaponPickupClass == None )
	{
		;
		return true;
	}

	return false;
}

/**
 * If our charge is not a super weapon and weaponstay is on, set weapon stay
 */
function SetWeaponStay()
{
	bWeaponStay = ( !WeaponPickupClass.Default.bSuperWeapon && UTGame(WorldInfo.Game).bWeaponStay );
}

function StartSleeping()
{
	if (!bWeaponStay)
	    GotoState('Sleeping');
}

function bool AddCustomer(Pawn P)
{
	local int			i;
	local PawnToucher	PT;

	if ( UTInventoryManager(P.InvManager) == None )
		return false;

	if ( Customers.Length > 0 )
		for ( i=0; i<Customers.Length; i++ )
		{
			if ( Customers[i].NextTouchTime < WorldInfo.TimeSeconds )
			{
				if ( Customers[i].P == P )
				{
					Customers[i].NextTouchTime = WorldInfo.TimeSeconds + 30;
					return true;
				}
				Customers.Remove(i,1);
				i--;
			}
			else if ( Customers[i].P == P )
			{
				return false;
			}
		}

	PT.P = P;
	PT.NextTouchTime = WorldInfo.TimeSeconds + 30;
	Customers[Customers.Length] = PT;
	return true;
}

function bool HasCustomer(Pawn P)
{
	local int i;
	local bool bFoundCustomer;

	if ( Customers.Length > 0 )
	{
		for ( i=0; i<Customers.Length; i++ )
		{
			bFoundCustomer = (Customers[i].P == P);
			if ( Customers[i].NextTouchTime < WorldInfo.TimeSeconds )
			{
				Customers.Remove(i,1);
				i--;
				if ( bFoundCustomer )
					return false;
			}
			else if ( bFoundCustomer )
				return true;
		}
	}
	return false;
}
function bool AllowPickup(UTBot Bot)
{
    return !HasCustomer(Bot.Pawn);
}

function PickedUpBy(Pawn P)
{
	if ( bWeaponStay )
	{
		AddCustomer(P);
		if ( (P.Controller != None) && P.Controller.IsLocalPlayerController() )
		{
			ShowHidden();
			SetTimer(30,false,'ShowActive');
		}
	}
	Super.PickedUpBy(P);
}

function SpawnCopyFor( Pawn Recipient )
{
	local Inventory Inv;
	if ( UTInventoryManager(Recipient.InvManager)!=None )
	{
		Inv = UTInventoryManager(Recipient.InvManager).HasInventoryOfClass(WeaponPickupClass);
		if ( UTWeapon(Inv)!=none )
		{
			UTWeapon(Inv).AddAmmo(WeaponPickupClass.Default.AmmoCount);
			UTWeapon(Inv).AnnouncePickup(Recipient);
			return;
		}
	}
	Recipient.MakeNoise(0.2);
	super.SpawnCopyFor(Recipient);
}

simulated function ShowActive();

simulated function ShowHidden()
{
	BaseGlow.DeactivateSystem();
	if ( PickupMesh != None )
		PickupMesh.SetHidden(true);
	bIsActive = false;
}

simulated function NotifyLocalPlayerDead(PlayerController PC);

auto state Pickup
{
	simulated function ShowActive()
	{
		BaseGlow.SetActive(true);
		bIsActive = true;
		if ( PickupMesh != None )
			PickupMesh.SetHidden(false);
	}

	simulated function NotifyLocalPlayerDead(PlayerController PC)
	{
		if ( bWeaponStay )
		{
			ShowActive();
		}
	}

	// When touched by an actor.
	simulated event Touch( actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
	{
		local Pawn Recipient;
		local Controller PickupController;

		if ( !bWeaponStay )
		{
			super.Touch(Other, OtherComp, HitLocation, HitNormal);
			return;
		}

		// If touched by a player pawn, let him pick this up.
		Recipient = Pawn(Other);
		if( (Recipient != None) && !HasCustomer(Recipient) && ValidTouch(Recipient) )
		{
			if ( bIsActive )
			{
				PickupController = Recipient.Controller;
				if ( (PickupController == None) && (Recipient.DrivenVehicle != None) )
				{
					PickupController = Recipient.DrivenVehicle.Controller;
				}
				if ( (PickupController != None) && PickupController.IsLocalPlayerController() )
				{
					ShowHidden();
					SetTimer(30,false,'ShowActive');
				}
			}
			if ( Role == ROLE_Authority )
			{
				if ( !AddCustomer(Recipient) )
					return;
				GiveTo(Recipient);
			}
		}
	}

	/*
	 Validate touch (if valid return true to let other pick me up and trigger event).
	*/
	simulated function bool ValidTouch( Pawn Other )
	{
		if ( Role == ROLE_Authority )
		{
			return Super.ValidTouch(Other);
		}

		// make sure its a live player
		if (Other == None || !Other.bCanPickupInventory || Other.Controller == None || !FastTrace(Other.Location, Location) )
		{
			return false;
		}
		return true;
	}

	simulated event BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);

		ShowActive();
	}
}

defaultproperties
{
   bWeaponStay=True
   Begin Object Class=ParticleSystemComponent Name=GlowEffect
      ReplacementPrimitive=None
      Translation=(X=0.000000,Y=0.000000,Z=-44.000000)
      Name="GlowEffect"
      ObjectArchetype=ParticleSystemComponent'Engine.Default__ParticleSystemComponent'
   End Object
   BaseGlow=GlowEffect
   WeaponPickupScaling=1.200000
   Begin Object Class=DynamicLightEnvironmentComponent Name=PickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPickupFactory:PickupLightEnvironment'
      bCastShadows=False
      bDynamic=False
      Name="PickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTPickupFactory:PickupLightEnvironment'
   End Object
   LightEnvironment=PickupLightEnvironment
   PickUpWaveForm=ForceFeedbackWaveform'UTGame.Default__UTWeaponPickupFactory:ForceFeedbackWaveformPickUp'
   bRotatingPickup=True
   bDoVisibilityFadeIn=False
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTPickupFactory:CollisionCylinder'
      CollisionHeight=44.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
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
      LightEnvironment=DynamicLightEnvironmentComponent'UTGame.Default__UTWeaponPickupFactory:PickupLightEnvironment'
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
   Components(4)=GlowEffect
   bBlockActors=True
   CollisionComponent=CollisionCylinder
   Name="Default__UTWeaponPickupFactory"
   ObjectArchetype=UTPickupFactory'UTGame.Default__UTPickupFactory'
}
