/**
 * TrEffectForm based class for all effect form present the visual when effect applied.
 * The m_ePriority determine the stackable MIC applied to body
 * server will keep track the list and update the r_replicatedBodyMat
 * however it can have PS displayed in client side based on hit location
 * or sound be hear by the hitactor
 */


class TrEffectForm extends Object
    native
    abstract
    dependsOn(TrObject);

var Material                    m_BodyMat;
var float                       m_fBodyMatFadeInTime;
var float                       m_fBodyMatFadeOutTime;
var EffectFormPriority          m_ePriority;            //Prority of the MIC applying
var bool                        m_bApplied;             //Whether applied currently
var ParticleSystem              m_PSC;
var SoundCue                    m_SoundCue;
var bool                        m_bIsManaged;
var EffectFormMatTypes          m_eMatType;

simulated function Material GetOverwriteMat(array<EffectFormOverwrite> list)
{
    local int i;

    for (i = 0; i < list.length; i++)
    {
        if (list[i].eType  == m_eMatType)
        {
            return list[i].mat;
        }
    }

    return None;
}

simulated function Material GetMatApplyToPawn(class<TrPawn> pawnClass)
{
    return (GetOverwriteMat(pawnClass.default.m_EffectFormOverwrite));
}

simulated function Material GetMatApplyToWeapon(class<TrDevice> devClass)
{   
    return (GetOverwriteMat(devClass.default.m_EffectFormOverwrite));
}

simulated function Material GetMatApplyToAttachment(class<TrDeviceAttachment> attClass)
{
   return (GetOverwriteMat(attClass.default.m_EffectFormOverwrite));
}

defaultproperties
{
   Name="Default__TrEffectForm"
   ObjectArchetype=Object'Core.Default__Object'
}
