///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect extends Object
    dependson(TrObject);

//-----------------------------------------------------------------------------
var     int                     m_nEffectInstanceId;        // Unique effect id, generated through TrGame.GetNextEffectInstanceId
var     EffectCalcMethod        m_eCalcMethodCode;          // Calculation method to use.
var     bool                    m_bRemovable;
var     float                   m_fValue;					// Modified value being used.
                                                            // we use this value to try to get back to the original value
var class<TrEffectForm>         m_EffectFormClass;
//-----------------------------------------------------------------------------


function Apply(Actor Target, optional ImpactInfo Impact)
{
}

function Remove(Actor Target)
{
}

//check whether property could be applied to certain type of target
//by default, except TgEffectDamage, effect can only be applied to Pawn target
function bool CanBeApplied(Actor Target)
{
    return (Target != None && (Target.IsA('TrPawn') || Target.IsA('TrDeployable')));
}

defaultproperties
{
   Name="Default__TrEffect"
   ObjectArchetype=Object'Core.Default__Object'
}
