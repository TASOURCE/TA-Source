/**
* Generic class for all objective-based flags. Much of the logic was ported from UTCTFFlag.
*/
class TrFlagBase extends UTCarriedObject
	abstract
	native;

/** particle system to play when the flag respawns at home base */
var ParticleSystem RespawnEffect;
/** if true the flag is just starting to res out and needs its bright param ramped up*/
var bool bBringUpBright;
/** if true the bright param has peaked and now we need to phase the flag out */
var bool bBringDownFromBright;

var repnotify bool  bFadingOut;
var repnotify bool  bRespawning;
var array<MaterialInstanceConstant> MICArray;
var bool bWasClothEnabled;

var	vector	RunningClothVelClamp;
var	vector	HoverboardingClothVelClamp;

var ParticleSystemComponent SuccessfulCaptureSystem;

/** The Flags's light environment */
var DynamicLightEnvironmentComponent LightEnvironment;

var float LastLocationPingTime;

/** Mass of this flag. */
var() float m_fMass;

/** Frictio of this flag.*/
var() float m_fFriction;

/** Current alpha of the icon fade */
var private float m_FlagIconAlpha;

/** Last screen location and camera direction/position */
var bool    bWasFlagReturned;
var vector  LastScreenLoc;
var vector  LastCameraDir;
var vector  LastCameraPos;

var int m_TimeAwaySeconds;

/** [0-1.0] Percent velocity to inherit when thrown. */
var float m_fInheritVelocityPct;

/** How much velocity to throw the flag forward. */
var float m_fForwardThrowVelocity;

/** How much to dampen velocity on bounce. */
var float m_fBounceDampingPercent;

/** Collision proxy for extending the touch collision. */
var TrCollisionProxy m_CollisionProxyLevel1;
var TrCollisionProxy m_CollisionProxyLevel2;
var TrCollisionProxy m_CollisionProxyLevel3;

/** MIC used for the HUD marker */
var transient MaterialInstanceConstant m_MarkerMIC;

/** Timer to ignore same team touch events */
var float m_fIgnoreSameTeamTouch;

/** How many bounces before it slides along ground? */
var int m_nNumBouncesBeforeSlide;

/** Current number of bounces. */
var transient int m_nNumBounces;

/** Should the flag bounce a limited number of times, then slide? */
var bool m_bBounceSlideEnabled;

/** Assistance for passing to teammates. */
var bool m_bPassToTeammatesEnabled;

/** Amount of distance we can be from a teammate to pass it to them.*/
var float m_fTeammatePassMaxDistanceSq;

/** Drop the flag if the flag holder's ping is greater than this amount. 0=disabled.*/
var int m_nDropFlagPingThreshold;

/** When this flag is falling, dampen the momentum when taking damage. */
var float m_fDamageMomentumDampingWhileFalling;

/** Rage radius. */
var float m_fRageRadius;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
	if(Role == ROLE_AUTHORITY)
		bFadingOut, bRespawning;
}

simulated event ReplicatedEvent(name VarName)
{
	if(VarName=='bFadingOut')
	{
		if(bFadingOut)
		{
			CustomFadeOutEffects();
			return;
		}
	}
	else if(VarName=='bRespawning')
	{
		if(bRespawning)
		{
			CustomRespawnEffects();
			return;
		}
	}
	else if (VarName == 'HolderPRI' || VarName == 'bHome')
	{
		// Set the vehicle rigid body flags appropriately.
		if (HolderPRI != none && bHome)
		{
			SkelMesh.SetRBCollidesWithChannel(RBCC_Vehicle, true);
		}
		else
		{
			SkelMesh.SetRBCollidesWithChannel(RBCC_Vehicle, false);
		}
	}

	Super.ReplicatedEvent(VarName);
}

