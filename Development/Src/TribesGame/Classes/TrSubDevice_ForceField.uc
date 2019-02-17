//
//	This device does damage when a pawn passes through the force field
//
class TrSubDevice_ForceField extends TrSubDevice;

/*
Moving through an ENEMY force field invokes damage upon a player.
The damage is not continuous, but applies just once per pass through.
The damage SCALES based on the player speed when they impact the force field, such that the force field should have:
Max Damage: The most damage that can be applied.
Max Damage Speed: The speed at which max damage is applied.
Min Damage: The minimum damage that is applied.
Min Damage Speed: The speed at which minimum damage is applied.

Greater than the max damage speed the force field always does max damage. 
Less than the minimum damage speed the force field always applies the min damage.
It ramps the damage linearly between the two speeds and two values.
*/

var float m_MaxDamage;
var float m_MinDamage;
var float m_MaxSpeed;
var float m_MinSpeed;

//
//	damage pawns only once
//
simulated function InstantFire()
{
	super.InstantFire();
	StopFire(0);
}

/* Damage based on speed traversing the field */
function float ModifyInstantHitDamage(byte FiringMode, ImpactInfo Impact, float damage)
{
	local float Speed;

	if (Impact.HitActor!=None)
	{
		Speed = VSize(Impact.HitActor.Velocity);
		if (Speed > m_MinSpeed)
		{
			damage = Lerp(m_MinDamage, m_MaxDamage, FPctByRange(Min(Speed, m_MaxSpeed), m_MinSpeed, m_MaxSpeed));
		}
	}

    return super.ModifyInstantHitDamage(FiringMode,Impact,damage);
}

defaultproperties
{
   m_MaxDamage=800.000000
   m_MinDamage=100.000000
   m_MaxSpeed=1800.000000
   m_MinSpeed=100.000000
   m_eTargetType(0)=TRDTT_Enemy
   m_eTargetType(1)=()
   m_nCarriedAmmo=1
   m_nMaxCarriedAmmo=1
   m_fReloadTime=1.000000
   m_FireCameraShake=CameraShake'TribesGame.Default__TrSubDevice_ForceField:FireCameraShake'
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrSubDevice_ForceField:ForceFeedbackWaveformShooting1'
   InstantHitDamageTypes(0)=Class'TribesGame.TrDmgType_ForceField'
   InstantHitDamageTypes(1)=()
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrSubDevice:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrSubDevice:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrSubDevice:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrSubDevice:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrSubDevice_ForceField"
   ObjectArchetype=TrSubDevice'TribesGame.Default__TrSubDevice'
}
