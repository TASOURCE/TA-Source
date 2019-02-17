class TrDmgType_SonicPunch extends TrDmgType_Base
	abstract;

defaultproperties
{
   DBWeaponId=7391
   m_fDamageMultiplierAgainstArmor=0.010000
   m_fDamageMultiplierAgainstGenerators=0.200000
   m_fDamageMultiplierAgainstNonArmoredObjectives=0.750000
   m_nmCameraShake="Zinged"
   m_nKillIconIndex=133
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_Melee'
   NodeDamageScaling=0.800000
   KDamageImpulse=3000.000000
   KDeathUpKick=500.000000
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_SonicPunch:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_SonicPunch:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_SonicPunch"
   ObjectArchetype=TrDmgType_Base'TribesGame.Default__TrDmgType_Base'
}
