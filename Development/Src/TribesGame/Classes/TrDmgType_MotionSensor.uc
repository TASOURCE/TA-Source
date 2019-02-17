class TrDmgType_MotionSensor extends TrDmgType_Mine
	abstract;

defaultproperties
{
   DBWeaponId=7426
   m_fMaxDamageRangePct=1.000000
   m_fMinDamageRangePct=1.000000
   m_bCausesGib=False
   m_EnergyDrainAmount=100.000000
   DamageWeaponClass=Class'TribesGame.TrDevice_MotionSensorDeployable'
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_MotionSensor:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_MotionSensor:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_MotionSensor"
   ObjectArchetype=TrDmgType_Mine'TribesGame.Default__TrDmgType_Mine'
}
