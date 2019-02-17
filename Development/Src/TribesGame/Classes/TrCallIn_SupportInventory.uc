class TrCallIn_SupportInventory extends TrCallIn_Support;

defaultproperties
{
   ItemInDeliveryPod=Class'TribesGame.TrInventoryStation_Spawnable'
   CallInId=TrCallIn_SupportInventory
   DatabaseId=10234
   BuildupTime=2.000000
   CooldownTime=10.000000
   DisplayName="Inventory Support"
   FlagStationDist=320.000000
   GameObjectiveDist=320.000000
   VehicleDist=320.000000
   CheckExtentsOnSpawn=True
   ExtentTemplateClass=Class'TribesGame.TrCallIn_SupportItemPlatform'
   Name="Default__TrCallIn_SupportInventory"
   ObjectArchetype=TrCallIn_Support'TribesGame.Default__TrCallIn_Support'
}
