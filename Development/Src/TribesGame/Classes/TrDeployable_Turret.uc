/*
 *		Base class for deployable (or level placed) Turrets 
 */
class TrDeployable_Turret extends TrDeployable;

/** If TRUE, turret will be allowed to fire. */
var() bool m_bEnabled;

/** Skel controls that controls the aiming. */
var array<SkelControlLookAt> m_LookAtSkelControls;
var() array<name> m_LookAtSkelControlNames;

/** Skel controls that controls fire recoils. */
var array<GameSkelCtrl_Recoil> m_RecoilSkelControls;
var() array<name> m_RecoilSkelControlNames;

var	UDKExplosionLight m_MuzzleFlashLight;
var class<UDKExplosionLight> m_MuzzleFlashLightClass;
var ParticleSystemComponent	m_MuzzleFlashPSC;

var bool m_bCanTargetVehicles;

/** The amount to modify the fire interval */
var float m_fDeltaFireInterval;

var SoundCue m_TargetAcquiredSoundCue;
var private float m_fTargetAcquiredTime;

/** How long does it to fire on a target? */
var float m_fTimeToAcquireTarget;

/** What pawns are we ignoring? */
struct IgnorePawn
{
	var TrPawn PawnToIgnore;
	var float  UnignoreTime;
};
var array<IgnorePawn> m_IgnorePawnList;

/** How long do we ignore invulnerable players? */
var float m_fTimeToIgnoreInvulnerable;

/** How long after we have been stalled until we can fire again? */
var float m_fFireStallRestoreTime;
var float m_fLastStallTime;

simulated event PostBeginPlay()
{
    Super.PostBeginPlay();
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    local int i;

    if( SkelComp == m_Mesh )
    {
        // Cache the list of look at controllers.
        for(i = 0; i < m_LookAtSkelControlNames.Length; i++ )
        {
            m_LookAtSkelControls.AddItem(SkelControlLookAt(SkelComp.FindSkelControl(m_LookAtSkelControlNames[i])));
        }

        // Cache the list of recoil controllers.
        for(i = 0; i < m_RecoilSkelControlNames.Length; i++ )
        {
            m_RecoilSkelControls.AddItem(GameSkelCtrl_Recoil(SkelComp.FindSkelControl(m_RecoilSkelControlNames[i])));
        }
    }

    // Shield mesh and X-Ray mesh should follow along with the animation on the m_Mesh.
    if( m_Mesh != None )
    {
        if( m_ShieldMesh != None )
        {
            m_ShieldMesh.SetParentAnimComponent(m_Mesh);
        }

		if (m_XRayMesh != none)
		{
			m_XRayMesh.SetParentAnimComponent(m_Mesh);
		}
    }
    
    Super.PostInitAnimTree(SkelComp);
}

simulated function DeployComplete()
{
	Super.DeployComplete();

	if ( Role == ROLE_Authority)
	{
		if(!IsTimerActive('AcquireTarget'))
		{
			SetTimer(0.25, true, 'AcquireTarget');
		}

		if (!IsTimerActive('CleanupIgnoreList'))
		{
			SetTimer(2.0, true, 'CleanupIgnoreList');
		}
	}
}

