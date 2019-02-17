/**
 * Base class for player pawns.
 */
class TrPlayerPawn extends TrPawn;

// Sounds.
var(Sounds) AudioComponent m_AudioComonentJetpackAttack;
var transient float m_fRemainingJetpackSoundFadeOutTime;
var(Sounds) float m_fJetpackSoundFadeOutTime;

/** Anim node used for 3p device anims. */
var TrAnimNodeBlendBy3pDevice m_3pDeviceAnimNode;
var TrAnimNodeBlendBy3pDevice m_1pBodyMeshDeviceAnimNode;

/** Used for simulated clients to play reload anim. */
var repnotify byte  r_nFlashReloadPrimaryWeapon;
var repnotify byte  r_nFlashReloadSecondaryWeapon;

/** List of particle effects to handle jetpacks. */
var array<ParticleSystemComponent> m_JetpackPSCs;
var array<ParticleSystemComponent> m_JetpackRibbonPSCs;

/** List of particle effects to play depending on player material */
var array<FootstepParticleInfo> m_HardLandingParticles;
var array<FootstepParticleInfo> m_StepParticles;
var ParticleSystem m_DefaultSkiJetParticle;
var array<ParticleSystemComponent> m_FootThrusterPSCs;

/** Sonic punch effects */
var(Sounds) SoundCue m_SonicPunch1p;
var(Sounds) SoundCue m_SonicPunch3p;
var ParticleSystem m_SonicPunchEffect1p;
var ParticleSystem m_SonicPunchEffect3p;

/** The Z velocity needed to activate jet ribbon. */
var float m_fRibbonZVelocity;

var Rotator m_CamRotOffset;

var Actor m_DeathCamFocus;

var float m_Cam3pZoomOutSpeed;
var float m_Cam3pZoomInSpeed;

// The below is very cryptic naming, but we're retaining the algorithm that UT used for weapon damping, but with the ability to change them via properties.
var() float m_EyeHeightWalkingMinSmoothing; //0.9
var() float m_EyeHeightWalkingMultiplier;   //10.0
var() float m_EyeHeightLandRecoveryMinSmoothing;    //0.9
var() float m_EyeHeightLandRecoveryMultiplier;      //9.0
var() float m_EyeHeightLandRecoveryMultiplier1;     //0.15
var() float m_EyeHeightLandRecoveryMultiplier2;     //0.6
var() float m_EyeHeightLandingMinSmoothing; //0.65
var() float m_EyeHeightLandingMultiplier;   //8.0
var() float m_EyeHeightLandingMultiplier1;  //1.5
var() float m_EyeHeightLandingMultiplier2;  //0.08
var() float m_EyeHeightLandingMultiplier3;  //0.25
var() float m_EyeHeightLandingMultiplier4;  //2.4
var() float m_EyeHeightLandingMultiplier5;
var() float m_EyeHeightLandingSpeedSqThreshold;
var() float m_EyeHeightLandingSpeedSqThresholdSkiing;
var() float m_EyeHeightLandingSkiingMultiplier;
var() float m_EyeHeightLandingSkiingMultiplier2;
var() float m_JumpBob1; //-1.5
var() float m_JumpBob2; //0.03
var() float m_JumpBob3; //300.0
var() float m_JumpBob4; //1.0
var() float m_JumpBob5; //8.0
var() float m_BobFootstepMultiplier; //9.0
var() float m_WeaponBobMultiplier1; //0.45
var() float m_WeaponBobMultiplier2; //0.55
var() float BobTimeMultiplier;//8.0
var() float BobGroundSpeedMultiplier1;//0.3
var() float BobGroundSpeedMultiplier2;//0.7

/** All anim node sequences for Mesh. */
var transient Array<AnimNodeSequence> m_MeshAnimSequenceNodes;

replication
{
	// replicated properties
    if (Role == ROLE_Authority)
        r_nFlashReloadPrimaryWeapon, r_nFlashReloadSecondaryWeapon;
}

simulated function SetCharacterClassFromInfo(class<UTFamilyInfo> Info, optional bool bForce=false)
{
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	Super.SetCharacterClassFromInfo(Info, bForce);

	switch( GetArmorType() )
	{
		case ARMOR_Light:
			m_BobFootstepMultiplier=10.2;
			BobGroundSpeedMultiplier2=0.8;
			break;
		case ARMOR_Medium:
			m_BobFootstepMultiplier=13.0;
			BobGroundSpeedMultiplier2=0.475;
			break;
		case ARMOR_Heavy:
			m_BobFootstepMultiplier=8.0;
			BobGroundSpeedMultiplier2=0.34;
			break;
	}

	TrPRI = GetTribesReplicationInfo();
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none )
		{
			m_BobFootstepMultiplier *= 1.0 + VM.m_fGroundSpeedPctBuff;
			BobGroundSpeedMultiplier2 *= 1.0 + VM.m_fGroundSpeedPctBuff;
		}
	}
}

