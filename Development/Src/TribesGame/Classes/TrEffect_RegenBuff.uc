///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_RegenBuff extends TrEffect_Managed;

function Apply(Actor Target, optional ImpactInfo Impact)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    //TODO, check whether can apply
    if (aPawn == None )
    {
        return;
    }
    aPawn.m_fSecondsBeforeAutoHeal *= m_fValue/100;
}

function Remove(Actor Target)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    //TODO, check whether can apply
    if (aPawn == None)
    {
        return;
    }
 
    aPawn.m_fSecondsBeforeAutoHeal *= 100/m_fValue;

    super.Remove(Target);
}

defaultproperties
{
   m_eCalcMethodCode=TRCM_PERC_INCREASE
   m_fValue=95.000000
   Name="Default__TrEffect_RegenBuff"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
