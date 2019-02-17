class TrSeekingMissileManager extends Info;

/** Missile to victim pairing. */
struct SeekingMissileInfo
{
	var TrProj_TrackingMissile Missile;
	var TrPlayerController VictimController;
};
var array<SeekingMissileInfo> ActiveSeekingMissiles;

/** Targeting saber launcher to victim pairing. */
struct TargetingSaberLauncherInfo
{
	var TrDevice_SaberLauncher SaberLauncher;
	var TrPlayerController VictimController;
	var float RemainingClientNotificationTime;

	structdefaultproperties
	{
		RemainingClientNotificationTime=1.4
	}
};
var array<TargetingSaberLauncherInfo> ActiveTargetingSaberLaunchers;

var int RepCounter;

/** 
 *  When anything changes with a missile or saber launcher targeting a victim, an event is fired
 *  and VictimControllerUpdated() should be called so we can process the correct course of action.
 */
enum ETrackingMissileEvent
{
	MissileEvent_NewMissileTracking,
	MissileEvent_MissileStoppedTracking,
	MissileEvent_NewSaberLauncherTargeting,
	MissileEvent_SaberLauncherStoppedTargeting,
	MissileEvent_NotifyClientAboutSaberLauncher,
};

event Tick(float DeltaTime)
{
	local int i;
	local Pawn SaberLauncherTarget;
	local TrPlayerController VictimController;
	local TrVehicle TargetVehicle;

	super.Tick(DeltaTime);

	for( i = ActiveTargetingSaberLaunchers.Length - 1; i >= 0; i-- )
	{
		SaberLauncherTarget = Pawn(ActiveTargetingSaberLaunchers[i].SaberLauncher.m_Target);
		VictimController = TrPlayerController(SaberLauncherTarget.Controller);
		TargetVehicle = TrVehicle(SaberLauncherTarget);

		if( ActiveTargetingSaberLaunchers[i].RemainingClientNotificationTime > 0.0 )
		{
			// Update the client notification timer.
			ActiveTargetingSaberLaunchers[i].RemainingClientNotificationTime = FMax(ActiveTargetingSaberLaunchers[i].RemainingClientNotificationTime - DeltaTime, 0.0 );

			if( ActiveTargetingSaberLaunchers[i].RemainingClientNotificationTime <= 0.0 )
			{
				if( TargetVehicle == none )
				{
					VictimControllerUpdated(ActiveTargetingSaberLaunchers[i].VictimController, MissileEvent_NotifyClientAboutSaberLauncher);
				}
				else
				{
					TargetVehicleUpdated(TargetVehicle, MissileEvent_NotifyClientAboutSaberLauncher);
				}
			}
		}

		if( SaberLauncherTarget == none )
		{
			RemoveSaberLauncher(ActiveTargetingSaberLaunchers[i].SaberLauncher);
		}
		else if( TargetVehicle == none && (VictimController == none ||VictimController.IsDead() ) )
		{
			RemoveSaberLauncher(ActiveTargetingSaberLaunchers[i].SaberLauncher);
		}
		else if( TargetVehicle != none && TargetVehicle.Health <= 0 )
		{
			RemoveSaberLauncher(ActiveTargetingSaberLaunchers[i].SaberLauncher);
		}
	}
}

