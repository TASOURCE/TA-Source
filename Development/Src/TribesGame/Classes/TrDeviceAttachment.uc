/**
 * InHand weapon device attachment, define the visual, replicated to all clients
 */
class TrDeviceAttachment extends UTWeaponAttachment
	abstract
	dependson(TrPawn)
    dependson(TrObject);

/** Aim offset anim node profiles. */
var name m_nmLightMedAimProfileName;
var name m_nmHeavyAimProfileName;

/** Does this device support tracers? */
var() bool m_bSpawnTracers;

/** Does this device support tracer beams? */
var() bool m_bSpawnTracerBeams;

/** Device will spawn this particle system along the fired direction. */
var() ParticleSystem m_TracerBeamTemplate;

/** Determines which tracer type to use for this weapon */
var() EWeaponTracerType m_TracerType;

/** Min distance between fire location and hit location for drawing a tracer. */
var() float m_fShowTracerDistance;

/** 3p pawn animsets. */
var array<AnimSet> m_LightMed3pPawnAnimSets;
var array<AnimSet> m_Heavy3pPawnAnimSets;

/** Should we scale the fire animations based on the FireInterval? */
var() bool m_bScaleFireAnimRate;

/** What is this? */
var array<EffectFormOverwrite>  m_EffectFormOverwrite;

/** Name of the fire animation to play when owner is riding as a passenger (this sequence is found in the vehicle's
 *  Animation set rather than pulled from the device's set. */
var name m_nmRidingAsPassengerFireAnimName;

/** Weapon loop for Constant Fire devices. */
var(Sounds) AudioComponent m_AudioComponentWeaponLoop;

/**
 * Called on a client, this function Attaches the WeaponAttachment
 * to the Mesh.
 */