simulated function AcquireTarget()
{
	local Pawn targetPawn;
	local TrVehicle targetVehicle;

    if (m_WeaponHolder == None || m_WeaponHolder.Weapon == None)
    {
        ;
        return;
    }

	if (!m_bEnabled || !r_bIsPowered || !m_bIsDeployed || r_bInDestroyedState || WorldInfo.Game.bGameEnded || m_fLastStallTime + m_fFireStallRestoreTime >= WorldInfo.TimeSeconds)
	{
		// Stop firing if we can't work.
		if (IsFiring())
			m_WeaponHolder.StopFire(0);

		r_TargetPawn = none;

		return;
	}

	// If we are targeting a vehicle, stop targeting and firing if it becomes empty.
	targetVehicle = TrVehicle(r_TargetPawn);
	if (targetVehicle != none && targetVehicle.IsEmpty())
	{
		m_WeaponHolder.StopFire(0);
		r_TargetPawn = none;
	}

    targetPawn = GetTargetPawn();

	// New target, play target acquired sound cue.
	if (targetPawn != r_TargetPawn)
	{
		// Stop firing.
		m_WeaponHolder.StopFire(0);

		m_fTargetAcquiredTime = WorldInfo.TimeSeconds;
		r_TargetPawn = targetPawn;
		PlaySound(m_TargetAcquiredSoundCue);
	}

	// Target delay complete?
	if (WorldInfo.TimeSeconds - m_fTargetAcquiredTime < GetAcquireDelayTime())
		return;

    if (r_TargetPawn != None)
    {
        m_WeaponHolder.StartFire(0);
    }
	else if (IsFiring())
	{
		m_WeaponHolder.StopFire(0);
	}
}

simulated function float GetAcquireDelayTime()
{
	local TrPlayerReplicationInfo TrPRI, TargetTrPRI;
	local TrValueModifier VM, TargetVM;
	local float PctChange; // Represents the owner's and the victim's combined buffs to the acquire time.

	PctChange = 1.0;

	if( m_Controller != none )
	{
		TrPRI = TrPlayerReplicationInfo(m_Controller.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				// If owning pawn has a skill/perk to quicken the acquire target time...
				PctChange -= VM.m_fTurretAcquireTargetBuffPct;
			}
		}
	}

	if( r_TargetPawn != none )
	{
		TargetTrPRI = TrPlayerReplicationInfo(r_TargetPawn.PlayerReplicationInfo);
		if( TargetTrPRI != none )
		{
			TargetVM = TargetTrPRI.GetCurrentValueModifier();
			if( TargetVM != none )
			{
				// If target pawn has a skill/perk to add to the acquire target time...
				PctChange += TargetVM.m_fAcquireTimeByEnemyTurretPctBuff;
			}
		}
	}

	return default.m_fTimeToAcquireTarget * PctChange;
}

function CleanupIgnoreList()
{
	local int i;
	local IgnorePawn IgnoredPawn;

	// Remove old ignored pawns.
	for (i = 0; i < m_IgnorePawnList.Length; i++)
	{
		if (IgnoredPawn.PawnToIgnore == none || IgnoredPawn.UnignoreTime <= WorldInfo.TimeSeconds)
		{
			m_IgnorePawnList.Remove(i, 1);
			i--;
		}
	}
}

simulated function bool CanTargetPawn(Pawn aPawn)
{
	local int i;
	local TrPawn    TrP;
	local TrVehicle TrV;

	// Check for stealth, jamming on TrPawn's, or if they are dead.
	TrP = TrPawn(aPawn);
	if (TrP != none && (TrP.Health <= 0 || (TrP.r_bIsStealthed && !(TrP.IsPulseStealthed())) || TrP.IsJammedByFriendOrSelf()))
		return false;

	// Ignore vehicles when it is empty or we can't target them.
	TrV = TrVehicle(aPawn);
	if (TrV != none && (TrV.IsEmpty() || !m_bCanTargetVehicles))
		return false;

	// Are we ignoring this pawn?
	if (TrP != none)
	{
		i = m_IgnorePawnList.Find('PawnToIgnore', TrP);

		// If they are in the ignore list and are still ignored, skip.
		if (i != INDEX_NONE && m_IgnorePawnList[i].UnignoreTime > WorldInfo.TimeSeconds)
		{
			return false;
		}
		// If they aren't in the ignore list and they should be ignored, add them.
		else if (i == INDEX_NONE && TrP.r_bIsInvulnerable)
		{
			i = m_IgnorePawnList.Add(1);
			m_IgnorePawnList[i].PawnToIgnore = TrP;
			m_IgnorePawnList[i].UnignoreTime = WorldInfo.TimeSeconds + m_fTimeToIgnoreInvulnerable;
		}
	}

	return true;
}