event UpdateEyeHeight( float DeltaTime )
{
	local float smooth, MaxEyeHeight, OldEyeHeight, Speed2D, OldBobTime;
	local Actor HitActor;
	local vector HitLocation,HitNormal, X, Y, Z;
	local int m,n;

	if ( bTearOff )
	{
		// no eyeheight updates if dead
		EyeHeight = Default.BaseEyeheight;
		bUpdateEyeHeight = false;
		return;
	}

	if ( abs(Location.Z - OldZ) > 15 )
	{
		// if position difference too great, don't do smooth land recovery
		bJustLanded = false;
		bLandRecovery = false;
	}

	if ( !bJustLanded )
	{
		// normal walking around
		// smooth eye position changes while going up/down stairs
		smooth = FMin(m_EyeHeightWalkingMinSmoothing, m_EyeHeightWalkingMultiplier * DeltaTime/CustomTimeDilation);
		LandBob *= (1 - smooth);
		EyeHeight = EyeHeight * ( 1 - smooth) + BaseEyeHeight * smooth;
		/*if( Physics == PHYS_Walking || Physics==PHYS_Spider || Controller.IsInState('PlayerSwimming') )
		{
			OldEyeHeight = EyeHeight;
			EyeHeight = FMax((EyeHeight - Location.Z + OldZ) * (1 - smooth) + BaseEyeHeight * smooth,
								-0.5 * CylinderComponent.CollisionHeight);
		}
		else
		{
			EyeHeight = EyeHeight * ( 1 - smooth) + BaseEyeHeight * smooth;
		}*/
	}
	else if ( bLandRecovery )
	{
		// return eyeheight back up to full height
		smooth = FMin(m_EyeHeightLandRecoveryMinSmoothing, m_EyeHeightLandRecoveryMultiplier * DeltaTime);
		OldEyeHeight = EyeHeight;
		LandBob *= (1 - smooth);
		// linear interpolation at end
		if ( Eyeheight > m_EyeHeightLandRecoveryMinSmoothing * BaseEyeHeight )
		{
			//Eyeheight = Eyeheight + m_EyeHeightLandRecoveryMultiplier1*BaseEyeheight*Smooth;  // 0.15 = (1-0.75)*0.6
			Eyeheight = Eyeheight + ((1.0 - 0.75)*m_EyeHeightLandRecoveryMultiplier2)*BaseEyeheight*Smooth;  // 0.15 = (1-0.75)*0.6
		}
		else
			EyeHeight = EyeHeight * (1 - m_EyeHeightLandRecoveryMultiplier2*smooth) + BaseEyeHeight*m_EyeHeightLandRecoveryMultiplier2*smooth;
		if ( Eyeheight >= BaseEyeheight)
		{
			bJustLanded = false;
			bLandRecovery = false;
			Eyeheight = BaseEyeheight;
		}
	}
	else
	{
		// drop eyeheight a bit on landing
		smooth = FMin(m_EyeHeightLandingMinSmoothing, m_EyeHeightLandingMultiplier * DeltaTime);
		OldEyeHeight = EyeHeight;
		EyeHeight = EyeHeight * (1 - m_EyeHeightLandingMultiplier1*smooth);
		if( r_bIsSkiing )
		{
			if( VSizeSq2D(Velocity) < m_EyeHeightLandingSpeedSqThresholdSkiing )
			{
				LandBob += m_EyeHeightLandingSkiingMultiplier * (OldEyeHeight - Eyeheight);
			}
			else
			{
				LandBob += m_EyeHeightLandingSkiingMultiplier2 * (OldEyeHeight - Eyeheight);
			}
		}
		else
		{
			if( VSizeSq2D(Velocity) < m_EyeHeightLandingSpeedSqThreshold )
			{
				LandBob += m_EyeHeightLandingMultiplier2 * (OldEyeHeight - Eyeheight);
			}
			else
			{
				LandBob += m_EyeHeightLandingMultiplier5 * (OldEyeHeight - Eyeheight);
			}
		}
		if ( (Eyeheight < m_EyeHeightLandingMultiplier3 * BaseEyeheight + 1) || (LandBob > m_EyeHeightLandingMultiplier4)  )
		{
			bLandRecovery = true;
			Eyeheight = m_EyeHeightLandingMultiplier3 * BaseEyeheight + 1;
		}
	}

	// don't bob if disabled, or just landed
	if( bJustLanded || !bUpdateEyeheight )
	{
		BobTime = 0;
		WalkBob = Vect(0,0,0);
	}
	else
	{
		// add some weapon bob based on jumping
		if ( Velocity.Z > 0 )
		{
		  JumpBob = FMax(m_JumpBob1, JumpBob - m_JumpBob2 * DeltaTime * FMin(Velocity.Z,m_JumpBob3));
		}
		else
		{
		  JumpBob *= (1 -  FMin(m_JumpBob4, m_JumpBob5 * DeltaTime));
		}

		// Add walk bob to movement
		OldBobTime = BobTime;
		Bob = FClamp(Bob, -0.05, 0.05);

		if (Physics == PHYS_Walking )
		{
		  GetAxes(Rotation,X,Y,Z);
		  Speed2D = VSize(Velocity);
		  if ( Speed2D < 10 )
			  BobTime += 0.2 * DeltaTime;
		  else
			  BobTime += DeltaTime * (BobGroundSpeedMultiplier1 + BobGroundSpeedMultiplier2 * Speed2D/GroundSpeed);
		  WalkBob = Y * Bob * Speed2D * sin(BobTimeMultiplier * BobTime);
		  AppliedBob = AppliedBob * (1 - FMin(1, 16 * deltatime));
		  WalkBob.Z = AppliedBob;
		  if ( Speed2D > 10 )
			  WalkBob.Z = WalkBob.Z + 0.75 * Bob * Speed2D * sin(16 * BobTime);
		}
		else if ( Physics == PHYS_Swimming )
		{
		  GetAxes(Rotation,X,Y,Z);
		  BobTime += DeltaTime;
		  Speed2D = Sqrt(Velocity.X * Velocity.X + Velocity.Y * Velocity.Y);
		  WalkBob = Y * Bob *  0.5 * Speed2D * sin(4.0 * BobTime);
		  WalkBob.Z = Bob * 1.5 * Speed2D * sin(8.0 * BobTime);
		}
		else
		{
		  BobTime = 0;
		  WalkBob = WalkBob * (1 - FMin(1, 8 * deltatime));
		}

		if ( (Physics == PHYS_Walking) && (VSizeSq(Velocity) > 100) && IsFirstPerson() )
		{
			m = int(0.5 * Pi + m_BobFootstepMultiplier * OldBobTime/Pi);
			n = int(0.5 * Pi + m_BobFootstepMultiplier * BobTime/Pi);

			if ( (m != n) && !bIsWalking && !bIsCrouched )
			{
			  ActuallyPlayFootStepSound(0);
			}
		}
		if ( !bWeaponBob )
		{
			WalkBob *= 0.1;
		}
	}
	if ( (CylinderComponent.CollisionHeight - Eyeheight < 12) && IsFirstPerson() )
	{
	  // desired eye position is above collision box
	  // check to make sure that viewpoint doesn't penetrate another actor
		// min clip distance 12
		if (bCollideWorld)
		{
			HitActor = trace(HitLocation,HitNormal, Location + WalkBob + (MaxStepHeight + CylinderComponent.CollisionHeight) * vect(0,0,1),
						  Location + WalkBob, true, vect(12,12,12),, TRACEFLAG_Blocking);
			MaxEyeHeight = (HitActor == None) ? CylinderComponent.CollisionHeight + MaxStepHeight : HitLocation.Z - Location.Z;
			Eyeheight = FMin(Eyeheight, MaxEyeHeight);
		}
	}
}