simulated function AttachTo(UTPawn OwnerPawn)
{
    local TrPlayerPawn TrP;
    local class<TrDevice> TrDeviceClass;
	local TrDevice_AutoFire PreviousAutoFireDevice;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float WeaponSwitchBuff;

    Super.AttachTo(OwnerPawn);

	if( MuzzleFlashPSC != none )
	{
		// Because artists want to use bUseLocalSpace on some emitters, make sure the component
		// gets ticked after the transforms (or else the emitter may spawn at an incorrect location).
		MuzzleFlashPSC.SetTickGroup(TG_PostUpdateWork);
	}

    TrDeviceClass = class<TrDevice>(WeaponClass);

    TrP = TrPlayerPawn(OwnerPawn);
	
	InitAnims(TrP);

	// Fire alternates.
	if( TrP.m_3pDeviceAnimNode != none && TrP.Mesh != none && TrP.m_3pDeviceAnimNode.m_SkiingFireName != '' )
	{
		if( TrP.Mesh.FindAnimSequence(TrP.m_3pDeviceAnimNode.m_SkiingFireName) != none )
		{
			if (TrP.m_3pDeviceAnimNode != none) TrP.m_3pDeviceAnimNode.m_bCurrentDeviceSupportsAltSkiFireAnims = true;
			if (TrP.m_1pBodyMeshDeviceAnimNode != none) TrP.m_1pBodyMeshDeviceAnimNode.m_bCurrentDeviceSupportsAltSkiFireAnims = true;
		}
		else
		{
			if (TrP.m_3pDeviceAnimNode != none) TrP.m_3pDeviceAnimNode.m_bCurrentDeviceSupportsAltSkiFireAnims = false;
			if (TrP.m_1pBodyMeshDeviceAnimNode != none) TrP.m_1pBodyMeshDeviceAnimNode.m_bCurrentDeviceSupportsAltSkiFireAnims = false;
		}
	}

	// Reload alternates.
	if( TrP.m_3pDeviceAnimNode != none && TrP.Mesh != none && TrP.m_3pDeviceAnimNode.m_SkiingReloadName != '' )
	{
		if( TrP.Mesh.FindAnimSequence(TrP.m_3pDeviceAnimNode.m_SkiingReloadName) != none )
		{
			if (TrP.m_3pDeviceAnimNode != none) TrP.m_3pDeviceAnimNode.m_bCurrentDeviceSupportsAltSkiReloadAnims = true;
			if (TrP.m_1pBodyMeshDeviceAnimNode != none) TrP.m_1pBodyMeshDeviceAnimNode.m_bCurrentDeviceSupportsAltSkiReloadAnims = true;
		}
		else
		{
			TrP.m_3pDeviceAnimNode.m_bCurrentDeviceSupportsAltSkiReloadAnims = false;
			if (TrP.m_1pBodyMeshDeviceAnimNode != none) TrP.m_1pBodyMeshDeviceAnimNode.m_bCurrentDeviceSupportsAltSkiReloadAnims = false;
		}
	}

	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				// Weapon switch skill/perk.
				WeaponSwitchBuff = VM.m_fWeaponSwitchPctBuff;
			}
		}
	}

    // Play retrieve anim.
    if( TrP != None )
    {
		if (TrP.InvManager != none)
		{
			PreviousAutoFireDevice = TrDevice_AutoFire(TrInventoryManager(TrP.InvManager).PreviousWeapon);
		}

        if( ClassIsChildOf(TrDeviceClass, class'TrDevice_AutoFire') )
        {
            // Remote client, skip retrieve anim and go straight to fire.
            ThirdPersonFireEffects(vect(0,0,0));

			if (TrDeviceClass != class'TrDevice_NinjaSmoke')
			{
				TrP.PulseStealth(true);
			}
        }
        else if (PreviousAutoFireDevice == none && TrP.m_3pDeviceAnimNode != None)
        {
			if (TrP.m_3pDeviceAnimNode != none) TrP.m_3pDeviceAnimNode.PlayRetrieve(TrDeviceClass.default.EquipTime, WeaponSwitchBuff);

			if( TrP.m_1pBodyMeshDeviceAnimNode != none ) TrP.m_1pBodyMeshDeviceAnimNode.PlayRetrieve(TrDeviceClass.default.EquipTime, WeaponSwitchBuff);
        }

    }

	// Draw the shadow if in first person mode.
	if( TrP != none && AttachmentSocket != '' && Mesh != none && Mesh.SkeletalMesh != none && TrP.IsLocallyControlled() && TrP.m_FirstPersonWeaponShadowMesh != none && TrP.m_FirstPersonBodyMesh != none )
	{
		TrP.m_FirstPersonWeaponShadowMesh.SetSkeletalMesh(Mesh.SkeletalMesh);
		TrP.m_FirstPersonWeaponShadowMesh.SetPhysicsAsset(Mesh.PhysicsAsset);
		
		if( !TrP.m_FirstPersonWeaponShadowMesh.bAttached )
		{
			TrP.m_FirstPersonBodyMesh.AttachComponentToSocket(TrP.m_FirstPersonWeaponShadowMesh, AttachmentSocket);
		}
	}

    // Set up overlay.
    CreateOverlayMesh();
}

