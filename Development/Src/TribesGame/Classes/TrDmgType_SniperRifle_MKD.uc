class TrDmgType_SniperRifle_MKD extends TrDmgType_Bullet
	abstract;

defaultproperties
{
   DBWeaponId=8407
   m_fMaxDamageRangePct=0.100000
   m_fMinDamageRangePct=0.200000
   m_fMinDamagePct=0.450000
   m_fDamageMultiplierAgainstShrike=0.100000
   m_nmCameraShake="Zinged"
   m_nKillIconIndex=137
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_SniperRifle_MKD'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_SniperRifle_MKD:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_SniperRifle_MKD:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_SniperRifle_MKD"
   ObjectArchetype=TrDmgType_Bullet'TribesGame.Default__TrDmgType_Bullet'
}
