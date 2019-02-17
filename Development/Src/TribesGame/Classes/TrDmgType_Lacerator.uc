class TrDmgType_Lacerator extends TrDmgType_Base
	abstract;

defaultproperties
{
   DBWeaponId=102016
   m_bEnableMotors=True
   m_bImpulsesFlags=True
   m_nmCameraShake="Zinged"
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   bBulletHit=True
   GibPerterbation=0.750000
   GibThreshold=-15
   MinAccumulateDamageThreshold=55
   AlwaysGibDamageThreshold=80
   DamageWeaponClass=Class'TribesGame.TrDevice_Lacerator'
   NodeDamageScaling=0.800000
   CustomTauntIndex=6
   VehicleDamageScaling=0.800000
   VehicleMomentumScaling=0.650000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_Lacerator:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_Lacerator:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_Lacerator"
   ObjectArchetype=TrDmgType_Base'TribesGame.Default__TrDmgType_Base'
}