simulated function name GetMaterialBelowFeetByLoc(vector TestLocation)
{
	local vector HitLocation, HitNormal;
	local TraceHitInfo HitInfo;
	local TrPhysicalMaterialProperty PhysicalProperty;
	local actor HitActor;
	local float TraceDist;
	local TrMapInfo TrMI;

	TraceDist = 1.5 * GetCollisionHeight();

	HitActor = Trace(HitLocation, HitNormal, TestLocation - TraceDist*vect(0,0,1), TestLocation, false,, HitInfo, TRACEFLAG_Bullet);
	if ( WaterVolume(HitActor) != None )
	{
		return (Location.Z - HitLocation.Z < 0.33*TraceDist) ? 'Water' : 'ShallowWater';
	}
	else if( Terrain(HitActor) != none )
	{
		// If we hit terrain, return the map's default phys mat.
		TrMI = TrMapInfo(WorldInfo.GetMapInfo());
		if( TrMI != none )
		{
			return TrMI.m_DefaultPhysicalMaterialName;
		}
		else
		{
			return '';
		}
	}
	if (HitInfo.PhysMaterial != None)
	{
		PhysicalProperty = TrPhysicalMaterialProperty(HitInfo.PhysMaterial.GetPhysicalMaterialProperty(class'TrPhysicalMaterialProperty'));
		if (PhysicalProperty != None)
		{
			return PhysicalProperty.MaterialType;
		}
	}
	return '';
}

simulated function name GetMaterialBelowFeet()
{
	return GetMaterialBelowFeetByLoc(Location);
}

simulated function ActuallyPlayFootstepSound(int FootDown)
{
	local int i;
	local ParticleSystemComponent E;
	local name MaterialBelowFeet;
	local SoundCue FootSound;
    local class<TrFamilyInfo> FamilyInfo;
	local vector FootLocation;

    FamilyInfo = GetCurrCharClassInfo();
	if (FamilyInfo == none)
	{
		return;
	}

	// Invalid footstep
	if (FootDown > FamilyInfo.default.m_nmFootstepEffectSockets.Length || FootDown < 0)
	{
		return;
	}

	// Invalid footstep socket
	if (!Mesh.GetSocketWorldLocationAndRotation(FamilyInfo.default.m_nmFootstepEffectSockets[FootDown], FootLocation))
	{
		return;
	}

	MaterialBelowFeet = GetMaterialBelowFeetByLoc(FootLocation);

	// Play the footstep sound.
	FootSound = SoundGroupClass.static.GetFootstepSound(FootDown, MaterialBelowFeet);
	if (FootSound != None)
	{
		PlaySound(FootSound, false, true,,, true);
	}

	// For now only play footstep particles in 3P.
	if (!IsFirstPerson())
	{
		i = default.m_StepParticles.Find('MaterialType', MaterialBelowFeet);

		if (i >= 0 && MaterialBelowFeet != '')
		{
			// Spawn the particle effect.
			E = WorldInfo.MyEmitterPool.SpawnEmitter(default.m_StepParticles[i].FootParticle, FootLocation);
			E.SetDepthPriorityGroup(SDPG_World);
			E.SetTickGroup(TG_PostUpdateWork);
		}
	}
}

simulated function vector WeaponBob(float BobDamping, float JumpDamping)
{
	Local Vector WBob;

	WBob = BobDamping * WalkBob;
	WBob.Z = (m_WeaponBobMultiplier1 + m_WeaponBobMultiplier2 * BobDamping)*WalkBob.Z;
	if ( !bWeaponBob )
	{
		WBob *= 2.5;
	}
	WBob.Z += JumpDamping *(LandBob - JumpBob);
	return WBob;
}

simulated event ReplicatedEvent(name VarName)
{
    if( VarName == 'r_nFlashReloadPrimaryWeapon' )
    {
        PlayReload(EQP_Primary);
    }
	else if( VarName == 'r_nFlashReloadSecondaryWeapon' )
    {
        PlayReload(EQP_Secondary);
    }
	
	super.ReplicatedEvent(VarName);
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
	local TrPlayerController TrPC;

    if( SkelComp == Mesh )
    {
        // Cache device anim node.
        m_3pDeviceAnimNode = TrAnimNodeBlendBy3pDevice(SkelComp.FindAnimNode('3pDeviceBlendNode'));

		// Don't play 3p notifies on locally controlled pawns in first person perpective.
		if( IsLocallyControlled() && IsHumanControlled() )
		{
			ClearMeshAnimSeqNodes();
			CacheMeshAnimSeqNodes();

			TrPC = TrPlayerController(Controller);
			if (TrPC != none && !TrPC.bBehindView )
			{
				SuppressAnimNotifies(true);
			}
		}
    }
	else if( SkelComp == m_FirstPersonBodyMesh && IsLocallyControlled() && IsHumanControlled() )
	{
		m_1pBodyMeshDeviceAnimNode = TrAnimNodeBlendBy3pDevice(SkelComp.FindAnimNode('3pDeviceBlendNode'));
	}
	Super.PostInitAnimTree(SkelComp);
}

