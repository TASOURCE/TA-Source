/**
 * 
 */
class TrAttachment_ChainGun_MKD extends TrDeviceAttachment;

var bool m_bIsFiring;
var bool m_bSpinningUp;
var float m_fCurrSpinTime;
var float m_fLastFireTime;

var TrSkelControl_SpinControl m_BarrelSpinControl;

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    local class<TrDevice_ChainGun> TrDeviceClass;
	local PlayerReplicationInfo PRI;

	if( Instigator != none )
	{
		PRI = Instigator.PlayerReplicationInfo;
	}

	TrDeviceClass = class<TrDevice_ChainGun>(WeaponClass);

    if (SkelComp == Mesh)
    {
        m_BarrelSpinControl = TrSkelControl_SpinControl(SkelComp.FindSkelControl('SpinControl'));
		m_BarrelSpinControl.m_fSpinDownTime = TrDeviceClass.static.GetBuildupTime(PRI, true);
		m_BarrelSpinControl.m_fSpinUpTime = TrDeviceClass.static.GetBuildupTime(PRI, true);
    }

    Super.PostInitAnimTree(SkelComp);
}

simulated function ThirdPersonFireEffects(vector HitLocation)
{
    local class<TrDevice_ChainGun> TrDeviceClass;
	local PlayerReplicationInfo PRI;

	if( Instigator != none )
	{
		PRI = Instigator.PlayerReplicationInfo;
	}

	TrDeviceClass = class<TrDevice_ChainGun>(WeaponClass);

	if (!m_bIsFiring)
	{
		m_bIsFiring = true;
		m_bSpinningUp = true;
		m_fLastFireTime = WorldInfo.TimeSeconds;

		if( m_BarrelSpinControl != none )
		{
			m_BarrelSpinControl.Spin(true);
		}
	}
	else
	{
		m_fCurrSpinTime += WorldInfo.TimeSeconds - m_fLastFireTime;
		m_fLastFireTime = WorldInfo.TimeSeconds;

		if (m_fCurrSpinTime >= TrDeviceClass.static.GetBuildupTime(PRI, true) )
		{
			m_bSpinningUp = false;
		}
	}

	Super.ThirdPersonFireEffects(HitLocation);
}

defaultproperties
{
   m_nmHeavyAimProfileName="Heavy_ChainGun"
   m_bSpawnTracerBeams=True
   m_Heavy3pPawnAnimSets(0)=None
   m_nmRidingAsPassengerFireAnimName="ADD_FireRepeat"
   Begin Object Class=UTAmbientSoundComponent Name=WeaponLoopSound Archetype=UTAmbientSoundComponent'TribesGame.Default__TrDeviceAttachment:WeaponLoopSound'
      Name="WeaponLoopSound"
      ObjectArchetype=UTAmbientSoundComponent'TribesGame.Default__TrDeviceAttachment:WeaponLoopSound'
   End Object
   m_AudioComponentWeaponLoop=WeaponLoopSound
   Begin Object Class=SkeletalMeshComponent Name=SkeletalMeshComponent0 Archetype=SkeletalMeshComponent'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0'
      Begin Object Class=UTAnimNodeSequence Name=MeshSequenceA Archetype=UTAnimNodeSequence'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0.MeshSequenceA'
         Name="MeshSequenceA"
         ObjectArchetype=UTAnimNodeSequence'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0.MeshSequenceA'
      End Object
      Animations=UTAnimNodeSequence'TribesGame.Default__TrAttachment_ChainGun_MKD:SkeletalMeshComponent0.MeshSequenceA'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      bPerBoneMotionBlur=True
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      MaxDrawDistance=5000.000000
      CachedMaxDrawDistance=5000.000000
      MotionBlurScale=0.000000
      bAllowAmbientOcclusion=False
      Name="SkeletalMeshComponent0"
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDeviceAttachment:SkeletalMeshComponent0'
   End Object
   Mesh=SkeletalMeshComponent0
   MuzzleFlashSocket="WSO_Emit_01"
   MuzzleFlashColor=(B=255,G=120,R=255,A=255)
   MuzzleFlashDuration=0.330000
   ImpactEffects(0)=(MaterialType="Composite",DecalMaterials=(None),DecalWidth=50.000000,DecalHeight=50.000000)
   ImpactEffects(1)=(MaterialType="Concrete",DecalMaterials=(None),DecalWidth=25.000000,DecalHeight=25.000000)
   ImpactEffects(2)=(MaterialType="Dirt")
   ImpactEffects(3)=(MaterialType="Grass")
   ImpactEffects(4)=(MaterialType="Metal",DecalMaterials=(None),DecalWidth=22.000000,DecalHeight=22.000000)
   ImpactEffects(5)=(MaterialType="MetalGrate",DecalMaterials=(None),DecalWidth=12.000000,DecalHeight=12.000000)
   ImpactEffects(6)=(MaterialType="Rock",DecalMaterials=(None),DecalWidth=17.000000,DecalHeight=17.000000)
   ImpactEffects(7)=(MaterialType="Water")
   ImpactEffects(8)=(MaterialType="Pawn")
   ImpactEffects(9)=(MaterialType="PawnHead")
   ImpactEffects(10)=(MaterialType="ForceField")
   DefaultImpactEffect=(DecalMaterials=(None),DecalWidth=25.000000,DecalHeight=25.000000)
   WeaponClass=Class'TribesGame.TrDevice_ChainGun_MKD'
   Components(0)=WeaponLoopSound
   Name="Default__TrAttachment_ChainGun_MKD"
   ObjectArchetype=TrDeviceAttachment'TribesGame.Default__TrDeviceAttachment'
}
