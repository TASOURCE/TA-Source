class TrDmgType_BaseTurret extends TrDmgType_Base
	abstract;

defaultproperties
{
   DBWeaponId=7412
   m_fMaxDamageRangePct=0.500000
   m_fMinDamageRangePct=0.900000
   m_fDamageMultiplierAgainstArmor=1.000000
   m_fDamageMultiplierAgainstShrike=1.000000
   m_bCausesGib=True
   m_nmCameraShake="LargeShake"
   m_nKillIconIndex=138
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_BaseTurretDeployable'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_BaseTurret:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_BaseTurret:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_BaseTurret"
   ObjectArchetype=TrDmgType_Base'TribesGame.Default__TrDmgType_Base'
}
