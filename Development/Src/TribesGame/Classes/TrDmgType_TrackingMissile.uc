class TrDmgType_TrackingMissile extends TrDmgType_Explosive
	abstract;

defaultproperties
{
   DBWeaponId=7398
   m_fMaxDamageRangePct=0.200000
   m_fMinDamageRangePct=0.900000
   m_fMinDamagePct=0.300000
   m_fDamageMultiplierAgainstArmor=1.400000
   m_fDamageMultiplierAgainstShrike=1.200000
   m_bImpulsesFlags=True
   m_nmCameraShake="LargeShake"
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_SaberLauncher'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_TrackingMissile:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_TrackingMissile:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_TrackingMissile"
   ObjectArchetype=TrDmgType_Explosive'TribesGame.Default__TrDmgType_Explosive'
}
