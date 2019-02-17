class TrDmgType_WhiteOut extends TrDmgType_Explosive
	abstract;

/** Interp speed for blending out of a whiteout. */
var float m_fWhiteoutInterpSpeed;

/** Scalar to send to the Material Effect representing how "white" to go. */
var float m_fWhiteoutTargetValue;

defaultproperties
{
   m_fWhiteoutInterpSpeed=0.200000
   m_fWhiteoutTargetValue=1.000000
   DBWeaponId=7432
   m_fMaxDamageRangePct=0.500000
   m_fMinDamageRangePct=0.900000
   m_fMinDamagePct=0.300000
   m_fDamageMultiplierAgainstArmor=0.500000
   m_bCausesGib=True
   m_bEnableMotors=True
   m_bImpulsesFlags=True
   bOffhandType=True
   m_nmCameraShake="MediumShake"
   m_nmTakeHitSoundMode="TR_Concussion"
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_WhiteOut'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   KDamageImpulse=5000.000000
   KDeathUpKick=3500.000000
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_WhiteOut:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_WhiteOut:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_WhiteOut"
   ObjectArchetype=TrDmgType_Explosive'TribesGame.Default__TrDmgType_Explosive'
}