simulated function PostBeginPlay()
{
	local int i;
    local PlayerController PC;

	if( Role == ROLE_Authority )
	{
		if( m_CollisionProxyLevel1 == none )
		{
			m_CollisionProxyLevel1 = spawn(class'TrCollisionProxy_FlagLevel1',self,,Location, Rotation,, true);
			m_CollisionProxyLevel1.ForceProximityScan();
			m_CollisionProxyLevel1.SetBase(self);
		}

		if (m_CollisionProxyLevel2 == none)
		{
			m_CollisionProxyLevel2 = spawn(class'TrCollisionProxy_FlagLevel2',self,,Location, Rotation,, true);
			m_CollisionProxyLevel2.ForceProximityScan();
			m_CollisionProxyLevel2.SetBase(self);
		}

		if (m_CollisionProxyLevel3 == none)
		{
			m_CollisionProxyLevel3 = spawn(class'TrCollisionProxy_FlagLevel3',self,,Location, Rotation,, true);
			m_CollisionProxyLevel3.ForceProximityScan();
			m_CollisionProxyLevel3.SetBase(self);
		}
	}

	super.PostBeginPlay();
	for(i=0;i<SkelMesh.Materials.Length;++i)
	{
		MICArray.Insert(i,1);
		MICArray[i] = SkelMesh.CreateAndSetMaterialInstanceConstant(i);
	}

    if (!bDeleteMe)
	{
		// add to local HUD's post-rendered list
		ForEach LocalPlayerControllers(class'PlayerController', PC)
		{
			if ( PC.MyHUD != None )
			{
				PC.MyHUD.AddPostRenderedActor(self);
			}
		}
	}
}

simulated function Tick(float DeltaTime)
{
	local int i, teamNum;
	local name TimerInUse;
	local TrGameReplicationInfo TrGRI;

	// Update the flag return timer.
	if (Role == ROLE_Authority)
	{
		TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
		if (TrGRI != none)
		{
			teamNum = GetTeamNum();

			if (teamNum == 0 || teamNum == 1)
			{
				// If we are dropped, get the remaining timer for the flag return time.
				if (IsInState('Dropped'))
				{
					TrGRI.FlagReturnTime[teamNum] = GetRemainingTimeForTimer();
				}
				else
				{
					TrGRI.FlagReturnTime[teamNum] = 0;
				}
			}
		}
	}

	if(WorldInfo.NetMode != NM_DEDICATEDSERVER)
	{
		if(bFadingOut)
		{
			TimerInUse='CustomFadeOutEffects';
		}
		else if(bRespawning)
		{
			TimerInUse='bringUpBrightOff';
		}
		if(bBringUpBright)
		{
			for(i=0;i<MICArray.Length;++i)
			{
				MICArray[i].setScalarParameterValue('FlagBrightness',1 - (GetTimerRate(TimerInUse)-GetTimerCount(TimerInUse))/0.5);
			}
		}
		else if(bBringDownFromBright)
		{
			for(i=0;i<MICArray.Length;++i)
			{
				MICArray[i].setScalarParameterValue('FlagOpacity',(GetTimerRate(TimerInUse)-GetTimerCount(TimerInUse))/0.5);
			}
		}
	}
}


