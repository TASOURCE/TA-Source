//=============================================================================
// TrDroppedPickup represents an item that has been dropped by a player and can
// be picked up by another player.
//
// FLOW:    1. A player drops a weapon (dying, throw weapon, etc.)
//          2. A TrDroppedPickup is spawned and represents that weapon.
//          3. A pawn that touches the weapon will pick it up if it is carriable 
//             and if nothing is currently in the EquipPoint for the pawn's 
//             current family info.
//             -OR-
//             If the EquipPoint for the pawn is currently occupied for the valid
//             device, then the pawn may swap out the currently equipped device
//             for this one. The pawn will throw out his old weapon in exchange
//             for this.
//             -OR-
//             If the equipped weapon is the same type as the dropped, replenish ammo. 
//=============================================================================

class TrDroppedPickup extends UTDroppedPickup;

/** Ammo add sound. */
var SoundCue    m_AmmoPickupSound;

/** Percentage of ammo to replace (based on max carried amount). */
var float m_PctAmmoToRefill;

/** How much higher than the target location to draw the marker. */
var(Marker) float m_fMarkerZOffset;
var(Marker) float m_fMarkerScale;
var(Marker) float m_fMarkerBlinkSpeed;
var(Marker) Rotator m_rMarkerRot;
var transient float m_fCurrentMarkerTime;
var transient float m_fMarkerOpacity;

/** Collision proxy for extending the touch collision. */
var TrCollisionProxy m_CollisionProxy;

var transient bool m_bHasHitObjective;

simulated event Destroyed()
{
	super.Destroyed();

	if( m_CollisionProxy != none )
	{
		m_CollisionProxy.Destroy();
		m_CollisionProxy = none;
	}
}

function GiveTo(Pawn P)
{
	// Overrode this function, as it was possible for players to obtain a third weapon.
	Destroy();
}

simulated function PostBeginPlay()
{
	local TrPlayerController TrPC;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		TrPC = TrPlayerController(GetALocalPlayerController());
		if( TrPC != none && TrPC.myHUD != none )
		{
			TrPC.myHUD.AddPostRenderedActor(self);
		}
	}

	if( Role == ROLE_Authority )
	{
		if( m_CollisionProxy == none )
		{
			m_CollisionProxy = spawn(class'TrCollisionProxy_Pickup',self,,Location, Rotation,, true);
			m_CollisionProxy.ForceProximityScan();
			m_CollisionProxy.SetBase(self);
		}
	}
}

simulated function DoBounce(Actor Other, vector HitNormal)
{
	// back up a smidge if we hit an objective so we will bounce off of the outside surface
	// without this, grenades get stuck inside objectives 5/16/11
	if (!m_bHasHitObjective && Other != none && (Other.IsA('TrGameObjective') || Other.IsA('TrVehicle')))
	{
		m_bHasHitObjective = true;
		Move(Normal(Velocity)*-30.0);
	}

	Velocity = 0.30f * (( Velocity dot HitNormal ) * HitNormal * -2.0 + Velocity);

	if (VSizeSq(Velocity) < 20.0)
	{
		SetPhysics(PHYS_None);
	}
}

simulated event HitWall(vector HitNormal, Actor Wall, PrimitiveComponent WallComp)
{
	DoBounce(Wall, HitNormal);
}

function OnCollisionProxyTouched(TrPawn TrP);

