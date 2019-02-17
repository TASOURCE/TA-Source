///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_MinorPowerPoolBuff extends TrEffect_Managed;

function Apply(Actor Target, optional ImpactInfo Impact)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    //TODO, check whether can apply
    if (aPawn == None )
    {
        return;
    }

    aPawn.r_fPowerPoolRechargeRate += (aPawn.default.r_fPowerPoolRechargeRate * m_fValue/100);
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
   //`log(self@"remove recharge"@aPawn);
    aPawn.r_fPowerPoolRechargeRate -= (aPawn.default.r_fPowerPoolRechargeRate * m_fValue/100);


    super.Remove(Target);
}

defaultproperties
{
   m_eCalcMethodCode=TRCM_PERC_INCREASE
   Name="Default__TrEffect_MinorPowerPoolBuff"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