simulated function InitAnims(TrPawn TrP)
{
    local class<TrFamilyInfo> FamilyInfoClass;
    local int i;
	local name AimOffsetProfileName;

	if( TrP != None )
    {
        FamilyInfoClass = TrP.GetCurrCharClassInfo();

        if( TrP.Mesh != None && TrP.m_RidingPassengerBlendNode == none ) // Don't attach 3p anims if riding as a passenger.
        {
            // Add 3p pawn anims to the pawn owner.
            if( ClassIsChildOf(FamilyInfoClass, class'TrFamilyInfo_Heavy') && m_Heavy3pPawnAnimSets.Length > 0 )
            {
                for( i = 0; i < m_Heavy3pPawnAnimSets.Length; i++ )
                {
					if( TrP.Mesh.AnimSets.Find(m_Heavy3pPawnAnimSets[i]) == INDEX_NONE )
					{
						TrP.Mesh.AnimSets.AddItem(m_Heavy3pPawnAnimSets[i]);
					}
                }
            }
            else if( (ClassIsChildOf(FamilyInfoClass, class'TrFamilyInfo_Light') || ClassIsChildOf(FamilyInfoClass, class'TrFamilyInfo_Medium')) && m_LightMed3pPawnAnimSets.Length > 0 )
            {
                for( i = 0; i < m_LightMed3pPawnAnimSets.Length; i++ )
                {
					if( TrP.Mesh.AnimSets.Find(m_LightMed3pPawnAnimSets[i]) == INDEX_NONE )
					{
						TrP.Mesh.AnimSets.AddItem(m_LightMed3pPawnAnimSets[i]);
					}
                }
            }

            TrP.Mesh.UpdateAnimations();

			AimOffsetProfileName = FamilyInfoClass == class'TrFamilyInfo_Heavy' ? m_nmHeavyAimProfileName : m_nmLightMedAimProfileName;
			if( TrP.m_AimOffsetNode != None )
			{
				// This is how the pawn will handle aim animation when holding this weapon.
				TrP.m_AimOffsetNode.SetActiveProfileByName(AimOffsetProfileName);
			}

			// Send animdata to the 1p body mesh.
			if( TrP.IsLocallyControlled() && TrP.m_FirstPersonBodyMesh != none )
			{
				TrP.m_FirstPersonBodyMesh.AnimSets.Remove(0,TrP.m_FirstPersonBodyMesh.AnimSets.Length);
				for( i = 0; i < TrP.Mesh.AnimSets.Length; i++ )
				{
					TrP.m_FirstPersonBodyMesh.AnimSets.AddItem(TrP.Mesh.AnimSets[i]);
				}
				TrP.m_FirstPersonBodyMesh.UpdateAnimations();

				if( TrP.m_1pBodyAimOffsetNode != none )
				{
					TrP.m_1pBodyAimOffsetNode.SetActiveProfileByName(AimOffsetProfileName);
				}
			}
        }
    }
}

/**
 * Detach weapon from skeletal mesh
 */
simulated function DetachFrom( SkeletalMeshComponent MeshCpnt )
{
    local TrPlayerPawn TrP;
    local class<TrFamilyInfo> FamilyInfoClass;
    local int i;

    Super.DetachFrom(MeshCpnt);

    TrP = TrPlayerPawn(Instigator);
    if( TrP != None )
    {
        FamilyInfoClass = TrP.GetCurrCharClassInfo();

        if( TrP.Mesh != None )
        {
            // Add 3p pawn anims to the pawn owner.
            if( ClassIsChildOf(FamilyInfoClass, class'TrFamilyInfo_Heavy') && m_Heavy3pPawnAnimSets.Length > 0 )
            {
                for( i = 0; i < m_Heavy3pPawnAnimSets.Length; i++ )
                {
                    TrP.Mesh.AnimSets.RemoveItem(m_Heavy3pPawnAnimSets[i]);
                }
            }
            else if( (ClassIsChildOf(FamilyInfoClass, class'TrFamilyInfo_Light') || ClassIsChildOf(FamilyInfoClass, class'TrFamilyInfo_Medium')) && m_LightMed3pPawnAnimSets.Length > 0 )
            {
                for( i = 0; i < m_LightMed3pPawnAnimSets.Length; i++ )
                {
                    TrP.Mesh.AnimSets.RemoveItem(m_LightMed3pPawnAnimSets[i]);
                }
            }

            TrP.Mesh.UpdateAnimations();
        } 
    }
}

simulated function SetPuttingDownWeapon(bool bNowPuttingDown)
{
    local TrPlayerPawn TrP;
	local class<TrDevice> TrDeviceClass;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float WeaponSwitchBuff;

    TrP = TrPlayerPawn(Owner);
	TrDeviceClass = class<TrDevice>(WeaponClass);

	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				// Weapon switch skill/perk.
				WeaponSwitchBuff = VM.m_fWeaponSwitchPctBuff;
			}
		}
	}

    // Play putaway animation.
    if( bNowPuttingDown && TrP != None && TrP.m_3pDeviceAnimNode != None )
    {
        TrP.m_3pDeviceAnimNode.PlayPutaway(TrDeviceClass.default.PutDownTime, WeaponSwitchBuff);

		if( TrP.m_1pBodyMeshDeviceAnimNode != none )
		{
			TrP.m_1pBodyMeshDeviceAnimNode.PlayPutaway(TrDeviceClass.default.PutDownTime, WeaponSwitchBuff);
		}
    }
}