/** Update damping on the cloth sim based on what we are doing. */
simulated event OnBaseChainChanged()
{
	local TrPawn TrP, TrPOldBase;

	TrP = TrPawn(Base);

	if (TrP != None)
	{
		// When pawn is holding flag, make sure attachments are updated in tick
		SkelMesh.SetTranslation( vect(0.0,0.0,0.0) );
		TrP.Mesh.bForceUpdateAttachmentsInTick = TRUE;
		SkelMesh.SetShadowParent(TrP.Mesh);
		ClearTimer( 'SetFlagDynamicLightToNotBeDynamic' );
		LightEnvironment.bDynamic = TRUE;
		//`log("PARENTING TO PAWN------");

		// Reset bounces.
		m_nNumBounces = 0;

		if( HomeBase != none )
		{
			if( OldBase == HomeBase )
			{
				// Let the home base know that the flag has been taken.
				UTGameObjective(HomeBase).FlagUpdated(false);
			}
		}
	}
	else
	{
		SkelMesh.SetTranslation( vect(0.0,0.0,-40.0) );
		SkelMesh.bClothBaseVelClamp = FALSE;
		SkelMesh.SetAttachClothVertsToBaseBody(FALSE);
		SkelMesh.SetShadowParent(None);
		LightEnvironment.bDynamic = TRUE;
		SetTimer( 5.0f, FALSE, 'SetFlagDynamicLightToNotBeDynamic' );
		//`log("DROPPED PARENTING TO SELF------");

		// When pawn is no longer holding flag, reset 'force update attachments' flag
		TrPOldBase = TrPawn(OldBase);
		if ( TrPOldBase != None)
		{
			TrPOldBase.Mesh.bForceUpdateAttachmentsInTick = FALSE;
			
			if( TrPOldBase.m_FirstPersonBodyMesh != none && TrPOldBase.m_FirstPersonFlagShadowMesh.bAttached )
			{
				TrPOldBase.m_FirstPersonBodyMesh.DetachComponent(TrPOldBase.m_FirstPersonFlagShadowMesh);
			}
		}

		if( HomeBase != none )
		{
			if( Base == HomeBase )
			{
				// Let the home base know that the flag has been returned.
				UTGameObjective(HomeBase).FlagUpdated(true);

				m_nNumBounces = 0;
			}
		}
	}
}


/** returns true if should be rendered for passed in player */
simulated function bool ShouldMinimapRenderFor(PlayerController PC)
{
	return bHome || (PC.PlayerReplicationInfo.Team != Team) || (WorldInfo.TimeSeconds - LastLocationPingTime < 5.0);
}


simulated function ClientReturnedHome()
{
	Super.ClientReturnedHome();

	if (HomeBase != None)
	{
		bWasFlagReturned = true;
		SetBase(HomeBase);
	}
}

function SetHolder(Controller C)
{
	local UTCTFSquadAI S;
	local UTPawn UTP;
	local UTBot B;
	local TrPawn TrP;
	local TrPlayerController TrC;
	local TrPlayerReplicationInfo TrPRI;

	// when the flag is picked up we need to set the flag translation so it doesn't stick in the ground
	SkelMesh.SetTranslation( vect(0.0,0.0,0.0) );
	UTP = UTPawn(C.Pawn);
	LightEnvironment.bDynamic = TRUE;
	SkelMesh.SetShadowParent( UTP.Mesh );

	ClearTimer( 'SetFlagDynamicLightToNotBeDynamic' );

	// AI Related
	B = UTBot(C);
	if ( B != None )
	{
		S = UTCTFSquadAI(B.Squad);
	}
	else if ( PlayerController(C) != None )
	{
		S = UTCTFSquadAI(UTTeamInfo(C.PlayerReplicationInfo.Team).AI.FindHumanSquad());
	}

	foreach WorldInfo.AllPawns(class'TrPawn', TrP)
	{
		if( bHome && TrP.GetTeamNum() == GetTeamNum() && VSizeSq(TrP.Location - Location) <= (m_fRageRadius * m_fRageRadius) )
		{
			TrPRI = TrP.GetTribesReplicationInfo();
			if( !(TrPRI != none && TrPRI.bHasFlag) )
			{
				TrP.SetRagePerkActive();
			}
		}
	}

	if ( S != None )
	{
		S.EnemyFlagTakenBy(C);
	}

	Super.SetHolder(C);
	if ( B != None )
	{
		B.SetMaxDesiredSpeed();
	}

	TrC = TrPlayerController(C);
	if( TrC != none )
	{
		// Pulse the HUD of the grabber's controller.
		TrC.ClientPulseHUD(0);

		// Update the new holder's New Player Assist points.
		TrC.UpdateNewPlayerAssistPoints(2);

		// Clear any determination points.
		TrC.ClearDetermination();
        
        TrP = TrPawn(TrC.Pawn);

        // See if we've set a record speed for this grab
        if (TrP != none) TrP.CheckGrabSpeed();
	}

	SkelMesh.SetRBCollidesWithChannel(RBCC_Vehicle, false);
}

