class TrDmgType_RepairTool extends TrDmgType_Bullet
	abstract;

defaultproperties
{
   DBWeaponId=7396
   m_fDamageMultiplierAgainstArmor=1.000000
   m_bIgnoreDamageFalloff=True
   DamageBodyMatColor=(R=40.000000,G=0.000000,B=50.000000,A=1.000000)
   DamageOverlayTime=0.300000
   DeathOverlayTime=0.600000
   GibPerterbation=0.750000
   DamageWeaponClass=Class'TribesGame.TrDevice_RepairTool'
   NodeDamageScaling=0.800000
   CustomTauntIndex=4
   VehicleDamageScaling=0.700000
   VehicleMomentumScaling=2.000000
   DamagedFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_RepairTool:ForceFeedbackWaveform0'
   KilledFFWaveform=ForceFeedbackWaveform'TribesGame.Default__TrDmgType_RepairTool:ForceFeedbackWaveform1'
   Name="Default__TrDmgType_RepairTool"
   ObjectArchetype=TrDmgType_Bullet'TribesGame.Default__TrDmgType_Bullet'
}
