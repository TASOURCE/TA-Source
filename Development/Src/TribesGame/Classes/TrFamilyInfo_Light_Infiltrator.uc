class TrFamilyInfo_Light_Infiltrator extends TrFamilyInfo_Light
    abstract;

defaultproperties
{
   DevSelectionList(0)=(EquipPoint=EQP_LaserTarget,DeviceClass=Class'TribesGame.TrDevice_LaserTargeter',ContentDeviceClassString="TribesGameContent.TrDevice_LaserTargeter_Content")
   DevSelectionList(1)=(EquipPoint=EQP_Primary,DeviceClass=Class'TribesGame.TrDevice_RhinoSMG',ContentDeviceClassString="TribesGameContent.TrDevice_RhinoSMG_Content")
   DevSelectionList(2)=(EquipPoint=EQP_Secondary,DeviceClass=Class'TribesGame.TrDevice_SN7',ContentDeviceClassString="TribesGameContent.TrDevice_SN7_Content")
   DevSelectionList(3)=(EquipPoint=EQP_Pack,DeviceClass=Class'TribesGame.TrDevice_Stealth')
   DevSelectionList(4)=(EquipPoint=EQP_Belt,DeviceClass=Class'TribesGame.TrDevice_StickyGrenade',ContentDeviceClassString="TribesGameContent.TrDevice_StickyGrenade_Content")
   DevSelectionList(5)=(EquipPoint=EQP_Armor,DeviceClass=Class'TribesGame.TrArmorMod_Infiltrator')
   DevSelectionList(6)=(EquipPoint=EQP_PerkA,DeviceClass=Class'TribesGame.TrPerk_SuperCapacitor')
   DevSelectionList(7)=(EquipPoint=EQP_PerkB,DeviceClass=Class'TribesGame.TrPerk_Determination')
   DevSelectionList(8)=(EquipPoint=EQP_Voice,DeviceClass=Class'TribesGame.TrPlayerVoice_Light')
   DefaultSkinClass=Class'TribesGame.TrSkin_Infiltrator'
   m_vAirControlMultiplier=(X=3.700000,Y=1.400000)
   m_fMaxGroundSpeed=500.000000
   m_nMaxHealthPool=800.000000
   FriendlyName="Infiltrator"
   ClassId=1682
   InfoBit=1
   ClassType=TCT_INF
   ShortDesc="Light - Stealth Attack"
   ClassDescription="With stealth capabilities and heavy explosives, the Infiltrator can devastate an enemy defense."
   Abbreviation="INF"
   Stat_Mobility=3.000000
   Stat_Difficulty=3.000000
   Stat_Durability=2.000000
   m_fFIMaxJettingSpeed=8000.000000
   m_fFITerminalJettingSpeed=9000.000000
   m_fFIMaxSkiSpeed=2600.000000
   m_fFITerminalSkiSpeed=3100.000000
   m_IconId=4
   m_IconColor=16025700
   Name="Default__TrFamilyInfo_Light_Infiltrator"
   ObjectArchetype=TrFamilyInfo_Light'TribesGame.Default__TrFamilyInfo_Light'
}