function bool ValidHolder(Actor Other)
{
    local Controller C;
	local TrGameReplicationInfo TrGRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

	if( TrGRI != none && TrGRI.bWarmupRound )
	{
		// Don't allow a flag grab during warmup.
		return false;
	}

	// The person wanting to hold is currently locked out from picking us up.
	if( Other != none && Other.IsTimerActive('LockedOutFromFlagPickupTimer') )
	{
		return false;
	}

	// Someone is holding us, so nobody can be a valid holder.
	if (Holder != none)
	{
		return false;
	}

    if ( !Super.ValidHolder(Other) )
	{
		return false;
	}

    C = Pawn(Other).Controller;

	if ( WorldInfo.GRI.OnSameTeam(self,C) )
	{
		SameTeamTouch(c);
		return false;
	}

    return true;
}


function SameTeamTouch(Controller C)
{
}

/** Intended to have different flags override if they need custom effects such as material params set on a respawn */
simulated function CustomRespawnEffects()
{
	local int i;

	bRespawning = true;
	bFadingOut = false;
	ClearTimer('CustomFadeOutEffects');
	setTimer(1.0,false,'BringUpBrightOff');

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (RespawnEffect != None)
		{
			WorldInfo.MyEmitterPool.SpawnEmitter(RespawnEffect, Location, Rotation, self);
		}

		bBringUpBright = true;
		bBringDownFromBright = false;
		for(i = 0;i < MICArray.Length; i++)
		{
			MICArray[i].setScalarParameterValue('FlagOpacity', 1.0f);
		}

		bWasClothEnabled = SkelMesh.bEnableClothSimulation;
		SkelMesh.SetEnableClothSimulation(false); // to prevent cloth flag from going nutty due to teleport
	}
}
simulated function bringUpBrightOff()
{
	local int i;

	if(WorldInfo.NetMode != NM_DEDICATEDSERVER)
	{
		bBringUpBright = false;

		for(i=0;i<MICArray.Length;++i)
		{
			MICArray[i].setScalarParameterValue('FlagBrightness',0.0f);
		}

		SkelMesh.SetEnableClothSimulation(bWasClothEnabled); // re-enable from above.
	}

	bRespawning = false;
}

/** intended to have different flags override if they need custom effects just before a flag is returned to it's base */
simulated function CustomFadeOutEffects()
{
	local int i;

	if(WorldInfo.NetMode != NM_DEDICATEDSERVER)
	{
		if(bBringUpBright) // we've been brought up to bright, so now fade down
		{
			bBringUpBright=false;
			bBringDownFromBright=true;
			for(i=0;i<MICArray.Length;++i)
			{
				MICArray[i].setScalarParameterValue('FlagBrightness',0.0f);
			}
		}
		else if(bBringDownFromBright) // we've done the whole sequence, so call super and don't do this any more
		{
			for(i=0;i<MICArray.Length;++i)
			{
				MICArray[i].setScalarParameterValue('FlagOpacity',1.0f);
			}
			bBringDownFromBright = false;
			return;
		}
		else // we haven't done anything, so bring up brights.
		{
			bBringUpBright=true;
		}

		setTimer(0.5,false,'CustomFadeOutEffects');
	}
}

// States
auto state Home
{
	ignores SendHome, Score, Drop;

	function BeginState(Name PreviousStateName)
	{
		CustomRespawnEffects();
		Super.BeginState(PreviousStateName);

        m_TimeAwaySeconds = 0;

		// need to reset the flag skel mesh translation
		SetFlagPropertiesToStationaryFlagState();

		if ( Team != None )
		{
			// note team is none at start of match, but flagstate is already correctly set
			UTGameReplicationInfo(WorldInfo.GRI).SetFlagHome(Team.TeamIndex);
		}

		if (HomeBase != none)   
		{
		    HomeBase.bForceNetUpdate = TRUE;
		    bForceNetUpdate = TRUE;
		    SetBase(HomeBase);
		    HomeBase.ObjectiveChanged();
		}
	}

	function EndState(Name NextStateName)
	{
	    m_TimeAwaySeconds = WorldInfo.TimeSeconds;

		Super.EndState(NextStateName);
		UTGameObjective(HomeBase).FlagUpdated(false);
		HomeBase.bForceNetUpdate = TRUE;
	}

	function OnCollisionProxyTouched(TrPawn TrP)
	{
		if( TrP != none && TrP.Controller != none )
		{
			if( !WorldInfo.GRI.OnSameTeam(self, TrP.Controller) )
			{
				// Only register proxy touch events at home when an enemy is attempting to pick the flag up.
				global.OnCollisionProxyTouched(TrP);
			}
		}
	}
}

