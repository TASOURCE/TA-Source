/**
 * 
 */
class TrDeployable_ForceField extends TrDeployable;

/** How long to play the hit flash. */
var() float m_fInTakeHitFlashTimeLength;
var() float m_fOutTakeHitFlashTimeLength;

/** Remaining time for the current hit flash. */
var transient float m_fInTakeHitFlashRemainingTime;
var transient float m_fOutTakeHitFlashRemainingTime;

/** How long to play the take hit flash. */
var() float m_fInHitOtherFlashTimeLength;
var() float m_fOutHitOtherFlashTimeLength;

/** Remaining time for the take hit flash. */
var transient float m_fInHitOtherFlashRemainingTime;
var transient float m_fOutHitOtherFlashRemainingTime;

/** Point light associated with the forcefield. */
var PointLightComponent m_Light;
var Color m_LightFlashColor;
var float m_LightFlashBrightness;

// player goes through the force field
simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal )
{
    local TrPawn aPawn;

    aPawn = TrPawn(Other);

	if( aPawn != none && WorldInfo.NetMode != NM_DedicatedServer && IsEnemy(aPawn) )
	{
		PlayHitOtherEffects(aPawn);
	}

	if (Role!=ROLE_Authority) return;

    if (aPawn != None && r_bIsPowered && m_bIsDeployed && !r_bInDestroyedState &&
		m_WeaponHolder != None && m_WeaponHolder.Weapon != None &&
	    IsEnemy(aPawn) )
    {
		m_TouchedPlayer = aPawn;
        m_WeaponHolder.StartFire(0);
    }

    if(Owner != None)
    {
        Owner.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
}

simulated function OnHealthChanged(bool wasDamage)
{
	super.OnHealthChanged(wasDamage);

	if( WorldInfo.NetMode != NM_DedicatedServer && m_ObjectiveMIC != none )
	{
		m_ObjectiveMIC.SetScalarParameterValue('Health', float(r_Health) / float(r_MaxHealth));
	}
}

simulated function PlayDamageHealthEffects(int DamageAmount, int HitBoneIndex)
{
	m_fInTakeHitFlashRemainingTime = m_fInTakeHitFlashTimeLength;

	if( m_ShieldHitSound != None && m_ShieldHitSound.SoundCue != None && DamageAmount > 0 )
    {
        m_ShieldHitSound.Play();
    }
}

simulated function PlayHitOtherEffects(Actor Other)
{
	m_fInHitOtherFlashRemainingTime = m_fInHitOtherFlashTimeLength;
}

simulated event Tick(float DeltaTime)
{
	local float Alpha;

	super.Tick(DeltaTime);

	if( WorldInfo.NetMode != NM_DedicatedServer && m_ObjectiveMIC != none )
	{
		if( m_fInTakeHitFlashRemainingTime > 0.f )
		{
			// Fading in Take Hit.
			m_fInTakeHitFlashRemainingTime -= DeltaTime;
			m_fInTakeHitFlashRemainingTime = FMax(m_fInTakeHitFlashRemainingTime, 0.f);
			Alpha = FClamp(m_fInTakeHitFlashRemainingTime / m_fInTakeHitFlashTimeLength, 0.f, 1.f);
			m_ObjectiveMIC.SetScalarParameterValue('Hit', Alpha);
			if( m_Light != none )
			{
				m_Light.SetLightProperties(Lerp(default.m_Light.Brightness, m_LightFlashBrightness, Alpha));
			}

			// If done fading in, fade out.
			if( m_fInTakeHitFlashRemainingTime <= 0.f )
			{
				m_fOutTakeHitFlashRemainingTime = m_fOutTakeHitFlashTimeLength;
			}
		}
		else if( m_fOutTakeHitFlashRemainingTime > 0.f )
		{
			// Fading out Take Hit.
			m_fOutTakeHitFlashRemainingTime -= DeltaTime;
			m_fOutTakeHitFlashRemainingTime = FMax(m_fOutTakeHitFlashRemainingTime, 0.f);
			Alpha = FClamp(m_fOutTakeHitFlashRemainingTime / m_fOutTakeHitFlashTimeLength, 0.f, 1.f);
			m_ObjectiveMIC.SetScalarParameterValue('Hit', Alpha);
			if( m_Light != none )
			{
				m_Light.SetLightProperties(Lerp(default.m_Light.Brightness, m_LightFlashBrightness, Alpha));
			}
		}

		if( m_fInHitOtherFlashRemainingTime > 0.f )
		{
			// Fading in Hit Other.
			m_fInHitOtherFlashRemainingTime -= DeltaTime;
			m_fInHitOtherFlashRemainingTime = FMax(m_fInHitOtherFlashRemainingTime, 0.f);
			Alpha = FClamp(m_fInHitOtherFlashRemainingTime / m_fInHitOtherFlashTimeLength, 0.f, 1.f);
			m_ObjectiveMIC.SetScalarParameterValue('HitPlayer', Alpha);
			if( m_Light != none )
			{
				m_Light.SetLightProperties(Lerp(default.m_Light.Brightness, m_LightFlashBrightness, Alpha), LerpColor(default.m_Light.LightColor, m_LightFlashColor, Alpha));
			}

			// If done fading in, fade out.
			if( m_fOutHitOtherFlashRemainingTime <= 0.f )
			{
				m_fOutHitOtherFlashRemainingTime = m_fOutHitOtherFlashTimeLength;
			}
		}
		else if( m_fOutHitOtherFlashRemainingTime > 0.f )
		{
			// Fading out Hit Other.
			m_fOutHitOtherFlashRemainingTime -= DeltaTime;
			m_fOutHitOtherFlashRemainingTime = FMax(m_fOutHitOtherFlashRemainingTime, 0.f);
			Alpha = FClamp(m_fOutHitOtherFlashRemainingTime / m_fOutHitOtherFlashTimeLength, 0.f, 1.f);
			m_ObjectiveMIC.SetScalarParameterValue('HitPlayer', Alpha);
			if( m_Light != none )
			{
				m_Light.SetLightProperties(Lerp(default.m_Light.Brightness, m_LightFlashBrightness, Alpha), LerpColor(default.m_Light.LightColor, m_LightFlashColor, Alpha));
			}
		}
	}
}

simulated function Texture2D GetMarker()
{
	return class'TrHUD'.default.DeployableShield;
}

defaultproperties
{
   m_fInTakeHitFlashTimeLength=0.100000
   m_fOutTakeHitFlashTimeLength=1.000000
   m_fInHitOtherFlashTimeLength=0.100000
   m_fOutHitOtherFlashTimeLength=1.000000
   m_fTimeToDeploySecs=0.500000
   m_DeviceClass=Class'TribesGame.TrSubDevice_ForceField'
   Begin Object Class=SkeletalMeshComponent Name=XRayMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:XRayMesh'
      Materials(0)=None
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      MotionBlurScale=0.000000
      CastShadow=False
      bAllowAmbientOcclusion=False
      AlwaysLoadOnServer=False
      Scale=2.000000
      Name="XRayMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:XRayMesh'
   End Object
   m_XRayMesh=XRayMesh
   m_nIconStackId=41
   Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment Archetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable:MyLightEnvironment'
      Name="MyLightEnvironment"
      ObjectArchetype=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable:MyLightEnvironment'
   End Object
   m_LightEnvironment=MyLightEnvironment
   Begin Object Class=SkeletalMeshComponent Name=ObjectiveMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ObjectiveMesh'
      Begin Object Class=AnimNodeSequence Name=AnimNodeSeq0 Archetype=AnimNodeSequence'TribesGame.Default__TrDeployable:ObjectiveMesh.AnimNodeSeq0'
         Name="AnimNodeSeq0"
         ObjectArchetype=AnimNodeSequence'TribesGame.Default__TrDeployable:ObjectiveMesh.AnimNodeSeq0'
      End Object
      Animations=AnimNodeSequence'TribesGame.Default__TrDeployable_ForceField:ObjectiveMesh.AnimNodeSeq0'
      PhysicsWeight=1.000000
      AnimSets(0)=None
      bHasPhysicsAssetInstance=True
      bUpdateJointsFromAnimation=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      LightEnvironment=DynamicLightEnvironmentComponent'TribesGame.Default__TrDeployable_ForceField:MyLightEnvironment'
      CollideActors=True
      BlockActors=True
      BlockZeroExtent=True
      BlockNonZeroExtent=True
      Scale=2.000000
      Name="ObjectiveMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ObjectiveMesh'
   End Object
   m_Mesh=ObjectiveMesh
   r_Health=1600
   m_nCriticalHealthThreshold=0
   Begin Object Class=SkeletalMeshComponent Name=ShieldMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ShieldMesh'
      ReplacementPrimitive=None
      HiddenGame=True
      HiddenEditor=True
      Name="ShieldMesh"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeployable:ShieldMesh'
   End Object
   m_ShieldMesh=ShieldMesh
   m_sScreenName="Force Field"
   m_bInstantOnlineSound=True
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
   Components(5)=OnlineSound
   Components(6)=CriticalSound
   Components(7)=ShieldHitSound
   Components(8)=DestroyedSound
   bCollideComplex=True
   CollisionComponent=ObjectiveMesh
   Name="Default__TrDeployable_ForceField"
   ObjectArchetype=TrDeployable'TribesGame.Default__TrDeployable'
}