simulated function Pawn GetTargetPawn()
{
	local bool      hasTargetLOS;
	local Box       BBox;
    local float     fCurrDist;
    local float     fClosestDist;
	local vector	relativeImpactPoint, StartLocation, TargetLocation;
    local Pawn	    closetPawn;
    local Pawn	    aPawn;

    closetPawn = None;
    fClosestDist = 0;
	StartLocation = GetWeaponStartTraceLocation();

    if (m_CollisionProxy != None)
    {
        foreach m_CollisionProxy.m_NearByPawns(aPawn)
        {
		    if (aPawn == None || aPawn==m_WeaponHolder || !IsEnemy(aPawn))
		    	continue;

			// Can we target this Pawn?
			if (!CanTargetPawn(aPawn))
				continue;

			// make sure we can turn all the way to where we need to be to lead and hit
			relativeImpactPoint = m_WeaponHolder.LeadingAimLocation(aPawn);
			if ((Normal(relativeImpactPoint) dot m_PlacementOrientationVector) > m_fFiringArcCheckValue)
			{
				aPawn.GetComponentsBoundingBox(BBox);

				hasTargetLOS = false;
				TargetLocation = (BBox.Min + BBox.Max) * 0.5f;

				// Vehicles are targeted at center of mass, players at top of mass.
				if (aPawn != none)
					TargetLocation.Z = BBox.Max.Z;

				// Do we have LOS to the BB? Make sure another actor isn't in the way for initial targeting.
				if (!hasTargetLOS && IsInLOS(aPawn, StartLocation, StartLocation + relativeImpactPoint, true, true))
					hasTargetLOS = true;

				// make sure we can see the enemy now (if required) and we have a straight shot at the place where we are aiming
				if ((!m_bRequireLOS || IsInLOS(aPawn, StartLocation, TargetLocation, true)) && hasTargetLOS)
				{
                    fCurrDist = VSize(Location - aPawn.Location);
	                if (fClosestDist == 0 || fCurrDist < fClosestDist)
		            {
			            fClosestDist = fCurrDist;
				        closetPawn = aPawn;
					}
				}
            }
        }
    }

    return closetPawn;
}

simulated event Tick( float DeltaTime )
{
    Super.Tick(DeltaTime);

    // Update the visual, i.e. mesh, aim.
    UpdateAim(DeltaTime);
}

/** Update the visual, i.e. mesh, aim. */
simulated function UpdateAim(float DeltaTime)
{
	local Box BBox;
    local int i;
    local vector TargetLocation;

    // Update the bone that our aim controls look at.
    for(i = 0; i < m_LookAtSkelControls.Length; i++ )
    {
		if (m_LookAtSkelControls[i] == none)
		{
			return;
		}

        if( r_TargetPawn != None )
        {
			r_TargetPawn.GetComponentsBoundingBox(BBox);

			// Target is the top of the BBox.
			TargetLocation = (BBox.Min + BBox.Max) * 0.5f;
			TargetLocation.Z = BBox.Max.Z;

            if( m_LookAtSkelControls[i].ControlStrength == 0.0 )
            {
                m_LookAtSkelControls[i].SetSkelControlActive(TRUE);
            }
            m_LookAtSkelControls[i].SetTargetLocation(TargetLocation);
            m_LookAtSkelControls[i].InterpolateTargetLocation(DeltaTime);
        }
        else
        {
            if( m_LookAtSkelControls[i].ControlStrength == 1.0 )
            {
                m_LookAtSkelControls[i].SetSkelControlActive(FALSE);
            }
        }
    }
}

/** Plays animation and other visual fire effects. */
simulated function PlayFireEffects(Weapon InWeapon, bool bViaReplication, optional vector HitLocation)
{
    local int i;

    for(i = 0; i < m_RecoilSkelControls.Length; i++ )
    {
		if (m_RecoilSkelControls[i] == none)
		{
			continue;
		}

        m_RecoilSkelControls[i].bPlayRecoil = true;
    }

    CauseMuzzleFlash();
}