simulated function bool ShouldFireTracer()
{
    local class<TrDevice> TrDeviceClass;

    TrDeviceClass = class<TrDevice>(WeaponClass);
    return (m_bSpawnTracers) && (TrDeviceClass.default.WeaponFireTypes[Pawn(Owner).FiringMode] != EWFT_Projectile);
}

simulated function bool ShouldFireTracerBeam()
{
    local class<TrDevice> TrDeviceClass;

    TrDeviceClass = class<TrDevice>(WeaponClass);
    return (m_bSpawnTracerBeams) && (m_TracerBeamTemplate != None) && (TrDeviceClass.default.WeaponFireTypes[Pawn(Owner).FiringMode] != EWFT_Projectile);
}

simulated function ThirdPersonFireEffects(vector HitLocation)
{
    local TrPlayerPawn TrP;
    local class<TrDevice> TrDeviceClass;
	local SoundCue SC;
	local TrPlayerReplicationInfo TrPRI;

    Super.ThirdPersonFireEffects(HitLocation);

    TrP = TrPlayerPawn(Owner);
    TrDeviceClass = class<TrDevice>(WeaponClass);
	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
	}

    // Play fire animation.
    if( TrP != None && TrPRI != none )//&& !ClassIsChildOf(TrDeviceClass, class'TrDevice_ConstantFire') ) // Don't play for looping, constant fire devices.
    {
		if( TrP.m_3pDeviceAnimNode != None )
		{
			// If !m_bScaleFireAnimRate, set the play rate to 0.0 so that the node knows not to scale the fire rate.
			TrP.m_3pDeviceAnimNode.PlayFire(m_bScaleFireAnimRate ? TrDeviceClass.default.FireInterval[0] : 0.0);
		}
		if( TrP.m_RidingPassengerBlendNode != none )
		{
			TrP.m_RidingPassengerBlendNode.PlayFire(m_bScaleFireAnimRate ? TrDeviceClass.default.FireInterval[0] : 0.0, m_nmRidingAsPassengerFireAnimName, TrDeviceClass.static.GetReloadTime(TrP.PlayerReplicationInfo, TrPRI.GetEquipPointByWeaponId(TrDeviceClass.default.DBWeaponId)));
		}
	}

    // Spawn a tracer.
    if( ShouldFireTracer() )
    {
        SpawnTracerEffect( HitLocation, VSize(HitLocation - Owner.Location) );
    }

    // Spawn a tracer beam.
    if( ShouldFireTracerBeam() )
    {
        SpawnTracerBeam(GetEffectLocation(), HitLocation);
    }

	// If this is a constant fire device, begin the sound loop.
	if( !TrP.IsLocallyControlled() && ClassIsChildOf(TrDeviceClass, class'TrDevice_ConstantFire') )
	{
		SC = class<TrDevice_ConstantFire>(TrDeviceClass).default.m_AudioComponentWeaponLoop.SoundCue;

		if( SC != none && ( !m_AudioComponentWeaponLoop.IsPlaying() || m_AudioComponentWeaponLoop.FadeOutTargetVolume == 0.0 ) )
		{
			m_AudioComponentWeaponLoop.SoundCue = SC;
			m_AudioComponentWeaponLoop.FadeIn(0.1, 1.0);
		}
	}
}

simulated event StopThirdPersonFireEffects()
{
	if( m_AudioComponentWeaponLoop != none && m_AudioComponentWeaponLoop.SoundCue != none )
	{
		m_AudioComponentWeaponLoop.FadeOut(0.1, 0.0);
	}
}

simulated function FirstPersonFireEffects(Weapon PawnWeapon, vector HitLocation)
{
	local TrPlayerPawn TrP;
    local class<TrDevice> TrDeviceClass;

	super.FirstPersonFireEffects(PawnWeapon, HitLocation);

	TrP = TrPlayerPawn(Owner);
    TrDeviceClass = class<TrDevice>(WeaponClass);
	
	if( TrP.m_1pBodyMeshDeviceAnimNode != none && !ClassIsChildOf(TrDeviceClass, class'TrDevice_ConstantFire') ) // Don't play for looping, constant fire devices.
	{
		TrP.m_1pBodyMeshDeviceAnimNode.PlayFire(m_bScaleFireAnimRate ? TrDeviceClass.default.FireInterval[0] : 0.0);
	}
}

