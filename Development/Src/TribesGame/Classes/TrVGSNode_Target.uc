class TrVGSNode_Target extends TrVGSNode;

defaultproperties
{
   m_KeyBind="T"
   m_MenuString="Target"
   m_Commands(0)=VGSCommandType_TargetAcquired
   m_Commands(1)=VGSCommandType_TargetBase
   m_Commands(2)=VGSCommandType_TargetDestroyed
   m_Commands(3)=VGSCommandType_TargetFlag
   m_Commands(4)=VGSCommandType_TargetFireOnMy
   m_Commands(5)=VGSCommandType_TargetNeed
   m_Commands(6)=VGSCommandType_TargetSensors
   m_Commands(7)=VGSCommandType_TargetTurret
   m_Commands(8)=VGSCommandType_TargetVehicle
   m_Commands(9)=VGSCommandType_TargetWait
   m_IgnoreTeamRabbitCommand(0)=VGSCommandType_TargetBase
   m_IgnoreTeamRabbitCommand(1)=VGSCommandType_TargetSensors
   m_IgnoreTeamRabbitCommand(2)=VGSCommandType_TargetVehicle
   m_IgnoreArenaCommand(0)=VGSCommandType_TargetBase
   m_IgnoreArenaCommand(1)=VGSCommandType_TargetSensors
   m_IgnoreArenaCommand(2)=VGSCommandType_TargetVehicle
   m_IgnoreArenaCommand(3)=VGSCommandType_TargetFlag
   m_IgnoreCaHCommand(0)=VGSCommandType_TargetBase
   m_IgnoreCaHCommand(1)=VGSCommandType_TargetFlag
   Name="Default__TrVGSNode_Target"
   ObjectArchetype=TrVGSNode'TribesGame.Default__TrVGSNode'
}
