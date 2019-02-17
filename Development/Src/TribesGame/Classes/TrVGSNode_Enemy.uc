class TrVGSNode_Enemy extends TrVGSNode;

defaultproperties
{
   m_KeyBind="E"
   m_MenuString="Enemy"
   m_Commands(0)=VGSCommandType_EnemyDisarray
   m_Commands(1)=VGSCommandType_EnemyGeneratorDestroyed
   m_Commands(2)=VGSCommandType_EnemySensorsDestroyed
   m_Commands(3)=VGSCommandType_EnemyTurretsDestroyed
   m_Commands(4)=VGSCommandType_EnemyVehicleDestroyed
   m_IgnoreTeamRabbitCommand(0)=VGSCommandType_EnemyGeneratorDestroyed
   m_IgnoreTeamRabbitCommand(1)=VGSCommandType_EnemySensorsDestroyed
   m_IgnoreTeamRabbitCommand(2)=VGSCommandType_EnemyVehicleDestroyed
   m_IgnoreArenaCommand(0)=VGSCommandType_EnemyGeneratorDestroyed
   m_IgnoreArenaCommand(1)=VGSCommandType_EnemySensorsDestroyed
   m_IgnoreArenaCommand(2)=VGSCommandType_EnemyVehicleDestroyed
   m_IgnoreCaHCommand(0)=VGSCommandType_EnemyGeneratorDestroyed
   Name="Default__TrVGSNode_Enemy"
   ObjectArchetype=TrVGSNode'TribesGame.Default__TrVGSNode'
}