simulated function SpawnTracerBeam(vector Start, vector End)
{
	local ParticleSystemComponent E;

	E = WorldInfo.MyEmitterPool.SpawnEmitter(m_TracerBeamTemplate, Start);
	E.SetVectorParameter('TracerEnd', End);
    E.SetDepthPriorityGroup(SDPG_World);
	E.SetTickGroup(TG_PostUpdateWork);
}

simulated function TrProj_Tracer SpawnTracerEffect( vector HitLocation, float HitDistance )
{
    local TrProj_Tracer	SpawnedProjectile;
    local vector SpawnLoc;
    local rotator SpawnRot;
 
    if( HitDistance > m_fShowTracerDistance )
    {
	    SpawnLoc = GetEffectLocation();
	    SpawnedProjectile = GetTracer( SpawnLoc, SpawnRot );

	    if ( (SpawnedProjectile != None) && !SpawnedProjectile.bDeleteMe )
	    {
		    SpawnedProjectile.Instigator = Pawn(Owner);

		    // init!
		    SpawnedProjectile.InitTracer(SpawnLoc, HitLocation);
	    }
    }

    return SpawnedProjectile;
}

simulated function TrProj_Tracer GetTracer( vector SpawnLocation, rotator SpawnRotation )
{
	return TrGameReplicationInfo(WorldInfo.GRI).m_TrObjectPool.GetTracer( m_TracerType, 0, SpawnLocation, SpawnRotation );
}

simulated function PlayReload()
{
    local TrPlayerPawn TrP;
    local class<TrDevice> TrDeviceClass;
	local float ReloadTime;
	local TrPlayerReplicationInfo TrPRI;

    TrDeviceClass = class<TrDevice>(WeaponClass);
    TrP = TrPlayerPawn(Owner);

	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
	}

	// Fetch the reload time.
	ReloadTime = TrDeviceClass.default.m_fReloadTime;
    
    // Play reload animation.
    if( TrP != None && TrPRI != none )
    {
		ReloadTime = TrDeviceClass.static.GetReloadTime(TrP.PlayerReplicationInfo, TrPRI.GetEquipPointByWeaponId(TrDeviceClass.default.DBWeaponId));

		if( TrP.m_3pDeviceAnimNode != None )
		{
			TrP.m_3pDeviceAnimNode.PlayReload(ReloadTime);
		}
		if( TrP.m_RidingPassengerBlendNode != none )
		{
			TrP.m_RidingPassengerBlendNode.PlayReload(ReloadTime);
		}
		if( TrP.m_1pBodyMeshDeviceAnimNode != none )
		{
			TrP.m_1pBodyMeshDeviceAnimNode.PlayReload(ReloadTime);
		}
    }
}

/**
 * Spawn any effects that occur at the impact point.  It's called from the pawn.
 */
