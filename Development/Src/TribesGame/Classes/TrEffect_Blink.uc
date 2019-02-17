///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_Blink extends TrEffect_Managed;

function Apply(Actor Target, optional ImpactInfo Impact)
{
}

defaultproperties
{
   m_eCalcMethodCode=TRCM_PERC_INCREASE
   Name="Default__TrEffect_Blink"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