auto state Pickup
{
	function GivePickupToPawn(TrPlayerPawn TrP)
	{
        local TrInventoryManager InventoryManager;
		local TrDevice D;
		local TrPlayerController TrC;
		local int AddedAmmo;
		local TrPlayerReplicationInfo TrPRI;
		local TrValueModifier VM;
		local float PctAmmoToRefill;

		if( TrP != none )
		{
			InventoryManager = TrInventoryManager(TrP.InvManager);
		}

        if( InventoryManager == None )
        {
            return;
        }

		if( TrP != None && ValidTouch(TrP) )
        {
			// Get the VM for perks/skills
			TrPRI = TrP.GetTribesReplicationInfo();
			if( TrPRI != none )
			{
				VM = TrPRI.GetCurrentValueModifier();
			}

			// Give ammo to the primary and secondary weapons.
			D = InventoryManager.GetDeviceByEquipPoint(EQP_Primary);
			if( D != none )
			{
				PctAmmoToRefill = m_PctAmmoToRefill;

				if( VM != none )
				{
					PctAmmoToRefill += VM.m_fAmmoFromPickupBuffPct;
				}
				AddedAmmo = FCeil(D.GetBasePickupAmmoAmount() * PctAmmoToRefill);
				D.AddCarriedAmmo(AddedAmmo);
			}
			D = InventoryManager.GetDeviceByEquipPoint(EQP_Secondary);
			if( D != none )
			{
				PctAmmoToRefill = m_PctAmmoToRefill;

				if( VM != none )
				{
					PctAmmoToRefill += VM.m_fAmmoFromPickupBuffPct;
				}
				AddedAmmo = FCeil(D.GetBasePickupAmmoAmount() * PctAmmoToRefill);
				D.AddCarriedAmmo(AddedAmmo);
			}
			D = InventoryManager.GetDeviceByEquipPoint(EQP_Belt);
			if( D != none )
			{
				// Always just give one base grenade.
				AddedAmmo = 1.0;
				
				if( VM != none )
				{
					AddedAmmo += VM.m_nExtraGrenadesFromPickupBuff;
				}
		
				D.AddCarriedAmmo(AddedAmmo);
			}

			// Perks/skills
			if( VM != none )
			{
				TrP.GiveHealth(float(TrP.HealthMax) * VM.m_fHealthFromPickupBuffPct, TrP.HealthMax);
				TrP.ConsumePowerPool(-1.0 * VM.m_fEnergyFromPickupBuffPct * TrP.r_fMaxPowerPool);
				TrP.SyncClientCurrentPowerPool();
			}

			if( m_AmmoPickupSound != None )
            {
                TrP.PlaySound(m_AmmoPickupSound);
            }

			// Pulse the HUD for the player picking this up.
			TrC = TrPlayerController(TrP.Controller);
			if( TrC != none )
			{
				TrC.ClientPulseHUD(1);
			}

            Destroy();
        }
	}

	function OnCollisionProxyTouched(TrPawn TrP)
	{
		local TrPlayerReplicationInfo TrPRI;
		local TrValueModifier VM;

		if( TrP != none )
		{
			TrPRI = TrP.GetTribesReplicationInfo();
			if( TrPRI != none )
			{
				VM = TrPRI.GetCurrentValueModifier();
				if( VM != none && VM.m_bAmmoPickupReach )
				{
					GivePickupToPawn(TrPlayerPawn(TrP));
				}
			}
		}
	}

    // When touched by an actor.
	event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
	{
		// Ignore touch events from the instigator.
		if (Other != Instigator)
		{
			if (Physics == PHYS_Falling && !ValidTouch(Pawn(Other)))
			{
				DoBounce(Other, HitNormal);
			}
			else
			{
				GivePickupToPawn(TrPlayerPawn(Other));
			}
		}
	}
}

simulated event Tick(float DeltaTime)
{
	m_fCurrentMarkerTime += DeltaTime * m_fMarkerBlinkSpeed;
	m_fMarkerOpacity = (sin(m_fCurrentMarkerTime) + 1.0) / 2.0;
	super.Tick(DeltaTime);
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
	local vector ScreenLoc, TargetLocation;
	local TrHUD HUD;

	HUD = TrHUD(PC.MyHUD);
	if( HUD != none && HUD.bIsMainMenuOpen )
	{
		// Don't draw any markers if the main menu is open because they may intefere with paperdolls.
		return;
	}

	// If hud is disabled while spectating, don't draw anything.
	if( PC.IsSpectating() )
	{
		if( !TrPlayerController(PC).m_bShowSpectatorHUD )
		{
			return;
		}
	}

	TargetLocation = Location;
	TargetLocation.Z += m_fMarkerZOffset;
	Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, TargetLocation, ScreenLoc);
	ScreenLoc.Z = VSize(CameraPosition - Location);
	TrHUD(PC.myHUD).DrawRotatedMarker(class'TrHUD'.default.AmmoDropPickup, ScreenLoc, m_rMarkerRot, Canvas, , , m_fMarkerOpacity, m_fMarkerScale);

}

defaultproperties
{
   m_PctAmmoToRefill=0.300000
   m_fMarkerZOffset=25.000000
   m_fMarkerScale=0.900000
   m_fMarkerBlinkSpeed=10.000000
   m_rMarkerRot=(Pitch=0,Yaw=16384,Roll=0)
   Begin Object Class=DynamicLightEnvironmentComponent Name=DroppedPickupLightEnvironment Archetype=DynamicLightEnvironmentComponent'UTGame.Default__UTDroppedPickup:DroppedPickupLightEnvironment'
      AmbientGlow=(R=0.200000,G=0.200000,B=0.200000,A=1.000000)
      bCastShadows=False
      bDynamic=False
      Name="DroppedPickupLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'UTGame.Default__UTDroppedPickup:DroppedPickupLightEnvironment'
   End Object
   MyLightEnvironment=DroppedPickupLightEnvironment
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'UTGame.Default__UTDroppedPickup:Sprite'
      Sprite=Texture2D'EditorResources.S_Inventory'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'UTGame.Default__UTDroppedPickup:Sprite'
   End Object
   Components(0)=Sprite
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTDroppedPickup:CollisionCylinder'
      CollisionHeight=20.000000
      CollisionRadius=30.000000
      ReplacementPrimitive=None
      CollideActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTDroppedPickup:CollisionCylinder'
   End Object
   Components(1)=CollisionCylinder
   Components(2)=DroppedPickupLightEnvironment
   bBounce=True
   LifeSpan=60.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrDroppedPickup"
   ObjectArchetype=UTDroppedPickup'UTGame.Default__UTDroppedPickup'
}