/** Keep track of a tracking saber launcher. */
function AddSaberLauncher(TrDevice_SaberLauncher SaberLauncherToAdd, EMissileLock MissileLockValue)
{
	local int i;
	local Pawn VictimPawn;
	local TrPlayerController VictimController, InstigatorController;
	local TargetingSaberLauncherInfo NewTargetingSaberLauncherInfo;
	local TrVehicle TargetVehicle;

	if( SaberLauncherToAdd == none )
	{
		// Make sure SaberLauncher is valid.
		;
		return;
	}

	// Update the instigator controller for the locked only (locking and ending the locking/locked
	// is simulated by the client).
	if( MissileLockValue == EMissileLocked )
	{
		InstigatorController = TrPlayerController(SaberLauncherToAdd.Instigator.Controller);
		if( InstigatorController != none )
		{
			InstigatorController.ClientMySaberLauncherTargetingUpdated(MissileLockValue);
		}
	}

	VictimPawn = Pawn(SaberLauncherToAdd.m_Target);
	TargetVehicle = TrVehicle(VictimPawn);
	if( VictimPawn == none )
	{
		// We only care about keeping track of SaberLaunchers that are targeting players.
		return;
	}

	VictimController = TrPlayerController(VictimPawn.Controller);
	if( VictimController == none && TargetVehicle == none )
	{
		// Make sure we have a valid TrPlayerController.
		;
		return;
	}

	// Check to see if we are already tracking this missile.
	for( i = 0; i < ActiveTargetingSaberLaunchers.Length; i++ )
	{
		if( ActiveTargetingSaberLaunchers[i].SaberLauncher == SaberLauncherToAdd )
		{
			//`warn("Attempting to add a SaberLauncher that is already being tracked by missile manager."@SaberLauncherToAdd);
			return;
		}
	}

	// Keep track of this missile and its victim.
	NewTargetingSaberLauncherInfo.SaberLauncher = SaberLauncherToAdd;
	if( TargetVehicle == none )
	{
		NewTargetingSaberLauncherInfo.VictimController = VictimController;
	}
	ActiveTargetingSaberLaunchers.AddItem(NewTargetingSaberLauncherInfo);

	// Update the victim controller.
	if( TargetVehicle != none )
	{
		TargetVehicleUpdated(TargetVehicle, MissileEvent_NewSaberLauncherTargeting);
	}
	else
	{
		VictimControllerUpdated(VictimController, MissileEvent_NewSaberLauncherTargeting);
	}
}

function RemoveSaberLauncher(TrDevice_SaberLauncher SaberLauncherToRemove)
{
	local int i;
	local TrPlayerController VictimController, InstigatorController;
	local bool bFoundSaberLauncher;
	local TrVehicle TargetVehicle;

	if( SaberLauncherToRemove == none )
	{
		// Make sure SaberLauncher is valid.
		;
		return;
	}

	// Update the instigator controller.
	InstigatorController = TrPlayerController(SaberLauncherToRemove.Instigator.Controller);
	if( InstigatorController != none )
	{
		InstigatorController.ClientMySaberLauncherTargetingUpdated(EMissileLockNone);
	}

	// Check to see if we are already tracking this Saber Launcher.
	for( i = 0; i < ActiveTargetingSaberLaunchers.Length; i++ )
	{
		if( ActiveTargetingSaberLaunchers[i].SaberLauncher == SaberLauncherToRemove )
		{
			VictimController = ActiveTargetingSaberLaunchers[i].VictimController;
			ActiveTargetingSaberLaunchers.Remove(i,1);
			VictimControllerUpdated(VictimController, MissileEvent_SaberLauncherStoppedTargeting);
			bFoundSaberLauncher = true;
			break;
		}
	}

	TargetVehicle = TrVehicle(SaberLauncherToRemove.m_Target);
	if( bFoundSaberLauncher && TargetVehicle != none )
	{
		TargetVehicleUpdated(TargetVehicle, MissileEvent_SaberLauncherStoppedTargeting);
	}

	if( !bFoundSaberLauncher )
	{
		// We should never get here.
		;
		return;
	}
}

/** Returns the number of missiles actively tracking a controller. */
function int GetNumSaberLaunchersTargetingController(TrPlayerController Controller, bool bOnlyClientNotified)
{
	local int i, TargetingCount;

	for( i = 0; i < ActiveTargetingSaberLaunchers.Length; i++ )
	{
		if( ActiveTargetingSaberLaunchers[i].VictimController == Controller )
		{
			if( bOnlyClientNotified )
			{
				if( ActiveTargetingSaberLaunchers[i].RemainingClientNotificationTime == 0.f )
				{
					TargetingCount++;
				}
			}
			else
			{
				TargetingCount++;
			}
		}
	}

	return TargetingCount;
}

