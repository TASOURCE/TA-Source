class TrVGSNode_Repair extends TrVGSNode;

defaultproperties
{
   m_KeyBind="R"
   m_MenuString="Repair"
   m_Commands(0)=VGSCommandType_RepairGenerator
   m_Commands(1)=VGSCommandType_RepairSensors
   m_Commands(2)=VGSCommandType_RepairTurrets
   m_Commands(3)=VGSCommandType_RepairVehicle
   m_IgnoreTeamRabbitCommand(0)=VGSCommandType_RepairGenerator
   m_IgnoreTeamRabbitCommand(1)=VGSCommandType_RepairSensors
   m_IgnoreTeamRabbitCommand(2)=VGSCommandType_RepairVehicle
   m_IgnoreArenaCommand(0)=VGSCommandType_RepairGenerator
   m_IgnoreArenaCommand(1)=VGSCommandType_RepairSensors
   m_IgnoreArenaCommand(2)=VGSCommandType_RepairVehicle
   m_IgnoreCaHCommand(0)=VGSCommandType_RepairGenerator
   Name="Default__TrVGSNode_Repair"
   ObjectArchetype=TrVGSNode'TribesGame.Default__TrVGSNode'
}