unreliable client function PlayHardLandingEffect(vector HitLocation)
{
	local int i;
	local name MaterialBelowFeet;
	local ParticleSystemComponent E;

	MaterialBelowFeet = GetMaterialBelowFeetByLoc(HitLocation);
	i = default.m_HardLandingParticles.Find('MaterialType', MaterialBelowFeet);

	if (i >= 0 && MaterialBelowFeet != '')
	{
		// Spawn the particle effect.
		E = WorldInfo.MyEmitterPool.SpawnEmitter(default.m_HardLandingParticles[i].FootParticle, HitLocation);
		E.SetDepthPriorityGroup(SDPG_World);
		E.SetTickGroup(TG_PostUpdateWork);
	}
}

unreliable client function PlaySonicPunchEffect()
{
	local bool bParticleIn3P;
	local ParticleSystemComponent PSC;
	local rotator ViewRotation;
	local TrPlayerController TrPC;

	bParticleIn3P = true;
	ViewRotation = Rotation;
	if (IsLocallyControlled() && IsHumanControlled())
	{
		TrPC = TrPlayerController(Controller);
		if (TrPC != none)
		{
			ViewRotation = TrPC.Rotation;
			bParticleIn3P = TrPC.bBehindView;
		}
	}

	// Create the effect particle.
	PSC = WorldInfo.MyEmitterPool.SpawnEmitter(m_SonicPunchEffect3p, Location, ViewRotation, self);
	PSC.SetDepthPriorityGroup(SDPG_World);
	PSC.SetTickGroup(TG_PostUpdateWork);

	if (bParticleIn3P)
	{
		PlaySound(m_SonicPunch3p);
	}
	else
	{
		PlaySound(m_SonicPunch1p);
	}
}

simulated function CreateSkiParticleEffects()
{
    local TrPlayerReplicationInfo TrPRI;
    local class<TrFamilyInfo> FamilyInfo;
    local int i, j;

    FamilyInfo = GetCurrCharClassInfo();
    TrPRI = GetTribesReplicationInfo();
	if (FamilyInfo == none || TrPRI == none)
	{
		return;
	}

	if (m_FootThrusterPSCs.Length == 0)
	{
		// Create and attach the particle system.
		for( i = 0; i < FamilyInfo.default.m_nmSkiThrusterEffectSockets.Length; i++ )
		{
			j = m_FootThrusterPSCs.Add(1);
			m_FootThrusterPSCs[j] = new(self) class'ParticleSystemComponent';
			m_FootThrusterPSCs[j].SetTemplate(TrPRI.GetSkiThrust(FamilyInfo, default.m_DefaultSkiJetParticle));
			Mesh.AttachComponentToSocket(m_FootThrusterPSCs[j], FamilyInfo.default.m_nmSkiThrusterEffectSockets[i]);
		}
	}
}

simulated function ClearSkiParticleEffects()
{
    local int i;

	for (i = m_FootThrusterPSCs.Length; i > 0; i-- )
	{
		m_FootThrusterPSCs.Remove(i-1, 1);
	}
}

simulated event PlaySkiEffects()
{
	local int i;

	// Create the particle effects.
	if (m_FootThrusterPSCs.Length == 0)
	{
		CreateSkiParticleEffects();
	}

	// Play the particle effects.
	for( i = 0; i < m_FootThrusterPSCs.Length; i++ )
	{
		m_FootThrusterPSCs[i].SetActive(true);
	}

	m_bIsPlayingSkiEffects = true;

	super.PlaySkiEffects();
}

simulated event StopSkiEffects()
{
	local int i;

	// Stop the particle effects.
	for( i = 0; i < m_FootThrusterPSCs.Length; i++ )
	{
		m_FootThrusterPSCs[i].SetActive(false);
	}

	m_bIsPlayingSkiEffects = false;

	super.StopSkiEffects();
}

simulated function CreateJetpackParticleEffects()
{
    local TrPlayerReplicationInfo TrPRI;
    local class<TrFamilyInfo> FamilyInfo;
    local int i, j;

    FamilyInfo = GetCurrCharClassInfo();
    TrPRI = GetTribesReplicationInfo();
	if (FamilyInfo == none || TrPRI == none)
	{
		return;
	}

    for( i = 0; i < TrPRI.GetJetpackSocketCount(FamilyInfo); i++ )
    {
        j = m_JetpackPSCs.Add(1);
        m_JetpackPSCs[j] = new(self) class'ParticleSystemComponent';
        m_JetpackPSCs[j].SetTemplate(TrPRI.GetJetpackThrust(FamilyInfo));
        Mesh.AttachComponentToSocket(m_JetpackPSCs[j], TrPRI.GetJetpackSocket(FamilyInfo, i));
    }

    for( i = 0; i < TrPRI.GetJetpackSocketCount(FamilyInfo); i++ )
    {
        j = m_JetpackRibbonPSCs.Add(1);
        m_JetpackRibbonPSCs[j] = new(self) class'ParticleSystemComponent';
        m_JetpackRibbonPSCs[j].SetTemplate(TrPRI.GetJetpackTrail(FamilyInfo));
        Mesh.AttachComponentToSocket(m_JetpackRibbonPSCs[j], TrPRI.GetJetpackSocket(FamilyInfo, i));
    }
}


simulated function ClearJetpackParticleEffects()
{
    local int i;

	for (i = m_JetpackPSCs.Length; i > 0; i-- )
	{
		m_JetpackPSCs.Remove(i-1, 1);
	}

	for (i = m_JetpackRibbonPSCs.Length; i > 0; i-- )
	{
		m_JetpackRibbonPSCs.Remove(i-1, 1);
	}
}