state Held
{
	function OnCollisionProxyTouched(TrPawn TrP);

	event Landed(vector HitNormal, actor FloorActor);
}

state Dropped
{
	ignores Drop;

	function Timer() // TODO: Look into resetting scalars on endstate too, just in case picked up mid-fade
	{
		if(bFadingOut)
		{
			super.Timer();
			bFadingOut=false;
		}
		else
		{
			bFadingOut = true;
			CustomFadeOutEffects();
			SetTimer(1.0f);
		}

	}

	event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
	{
		local class<TrDmgType_Base> TrDamageType;

		TrDamageType = class<TrDmgType_Base>(DamageType);

		if( TrDamageType != none && TrDamageType.default.m_bImpulsesFlags )
		{
			if (damageType.default.bExtraMomentumZ)
			{
				momentum.Z = FMax(momentum.Z, 0.4 * VSize(momentum));
			}

			if( Physics == PHYS_Falling )
			{
				// Dampen the momentum if falling.
				Momentum *= m_fDamageMomentumDampingWhileFalling;
			}

			Velocity += Momentum/m_fMass;
		}
	}
}

event Landed(vector HitNormal, actor FloorActor)
{
	local float VelocitySizeSq;

	super.Landed(HitNormal, FloorActor);
	SetPhysics(PHYS_Custom);
	
	if (FloorActor != none && FloorActor.IsA('TrVehicle'))
	{
		// Landed on a vehicle, so bounce off of it.
		if( HitNormal.Z > 0.98 )
		{
			// If on a fairly flag surface, add a random direction to the bounce to make sure we don't
			// infinitely bounce.
			HitNormal.X = RandRange(-1.0, 1.0);
			HitNormal.Y = RandRange(-1.0, 1.0);
			HitNormal.Z = RandRange(0.3, 0.8);
			HitNormal = Normal(HitNormal);
		}
		Velocity += (Velocity dot HitNormal) * HitNormal * -2.0;
	}

	VelocitySizeSq = VSizeSq(Velocity);
	//`log("Velocity:"@VelocitySizeSq);
	if( VelocitySizeSq > 580000.0 ) // Number determined via logging.
	{
		PlaySound(SoundCue'AUD_ENV_FlagBounce.Flag_Bounce.A_CUE_ENV_FlagBounce', false);
	}
	else
	{   
		PlaySound(SoundCue'AUD_ENV_FlagBounce.Flag_Bounce.A_CUE_ENV_FlagBounceLight', false);
	}
}

/** we are encroached by something (i.e. telefragged) */
event EncroachedBy(Actor Other)
{
	// The vehicle is being spawned in, just send us home.
	if (Other.IsA('TrVehicle') && !Other.bScriptInitialized)
		AutoSendHome();
}

