class TrDmgType_MortarLauncher extends TrDmgType_Explosive
	abstract;

defaultproperties
{
   DBWeaponId=7393
   m_fMaxDamageRangePct=0.500000
   m_fMinDamageRangePct=0.900000
   m_fMinDamagePct=0.500000
   m_fDamageMultiplierAgainstArmor=2.000000
   m_fDamageMultiplierAgainstGenerators=2.500000
   m_bCausesGib=True
   m_bImpulsesFlags=True
   m_nmCameraShake="LargeShake"
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_MortarLauncher'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   KDamageImpulse=5000.000000
   KDeathUpKick=3500.000000
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_MortarLauncher:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_MortarLauncher:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_MortarLauncher"
   ObjectArchetype=TrDmgType_Explosive'TribesGame.Default__TrDmgType_Explosive'
}
