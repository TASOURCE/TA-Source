class TrFamilyInfo_Light_Sentinel extends TrFamilyInfo_Light
    abstract;

defaultproperties
{
   DevSelectionList(0)=(EquipPoint=EQP_LaserTarget,DeviceClass=Class'TribesGame.TrDevice_LaserTargeter',ContentDeviceClassString="TribesGameContent.TrDevice_LaserTargeter_Content")
   DevSelectionList(1)=(EquipPoint=EQP_Primary,DeviceClass=Class'TribesGame.TrDevice_SniperRifle',ContentDeviceClassString="TribesGameContent.TrDevice_SniperRifle_Content")
   DevSelectionList(2)=(EquipPoint=EQP_Secondary,DeviceClass=Class'TribesGame.TrDevice_NovaColt',ContentDeviceClassString="TribesGameContent.TrDevice_NovaColt_Content")
   DevSelectionList(3)=(EquipPoint=EQP_Pack,DeviceClass=Class'TribesGame.TrDevice_DropJammerDeployable')
   DevSelectionList(4)=(EquipPoint=EQP_Belt,DeviceClass=Class'TribesGame.TrDevice_Claymore',ContentDeviceClassString="TribesGameContent.TrDevice_Claymore_Content")
   DevSelectionList(5)=(EquipPoint=EQP_Armor,DeviceClass=Class'TribesGame.TrArmorMod_Sentinel')
   DevSelectionList(6)=(EquipPoint=EQP_PerkA,DeviceClass=Class'TribesGame.TrPerk_SuperCapacitor')
   DevSelectionList(7)=(EquipPoint=EQP_PerkB,DeviceClass=Class'TribesGame.TrPerk_Determination')
   DevSelectionList(8)=(EquipPoint=EQP_Voice,DeviceClass=Class'TribesGame.TrPlayerVoice_Light')
   DefaultSkinClass=Class'TribesGame.TrSkin_Sentinel'
   m_vAirControlMultiplier=(X=3.700000,Y=1.400000)
   r_fMaxPowerPool=90.000000
   m_fMaxGroundSpeed=500.000000
   m_nMaxHealthPool=800.000000
   FriendlyName="Sentinel"
   ClassId=1686
   InfoBit=32
   ClassType=TCT_SEN
   ShortDesc="Light - Sniper"
   ClassDescription="A sniper capable of dealing damage at extreme range, the Sentinel is exceptional at Attack or Defense."
   Abbreviation="SEN"
   Stat_Mobility=4.000000
   Stat_Difficulty=3.000000
   Stat_Durability=1.000000
   m_fFIMaxJettingSpeed=8000.000000
   m_fFITerminalJettingSpeed=9000.000000
   m_fFIMaxSkiSpeed=2100.000000
   m_fFITerminalSkiSpeed=2600.000000
   m_IconId=1
   m_IconColor=10040217
   Name="Default__TrFamilyInfo_Light_Sentinel"
   ObjectArchetype=TrFamilyInfo_Light'TribesGame.Default__TrFamilyInfo_Light'
}