simulated event PlayJetpackEffects()
{
    local int i;

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
		if (m_AudioComponentJetpackLoop != none)
		{
			// Set up the sound to play if we already don't have one cached.
			if( m_AudioComponentJetpackLoop.SoundCue == None )
			{
				m_AudioComponentJetpackLoop.SoundCue = class<TrPawnSoundGroup>(SoundGroupClass).default.m_JetpackLoopSound;
			}

			// No panning if we are playing locally controlled.
			if( IsLocallyControlled() && IsHumanControlled() )
			{
				m_AudioComponentJetpackLoop.bAllowSpatialization = false;
				m_AudioComonentJetpackAttack.bAllowSpatialization = false;    
			}

			// Play sound effects.
			//m_AudioComonentJetpackAttack.FadeIn(0.05, 0.0);
			m_AudioComponentJetpackLoop.FadeIn(0.12, 1.0);
			m_AudioComponentJetpackLoop.SetFloatParameter('Pitch', 1.0);
			m_AudioComponentJetpackLoop.SetFloatParameter('Volume', 1.0);
		}

        if( !IsFirstPerson() )
        {
            // Set up the particle effects if we don't already have them attached.
            if( m_JetpackPSCs.Length == 0 || m_JetpackRibbonPSCs.Length == 0 )
            {
                CreateJetpackParticleEffects();
            }

            // Play the particle effects.
            for( i = 0; i < m_JetpackPSCs.Length; i++ )
            {
                m_JetpackPSCs[i].SetActive(TRUE);
            }
        }

		m_bIsJetEffectsPlaying = true;
    }
}

simulated event UpdateJetpackEffects()
{
	local int i;

    // Play the particle effects.
    for( i = 0; i < m_JetpackRibbonPSCs.Length; i++ )
    {
        m_JetpackRibbonPSCs[i].SetActive(Velocity.Z > m_fRibbonZVelocity);
    }
}

simulated event StopJetpackEffects()
{
    local int i;

    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        // Stop the sounds.
        m_fRemainingJetpackSoundFadeOutTime = m_fJetpackSoundFadeOutTime;

		if (m_AudioComponentJetpackLoop != none && m_AudioComponentJetpackLoop.IsPlaying() && m_AudioComponentJetpackLoop.FadeOutTargetVolume != 0.0f)
		{
			m_AudioComponentJetpackLoop.FadeOut(m_fJetpackSoundFadeOutTime, 0.0);
		}

        // Stop the particle effects.
        for( i = 0; i < m_JetpackPSCs.Length; i++ )
        {
            m_JetpackPSCs[i].SetActive(FALSE);
        }

        for( i = 0; i < m_JetpackRibbonPSCs.Length; i++ )
        {
            m_JetpackRibbonPSCs[i].SetActive(FALSE);
        }

		m_bIsJetEffectsPlaying = false;
    }
}

simulated function PlayReload(TR_EQUIP_POINT EquipPoint)
{
	local TrInventoryManager TrIM;
	local TrDevice TrD;
	local TrPlayerController TrPC;

	if (DrivenVehicle != none && DrivenVehicle.Weapon != none)
	{
		TrVehicleWeapon(DrivenVehicle.Weapon).OnClientReloaded();
	}
    else if( TrDeviceAttachment(CurrentWeaponAttachment) != None )
    {
        TrDeviceAttachment(CurrentWeaponAttachment).PlayReload();
    }

	if (DrivenVehicle == none && InvManager != none )
	{
		TrIM = TrInventoryManager(InvManager);
		TrD = TrIM.GetDeviceByEquipPoint(EquipPoint);
		if( TrD != none )
		{			
			TrD.OnClientReloaded();
			if( TrD.m_bEndZoomOnReload )
			{
				TrPC = TrPlayerController(Controller);
				if( TrPC != none )
				{
					TrPC.TrEndZoom();
				}
			}
		}
	}

		/*
	if (DrivenVehicle == none && InvManager != none && TrDevice(InvManager.PendingWeapon) != none )
	{
		TrDevice(InvManager.PendingWeapon).OnClientReloaded();
	}
    else if(DrivenVehicle == none &&  TrDevice(Weapon) != None )
    {
        TrDevice(Weapon).OnClientReloaded();
    }*/
}

simulated function Tick( float DeltaTime )
{
    Super.Tick(DeltaTime);

    if( Physics != PHYS_Flying && m_AudioComponentJetpackLoop != None && m_fRemainingJetpackSoundFadeOutTime > 0 && m_AudioComponentJetpackLoop.IsPlaying() )
    {
        m_fRemainingJetpackSoundFadeOutTime -= DeltaTime;

        m_AudioComponentJetpackLoop.SetFloatParameter('Pitch', m_fRemainingJetpackSoundFadeOutTime / m_fJetpackSoundFadeOutTime);
    }
}

