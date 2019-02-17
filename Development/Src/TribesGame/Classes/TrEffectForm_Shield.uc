/**
 * TrEffectForm based class for all effect form present the visual when effect applied.
 * The m_ePriority determine the stackable MIC applied to body
 * server will keep track the list and update the r_replicatedBodyMat
 * however it can have PS displayed in client side based on hit location
 * or sound be hear by the hitactor
 */


class TrEffectForm_Shield extends TrEffectForm;

defaultproperties
{
   m_fBodyMatFadeInTime=1.000000
   m_ePriority=TR_EF_SHIELD
   m_eMatType=MAT_Shield
   m_bIsManaged=True
   Name="Default__TrEffectForm_Shield"
   ObjectArchetype=TrEffectForm'TribesGame.Default__TrEffectForm'
}
