class TrDmgType_SawedOffShotgun extends TrDmgType_Bullet
	abstract;

defaultproperties
{
   DBWeaponId=7427
   m_fMaxDamageRangePct=0.500000
   m_fMinDamageRangePct=0.900000
   m_fMinDamagePct=0.400000
   m_nmCameraShake="Zinged"
   m_v2DDamageNumbersMinMaxX=(X=-90.000000,Y=90.000000)
   m_v2DDamageNumbersMinMaxY=(X=-90.000000,Y=90.000000)
   m_v2DDamageNumbersMinMaxZ=(X=-20.000000,Y=40.000000)
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_SawedOffShotgun'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_SawedOffShotgun:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_SawedOffShotgun:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_SawedOffShotgun"
   ObjectArchetype=TrDmgType_Bullet'TribesGame.Default__TrDmgType_Bullet'
}
