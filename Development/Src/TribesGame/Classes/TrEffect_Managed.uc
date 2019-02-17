///////////////////////////////////////////////////////////////////////////////
//
// Effects that managed by owner m_AppliedEffects array
// Usually have a lifetime, that should be removed after lifetime
// or Managed effect such as Fire effect
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_Managed extends TrEffect;

var TrPawn      m_PawnTarget;
var float       m_fLifeTime;			    // Does effect get applied on intervals.


function Apply(Actor Target, optional ImpactInfo Impact)
{
    local TrPawn aPawn;

    aPawn = TrPawn(Target);
    
    //TODO, check whether can apply
    if (aPawn == None )
    {
        return;
    }

    m_PawnTarget = aPawn;

    m_PawnTarget.m_AppliedEffects.AddItem(self);

    if (m_fLifeTime > 0)
    {
        m_PawnTarget.SetTimer(m_fLifeTime, false, 'RemoveEffect', self);
        
    }
    
    //Deal with server managed EffectForm that affect r_ReplicatedBodyMat etc
    if (m_EffectFormClass != None && m_EffectFormClass.default.m_bIsManaged)
    {
        m_PawnTarget.ProcessEffectForm(m_EffectFormClass);
    }
}

function RemoveEffect()
{
    if (m_PawnTarget != None)
    {  
        Remove(m_PawnTarget);
        m_PawnTarget = None;
    }
    
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
    aPawn.m_AppliedEffects.RemoveItem(self);
    aPawn.ClearTimer('RemoveEffect');
    //Deal with server managed EffectForm that affect r_ReplicatedBodyMat etc
    if (m_EffectFormClass != None && m_EffectFormClass.default.m_bIsManaged)
    {
        m_PawnTarget.ProcessEffectForm(m_EffectFormClass, true);
    }
}

defaultproperties
{
   Name="Default__TrEffect_Managed"
   ObjectArchetype=TrEffect'TribesGame.Default__TrEffect'
}
