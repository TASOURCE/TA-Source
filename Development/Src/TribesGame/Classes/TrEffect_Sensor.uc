///////////////////////////////////////////////////////////////////////////////
//
// TrEffect is the parent class of all effects that can be applied to an actor.
// Examples can include buffs, debuffs, toggles, damage overtime, etc
//
///////////////////////////////////////////////////////////////////////////////
class TrEffect_Sensor extends TrEffect_Managed;

var float   m_fScannerFOV;
var float   m_fScannerRange;
var bool    m_bRequiresLOS;

var bool    m_bDisplayInGame;
var bool    m_bDisplayForeground;
var bool    m_bSeeNormalEnemy;
var bool    m_bSeeStealthedEnemy;
var bool    m_bSeeLowHealthEnemy;

/*
const class'TrObject'.const.INDEX_DISPLAY_TARGET_INGAME       =  0;
const class'TrObject'.const.INDEX_DISPLAY_TARGET_FOREGROUND   =  1;      

const class'TrObject'.const.INDEX_SEE_NON_STEALTHED_ENEMY     =  0;
const class'TrObject'.const.INDEX_SEE_STEALTHED_ENEMY         =  1;
const class'TrObject'.const.INDEX_SEE_LOW_HEALTH_ENEMY        =  1;
*/

function Apply(Actor Target, optional ImpactInfo Impact)
{
    local TrPawn            PawnTarget;
    
 
    PawnTarget=TrPawn(Target);

    if (PawnTarget!=None)
    {
      
    }
    return;
}


function Remove(Actor Target)
{
    local TrPawn PawnTarget;
 
    if (Target!=None && Target.IsA('TrPawn'))
    {
        PawnTarget=TrPawn(Target);
        
        if (PawnTarget != None)
        {

        }

    }
}

defaultproperties
{
   m_fScannerFOV=359.000000
   m_fScannerRange=3000.000000
   m_bDisplayInGame=True
   m_bDisplayForeground=True
   m_bSeeNormalEnemy=True
   m_bSeeStealthedEnemy=True
   m_bSeeLowHealthEnemy=True
   m_fValue=1.000000
   Name="Default__TrEffect_Sensor"
   ObjectArchetype=TrEffect_Managed'TribesGame.Default__TrEffect_Managed'
}
