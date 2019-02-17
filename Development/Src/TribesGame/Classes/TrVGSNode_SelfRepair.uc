class TrVGSNode_SelfRepair extends TrVGSNode;

defaultproperties
{
   m_KeyBind="R"
   m_MenuString="Repair"
   m_Commands(0)=VGSCommandType_SelfRepairBase
   m_Commands(1)=VGSCommandType_SelfRepairGenerator
   m_Commands(2)=VGSCommandType_SelfRepairSensors
   m_Commands(3)=VGSCommandType_SelfRepairTurrets
   m_Commands(4)=VGSCommandType_SelfRepairVehicle
   m_IgnoreTeamRabbitCommand(0)=VGSCommandType_SelfRepairBase
   m_IgnoreTeamRabbitCommand(1)=VGSCommandType_SelfRepairGenerator
   m_IgnoreTeamRabbitCommand(2)=VGSCommandType_SelfRepairSensors
   m_IgnoreTeamRabbitCommand(3)=VGSCommandType_SelfRepairVehicle
   m_IgnoreArenaCommand(0)=VGSCommandType_SelfRepairBase
   m_IgnoreArenaCommand(1)=VGSCommandType_SelfRepairGenerator
   m_IgnoreArenaCommand(2)=VGSCommandType_SelfRepairSensors
   m_IgnoreArenaCommand(3)=VGSCommandType_SelfRepairVehicle
   m_IgnoreCaHCommand(0)=VGSCommandType_SelfRepairGenerator
   Name="Default__TrVGSNode_SelfRepair"
   ObjectArchetype=TrVGSNode'TribesGame.Default__TrVGSNode'
}
