class TrVGSNode_SelfUpgrade extends TrVGSNode;

defaultproperties
{
   m_KeyBind="U"
   m_MenuString="Upgrade"
   m_Commands(0)=VGSCommandType_SelfUpgradeGenerator
   m_Commands(1)=VGSCommandType_SelfUpgradeSensors
   m_Commands(2)=VGSCommandType_SelfUpgradeTurrets
   m_bIgnoreTeamRabbit=True
   m_bIgnoreArena=True
   m_bIgnoreCaH=True
   Name="Default__TrVGSNode_SelfUpgrade"
   ObjectArchetype=TrVGSNode'TribesGame.Default__TrVGSNode'
}
