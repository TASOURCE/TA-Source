/**
 *
 */
class TrDevice_AmmoPack extends TrDevice_Pack;

var int m_nAmmoPackMultPrimary;
var int m_nAmmoPackMultSecondary;
var int m_nAmmoPackMultBelt;

function AddAmmoBuff(TrDevice dev, float mult)
{
	if (dev!=None)
	{
		dev.m_nCarriedAmmo *= mult;
		dev.UpdateReplicatedCarriedAmmo();
	}
}

function ApplyAmmoBuff()
{
	local TrInventoryManager trim;

	trim = TrInventoryManager(invManager);

	if (trim!=None)
	{
		AddAmmoBuff(trim.GetDeviceByEquipPoint(EQP_Primary),m_nAmmoPackMultPrimary);
		AddAmmoBuff(trim.GetDeviceByEquipPoint(EQP_Belt),m_nAmmoPackMultSecondary);
		AddAmmoBuff(trim.GetDeviceByEquipPoint(EQP_Secondary),m_nAmmoPackMultBelt);
	}
}

defaultproperties
{
   m_nAmmoPackMultPrimary=3
   m_nAmmoPackMultSecondary=3
   m_nAmmoPackMultBelt=3
   m_EffectInfo(0)=(effectClass=Class'TribesGame.TrEffect_AmmoPoolBuff',Type=ET_Equip)
   m_nIconIndex=15
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice_AmmoPack:FireCameraShake'
   Upgrades(0)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(1)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(2)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(3)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   Upgrades(4)=(DatabaseItemId=99999,Modifications=((ModType=1)))
   m_sContentDataClassName="TribesGameContent.TrDevice_AmmoPack_Content"
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   ItemName="Ammo"
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:PickupMesh'
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
      ObjectArchetype=SkeletalMeshComponent'TribesGame.Default__TrDevice_Pack:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   Name="Default__TrDevice_AmmoPack"
   ObjectArchetype=TrDevice_Pack'TribesGame.Default__TrDevice_Pack'
}
