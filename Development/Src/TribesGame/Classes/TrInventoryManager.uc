/**

 */
class TrInventoryManager extends UTInventoryManager
	config(Game)
    dependsOn(TrObject);

var TrDevice m_RealLastDevice;
var TR_EQUIP_POINT m_PreviousDeviceEquipPoint;
var TrStatsInterface Stats;

/** Used to catch when we are told to use a weapon class before it has been loaded. */
var bool c_bRetryEquippingPrimaryWeapon;

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

    if (Role == ROLE_Authority)
    {
	    Stats = TrGame(WorldInfo.Game).Stats;
    }
}

simulated event ReplicatedEvent(name VarName)
{
	local TrDevice PrimaryWeapon;

	if( VarName == 'InventoryChain' )
	{
		if( c_bRetryEquippingPrimaryWeapon && InventoryChain != none )
		{
			PrimaryWeapon = GetDeviceByEquipPoint(EQP_Primary);
			if( PrimaryWeapon != none )
			{
				SetCurrentWeapon(PrimaryWeapon);
				c_bRetryEquippingPrimaryWeapon = false;
			}
		}
	}

	super.ReplicatedEvent(VarName);
}

simulated function TrDevice GetDeviceByEquipPoint(TR_EQUIP_POINT EquipPoint)
{
    local array<TrDevice> WeaponList;
    local int i;

    TrGetWeaponList(WeaponList, false);
    
    for (i = 0; i < WeaponList.Length; i++)
	{
        //`log(self@WeaponList[i]@WeaponList[i].m_eEquipAt);
		if (WeaponList[i].r_eEquipAt == EquipPoint)
        {
            return WeaponList[i];
        }
    }

    return None;
}

simulated function TrDevice GetDeviceByWeaponClass(class<TrDevice> DeviceClass)
{
    local array<TrDevice> WeaponList;
    local int i;

    TrGetWeaponList(WeaponList, false);
    
    for (i = 0; i < WeaponList.Length; i++)
	{
		if( ClassIsChildOf(WeaponList[i].Class, DeviceClass) )
        {
            return WeaponList[i];
        }
    }

    return None;
}

simulated function TrDevice GetDeviceByWeaponId(int WeaponId)
{
    local array<TrDevice> WeaponList;
    local int i;

    TrGetWeaponList(WeaponList, false);
    
    for (i = 0; i < WeaponList.Length; i++)
	{
        //`log(self@WeaponList[i]@WeaponList[i].m_eEquipAt);
		if (WeaponList[i].DBWeaponId == WeaponId)
        {
            return WeaponList[i];
        }
    }

    return None;
}

//need to modify based on equip slot
simulated function TrGetWeaponList(out array<TrDevice> WeaponList, bool bInhandOnly = true)
{
	local TrDevice Weap;

	ForEach InventoryActors( class'TrDevice', Weap )
    {
        if (!bInHandOnly || (Weap.r_eEquipAt == EQP_Primary || Weap.r_eEquipAt == EQP_Secondary))
        {
		    WeaponList.AddItem(Weap);
        }
	}
}

simulated function DiscardEquippedDeployable()
{
	local TrDevice_Deployable Weap;

	ForEach InventoryActors( class'TrDevice_Deployable', Weap )
    {
		break;
	}

	if (Weap!=None)
	{
		RemoveFromInventory(Weap);
	}
}

simulated function AdjustWeapon(int NewOffset)
{
	local TrDevice CurrentWeapon;
	local array<TrDevice> WeaponList;
	local int i, Index;
	// don't allow multiple weapon switches very close to one another (seems to happen with some mouse wheels)
	if (WorldInfo.TimeSeconds - LastAdjustWeaponTime < 0.05)
	{
		return;
	}
	LastAdjustWeaponTime = WorldInfo.TimeSeconds;

	if (Instigator == none)
	{
		if (Owner == none)
		{
			;
			return;
		}
		else
		{
			;
			Instigator = Pawn(Owner);
		}
	}

	CurrentWeapon = TrDevice(PendingWeapon);
	if (CurrentWeapon == None)
	{
		CurrentWeapon = TrDevice(Instigator.Weapon);
	}

   	TrGetWeaponList(WeaponList, true);
   	if (WeaponList.length == 0)
   	{
   		return;
   	}

	if( CurrentWeapon != none && m_PreviousDeviceEquipPoint != EQP_NONE
		&& CurrentWeapon.r_eEquipAt == EQP_LaserTarget
		&& (m_PreviousDeviceEquipPoint == EQP_Primary || m_PreviousDeviceEquipPoint == EQP_Secondary )
		&& WeaponList.Length > 1 )
	{
		SetCurrentWeapon(WeaponList[m_PreviousDeviceEquipPoint == EQP_Primary ? 0 : 1]);
		m_PreviousDeviceEquipPoint = EQP_NONE;
		return;
	}

	for (i = 0; i < WeaponList.Length; i++)
	{
		if (WeaponList[i] == CurrentWeapon)
		{
			Index = i;
			break;
		}
	}

	Index += NewOffset;
	if (Index < 0)
	{
		Index = WeaponList.Length - 1;
	}
	else if (Index >= WeaponList.Length)
	{
		Index = 0;
	}

	if (Index >= 0)
	{
		SetCurrentWeapon(WeaponList[Index]);
		m_PreviousDeviceEquipPoint = WeaponList[Index].r_eEquipAt;
	}
}

