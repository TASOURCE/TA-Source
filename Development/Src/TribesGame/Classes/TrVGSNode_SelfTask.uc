class TrVGSNode_SelfTask extends TrVGSNode;

defaultproperties
{
   m_KeyBind="T"
   m_MenuString="Task"
   m_Commands(0)=VGSCommandType_SelfTaskCover
   m_Commands(1)=VGSCommandType_SelfTaskDefenses
   m_Commands(2)=VGSCommandType_SelfTaskForcefield
   m_Commands(3)=VGSCommandType_SelfTaskOnIt
   m_Commands(4)=VGSCommandType_SelfTaskDeploySensors
   m_Commands(5)=VGSCommandType_SelfTaskDeployTurrets
   m_Commands(6)=VGSCommandType_SelfTaskVehicle
   m_IgnoreTeamRabbitCommand(0)=VGSCommandType_SelfTaskVehicle
   m_IgnoreArenaCommand(0)=VGSCommandType_SelfTaskVehicle
   Name="Default__TrVGSNode_SelfTask"
   ObjectArchetype=TrVGSNode'TribesGame.Default__TrVGSNode'
}
