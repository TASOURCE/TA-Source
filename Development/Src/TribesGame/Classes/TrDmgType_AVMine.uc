class TrDmgType_AVMine extends TrDmgType_Mine
	abstract;

defaultproperties
{
   DBWeaponId=102003
   m_fMinDamagePct=0.500000
   m_nmCameraShake="LargeShake"
   DamageWeaponClass=Class'TribesGame.TrDevice_AVMine'
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_AVMine:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_AVMine:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_AVMine"
   ObjectArchetype=TrDmgType_Mine'TribesGame.Default__TrDmgType_Mine'
}
