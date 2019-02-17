//
//
//
class TrEffect_Shield extends TrEffect_Managed;

function Apply(Actor Target, optional ImpactInfo Impact)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    //TODO, check whether can apply
    if (aPawn == None )
    {
        return;
    }

    aPawn.SetShieldPackActive(true);
    super.Apply(Target,Impact);
}

function Remove(Actor Target)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    aPawn.SetShieldPackActive(false);

    super.Remove(Target);
}

defaultproperties
{
   m_fValue=1.000000
   m_EffectFormClass=Class'TribesGame.TrEffectForm_Shield'
   Name="Default__TrEffect_Shield"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
