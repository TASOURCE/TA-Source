class TrFamilyInfo_Medium_Technician extends TrFamilyInfo_Medium
    abstract;

defaultproperties
{
   DevSelectionList(0)=(EquipPoint=EQP_LaserTarget,DeviceClass=Class'TribesGame.TrDevice_LaserTargeter',ContentDeviceClassString="TribesGameContent.TrDevice_LaserTargeter_Content")
   DevSelectionList(1)=(EquipPoint=EQP_Primary,DeviceClass=Class'TribesGame.TrDevice_TCN4SMG',ContentDeviceClassString="TribesGameContent.TrDevice_TCN4SMG_Content")
   DevSelectionList(2)=(EquipPoint=EQP_Secondary,DeviceClass=Class'TribesGame.TrDevice_RepairToolSD',ContentDeviceClassString="TribesGameContent.TrDevice_RepairToolSD_Content")
   DevSelectionList(3)=(EquipPoint=EQP_Pack,DeviceClass=Class'TribesGame.TrDevice_LightTurretDeployable')
   DevSelectionList(4)=(EquipPoint=EQP_Belt,DeviceClass=Class'TribesGame.TrDevice_TCNG',ContentDeviceClassString="TribesGameContent.TrDevice_TCNG_Content")
   DevSelectionList(5)=(EquipPoint=EQP_Armor,DeviceClass=Class'TribesGame.TrArmorMod_Technician')
   DevSelectionList(6)=(EquipPoint=EQP_PerkA,DeviceClass=Class'TribesGame.TrPerk_SuperCapacitor')
   DevSelectionList(7)=(EquipPoint=EQP_PerkB,DeviceClass=Class'TribesGame.TrPerk_Determination')
   DevSelectionList(8)=(EquipPoint=EQP_Voice,DeviceClass=Class'TribesGame.TrPlayerVoice_Medium')
   DefaultSkinClass=Class'TribesGame.TrSkin_Technician'
   FriendlyName="Technician"
   ClassId=1694
   InfoBit=2048
   ClassType=TCT_TCN
   ShortDesc="Medium - Base Defense"
   ClassDescription="The Technician is built for defense and repair, keeping base structures online and functional, and deploying Turrets to bolster defenses."
   Abbreviation="TCN"
   Stat_Mobility=3.000000
   Stat_Difficulty=2.000000
   Stat_Durability=3.000000
   m_fMass=100.000000
   m_fFIMaxJettingSpeed=8000.000000
   m_fFITerminalJettingSpeed=9000.000000
   m_fFIMaxSkiSpeed=2100.000000
   m_fFITerminalSkiSpeed=2600.000000
   m_IconId=31
   m_IconColor=14084408
   Name="Default__TrFamilyInfo_Medium_Technician"
   ObjectArchetype=TrFamilyInfo_Medium'TribesGame.Default__TrFamilyInfo_Medium'
}
