///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_Jammer extends TrEffect_Managed;

function Apply(Actor Target, optional ImpactInfo Impact)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    if (aPawn == None )
    {
        return;
    }

    aPawn.EnableJamming();

    super.Apply(Target,Impact);
}

function Remove(Actor Target)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    if (aPawn == None)
    {
        return;
    }

	aPawn.DisableJamming();

    super.Remove(Target);
}

defaultproperties
{
   m_fValue=1.000000
   Name="Default__TrEffect_Jammer"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