/**
 * This is the work-horse of the weapon switch.  It will set a new pending weapon
 * and tell the weapon to begin the switch.  If the call to Weapon.TryPutdown() returns
 * false, it means that the weapon can't switch at the moment and has deferred it until later
 *
 * @param	DesiredWeapon		The Weapon to switch to
 */

simulated function SetPendingWeapon( Weapon DesiredWeapon )
{
	local TrDevice PrevWeapon, CurrentPending;
	local UTPawn UTP;
	local TR_EQUIP_POINT EqpPoint;

	if( InventoryChain == none && DesiredWeapon == none && WorldInfo.NetMode == NM_Client )
	{
		// We have been told to switch to a weapon that hasn't yet been loaded
		// by the client. Switch to primary weapon when possible.
		c_bRetryEquippingPrimaryWeapon = true;
	}

	if (Instigator == none)
	{
		if (Owner == none)
		{
			;
			return;
		}
		else
		{
			;
			Instigator = Pawn(Owner);
		}
	}
    ;

	PrevWeapon = TrDevice( Instigator.Weapon );
	CurrentPending = TrDevice(PendingWeapon);

	if ( (PrevWeapon == None || PrevWeapon.AllowSwitchTo(DesiredWeapon)) &&
		(CurrentPending == None || CurrentPending.AllowSwitchTo(DesiredWeapon)) )
	{
		// We only work with TrDevice
		// Detect that a weapon is being reselected.  If so, notify that weapon.
		if ( DesiredWeapon != None && DesiredWeapon == Instigator.Weapon )
		{
			if (PendingWeapon != None)
			{
				PendingWeapon = None;
			}
			else
			{
				//$$BE Play the put-down animation.
				//PrevWeapon.ServerReselectWeapon();
				PrevWeapon.PutDownWeapon();
			}

			// If this weapon is ready to fire, there is no reason to perform the whole switch logic.
			if (!PrevWeapon.bReadyToFire())
			{
				PrevWeapon.Activate();
			}
			else
			{
				PrevWeapon.bWeaponPutDown = false;
			}
		}
		else
		{
			if ( Instigator.IsHumanControlled() && Instigator.IsLocallyControlled() )
			{
				// preload pending weapon textures, clear any other preloads
				if ( TrDevice(Instigator.Weapon) != None )
				{
					TrDevice(Instigator.Weapon).PreloadTextures(false);
				}
				if ( PendingWeapon != None )
				{
					TrDevice(PendingWeapon).PreloadTextures(false);
				}
				if (DesiredWeapon != none)
				{
	 				TrDevice(DesiredWeapon).PreloadTextures(true);
				}
			}
			PendingWeapon = DesiredWeapon;

			if (PendingWeapon != none)
			{
				EqpPoint = TrDevice(PendingWeapon).r_eEquipAt;
				if( EqpPoint == EQP_Primary || EqpPoint == EQP_Secondary )
				{
					m_PreviousDeviceEquipPoint = EqpPoint;
				}
			}

			// if there is an old weapon handle it first.
			if( PrevWeapon != None && !PrevWeapon.bDeleteMe && !PrevWeapon.IsInState('Inactive') )
			{
				PrevWeapon.TryPutDown();
			}
			else
			{
				// We don't have a weapon, force the call to ChangedWeapon
				ChangedWeapon();
			}
		}
	}

	UTP = UTPawn(Instigator);
	if (UTP != None)
	{
		//UTP.SetPuttingDownWeapon((PendingWeapon != None));
	}
}

simulated function bool AddInventory(Inventory NewItem, optional bool bDoNotActivate)
{
    local TrDevice Dev;

    if (super.AddInventory(NewItem, bDoNotActivate))
    {
        dev = TrDevice(NewItem);
        if (dev != None)
        {
            dev.ApplyEquipEffect();
        }
        return true;
    }
    return false;
}

