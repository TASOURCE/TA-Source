class TrFamilyInfo_Light_Pathfinder extends TrFamilyInfo_Light
    abstract;

defaultproperties
{
   DevSelectionList(0)=(EquipPoint=EQP_LaserTarget,DeviceClass=Class'TribesGame.TrDevice_LaserTargeter',ContentDeviceClassString="TribesGameContent.TrDevice_LaserTargeter_Content")
   DevSelectionList(1)=(EquipPoint=EQP_Primary,DeviceClass=Class'TribesGame.TrDevice_LightSpinfusor',ContentDeviceClassString="TribesGameContent.TrDevice_LightSpinfusor_Content")
   DevSelectionList(2)=(EquipPoint=EQP_Secondary,DeviceClass=Class'TribesGame.TrDevice_Shotgun',ContentDeviceClassString="TribesGameContent.TrDevice_Shotgun_Content")
   DevSelectionList(3)=(EquipPoint=EQP_Pack,DeviceClass=Class'TribesGame.TrDevice_ERechargePack_Pathfinder')
   DevSelectionList(4)=(EquipPoint=EQP_Belt,DeviceClass=Class'TribesGame.TrDevice_ConcussionGrenade',ContentDeviceClassString="TribesGameContent.TrDevice_ConcussionGrenade_Content")
   DevSelectionList(5)=(EquipPoint=EQP_Armor,DeviceClass=Class'TribesGame.TrArmorMod_Pathfinder')
   DevSelectionList(6)=(EquipPoint=EQP_PerkA,DeviceClass=Class'TribesGame.TrPerk_SuperCapacitor')
   DevSelectionList(7)=(EquipPoint=EQP_PerkB,DeviceClass=Class'TribesGame.TrPerk_Determination')
   DevSelectionList(8)=(EquipPoint=EQP_Voice,DeviceClass=Class'TribesGame.TrPlayerVoice_Light')
   DefaultSkinClass=Class'TribesGame.TrSkin_Pathfinder'
   m_vAirControlMultiplier=(X=3.700000,Y=1.400000)
   m_fPowerPoolRechargeRate=14.000000
   m_fMaxGroundSpeed=500.000000
   m_nMaxHealthPool=800.000000
   FriendlyName="Pathfinder"
   ClassId=1683
   InfoBit=8
   ShortDesc="Light - Cap/Chase"
   ClassDescription="Pathfinders have amazing speed, making excellent flag cappers and chasers."
   Abbreviation="PTH"
   Stat_Mobility=5.000000
   Stat_Difficulty=2.000000
   Stat_Durability=1.000000
   m_fFIMaxJettingSpeed=8000.000000
   m_fFITerminalJettingSpeed=9000.000000
   m_fFIMaxSkiSpeed=2800.000000
   m_fFITerminalSkiSpeed=3300.000000
   m_IconId=2
   m_IconColor=2349277
   Name="Default__TrFamilyInfo_Light_Pathfinder"
   ObjectArchetype=TrFamilyInfo_Light'TribesGame.Default__TrFamilyInfo_Light'
}