simulated function PlayImpactEffects(vector HitLocation)
{
	local vector NewHitLoc, HitNormal, FireDir, WaterHitNormal;
	local Actor HitActor;
	local TraceHitInfo HitInfo;
	local MaterialImpactEffect ImpactEffect;
	local MaterialInterface MI;
	local MaterialInstanceTimeVarying MITV_Decal;
	local int DecalMaterialsLength;
	local Vehicle V;
	local TrPawn P;
	local ImpactInfo Impact;
	local TrPawn TrHitActor;

	P = TrPawn(Owner);
	HitNormal = Normal(Owner.Location - HitLocation);
	FireDir = -1 * HitNormal;
	if ( (P != None) && EffectIsRelevant(HitLocation, false, MaxImpactEffectDistance) )
	{
		if ( bMakeSplash && !WorldInfo.bDropDetail && P.IsPlayerPawn() && P.IsLocallyControlled() )
		{
			HitActor = Trace(NewHitLoc, WaterHitNormal, HitLocation, P.Location+P.eyeheight*vect(0,0,1), true,, HitInfo, TRACEFLAG_PhysicsVolumes | TRACEFLAG_Bullet);
			if ( UTWaterVolume(HitActor) != None )
			{
				//$$AF WorldInfo.MyEmitterPool.SpawnEmitter(ParticleSystem'Envy_Effects.Particles.P_WP_Water_Splash_Small', NewHitLoc, rotator(vect(0,0,1)));
			}
		}
		HitActor = Trace(NewHitLoc, HitNormal, (HitLocation - (HitNormal * 32)), HitLocation + (HitNormal * 32), true,, HitInfo, TRACEFLAG_Bullet);
		if(Pawn(HitActor) != none)
		{
			CheckHitInfo(HitInfo, Pawn(HitActor).Mesh, -HitNormal, NewHitLoc);

			TrHitActor = TrPlayerPawn(HitActor);
			if( TrHitActor != none )
			{
				Impact.RayDir = HitNormal;
				Impact.HitLocation = HitLocation;

				if (TrHitActor.CheckHeadShot(Impact))
					HitInfo.PhysMaterial = PhysicalMaterial'physmat_tgphysicalmaterials.PM_PawnHead';
				else
					HitInfo.PhysMaterial = PhysicalMaterial'physmat_tgphysicalmaterials.PM_Pawn';
			}
		}
		SetImpactedActor(HitActor, HitLocation, HitNormal, HitInfo);
		// figure out the impact sound to use
		ImpactEffect = GetImpactEffect(HitInfo.PhysMaterial);
		V = Vehicle(HitActor);
		PlayImpactSound(HitActor, ImpactEffect.Sound, FireDir, HitLocation);

		if ( UTVehicle(V) != none && Role < ROLE_Authority && !WorldInfo.GRI.OnSameTeam(Owner,V) )
		{
			UTVehicle(V).ApplyMorphDamage(HitLocation, WeaponClass.Default.InstantHitDamage[TrPawn(Owner).FiringMode], WeaponClass.Default.InstantHitMomentum[TrPawn(Owner).FiringMode]*FireDir);
		}

		// Pawns handle their own hit effects
		if ( HitActor != None &&
			 (Pawn(HitActor) == None || Vehicle(HitActor) != None) &&
			 AllowImpactEffects(HitActor, HitLocation, HitNormal) )
		{
			// this code is mostly duplicated in:  UTGib, UTProjectile, UTVehicle, UTWeaponAttachment be aware when updating
			if ( !WorldInfo.bDropDetail
				&& (Pawn(HitActor) == None)
				&& (VSizeSQ(Owner.Location - HitLocation) < MaxDecalRangeSq)
				&& (((WorldInfo.GetDetailMode() != DM_Low) && !class'Engine'.static.IsSplitScreen()) || (P.IsLocallyControlled() && P.IsHumanControlled())) )
			{
				// if we have a decal to spawn on impact
				DecalMaterialsLength = ImpactEffect.DecalMaterials.length;
				if( DecalMaterialsLength > 0 )
				{
					MI = ImpactEffect.DecalMaterials[Rand(DecalMaterialsLength)];
					if( MI != None )
					{
						if( MaterialInstanceTimeVarying(MI) != none )
						{
							// hack, since they don't show up on terrain anyway
							if ( Terrain(HitActor) == None )
							{
								MITV_Decal = new(self) class'MaterialInstanceTimeVarying';
								MITV_Decal.SetParent( MI );

								WorldInfo.MyDecalManager.SpawnDecal( MITV_Decal, HitLocation, rotator(-HitNormal), ImpactEffect.DecalWidth,
									ImpactEffect.DecalHeight, 10.0, false,, HitInfo.HitComponent, true, false, HitInfo.BoneName, HitInfo.Item, HitInfo.LevelIndex );
								//here we need to see if we are an MITV and then set the burn out times to occur
								MITV_Decal.SetScalarStartTime( ImpactEffect.DecalDissolveParamName, ImpactEffect.DurationOfDecal );
							}
						}
						else
						{
							WorldInfo.MyDecalManager.SpawnDecal( MI, HitLocation, rotator(-HitNormal), ImpactEffect.DecalWidth,
								ImpactEffect.DecalHeight, 10.0, false,, HitInfo.HitComponent, true, false, HitInfo.BoneName, HitInfo.Item, HitInfo.LevelIndex );
						}
					}
				}
			}

			if (ImpactEffect.ParticleTemplate != None)
			{
				if (!bAlignToSurfaceNormal)
				{
					HitNormal = normal(FireDir - ( 2 *  HitNormal * (FireDir dot HitNormal) ) ) ;
				}
				WorldInfo.MyEmitterPool.SpawnEmitter(ImpactEffect.ParticleTemplate, HitLocation, rotator(HitNormal), HitActor);
			}
		}
	}
	else if ( BulletWhip != None )
	{
		CheckBulletWhip(FireDir, HitLocation);
	}
}