/** need to reset the flag skel mesh translation **/
event Drop(optional Controller Killer, optional bool bNoThrow)
{
	local float fForwardThrowVelocity;
	local TrPlayerController PC;
	local TrPawn TrP;
	local Vector Dir, ViewPos;
	local Rotator ViewRot, NewRotation;

	// Calculate forward throw velocity.
	fForwardThrowVelocity = m_fForwardThrowVelocity;

	SetFlagPropertiesToStationaryFlagState();

	// The player has dropped the flag, they can't touch it for 2s.
	TrP = TrPawn(Holder);
	if( TrP != none )
	{
		TrP.LockFromFlagPickup();
	}

	OldHolder = Holder;

    if (HomeBase != none)
    {
	    HomeBase.ObjectiveChanged();
    }

	// If another pawn caused us to fumble the flag, drop the flag in the direction from them to the flag.
	// Otherwise throw in the direction of the holder.
	Dir = vect(0.0,0.0,1.0);
	if( Killer != none && Killer.Pawn != none )
	{
		Dir = Normal(Location - Killer.Pawn.Location);
	}
	else if( OldHolder != none && OldHolder.Controller != none )
	{
		OldHolder.Controller.GetPlayerViewPoint(ViewPos, ViewRot);
		Dir = Vector(ViewRot);
	}

	Velocity = m_fInheritVelocityPct * Holder.Velocity;
	if ( (OldHolder != None) && (OldHolder.health > 0) && !bNoThrow )
	{
		Velocity += fForwardThrowVelocity * Dir;
	}
	Velocity.Z += 350; 

	//`log(self$" drop holder="$holder,, 'GameObject');
	BaseBoneName = '';
	BaseSkelComponent = None;

	SetLocation(Holder.Location);
	if ( Killer != None )
	{
		LogDropped(Killer);
	}
	else
	{
		LogDropped(Holder.Controller);
	}
	GotoState('Dropped');

	ForEach WorldInfo.AllControllers(class'TrPlayerController', PC)
	{
		PC.CheckAutoObjective(true);

		if( PC.InRovingSpectate() && (PC.ViewTarget == self || PC.ViewTarget == OldHolder) )
		{
			// Spectators watch the dropped flag.
			PC.OnViewTargetDroppedFlag(self);
		}

	}

	if (OldHolder != none)
	{
		NewRotation = OldHolder.Rotation;
		NewRotation.Pitch = 0;
		NewRotation.Roll = 0;
		SetRotation(NewRotation);

		// Use m_fLastDamagerTimeStamp to prevent auto regening health when throwing the flag down.
		TrPawn(OldHolder).m_fLastDamagerTimeStamp = WorldInfo.TimeSeconds;
	}
}


/**
 * This function will set the flag properties back to what they should be when the flag is stationary.  (i.e. dropped or at a flag base
 **/
simulated function SetFlagPropertiesToStationaryFlagState()
{
	SkelMesh.SetTranslation( vect(0.0,0.0,-40.0) );
	LightEnvironment.bDynamic = TRUE;
	SkelMesh.SetShadowParent( None );
	SetTimer( 5.0f, FALSE, 'SetFlagDynamicLightToNotBeDynamic' );

	if (bHome)
		SkelMesh.SetRBCollidesWithChannel(RBCC_Vehicle, true);
}

/**
 * This is used to set the LightEnvironment to not be dynamic.
 * Basically when a flag is dropped we need to update the LightEnvironment and then set it to not update anymore.
 **/
function SetFlagDynamicLightToNotBeDynamic()
{
	ClearTimer( 'SetFlagDynamicLightToNotBeDynamic' );
	LightEnvironment.bDynamic = FALSE;
}

simulated event Destroyed()
{
	local PlayerController PC;

	Super.Destroyed();

	if( m_CollisionProxyLevel1 != none )
	{
		m_CollisionProxyLevel1.Destroy();
		m_CollisionProxyLevel1 = none;
	}

	if( m_CollisionProxyLevel2 != none )
	{
		m_CollisionProxyLevel2.Destroy();
		m_CollisionProxyLevel2 = none;
	}

	if( m_CollisionProxyLevel3 != none )
	{
		m_CollisionProxyLevel3.Destroy();
		m_CollisionProxyLevel3 = none;
	}

	// remove from local HUD's post-rendered list
	ForEach LocalPlayerControllers(class'PlayerController', PC)
	{
		if ( PC.MyHUD != None )
		{
			PC.MyHUD.RemovePostRenderedActor(self);
		}
	}
}

