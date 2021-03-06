class TrDmgType_SpikeLauncher extends TrDmgType_Explosive
	abstract;

defaultproperties
{
   DBWeaponId=8357
   m_fMaxDamageRangePct=0.500000
   m_fMinDamageRangePct=0.900000
   m_fMinDamagePct=1.000000
   m_fDamageMultiplierAgainstArmor=0.800000
   m_bEnableMotors=True
   m_bImpulsesFlags=True
   m_nmCameraShake="MediumShake"
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_SpikeLauncher'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_SpikeLauncher:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_SpikeLauncher:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_SpikeLauncher"
   ObjectArchetype=TrDmgType_Explosive'TribesGame.Default__TrDmgType_Explosive'
}
