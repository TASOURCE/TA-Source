class TrDmgType_NovaColt_MKD extends TrDmgType_Bullet
	abstract;

defaultproperties
{
   DBWeaponId=8403
   m_fMaxDamageRangePct=0.200000
   m_fMinDamageRangePct=0.400000
   m_fMinDamagePct=1.000000
   m_bIgnoreDamageFalloff=True
   m_nmCameraShake="Zinged"
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_NovaColt_MKD'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_NovaColt_MKD:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_NovaColt_MKD:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_NovaColt_MKD"
   ObjectArchetype=TrDmgType_Bullet'TribesGame.Default__TrDmgType_Bullet'
}
