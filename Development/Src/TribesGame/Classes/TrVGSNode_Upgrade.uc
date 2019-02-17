class TrVGSNode_Upgrade extends TrVGSNode;

defaultproperties
{
   m_KeyBind="U"
   m_MenuString="Upgrade"
   m_Commands(0)=VGSCommandType_UpgradeGenerator
   m_Commands(1)=VGSCommandType_UpgradeSensors
   m_Commands(2)=VGSCommandType_UpgradeTurrets
   m_bIgnoreTeamRabbit=True
   m_bIgnoreArena=True
   m_bIgnoreCaH=True
   Name="Default__TrVGSNode_Upgrade"
   ObjectArchetype=TrVGSNode'TribesGame.Default__TrVGSNode'
}