simulated function PlayImpactSound(Actor HitActor, SoundCue SoundToPlay, vector FireDir, vector HitLocation )
{
	local TrVehicle V;

	V = TrVehicle(HitActor);

	if (SoundToPlay != None && !bSuppressSounds)
	{
		// if hit a vehicle controlled by the local player, always play it full volume
		if (V != None && V.IsLocallyControlled() && V.IsHumanControlled())
		{
			PlayerController(V.Controller).ClientPlaySound(SoundToPlay);
		}
		else
		{
			if ( BulletWhip != None )
			{
				CheckBulletWhip(FireDir, HitLocation);
			}
			PlaySound(SoundToPlay, true,,, HitLocation);
		}
	}
}

/** returns the impact sound that should be used for hits on the given physical material */
simulated function MaterialImpactEffect GetImpactEffect(PhysicalMaterial HitMaterial)
{
	local int i;
	local TrPhysicalMaterialProperty PhysicalProperty;

	if (HitMaterial != None)
	{
		PhysicalProperty = TrPhysicalMaterialProperty(HitMaterial.GetPhysicalMaterialProperty(class'TrPhysicalMaterialProperty'));
	}
	if (UTPawn(Owner).FiringMode > 0)
	{
		if (PhysicalProperty != None && PhysicalProperty.MaterialType != 'None')
		{
			i = AltImpactEffects.Find('MaterialType', PhysicalProperty.MaterialType);
			if (i != -1)
			{
				return default.AltImpactEffects[i];
			}
		}
		return default.DefaultAltImpactEffect;
	}
	else
	{
		if (PhysicalProperty != None && PhysicalProperty.MaterialType != 'None')
		{
			i = ImpactEffects.Find('MaterialType', PhysicalProperty.MaterialType);
			if (i != -1)
			{
				return default.ImpactEffects[i];
			}
		}
		return default.DefaultImpactEffect;
	}
}

defaultproperties
{
   m_nmLightMedAimProfileName="LightMed_SMG"
   m_nmHeavyAimProfileName="Heavy_SMG"
   m_bScaleFireAnimRate=True
   m_fShowTracerDistance=512.000000
   m_nmRidingAsPassengerFireAnimName="ADD_Fire"
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'UTGame.Default__UTAmbientSoundComponent'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'UTGame.Default__UTWeaponAttachment:SkeletalMeshComponent0'
      Begin Object Class=UTAnimNodeSequence Name=MeshSequenceA Archetype=UTAnimNodeSequence'UTGame.Default__UTWeaponAttachment:MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=UTAnimNodeSequence'UTGame.Default__UTWeaponAttachment:MeshSequenceA'
      End Object
      Animations=UTAnimNodeSequence'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0.MeshSequenceA'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      MaxDrawDistance=4000.000000
      CachedMaxDrawDistance=4000.000000
      MotionBlurScale=0.000000
      bAllowAmbientOcclusion=False
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTWeaponAttachment:SkeletalMeshComponent0'
   End Object
   Mesh=SkeletalMeshComponent0
   MuzzleFlashLightClass=Class'TribesGame.TrNeutralMuzzleFlashLight'
   Components(0)=WeaponLoopSound
   Name="Default__TrDeviceAttachment"
   ObjectArchetype=UTWeaponAttachment'UTGame.Default__UTWeaponAttachment'
}