/**
 * Causes the muzzle flash to turn on and setup a time to
 * turn it back off again.
 */
simulated function CauseMuzzleFlash()
{
	local ParticleSystem MuzzleTemplate;

	// only enable muzzleflash light if performance is high enough
	if ((!WorldInfo.bDropDetail && !class'Engine'.static.IsSplitScreen()) || WorldInfo.IsConsoleBuild(CONSOLE_Mobile) )
	{
		if ( m_MuzzleFlashLight == None )
		{
			if ( m_MuzzleFlashLightClass != None )
			{
				m_MuzzleFlashLight = new(Outer) m_MuzzleFlashLightClass;
				if (m_Mesh != None && m_Mesh.GetSocketByName(m_DeviceClass.default.MuzzleFlashSocket) != None)
				{
					m_Mesh.AttachComponentToSocket(m_MuzzleFlashLight, m_DeviceClass.default.MuzzleFlashSocket);
				}
			}
		}
		else
		{
			m_MuzzleFlashLight.ResetLight();
		}
	}

    if( m_MuzzleFlashPSC == none )
    {
        m_MuzzleFlashPSC = new(self) class'UTParticleSystemComponent';
        m_MuzzleFlashPSC.bAutoActivate = false;
        m_Mesh.AttachComponentToSocket(m_MuzzleFlashPSC, m_DeviceClass.default.MuzzleFlashSocket);
				
        // Because artists want to use bUseLocalSpace on some emitters, make sure the component
		// gets ticked after the transforms (or else the emitter may spawn at an incorrect location).
		m_MuzzleFlashPSC.SetTickGroup(TG_PostUpdateWork);
    }

	if (m_MuzzleFlashPSC != none)
	{
		if ( !m_MuzzleFlashPSC.bIsActive)
		{
			if (Instigator != None && Instigator.FiringMode == 1 && m_DeviceClass.default.MuzzleFlashAltPSCTemplate != None)
			{
				MuzzleTemplate = m_DeviceClass.default.MuzzleFlashAltPSCTemplate;
			}
			else
			{
				MuzzleTemplate = m_DeviceClass.default.MuzzleFlashPSCTemplate;
			}
			if (MuzzleTemplate != m_MuzzleFlashPSC.Template)
			{
				m_MuzzleFlashPSC.SetTemplate(MuzzleTemplate);
			}
			SetMuzzleFlashParams(m_MuzzleFlashPSC, m_DeviceClass.default.MuzzleFlashColor);
		}
		m_MuzzleFlashPSC.ActivateSystem();
	}

	// Set when to turn it off.
	SetTimer(m_DeviceClass.default.MuzzleFlashDuration,false,'MuzzleFlashTimer');

}

/**
 * Turns the MuzzleFlashlight off
 */
simulated function MuzzleFlashTimer()
{
	if ( m_MuzzleFlashLight != None )
	{
		m_MuzzleFlashLight.SetEnabled(FALSE);
	}

	if( m_MuzzleFlashPSC != none )
	{
		m_MuzzleFlashPSC.DeactivateSystem();
	}
}

/**
 * Allows a child to setup custom parameters on the muzzle flash
 */
simulated function SetMuzzleFlashParams(ParticleSystemComponent PSC, Color MuzzleFlashColor)
{
	PSC.SetColorParameter('MuzzleFlashColor', MuzzleFlashColor);
}

/** Returns the location where the weapon traces begin / projectiles spawn.*/
simulated function vector GetWeaponStartTraceLocation(optional Weapon CurrentWeapon)
{
    local vector Loc;

    m_Mesh.GetSocketWorldLocationAndRotation('WSO_Emit_01', Loc);
    
    return Loc;
}

simulated state Blownup
{
	simulated function BeginState(Name PreviousStateName)
	{
        ClearTimer('AcquireTarget');
		ClearTimer('CleanupIgnoreList');
        super.BeginState(PreviousStateName);
	}
}