simulated function RemoveFromInventory(Inventory ItemToRemove)
{
    local TrDevice dev;

    Super.RemoveFromInventory(ItemToRemove);

    dev = TrDevice(ItemToRemove);
    if (dev != None)
    {
        dev.RemoveEquipEffect();
    }
}

/** Sets everything in motion for firing a melee strike, grenade throw, etc. */
simulated function AutoFireWeapon(TR_EQUIP_POINT EquipPoint)
{
    local TrDevice_AutoFire AutoDevice;
    local TrDevice StartWeapon;
	local TrPawn TrP;

	if (Instigator == none)
	{
		if (Owner == none)
		{
			;
			return;
		}
		else
		{
			;
			Instigator = Pawn(Owner);
		}
	}

    StartWeapon = TrDevice(Instigator.Weapon);
	if( PendingWeapon != None )
	{
		StartWeapon = TrDevice(PendingWeapon);
	}

    AutoDevice = TrDevice_AutoFire(GetDeviceByEquipPoint(EquipPoint));
    if( AutoDevice == StartWeapon )
    {
        // Already firing the device, do not fire again.
        return;
    }

    if( !AutoDevice.CanFireNow() )
    {
        // Abort if the auto device can't fire.
        return;
    }

    if( !StartWeapon.CanAutoDeviceFireNow() )
    {
        // Abort if the current weapon won't let this fire.
        return;
    }

	TrP = TrPawn(Instigator);
	if( TrP != none && AutoDevice.Class != class'TrDevice_NinjaSmoke' )
	{
		TrP.PulseStealth(true);
	}

    // Immediately put down the current weapon.
    StartWeapon.PutDownFast();

    // This weapon will be switched back to when the auto device is done.
	if (!StartWeapon.IsA('TrDevice_AutoFire'))
	{
		m_RealLastDevice = StartWeapon;
	}

	// We don't have a real last device, so make it the primary.
	if (m_RealLastDevice == none)
	{
		m_RealLastDevice = GetDeviceByEquipPoint(EQP_Primary);
	}

	// Set the real device to swap to.
    AutoDevice.SetPostFireDevice(m_RealLastDevice);
    
    // We do not want to go through SetCurrentWeapon() (like Epic suggests)
    // because we do not want to go through the putaway logic for this type of
    // device. So, set the pending weapon directly and set it immediately.
    SetPendingWeapon(AutoDevice);
    ChangedWeapon();

	/*if( EquipPoint == EQP_Melee && Owner != none && TrPlayerController(Owner) != none )
	{
		if (Stats != none) Stats.UpdateWeapon(TrPlayerController(Owner),AutoDevice,0);
	}*/

    if( Role < ROLE_Authority )
    {
        ServerAutoFireWeapon(EquipPoint);
    }
}

simulated function SwitchWeaponByEquipPoint(TR_EQUIP_POINT EquipPoint)
{
    local TrDevice EndWeapon, StartWeapon;

	if (Instigator == none)
	{
		if (Owner == none)
		{
			;
			return;
		}
		else
		{
			;
			Instigator = Pawn(Owner);
		}
	}

    StartWeapon = TrDevice(Instigator.Weapon);
	if( PendingWeapon != None )
	{
		StartWeapon = TrDevice(PendingWeapon);
	}

    EndWeapon = GetDeviceByEquipPoint(EquipPoint);
    if( EndWeapon == StartWeapon && EquipPoint != EQP_LaserTarget )
    {
        // Already using the device, do not switch.
        return;
    }

	SetCurrentWeapon(EndWeapon);
}

simulated function SwitchToPreviousWeapon()
{
	if (PreviousWeapon != none && PreviousWeapon != Pawn(Owner).Weapon)
	{
		// If our previous weapon is an auto-fire, just go back to the primary weapon.
		if (PreviousWeapon.IsA('TrDevice_AutoFire'))
		{
			SwitchWeaponByEquipPoint(EQP_Primary);
		}
		else
		{
			PreviousWeapon.ClientWeaponSet(false);
		}
	}
}

reliable server function ServerAutoFireWeapon(TR_EQUIP_POINT EquipPoint)
{
    AutoFireWeapon(EquipPoint);
}

defaultproperties
{
   m_PreviousDeviceEquipPoint=EQP_Primary
   s_bThrottleNetRelevancy=True
   Name="Default__TrInventoryManager"
   ObjectArchetype=UTInventoryManager'UTGame.Default__UTInventoryManager'
}