/** Returns the number of missiles actively tracking a vehicle. */
function int GetNumSaberLaunchersTargetingVehicle(TrVehicle TargetVehicle, bool bOnlyClientNotified)
{
	local int i, TargetingCount;

	for( i = 0; i < ActiveTargetingSaberLaunchers.Length; i++ )
	{
		if( ActiveTargetingSaberLaunchers[i].SaberLauncher.m_Target == TargetVehicle )
		{
			if( bOnlyClientNotified )
			{
				if( ActiveTargetingSaberLaunchers[i].RemainingClientNotificationTime == 0.f )
				{
					TargetingCount++;
				}
			}
			else
			{
				TargetingCount++;
			}
		}
	}

	return TargetingCount;
}

/** Keep track of a new missile. */
function AddMissile(TrProj_TrackingMissile MissileToAdd)
{
	local int i;
	local Pawn VictimPawn;
	local TrPlayerController VictimController;
	local SeekingMissileInfo NewSeekingMissileInfo;
	local TrVehicle TargetVehicle;

	if( MissileToAdd == none )
	{
		// Make sure missile is valid.
		;
		return;
	}

	VictimPawn = Pawn(MissileToAdd.SeekTarget);
	TargetVehicle = TrVehicle(VictimPawn);
	if( VictimPawn == none )
	{
		// We only care about keeping track of missiles that are following players.
		return;
	}

	VictimController = TrPlayerController(VictimPawn.Controller);
	if( VictimController == none && TargetVehicle == none )
	{
		// Make sure we have a valid TrPlayerController.
		;
		return;
	}

	// Check to see if we are already tracking this missile.
	for( i = 0; i < ActiveSeekingMissiles.Length; i++ )
	{
		if( ActiveSeekingMissiles[i].Missile == MissileToAdd )
		{
			// We should never get here.
			;
			return;
		}
	}

	// Keep track of this missile and its victim.
	NewSeekingMissileInfo.Missile = MissileToAdd;
	if( TargetVehicle == none )
	{
		NewSeekingMissileInfo.VictimController = VictimController;
	}
	ActiveSeekingMissiles.AddItem(NewSeekingMissileInfo);

	// Update the victim controller.
	if( TargetVehicle != none )
	{
		TargetVehicleUpdated(TargetVehicle, MissileEvent_NewMissileTracking);
	}
	else
	{
		VictimControllerUpdated(VictimController, MissileEvent_NewMissileTracking);
	}
}

function RemoveMissile(TrProj_TrackingMissile MissileToRemove)
{
	local int i;
	local TrPlayerController VictimController;
	local bool bFoundMissile;
	local TrVehicle TargetVehicle;

	if( MissileToRemove == none )
	{
		// Make sure missile is valid.
		;
		return;
	}

	// Check to see if we are already tracking this missile.
	for( i = 0; i < ActiveSeekingMissiles.Length; i++ )
	{
		if( ActiveSeekingMissiles[i].Missile == MissileToRemove )
		{
			VictimController = ActiveSeekingMissiles[i].VictimController;
			ActiveSeekingMissiles.Remove(i,1);
			VictimControllerUpdated(VictimController, MissileEvent_MissileStoppedTracking);
			bFoundMissile = true;
			break;
		}
	}

	TargetVehicle = TrVehicle(MissileToRemove.SeekTarget);
	if( bFoundMissile && TargetVehicle != none )
	{
		TargetVehicleUpdated(TargetVehicle, MissileEvent_MissileStoppedTracking);
	}

	if( !bFoundMissile )
	{
		// We should never get here.
		;
		return;
	}
}

/** Returns the number of missiles actively tracking a controller. */
function int GetNumMissilesTrackingController(TrPlayerController Controller)
{
	local int i, TrackingMissilesCount;

	for( i = 0; i < ActiveSeekingMissiles.Length; i++ )
	{
		if( ActiveSeekingMissiles[i].VictimController == Controller )
		{
			TrackingMissilesCount++;
		}
	}

	return TrackingMissilesCount;
}