simulated function Texture2D GetMarker()
{
	return class'TrHud'.default.DeployableTurret;
}

function AwardKillAssists()
{
    local int i;

    for (i = 0; i < m_Upgraders.Length; i++)
    {
        if (GetTeamNum() == m_Upgraders[i].GetTeamNum())
        {
            m_Upgraders[i].m_AccoladeManager.QueueAccolade(m_AssistAccolade);
        }
    }
}

defaultproperties
{
   m_bEnabled=True
   m_bCanTargetVehicles=True
   m_fTimeToAcquireTarget=1.000000
   m_fTimeToIgnoreInvulnerable=10.000000
   m_fFireStallRestoreTime=1.000000
   m_fRelevancyCheckHeights(1)=15.000000
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:XRayMesh'
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:XRayMesh'
   End Object
   m_XRayMesh=XRayMesh
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ObjectiveMesh'
      PhysicsWeight=1.000000
      bHasPhysicsAssetInstance=True
      bUpdateJointsFromAnimation=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_Turret:MyLightEnvironment'
      RBChannel=RBCC_EffectPhysics
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      BlockRigidBody=True
      RBCollideWithChannels=(Default=True,GameplayPhysics=True,EffectPhysics=True,BlockingVolume=True)
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   MarkerOffset=70
   m_sScreenName="Turret"
   Begin Object Class=AudioComponent Name=OnlineSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:OnlineSound'
      bShouldRemainActiveIfDropped=True
      Name="OnlineSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:OnlineSound'
   End Object
   m_OnlineSound=OnlineSound
   Begin Object Class=AudioComponent Name=CriticalSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:CriticalSound'
      bShouldRemainActiveIfDropped=True
      Name="CriticalSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:CriticalSound'
   End Object
   m_CriticalSound=CriticalSound
   Begin Object Class=AudioComponent Name=ShieldHitSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:ShieldHitSound'
      Name="ShieldHitSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:ShieldHitSound'
   End Object
   m_ShieldHitSound=ShieldHitSound
   Begin Object Class=AudioComponent Name=PowerDownSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:PowerDownSound'
      Name="PowerDownSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:PowerDownSound'
   End Object
   m_PowerDownSound=PowerDownSound
   Begin Object Class=AudioComponent Name=DestroyedSound Archetype=AudioComponent'TribesGame.Default__TrDeployable:DestroyedSound'
      bShouldRemainActiveIfDropped=True
      Name="DestroyedSound"
      ObjectArchetype=AudioComponent'TribesGame.Default__TrDeployable:DestroyedSound'
   End Object
   m_DestroyedSound=DestroyedSound
   m_AssistAccolade=Class'TribesGame.TrAccolade_TurretAssist'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrDeployable:CollisionCylinder'
      CollisionHeight=50.000000
      CollisionRadius=50.000000
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrDeployable:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrDeployable:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      ArrowSize=0.500000
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrDeployable:Arrow'
   End Object
   Components(0)=Arrow
   Components(1)=CollisionCylinder
   Begin Object Class=PathRenderingComponent Name=PathRenderer Archetype=PathRenderingComponent'TribesGame.Default__TrDeployable:PathRenderer'
      ReplacementPrimitive=None
      Name="PathRenderer"
      ObjectArchetype=PathRenderingComponent'TribesGame.Default__TrDeployable:PathRenderer'
   End Object
   Components(2)=PathRenderer
   Components(3)=MyLightEnvironment
   Components(4)=ObjectiveMesh
   Components(5)=ShieldMesh
   Components(6)=OnlineSound
   Components(7)=CriticalSound
   Components(8)=ShieldHitSound
   Components(9)=PowerDownSound
   Components(10)=DestroyedSound
   CollisionComponent=ObjectiveMesh
   Name="Default__TrDeployable_Turret"
   ObjectArchetype=TrDeployable'TribesGame.Default__TrDeployable'
}