simulated function bool CalcCamera( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
{
	// Handle the fixed camera

	if (bFixedView)
	{
		out_CamLoc = FixedViewLoc;
		out_CamRot = FixedViewRot;
	}
	else
	{
		if ( !IsFirstPerson() )	// Handle BehindView
		{
			CalcThirdPersonCam(fDeltaTime, out_CamLoc, out_CamRot, out_FOV);
		}
		else
		{
			if( CurrentCameraScale > 1.0 )
			{
				CalcThirdPersonCam(fDeltaTime, out_CamLoc, out_CamRot, out_FOV);
			}
			else
			{
				// By default, we view through the Pawn's eyes..
				GetActorEyesViewPoint( out_CamLoc, out_CamRot );
			}
		}

		if ( UTWeapon(Weapon) != none)
		{
			UTWeapon(Weapon).WeaponCalcCamera(fDeltaTime, out_CamLoc, out_CamRot);
		}
	}

	return true;
}

simulated function SetThirdPersonCamera(bool bNewBehindView)
{
	if ( bNewBehindView )
	{
		CameraScale = 9.0;
		CameraZOffset = GetCollisionHeight() + Mesh.Translation.Z;
		SetMeshVisibility(true);
		SuppressAnimNotifies(false);
	}
	else
	{
		CameraScale = 1.0;
		SuppressAnimNotifies(true);
	}
}

simulated function bool CalcThirdPersonCam( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
{
	local vector CamStart, HitLocation, HitNormal, CamDirX, CamDirY, CamDirZ, CurrentCamOffset;
	local float OldCameraScale;
	local TrPlayerController TrPC;

	ModifyRotForDebugFreeCam(out_CamRot);

	CamStart = Location;
	CurrentCamOffset = CamOffset;

	// For specific death cams.
	if (Controller != none && Controller.IsInState('Dead'))
	{
		if (DrivenVehicle != none && m_DeathCamFocus == none)
		{
			m_DeathCamFocus = UTVehicle(DrivenVehicle).DeathCameraGib;
		}

		if (m_DeathCamFocus != none)
		{
			CamStart = m_DeathCamFocus.Location;
		}
	}
	else if( Health <= 0.0 )
	{
		// Follow along the head bone.
		if( Mesh != none )
		{
			CamStart = Mesh.GetBoneLocation('Head');
		}
	}

	if( !IsLocallyControlled() && Mesh != none )
	{
		// We are someone looking at this pawn remotely so follow along the pelvis bone.
		if( Mesh != none )
		{
			CamStart = Mesh.GetBoneLocation('Pelvis');
		}
	}
		
	out_CamRot.Roll += m_CamRotOffset.Roll;
	out_CamRot.Yaw += m_CamRotOffset.Yaw;
	out_CamRot.Pitch += m_CamRotOffset.Pitch;

	// Add in any free cam offsets.
	TrPC = TrPlayerController(Controller);
	if( TrPC != none )
	{
		out_CamRot.Yaw += TrPC.m_fFreeCamYawOffset;
		out_CamRot.Pitch += TrPC.m_fFreeCamPitchOffset;
	}

	GetAxes(out_CamRot, CamDirX, CamDirY, CamDirZ);

	OldCameraScale = CurrentCameraScale;

	CamDirX *= CurrentCameraScale;

	if ( (Health <= 0) || bFeigningDeath )
	{
		// adjust camera position to make sure it's not clipping into world
		// @todo fixmesteve.  Note that you can still get clipping if FindSpot fails (happens rarely)
		FindSpot(GetCollisionExtent(),CamStart);
	}
	if (CurrentCameraScale < CameraScale)
	{
		//CurrentCameraScale = FMin(CameraScale, CurrentCameraScale + 5 * m_Cam3pZoomOutSpeed *fDeltaTime);
		CurrentCameraScale = FInterpTo(CurrentCameraScale, CameraScale, fDeltaTime, m_Cam3pZoomOutSpeed);
	}
	else if (CurrentCameraScale > CameraScale)
	{
		CurrentCameraScale = FMax(CameraScale, CurrentCameraScale - 5 * m_Cam3pZoomInSpeed*fDeltaTime);
	}
	if (CamDirX.Z > GetCollisionHeight())
	{
		CamDirX *= square(cos(out_CamRot.Pitch * 0.0000958738)); // 0.0000958738 = 2*PI/65536
	}
	out_CamLoc = (CamStart - CamDirX*CurrentCamOffset.X + CurrentCamOffset.Y*CamDirY + CurrentCamOffset.Z*CamDirZ);
	
	if( CurrentCameraScale == 1.0 && OldCameraScale > 1.0 )
	{
		// Camera is now completely zoomed in.
		SetMeshVisibility(false);
	}
	
	if (Trace(HitLocation, HitNormal, out_CamLoc, CamStart, false, vect(12,12,12)) != None)
	{
		out_CamLoc = HitLocation;
		return false;
	}
	return true;
}

simulated function bool CalcOtherWatchingCam( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV, TrPlayerController WatcherController )
{
	local vector CamStart, HitLocation, HitNormal, CamDirX, CamDirY, CamDirZ, CurrentCamOffset;

	// Location.
	CamStart = Mesh == none ? Location : Mesh.GetBoneLocation('Pelvis');
	CurrentCamOffset = WatcherController.m_vDeathCamOffset;
		
	// Rotation.
	out_CamRot.Roll += m_CamRotOffset.Roll;
	out_CamRot.Yaw += m_CamRotOffset.Yaw;
	out_CamRot.Pitch += m_CamRotOffset.Pitch;
	GetAxes(out_CamRot, CamDirX, CamDirY, CamDirZ);

	// Scale
	CamDirX *= WatcherController.m_fDeathCameraCurrentScale;

	// UT code sets LastCameraTimeStamp to 1.0s on initialization to force a refresh of the camera calculation. Don't 
	// interpolate when DeltaTime is 1.0s or else it will snap to the inner scale.
	if( WatcherController.m_fDeathCameraCurrentScale != WatcherController.m_fDeathCameraInnerScale && fDeltaTime != 1.0 ) 
	{
		// Zoom in to the inner scale.
		WatcherController.m_fDeathCameraCurrentScale = FInterpTo(WatcherController.m_fDeathCameraCurrentScale, WatcherController.m_fDeathCameraInnerScale, fDeltaTime, WatcherController.m_fDeathCameraInterpSpeed);
	}

	if (CamDirX.Z > GetCollisionHeight())
	{
		CamDirX *= square(cos(out_CamRot.Pitch * 0.0000958738)); // 0.0000958738 = 2*PI/65536
	}
	out_CamLoc = (CamStart - CamDirX*CurrentCamOffset.X + CurrentCamOffset.Y*CamDirY + CurrentCamOffset.Z*CamDirZ);
		
	if (Trace(HitLocation, HitNormal, out_CamLoc, CamStart, false, vect(12,12,12)) != None)
	{
		out_CamLoc = HitLocation;
		return false;
	}
	return true;
}

simulated function ClearMeshAnimSeqNodes()
{
	m_MeshAnimSequenceNodes.Length = 0;
}

simulated function CacheMeshAnimSeqNodes()
{
	local AnimNodeSequence SequenceNode;

	if( Mesh != none )
	{
		foreach Mesh.AllAnimNodes(class'AnimNodeSequence', SequenceNode)
		{
			m_MeshAnimSequenceNodes.AddItem(SequenceNode);
		}
	}
}

simulated function SuppressAnimNotifies(bool bSuppress)
{
	local int i;
	local Inventory Inv;
	local TrDevice TrD;

	for( i = 0; i < m_MeshAnimSequenceNodes.Length; i++ )
	{
		m_MeshAnimSequenceNodes[i].m_bSuppressNotifies = bSuppress;
	}

	if( InvManager == none )
	{
		return;
	}

	for( Inv=InvManager.InventoryChain; Inv!=None; Inv=Inv.Inventory )
	{
		TrD = TrDevice(Inv);
		if( TrD != none )
		{
			TrD.SuppressAnimNotifies(!bSuppress);
		}
	}
}

defaultproperties
{
   Begin Object Class=AudioComponent Name=JetpackAttackSound
      Name="JetpackAttackSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   m_AudioComonentJetpackAttack=JetpackAttackSound
   m_fJetpackSoundFadeOutTime=0.800000
   m_HardLandingParticles(0)=(MaterialType="Dirt")
   m_HardLandingParticles(1)=(MaterialType="Grass")
   m_HardLandingParticles(2)=(MaterialType="Snow")
   m_HardLandingParticles(3)=(MaterialType="Water")
   m_StepParticles(0)=(MaterialType="Dirt")
   m_StepParticles(1)=(MaterialType="Grass")
   m_StepParticles(2)=(MaterialType="Snow")
   m_StepParticles(3)=(MaterialType="Water")
   m_fRibbonZVelocity=75.000000
   m_Cam3pZoomOutSpeed=8.000000
   m_Cam3pZoomInSpeed=14.000000
   m_EyeHeightWalkingMinSmoothing=0.900000
   m_EyeHeightWalkingMultiplier=10.000000
   m_EyeHeightLandRecoveryMinSmoothing=0.900000
   m_EyeHeightLandRecoveryMultiplier=9.000000
   m_EyeHeightLandRecoveryMultiplier1=0.150000
   m_EyeHeightLandRecoveryMultiplier2=0.600000
   m_EyeHeightLandingMinSmoothing=0.650000
   m_EyeHeightLandingMultiplier=8.000000
   m_EyeHeightLandingMultiplier1=1.500000
   m_EyeHeightLandingMultiplier2=0.080000
   m_EyeHeightLandingMultiplier3=0.250000
   m_EyeHeightLandingMultiplier4=2.400000
   m_EyeHeightLandingMultiplier5=0.020000
   m_EyeHeightLandingSpeedSqThreshold=80000.000000
   m_EyeHeightLandingSpeedSqThresholdSkiing=80000.000000
   m_EyeHeightLandingSkiingMultiplier=0.040000
   m_EyeHeightLandingSkiingMultiplier2=0.020000
   m_JumpBob1=-1.500000
   m_JumpBob2=0.010000
   m_JumpBob3=100.000000
   m_JumpBob4=0.200000
   m_JumpBob5=0.200000
   m_BobFootstepMultiplier=9.750000
   m_WeaponBobMultiplier1=0.450000
   m_WeaponBobMultiplier2=0.550000
   BobTimeMultiplier=8.000000
   BobGroundSpeedMultiplier1=0.300000
   BobGroundSpeedMultiplier2=0.700000
   Begin Object Class=AudioComponent Name=SkiLoopSound
      bShouldRemainActiveIfDropped=True
      Name="SkiLoopSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   m_AudioComponentSkiLoop=SkiLoopSound
   Begin Object Class=AudioComponent Name=JetpackLoopSound
      bShouldRemainActiveIfDropped=True
      Name="JetpackLoopSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   m_AudioComponentJetpackLoop=JetpackLoopSound
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyMesh'
      FOV=90.000000
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPlayerPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Translation=(X=0.000000,Y=0.000000,Z=-52.000000)
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonBodyMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyMesh'
   End Object
   m_FirstPersonBodyMesh=FirstPersonBodyMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyOverlayMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyOverlayMesh'
      bUpdateSkelWhenNotRendered=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      TickGroup=TG_PostAsyncWork
      Name="FirstPersonBodyOverlayMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyOverlayMesh'
   End Object
   m_FirstPersonBodyOverlayMesh=FirstPersonBodyOverlayMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonBodyShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPlayerPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonBodyShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonBodyShadowMesh'
   End Object
   m_FirstPersonBodyShadowMesh=FirstPersonBodyShadowMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonWeaponShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonWeaponShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPlayerPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      BoundsScale=5.000000
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonWeaponShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonWeaponShadowMesh'
   End Object
   m_FirstPersonWeaponShadowMesh=FirstPersonWeaponShadowMesh
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonFlagShadowMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonFlagShadowMesh'
      FOV=90.000000
      bSyncActorLocationToRootRigidBody=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPlayerPawn:MyLightEnvironment'
      MotionBlurScale=0.000000
      HiddenGame=True
      bOnlyOwnerSee=True
      bCastHiddenShadow=True
      bAllowAmbientOcclusion=False
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonFlagShadowMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonFlagShadowMesh'
   End Object
   m_FirstPersonFlagShadowMesh=FirstPersonFlagShadowMesh
   m_SkiParticles(0)=(MaterialType="Dirt")
   m_SkiParticles(1)=(MaterialType="Grass")
   m_SkiParticles(2)=(MaterialType="Snow")
   m_SkiParticles(3)=(MaterialType="Water")
   Begin Object Class=UTParticleSystemComponent Name=SkiDust Archetype=UTParticleSystemComponent'TribesGame.Default__TrPawn:SkiDust'
      bAutoActivate=False
      ReplacementPrimitive=None
      AbsoluteTranslation=True
      AbsoluteRotation=True
      Name="SkiDust"
      ObjectArchetype=UTParticleSystemComponent'TribesGame.Default__TrPawn:SkiDust'
   End Object
   m_GroundSkiPSC=SkiDust
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
      bUseBooleanEnvironmentShadowing=False
      bSynthesizeSHLight=True
      bIsCharacterLightEnvironment=True
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrPawn:MyLightEnvironment'
   End Object
   LightEnvironment=MyLightEnvironment
   FallingDamageWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPlayerPawn:ForceFeedbackWaveformFall'
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent Archetype=UTAmbientSoundComponent'TribesGame.Default__TrPawn:AmbientSoundComponent'
      Name="AmbientSoundComponent"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrPawn:AmbientSoundComponent'
   End Object
   PawnAmbientSound=AmbientSoundComponent
   Begin Object Class=UTAmbientSoundComponent Name=AmbientSoundComponent2 Archetype=UTAmbientSoundComponent'TribesGame.Default__TrPawn:AmbientSoundComponent2'
      Name="AmbientSoundComponent2"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrPawn:AmbientSoundComponent2'
   End Object
   WeaponAmbientSound=AmbientSoundComponent2
   Begin Object Class=SkeletalMeshComponent Name=OverlayMeshComponent0 Archetype=SkeletalMeshComponent'TribesGame.Default__TrPawn:OverlayMeshComponent0'
      bShouldIgnoreParentAnimComponent=True
      bUpdateSkelWhenNotRendered=False
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      bOwnerNoSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      TickGroup=TG_PostAsyncWork
      Name="OverlayMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrPawn:OverlayMeshComponent0'
   End Object
   OverlayMesh=OverlayMeshComponent0
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonArms'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceA Archetype=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms.MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms.MeshSequenceA'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'TribesGame.Default__TrPlayerPawn:FirstPersonArms.MeshSequenceA'
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      AbsoluteRotation=True
      AbsoluteScale=True
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonArms"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonArms'
   End Object
   ArmsMesh(0)=FirstPersonArms
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonArms2 Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonArms2'
      Begin Object Class=AnimNodeSequence Name=MeshSequenceB Archetype=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms2.MeshSequenceB'
         Name="MeshSequenceB"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrPawn:FirstPersonArms2.MeshSequenceB'
      End Object
      FOV=55.000000
      Animations=AnimNodeSequence'TribesGame.Default__TrPlayerPawn:FirstPersonArms2.MeshSequenceB'
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bSyncActorLocationToRootRigidBody=False
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      HiddenGame=True
      bOnlyOwnerSee=True
      CastShadow=False
      bAllowAmbientOcclusion=False
      AbsoluteRotation=True
      AbsoluteScale=True
      Scale3D=(X=1.000000,Y=-1.000000,Z=1.000000)
      TickGroup=TG_DuringAsyncWork
      Name="FirstPersonArms2"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrPawn:FirstPersonArms2'
   End Object
   ArmsMesh(1)=FirstPersonArms2
   Begin Object Class=SkeletalMeshComponent Name=WPawnSkeletalMeshComponent Archetype=SkeletalMeshComponent'TribesGame.Default__TrPawn:WPawnSkeletalMeshComponent'
      MinDistFactorForKinematicUpdate=0.200000
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bHasPhysicsAssetInstance=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      bChartDistanceFactor=True
      bCacheAnimSequenceNodes=False
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrPlayerPawn:MyLightEnvironment'
      RBChannel=RBCC_Untitled3
      RBDominanceGroup=20
      MotionBlurScale=0.000000
      bOwnerNoSee=True
      bUsesPlayerShadowFadeResolution=True
      bUseOnePassLightingOnTranslucency=True
      bAllowAmbientOcclusion=False
      BlockRigidBody=True
      RBCollideWithChannels=(Untitled3=True)
      Translation=(X=0.000000,Y=0.000000,Z=8.000000)
      Scale=1.075000
      Name="WPawnSkeletalMeshComponent"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrPawn:WPawnSkeletalMeshComponent'
   End Object
   Mesh=WPawnSkeletalMeshComponent
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'TribesGame.Default__TrPawn:CollisionCylinder'
      CollisionHeight=2.000000
      CollisionRadius=2.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockActors=True
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'TribesGame.Default__TrPawn:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   Begin Object Class=ArrowComponent Name=Arrow Archetype=ArrowComponent'TribesGame.Default__TrPawn:Arrow'
      ArrowColor=(B=255,G=200,R=150,A=255)
      bTreatAsASprite=True
      ReplacementPrimitive=None
      Name="Arrow"
      ObjectArchetype=ArrowComponent'TribesGame.Default__TrPawn:Arrow'
   End Object
   Components(1)=Arrow
   Components(2)=MyLightEnvironment
   Components(3)=WPawnSkeletalMeshComponent
   Components(4)=AmbientSoundComponent
   Components(5)=AmbientSoundComponent2
   Components(6)=SkiDust
   Components(7)=WPawnSkeletalMeshComponent
   Components(8)=JetpackLoopSound
   Components(9)=JetpackAttackSound
   Components(10)=SkiLoopSound
   CollisionComponent=CollisionCylinder
   Name="Default__TrPlayerPawn"
   ObjectArchetype=TrPawn'TribesGame.Default__TrPawn'
}
