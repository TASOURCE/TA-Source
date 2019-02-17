///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_PowerPoolBuff extends TrEffect_Managed;

function Apply(Actor Target, optional ImpactInfo Impact)
{
    local TrPawn aPawn;
	local TrHUD TrH;

    aPawn = TrPawn(Target);
    
    if (aPawn != None)
    {
        //`log(self@"Adjustpowerpool");
	    aPawn.AdjustMaxPowerPool(m_fValue);

		TrH = aPawn.GetTrHud();
		if( TrH != none )
		{
			TrH.SetPowerOscillation(true);
		}
	}

	super.Apply(Target);
}

function Remove(Actor Target)
{
	local TrHUD TrH;
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    if (aPawn != None)
    {
        //`log(self@"Adjustpowerpool remove");
	    aPawn.AdjustMaxPowerPool(-m_fValue);


		TrH = aPawn.GetTrHud();
		if (TrH != none)
			TrH.SetPowerOscillation(false);
	}

    super.Remove(Target);
}

defaultproperties
{
   m_eCalcMethodCode=TRCM_ADD
   Name="Default__TrEffect_PowerPoolBuff"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
