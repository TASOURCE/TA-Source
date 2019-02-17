///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_Stealth extends TrEffect_Managed;

function Apply(Actor Target, optional ImpactInfo Impact)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    //TODO, check whether can apply
    if (aPawn == None )
    {
        return;
    }
	//`log(self@"Apply stealth to"@aPawn);
    aPawn.SetStealthPackActive(true);
    super.Apply(Target,Impact);
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
   //`log(self@"remove stealth"@aPawn);

	aPawn.SetStealthPackActive(false);

    super.Remove(Target);
}

defaultproperties
{
   m_fValue=1.000000
   Name="Default__TrEffect_Stealth"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