simulated event PostRenderFor(PlayerController PC, Canvas Canvas, vector CameraPosition, vector CameraDir)
{
    local bool friendly;
	local vector ScreenLoc;
    local Texture2D flag;
	local TrHUD HUD;
	local int xPixelBlock, yPixelBlock;
	local bool bAlongScreenEdges;
	local LinearColor RenderColor;

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

    if (HolderPRI != None)
    {
		return;
    }

	if (m_markerMIC == none)
	{
		m_MarkerMIC = new(self) class'MaterialInstanceConstant';
		m_MarkerMIC.SetParent(class'TrHUD'.default.MarkerBaseMIC);
	}


	xPixelBlock = (Canvas.ClipX / 2) * 0.08f;
	yPixelBlock = (Canvas.ClipY / 2) * 0.08f;

    //if (!HUD.bShowObjectives) return;

	bAlongScreenEdges = Class'TrHUD'.static.GetEdgeScreenCoordinates(Canvas, CameraPosition, CameraDir, Location + 112 * vect(0,0,1), ScreenLoc);

	// If a large difference in screen positions happens and there wasn't a huge difference in camera direction and position, go with the previous screen pos.
	// If the flag was recently returned, jump to it's new location.
	if (bAlongScreenEdges && !bWasFlagReturned && VSize(ScreenLoc - LastScreenLoc) > 200.0f && VSize(CameraDir * 200 - LastCameraDir * 200) < 100.0f && VSize(CameraPosition - LastCameraPos) < 200.0f)
		ScreenLoc = LastScreenLoc;
	// Save the new location.
	else
	{
		bWasFlagReturned = false;
		LastScreenLoc = ScreenLoc;
		LastCameraDir = CameraDir;
		LastCameraPos = CameraPosition;
	}

	// Block out the flag inside a certain pixel range.
	if (ScreenLoc.X > (Canvas.ClipX/2 - xPixelBlock) && ScreenLoc.X < (Canvas.ClipX/2 + xPixelBlock) &&
		ScreenLoc.Y > (Canvas.ClipY/2 - yPixelBlock) && ScreenLoc.Y < (Canvas.ClipY/2 + yPixelBlock))
	{
		m_FlagIconAlpha -= WorldInfo.DeltaSeconds * 2.0f;
		m_flagIconAlpha = FMax(m_FlagIconAlpha, 0.0f);
	}
	else
	{
		m_FlagIconAlpha = m_FlagIconAlpha + WorldInfo.DeltaSeconds*4.0f*(1.0f-m_FlagIconAlpha);
		m_flagIconAlpha = FMin(m_FlagIconAlpha, 1.0f);
	}

	friendly = PC.IsSpectating() ? GetTeamNum() == 1 : (PC.GetTeamNum() == GetTeamNum());
	RenderColor = friendly ? class'TrHUD'.default.MarkerColorFriendly : class'TrHUD'.default.MarkerColorEnemy;
	flag = bHome ? class'TrHUD'.default.FlagAtBase : class'TrHUD'.default.FlagDropped;

	// Set the alpha.
	RenderColor.A *= m_FlagIconAlpha;

	m_MarkerMIC.SetTextureParameterValue('HudItem_Texture', flag);
	m_MarkerMIC.SetVectorParameterValue('HudItem_Color', RenderColor);

    ScreenLoc.Z = VSize(CameraPosition - Location);

	if (flag != none)
	{
		HUD.DrawMICMarker(m_MarkerMIC, ScreenLoc, Canvas, vect2d(flag.SizeX, flag.SizeY), , friendly, 1.0f);
	}
}

simulated function DisplayDebug(HUD HUD, out float out_YL, out float out_YPos)
{
	local string teamname;

	if (Team.TeamIndex == 0)
	{
		teamname = "BE";
	}
	else
	{
		teamname = "DS";
	}
	HUD.Canvas.SetDrawColor(0, 255, 0);
	HUD.Canvas.SetPos(4, out_YPos);
	HUD.Canvas.DrawText("Flag"@teamname, false);
	out_YPos += out_YL;

	HUD.Canvas.SetPos(24, out_YPos);
	HUD.Canvas.DrawText("Velocity ["$VSize(Velocity)$"]");
	out_YPos += out_YL;

	HUD.Canvas.SetPos(24, out_YPos);
	HUD.Canvas.DrawText("Z-Velocity ["$Velocity.Z$"]");
	out_YPos += out_YL;
}

