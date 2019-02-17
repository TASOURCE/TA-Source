class TrDevice_Melee extends TrDevice_AutoFire
	abstract;

struct MeleeRandomAnimation
{
	var name        FireAnimName;
	var CameraAnim  FireCameraAnim;
};

var array<ImpactInfo>	        PendingImpactList;
var array<MeleeRandomAnimation>	FiringAnimRandomList;
var AnimNodeSequence            FiringAnimSeqNode;

unreliable client function OwningClientPlayHit(vector HitLocation)
{
	local TrPawn TrPawnInstigator;

	TrPawnInstigator = TrPawn(Instigator);
	if (TrPawnInstigator != none && TrPawnInstigator.CurrentWeaponAttachment != none)
	{
		TrPawnInstigator.CurrentWeaponAttachment.PlayImpactEffects(HitLocation);
	}
}

simulated function PlayFireAnimation(byte FireModeNum)
{
	local int i, RandFire;

	RandFire = Rand(FiringAnimRandomList.Length);

	// Play fire animation.
    if (m_DeviceAnimNode != None)
    {
		if (RandFire < FiringAnimRandomList.Length)
		{
			// Update the animation.
			FiringAnimSeqNode = AnimNodeSequence(m_DeviceAnimNode.Children[2].Anim);
			if (FiringAnimRandomList[RandFire].FireAnimName != '' && FiringAnimSeqNode != none)
			{
				FiringAnimSeqNode.SetAnim(FiringAnimRandomList[RandFire].FireAnimName);
			}

			// Update the camera animation.
			for (i = 0; i < m_DeviceAnimNode.m_CameraAnimations.Length; i++)
			{
				if (FiringAnimRandomList[RandFire].FireCameraAnim != none && m_DeviceAnimNode.m_CameraAnimations[i].ChildIndex == 2)
				{
					m_DeviceAnimNode.m_CameraAnimations[i].CameraAnim = FiringAnimRandomList[RandFire].FireCameraAnim;
				}
			}
		}
    }

	super.PlayFireAnimation(FireModeNum);
}

function int CalcAmountToLoad()
{
	return 0;
}

simulated function bool HasAmmo( byte FireModeNum, optional int Amount )
{
	return true;
}

simulated function float GetBuildUpTime()
{
	return m_fBuildupTime;
}

/** Hits the target with the melee device. */
simulated function FireAmmunition()
{
	local float				ConeCosine;
    local vector			StartTrace, EndTrace;
	local Array<ImpactInfo>	ImpactList;
	local int Idx;
    local TrPawn            TrPawnInstigator, PawnTarget;
    local ImpactInfo         MeleeImpact;
	local TrGameObjective  Objective;
	local Actor A;
	local TrValueModifier TrVM;
	local float RadiusCheckDist;
	local float DamageDistSq, KnockbackDistSq;

	TrPawnInstigator = TrPawn(Instigator);
    if( TrPawnInstigator != None )
	{
		TrPawnInstigator.ConsumePowerPool( m_PowerPoolCost[0] );
		TrVM = TrPawnInstigator.GetTribesReplicationInfo().GetCurrentValueModifier();
	}

	ConeCosine = cos(PI * (m_fConeAttackAngle/2)/180 );

	// Determine the radius check distance.
	RadiusCheckDist = m_fDamageRadius;
	DamageDistSq = m_fDamageRadius * m_fDamageRadius;
	if (TrVM != none && TrVM.m_bSonicPunch)
	{
		RadiusCheckDist = FMax(m_fDamageRadius, TrVM.m_fSonicPunchDistance);
		KnockbackDistSq = TrVM.m_fSonicPunchDistance * TrVM.m_fSonicPunchDistance;

		if (Role == ROLE_Authority)
		{
			TrPawnInstigator.PlaySonicPunchEffect();
		}
	}

	foreach Owner.OverlappingActors(class 'Actor', A, RadiusCheckDist)
	{
		PawnTarget = TrPawn(A);
		Objective = TrGameObjective(A);
		if( (PawnTarget != none && Owner.GetTeamNum()!=PawnTarget.GetTeamNum()) || 
			(Objective != none ))
		{
			if (vector(Instigator.Controller.Rotation) dot Normal(A.Location-Owner.Location) > ConeCosine)
			{
				// Is the user in the damage distance?
				if (VSizeSq(A.Location-Owner.Location) <= DamageDistSq)
				{
					StartTrace	= Owner.Location;
					EndTrace = A.Location;

					MeleeImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
	   				for ( Idx = 0; Idx < ImpactList.Length; Idx++)
					{	
						if( Role == ROLE_Authority )
						{
							ProcessInstantHit_Internal(CurrentFireMode, ImpactList[Idx]);
						}
					}

					ImpactList.Remove(0, ImpactList.Length);

					// Flash the hit location so that impact effects will play.
					if( Role == ROLE_Authority )
					{
						OwningClientPlayHit(MeleeImpact.HitLocation);
						SetFlashLocation(MeleeImpact.HitLocation);
					}
				}

				// Is the user in the knockback distance? If so apply knockback.
				if (TrVM != none && PawnTarget != none && TrVM.m_bSonicPunch && VSizeSq(A.Location-Owner.Location) <= KnockbackDistSq)
				{
					AttemptFlagFumble(PawnTarget);
					PawnTarget.HandleMomentum(Normal(A.Location-Owner.Location) * TrVM.m_fSonicPunchKnockback, Owner.Location, class'TrDmgType_SonicPunch');
					PawnTarget.RememberLastDamager(TrPawnInstigator.Controller, 0, TrPawnInstigator);
				}
			}
		}
	}
}

