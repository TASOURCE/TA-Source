class TrDmgType_AntiAirTurret extends TrDmgType_Base
	abstract;

defaultproperties
{
   DBWeaponId=7417
   m_fMaxDamageRangePct=1.000000
   m_fMinDamageRangePct=1.000000
   m_fMinDamagePct=1.000000
   m_fDamageMultiplierAgainstArmor=1.200000
   m_bIgnoreDamageFalloff=True
   m_nmCameraShake="Zinged"
   m_nKillIconIndex=142
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_AntiAirTurretDeployable'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_AntiAirTurret:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_AntiAirTurret:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_AntiAirTurret"
   ObjectArchetype=TrDmgType_Base'TribesGame.Default__TrDmgType_Base'
}
