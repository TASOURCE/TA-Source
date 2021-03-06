class TrDmgType_APGrenade extends TrDmgType_Explosive
	abstract;

defaultproperties
{
   DBWeaponId=7434
   m_fMaxDamageRangePct=0.500000
   m_fMinDamageRangePct=0.900000
   m_fMinDamagePct=0.300000
   m_fDamageMultiplierAgainstArmor=0.250000
   m_fDamageMultiplierAgainstGenerators=0.500000
   m_fDamageMultiplierAgainstShrike=0.250000
   m_bCausesGib=True
   m_bEnableMotors=True
   m_bImpulsesFlags=True
   bOffhandType=True
   m_nmCameraShake="MediumShake"
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_APGrenade'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   KDamageImpulse=5000.000000
   KDeathUpKick=3500.000000
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_APGrenade:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_APGrenade:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_APGrenade"
   ObjectArchetype=TrDmgType_Explosive'TribesGame.Default__TrDmgType_Explosive'
}
