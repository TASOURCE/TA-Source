class TrDmgType_GravCyclePilot extends TrDmgType_Base
	abstract;

defaultproperties
{
   DBWeaponId=7410
   m_fMaxDamageRangePct=0.500000
   m_fMinDamageRangePct=0.900000
   m_fMinDamagePct=0.700000
   m_fDamageMultiplierAgainstArmor=0.600000
   m_nmCameraShake="Zinged"
   m_nKillIconIndex=135
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrVehicleWeapon_GravCyclePilot'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_GravCyclePilot:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_GravCyclePilot:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_GravCyclePilot"
   ObjectArchetype=TrDmgType_Base'TribesGame.Default__TrDmgType_Base'
}
