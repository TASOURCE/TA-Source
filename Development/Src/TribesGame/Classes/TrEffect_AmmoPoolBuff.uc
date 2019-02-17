///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_AmmoPoolBuff extends TrEffect_Managed;

function Apply(Actor Target, optional ImpactInfo Impact)
{
	super.Apply(Target);
}

function Remove(Actor Target)
{
    super.Remove(Target);
}

defaultproperties
{
   m_eCalcMethodCode=TRCM_ADD
   m_fValue=10.000000
   Name="Default__TrEffect_AmmoPoolBuff"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