/** Returns the number of missiles actively tracking a controller. */
function int GetNumMissilesTrackingVehicle(TrVehicle TargetVehicle)
{
	local int i, TrackingMissilesCount;

	for( i = 0; i < ActiveSeekingMissiles.Length; i++ )
	{
		if( ActiveSeekingMissiles[i].Missile.SeekTarget == TargetVehicle )
		{
			TrackingMissilesCount++;
		}
	}

	return TrackingMissilesCount;
}

/** 
 *  Considers actively targeting launchers and actively seeking missiles to determine if anything needs to
 *  happen to the client version.
 */
function VictimControllerUpdated(TrPlayerController VictimController, ETrackingMissileEvent MissileEvent)
{
	local int NumTargetingSaberLaunchers, NumTrackingMissiles;

	if( VictimController == none )
	{
		return;
	}

	NumTargetingSaberLaunchers = GetNumSaberLaunchersTargetingController(VictimController, true);
	NumTrackingMissiles = GetNumMissilesTrackingController(VictimController);

	switch( MissileEvent )
	{
		case MissileEvent_NewMissileTracking:
			// A new missile is tracking the victim controller.
			if( NumTrackingMissiles == 1 )
			{
				// The new missile is the only missile tracking, so play the tracking sound.
				BeginMissileTracking(VictimController);
			}
			break;
		
		case MissileEvent_MissileStoppedTracking:
			// A missile has blown up.
			if( NumTrackingMissiles == 0 )
			{
				// There are no more missiles tracking, so stop the missile tracking warning.
				StopMissileTracking(VictimController);

				if( NumTargetingSaberLaunchers > 0 )
				{
					// There are saber launchers targeting the victim, so play that warning.
					BeginSaberLauncherTargeting(VictimController);
				}
			}
			break;
		case MissileEvent_NewSaberLauncherTargeting:
			break;
		case MissileEvent_SaberLauncherStoppedTargeting:
			// A saber launcher has stopped targeting the victim controller.
			if( NumTrackingMissiles == 0 ) // Always give priority to tracking missiles.
			{
				if( NumTargetingSaberLaunchers == 0 )
				{
					// There are no more saber launchers targeting, so stop playing the targeting sound.
					StopSaberLauncherTargeting(VictimController);
				}
			}
			break;
		case MissileEvent_NotifyClientAboutSaberLauncher:
			// The victim controller needs to know about this saber launcher targeting them.
			if( NumTrackingMissiles == 0 ) // Always give priority to tracking missiles.
			{
				if( NumTargetingSaberLaunchers == 1)
				{
					// The new saber launcher is the only one targeting, so play the targeting sound.
					BeginSaberLauncherTargeting(VictimController);
				}
			}
	}
}


/** 
 *  Considers actively targeting launchers and actively seeking missiles to determine if anything needs to
 *  happen to the client version.
 */
