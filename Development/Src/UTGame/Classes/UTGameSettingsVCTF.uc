/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/** Holds the settings that are advertised for a match */
class UTGameSettingsVCTF extends UTGameSettingsCommon;

defaultproperties
{
   LocalizedSettings(0)=(Id=32779,ValueIndex=3,AdvertisementType=ODAT_OnlineService)
   Properties(2)=(PropertyId=268435467,Data=(Type=SDT_Int32,Value1=3),AdvertisementType=ODAT_OnlineService)
   Properties(3)=()
   Properties(4)=(PropertyId=268435703,Data=(Type=SDT_Int32,Value1=11),AdvertisementType=ODAT_OnlineService)
   PropertyMappings(0)=(ColumnHeaderText="Map")
   PropertyMappings(1)=(ColumnHeaderText="Game")
   PropertyMappings(2)=(Id=268435467,Name="GoalScore",ColumnHeaderText="Caps Limit",MappingType=PVMT_PredefinedValues,PredefinedValues=((Type=SDT_Int32),(Type=SDT_Int32,Value1=1),(Type=SDT_Int32,Value1=2),(Type=SDT_Int32,Value1=3),(Type=SDT_Int32,Value1=4),(Type=SDT_Int32,Value1=5),(Type=SDT_Int32,Value1=10),(Type=SDT_Int32,Value1=15),(Type=SDT_Int32,Value1=20),(Type=SDT_Int32,Value1=30),(Type=SDT_Int32,Value1=40),(Type=SDT_Int32,Value1=50)))
   PropertyMappings(3)=(ColumnHeaderText="Time Limit")
   PropertyMappings(4)=(ColumnHeaderText="Bots")
   PropertyMappings(5)=(ColumnHeaderText="Server Description")
   PropertyMappings(6)=(ColumnHeaderText="Mutators")
   Name="Default__UTGameSettingsVCTF"
   ObjectArchetype=UTGameSettingsCommon'UTGame.Default__UTGameSettingsCommon'
}