simulated function string GetSpectatorName()
{
	return "Flag";
}

simulated function string GetSpectatorDescription()
{
	if( bHome )
	{
		return "At base";
	}
	else if( HolderPRI != none )
	{
		return "Held by"@HolderPRI.PlayerName;
	}
	else
	{
		return "Dropped";
	}
}

function OnCollisionProxyTouched(TrPawn TrP)
{
	if (!ValidHolder(TrP) || !FastTrace(TrP.Location, Location))
	{
		return;
	}

	// A pawn with the reach perk is picking up the flag.
	SetHolder(TrP.Controller);
}

defaultproperties
{
   m_bBounceSlideEnabled=True
   RunningClothVelClamp=(X=500.000000,Y=500.000000,Z=200.000000)
   HoverboardingClothVelClamp=(X=300.000000,Y=300.000000,Z=200.000000)
   Begin Object Class=DynamicLightEnvironmentComponent Name=FlagLightEnvironment
      bDynamic=False
      Name="FlagLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'Engine.Default__DynamicLightEnvironmentComponent'
   End Object
   LightEnvironment=FlagLightEnvironment
   LastLocationPingTime=-100.000000
   m_fMass=75.000000
   m_fFriction=2.000000
   m_FlagIconAlpha=1.000000
   m_fInheritVelocityPct=0.750000
   m_fForwardThrowVelocity=1200.000000
   m_fBounceDampingPercent=0.400000
   m_nNumBouncesBeforeSlide=1
   m_nDropFlagPingThreshold=400
   m_fDamageMomentumDampingWhileFalling=0.400000
   m_fRageRadius=12000.000000
   bUseTeamColorForIcon=True
   MaxDropTime=40.000000
   MapSize=0.400000
   IconCoords=(U=843.000000,V=86.000000,UL=46.000000,VL=44.000000)
   GameObjBone3P="Spine1"
   GameObjOffset3P=(X=-30.000000,Y=12.000000,Z=0.000000)
   GameObjRot3P=(Pitch=5461,Yaw=-16384,Roll=16384)
   GameObjOffset1P=(X=-15.000000,Y=-8.000000,Z=15.000000)
   GameObjRot1P=(Pitch=910,Yaw=0,Roll=0)
   PickUpWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrFlagBase:ForceFeedbackWaveformPickUp'
   Begin Object Class=SkeletalMeshComponent Name=TheFlagSkelMesh
      bUpdateSkelWhenNotRendered=False
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bEnableClothSimulation=True
      ClothWind=(X=20.000000,Y=10.000000,Z=0.000000)
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrFlagBase:FlagLightEnvironment'
      RBChannel=RBCC_Nothing
      BlockRigidBody=True
      RBCollideWithChannels=(Vehicle=True,Cloth=True)
      Translation=(X=0.000000,Y=0.000000,Z=-40.000000)
      Name="TheFlagSkelMesh"
      ObjectArchetype=SkeletalMeshComponent'Engine.Default__SkeletalMeshComponent'
   End Object
   SkelMesh=TheFlagSkelMesh
   bHome=True
   HomeBaseOffset=(X=0.000000,Y=0.000000,Z=1.000000)
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTCarriedObject:CollisionCylinder'
      CollisionHeight=80.000000
      CollisionRadius=40.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Translation=(X=0.000000,Y=0.000000,Z=35.000000)
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTCarriedObject:CollisionCylinder'
   End Object
   Components(0)=CollisionCylinder
   Components(1)=FlagLightEnvironment
   Components(2)=TheFlagSkelMesh
   bOrientOnSlope=False
   bPostRenderIfNotVisible=True
   bHardAttach=True
   bCollideActors=True
   bProjTarget=True
   NetPriority=2.000000
   CollisionComponent=CollisionCylinder
   Name="Default__TrFlagBase"
   ObjectArchetype=UTCarriedObject'UTGame.Default__UTCarriedObject'
}