function float ModifyInstantHitDamage(byte FiringMode, ImpactInfo Impact, float damage)
{
	local TrPawn TrPawnVictim, TrPawnInstigator;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	TrPawnVictim = TrPawn(Impact.HitActor);
	TrPawnInstigator = TrPawn(Instigator);
	if( TrPawnVictim != none && TrPawnInstigator != none )
	{
		TrPRI = TrPawnInstigator.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none && VM.m_fBackstabMeleeDamagePctBuff > 0.0 )
			{
				// Check for a backstab.
				if( (Vector(TrPawnVictim.Rotation) dot Normal(TrPawnVictim.Location - TrPawnInstigator.Location)) > 0.0 )
				{
					// Modify damage for backstab.
					damage *= 1.0 + VM.m_fBackstabMeleeDamagePctBuff;
				}
			}
		}
	}

	return super.ModifyInstantHitDamage(FiringMode, Impact, damage);
}

function AttemptFlagFumble(TrPawn Victim)
{
	local TrPawn TrPawnInstigator;
	local TrPlayerReplicationInfo TrInstigatorPRI, TrVictimPRI;
	local TrValueModifier InstigatorVM, VictimVM;
	local TrPlayerController TrVictimPC;

	TrPawnInstigator = TrPawn(Instigator);
	if( TrPawnInstigator != none )
	{
		TrInstigatorPRI = TrPawnInstigator.GetTribesReplicationInfo();
		if( TrInstigatorPRI != none )
		{
			// Make the victim drop the flag if we have the necessary skill/perk
			InstigatorVM = TrInstigatorPRI.GetCurrentValueModifier();
			if( InstigatorVM != none && InstigatorVM.m_bVictimDropFlagOnMelee )
			{
				// Check to see if the victim is carring a flag.
				TrVictimPRI = Victim.GetTribesReplicationInfo();
				if( TrVictimPRI != none && TrVictimPRI.bHasFlag )
				{
					VictimVM = TrVictimPRI.GetCurrentValueModifier();
					if( VictimVM == none || !VictimVM.m_bStickyHands )
					{
						// No sticky hands, victim drops the flag.
						TrVictimPC = TrPlayerController(Victim.Controller);
						if( TrVictimPC != none )
						{
							TrVictimPC.FumbledFlag();
							Victim.DropFlag(TrPawnInstigator.Controller);
						}
					}
				}
			}
		}
	}
}

defaultproperties
{
   m_fBuildupTime=0.200000
   DBWeaponId=7391
   m_fDamageRadius=128.000000
   m_fConeAttackAngle=120.000000
   m_bAllowReloads=False
   m_nCarriedAmmo=1
   m_nMaxCarriedAmmo=1
   m_TinyWeaponsOffset=(X=15.000000,Y=-3.500000,Z=-2.000000)
   AttachmentClass=Class'TribesGame.TrAttachment_Melee'
   PlayerViewOffset=(X=0.000000,Y=-5.000000,Z=-8.000000)
   SmallWeaponsOffset=(X=12.000000,Y=5.000000,Z=0.000000)
   WidescreenRotationOffset=(Pitch=0,Yaw=0,Roll=0)
   FireInterval(0)=0.550000
   FireInterval(1)=()
   InstantHitDamage(0)=900.000000
   InstantHitDamage(1)=()
   InstantHitMomentum(0)=1000.000000
   InstantHitMomentum(1)=()
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_Melee'
   InstantHitDamageTypes(1)=()
   bMeleeWeapon=True
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:PickupMesh'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      ReplacementPrimitive=None
      MaxDrawDistance=6000.000000
      CachedMaxDrawDistance=6000.000000
      MotionBlurScale=0.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      bAllowAmbientOcclusion=False
      Scale=1.250000
      Name="PickupMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_AutoFire:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_Melee"
   ObjectArchetype=TrDevice_AutoFire'TribesGame.Default__TrDevice_AutoFire'
}