function TargetVehicleUpdated(TrVehicle TargetVehicle, ETrackingMissileEvent MissileEvent)
{
	local int NumTargetingSaberLaunchers, NumTrackingMissiles, i;
	local TrPlayerController VehicleController;

	if( TargetVehicle == none )
	{
		return;
	}

	NumTargetingSaberLaunchers = GetNumSaberLaunchersTargetingVehicle(TargetVehicle, true);
	NumTrackingMissiles = GetNumMissilesTrackingVehicle(TargetVehicle);

	switch( MissileEvent )
	{
		case MissileEvent_NewMissileTracking:
			// A new missile is tracking the victim controller.
			if( NumTrackingMissiles == 1 )
			{
				// The new missile is the only missile tracking, so play the tracking sound.
				for( i = 0; i < TargetVehicle.Seats.Length; i++ )
				{
					VehicleController = TrPlayerController(TargetVehicle.GetControllerForSeatIndex(i));
					BeginMissileTracking(VehicleController);
				}
			}
			break;
		
		case MissileEvent_MissileStoppedTracking:
			// A missile has blown up.
			if( NumTrackingMissiles == 0 )
			{
				// There are no more missiles tracking, so stop the missile tracking warning.
				for( i = 0; i < TargetVehicle.Seats.Length; i++ )
				{
					VehicleController = TrPlayerController(TargetVehicle.GetControllerForSeatIndex(i));
					StopMissileTracking(VehicleController);
				}

				if( NumTargetingSaberLaunchers > 0 )
				{
					// There are saber launchers targeting the victim, so play that warning.
					for( i = 0; i < TargetVehicle.Seats.Length; i++ )
					{
						VehicleController = TrPlayerController(TargetVehicle.GetControllerForSeatIndex(i));
						BeginSaberLauncherTargeting(VehicleController);
					}
				}
			}
			break;
		case MissileEvent_NewSaberLauncherTargeting:
			break;
		case MissileEvent_SaberLauncherStoppedTargeting:
			// A saber launcher has stopped targeting the victim controller.
			if( NumTrackingMissiles == 0 ) // Always give priority to tracking missiles.
			{
				if( NumTargetingSaberLaunchers == 0 )
				{
					// There are no more saber launchers targeting, so stop playing the targeting sound.
					for( i = 0; i < TargetVehicle.Seats.Length; i++ )
					{
						VehicleController = TrPlayerController(TargetVehicle.GetControllerForSeatIndex(i));
						StopSaberLauncherTargeting(VehicleController);
					}
				}
			}
			break;
		case MissileEvent_NotifyClientAboutSaberLauncher:
			// The victim controller needs to know about this saber launcher targeting them.
			if( NumTrackingMissiles == 0 ) // Always give priority to tracking missiles.
			{
				if( NumTargetingSaberLaunchers == 1)
				{
					// The new saber launcher is the only one targeting, so play the targeting sound.
					for( i = 0; i < TargetVehicle.Seats.Length; i++ )
					{
						VehicleController = TrPlayerController(TargetVehicle.GetControllerForSeatIndex(i));
						BeginSaberLauncherTargeting(VehicleController);
					}
				}
			}
	}
}

function BeginSaberLauncherTargeting(TrPlayerController VictimController)
{
	//RepCounter++;
	//`log("Begin playing the Saber Launcher Targeting sound on"@VictimController@RepCounter);
	if (VictimController != none)
	{
		VictimController.ClientSeekingMissileTargetingSelfEvent(1);
	}
}

function StopSaberLauncherTargeting(TrPlayerController VictimController)
{
	//RepCounter++;
	//`log("Stop playing the Saber Launcher Targeting sound on"@VictimController@RepCounter);
	if (VictimController != none)
	{
		VictimController.ClientSeekingMissileTargetingSelfEvent(2);
	}
}

function BeginMissileTracking(TrPlayerController VictimController)
{
	//RepCounter++;
	//`log("Begin playing the Missile Tracking sound on"@VictimController@RepCounter);
	if (VictimController != none)
	{
		VictimController.ClientSeekingMissileTargetingSelfEvent(3);
	}
}

function StopMissileTracking(TrPlayerController VictimController)
{
	//RepCounter++;
	//`log("Stop playing the Missile Tracking sound on"@VictimController@RepCounter);
	if (VictimController != none)
	{
		VictimController.ClientSeekingMissileTargetingSelfEvent(4);
	}
}

