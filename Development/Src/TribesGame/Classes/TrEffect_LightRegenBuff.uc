///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_LightRegenBuff extends TrEffect_RegenBuff;

defaultproperties
{
   m_fValue=80.000000
   Name="Default__TrEffect_LightRegenBuff"
   ObjectArchetype=TrEffect_RegenBuff'TribesGame.Default__TrEffect_RegenBuff'
}