function PawnLeftVehicle(Pawn LeavingPawn, TrVehicle Vehicle)
{
	local int i;
	local Pawn PawnTarget;
	local TrPlayerController PawnTargetController;
	local bool bIsLeavingPawnTrackedByMissile, bIsLeavingPawnTargetedBySaberLauncher;

	//`log("Pawn:$LeavingPawn@left@Vehicle@.");

	// See if there are any missiles tracking this pawn.
	for(i = 0; i < ActiveSeekingMissiles.Length; i++ )
	{
		PawnTarget = Pawn(ActiveSeekingMissiles[i].Missile.SeekTarget);
		if( PawnTarget == LeavingPawn )
		{
			bIsLeavingPawnTrackedByMissile = true;

			// Make sure we are seeking the correct controller.
			PawnTargetController = TrPlayerController(LeavingPawn.Controller);
			if( PawnTargetController != none )
			{
				ActiveSeekingMissiles[i].VictimController = PawnTargetController;
				VictimControllerUpdated(PawnTargetController, MissileEvent_NewMissileTracking);
			}
		}
	}

	if( !bIsLeavingPawnTrackedByMissile )
	{
		// See if there are any saber launchers targeting this pawn.
		for(i = 0; i < ActiveTargetingSaberLaunchers.Length; i++ )
		{
			PawnTarget = Pawn(ActiveTargetingSaberLaunchers[i].SaberLauncher.m_Target);
			if( PawnTarget == LeavingPawn )
			{
				bIsLeavingPawnTargetedBySaberLauncher = true;

				// Make sure we are targeting the correct controller.
				PawnTargetController = TrPlayerController(LeavingPawn.Controller);
				if( PawnTargetController != none )
				{
					ActiveTargetingSaberLaunchers[i].VictimController = PawnTargetController;
					VictimControllerUpdated(PawnTargetController, MissileEvent_NewSaberLauncherTargeting);
				}
			}
		}

		if( !bIsLeavingPawnTargetedBySaberLauncher )
		{
			// Nothing is targeting this pawn so make sure they are not playing any seeking sounds.
			PawnTargetController = TrPlayerController(LeavingPawn.Controller);
			if( PawnTargetController != none )
			{
				PawnTargetController.ClientSeekingMissileTargetingSelfEvent(5);
			}
		}
	}
}

function PawnEnteredVehicle(Pawn EnteringPawn, TrVehicle Vehicle, int SeatIndex)
{
	local int i;
	local Vehicle TargetVehicle;
	local TrPlayerController VehicleController;
	local bool bIsVehicleTrackedByMissile, bIsTargetVehicleedBySaberLauncher;

	//`log("Pawn:$EnteringPawn@entered@Vehicle@.");

	// See if there are any missiles tracking this vehicle.
	for(i = 0; i < ActiveSeekingMissiles.Length; i++ )
	{
		TargetVehicle = TrVehicle(ActiveSeekingMissiles[i].Missile.SeekTarget);
		if( TargetVehicle == Vehicle )
		{
			bIsVehicleTrackedByMissile = true;

			// Notify the entering pawn if the vehicle already has missiles.
			VehicleController = TrPlayerController(Vehicle.GetControllerForSeatIndex(SeatIndex));
			if( VehicleController != none )
			{
				BeginMissileTracking(VehicleController);
			}
		}
	}

	if( !bIsVehicleTrackedByMissile )
	{
		// See if there are any saber launchers targeting this pawn.
		for(i = 0; i < ActiveTargetingSaberLaunchers.Length; i++ )
		{
			TargetVehicle = TrVehicle(ActiveTargetingSaberLaunchers[i].SaberLauncher.m_Target);
			if( TargetVehicle == Vehicle )
			{
				bIsTargetVehicleedBySaberLauncher = true;

				VehicleController = TrPlayerController(Vehicle.GetControllerForSeatIndex(SeatIndex));

				if( VehicleController != none )
				{
					BeginSaberLauncherTargeting(VehicleController);
				}
			}
		}

		if( !bIsTargetVehicleedBySaberLauncher )
		{
			// Nothing is targeting this pawn so make sure they are not playing any seeking sounds.
			VehicleController = TrPlayerController(Vehicle.GetControllerForSeatIndex(SeatIndex));

			if( VehicleController != none )
			{
				VehicleController.ClientSeekingMissileTargetingSelfEvent(5);
			}
		}
	}
}

defaultproperties
{
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__TrSeekingMissileManager"
   ObjectArchetype=Info'Engine.Default__Info'
}
