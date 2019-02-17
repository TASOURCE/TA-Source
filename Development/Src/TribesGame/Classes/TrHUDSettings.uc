class TrHUDSettings extends GFxObject;

var int       SettingsCount;
var GFxObject SettingsList;

enum EHUDSettingType
{
    EHST_HEROTEXT,
    EHST_COMBATLOG,
    EHST_CREDITS,
    EHST_CHAT,
    EHST_SCORES,
    EHST_ACCOLADES,
    EHST_BADGES,
    EHST_VISOR,
    EHST_KILLBOX,
    EHST_DEATHCAM,
    EHST_PROMPTPANEL,
    EHST_RESPAWNTIMER,
    EHST_HEALTHBAR,
    EHST_RETICULE,
    EHST_SKIBARS,
    EHST_FRIENDCOLOR,
    EHST_CRACKS,
    EHST_MAX,
};

function SaveSetting(int Index, float Val)
{
	local int IntVal;
    local TrHUD TrH;
    local TrPlayerController TrPC;

	IntVal = int(Val);

    TrPC = TrPlayerController(GetPC());

    if (TrPC == none)
    {
        return;
    }

    switch (EHUDSettingType(Index))
    {
    case EHST_COMBATLOG:    TrPC.EnableHUDCombatLog(IntVal > 0 ? true : false); break;
    case EHST_CHAT:         TrPC.EnableHUDChat(IntVal > 0 ? true : false); break;
    case EHST_RETICULE:     TrPC.EnableHUDReticule(IntVal > 0 ? true : false); break;
    case EHST_CREDITS:      TrPC.EnableHUDCredits(IntVal > 0 ? true : false); break;
    case EHST_ACCOLADES:    TrPC.EnableHUDAccolades(IntVal > 0 ? true : false); break;
    case EHST_BADGES:       TrPC.EnableHUDBadges(IntVal > 0 ? true : false); break;
    case EHST_SCORES:       TrPC.EnableHUDScores(IntVal > 0 ? true : false); break;
    case EHST_HEALTHBAR:    TrPC.EnableHUDHealthBar(IntVal > 0 ? true : false); break;
    case EHST_VISOR:        TrPC.EnableHUDVisor(IntVal > 0 ? true : false); break;
    case EHST_KILLBOX:      TrPC.EnableHUDKillbox(IntVal > 0 ? true : false); break;
    case EHST_DEATHCAM:     TrPC.EnableHUDDeathcam(IntVal > 0 ? true : false); break;
    case EHST_HEROTEXT:     TrPC.EnableHUDHeroText(IntVal > 0 ? true : false); break;
    case EHST_PROMPTPANEL:  TrPC.EnableHUDPromptPanel(IntVal > 0 ? true : false); break;
    case EHST_RESPAWNTIMER: TrPC.EnableHUDRespawnTimer(IntVal > 0 ? true : false); break;
    case EHST_SKIBARS:      TrPC.EnableHUDSkiBars(IntVal > 0 ? true : false); break;
    case EHST_FRIENDCOLOR:  TrPC.EnableHUDFriendColoring(IntVal > 0 ? true : false); break;
    case EHST_CRACKS:       TrPC.EnableHUDCracks(IntVal > 0 ? true : false); break;
    default:
        break;
    }

    TrH = TrHUD(TrPC.myHUD);

    if (TrH != none)
    {
        TrH.RestoreHUDState();
    }
}

function float GetCurrentValue(EHUDSettingType Index)
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC == none)
    {
        return -1;
    }

    switch (EHUDSettingType(Index))
    {
    case EHST_COMBATLOG:    return int(TrPC.m_bShowHUDCombatLog);
    case EHST_CHAT:         return int(TrPC.m_bShowHUDChat);
    case EHST_RETICULE:     return int(TrPC.m_bShowHUDReticule);
    case EHST_CREDITS:      return int(TrPC.m_bShowHUDCredits);
    case EHST_ACCOLADES:    return int(TrPC.m_bShowHUDAccolades);
    case EHST_BADGES:       return int(TrPC.m_bShowHUDBadges);
    case EHST_SCORES:       return int(TrPC.m_bShowHUDScores);
    case EHST_HEALTHBAR:    return int(TrPC.m_bShowHUDHealthBar);
    case EHST_VISOR:        return int(TrPC.m_bShowHUDVisor);
    case EHST_KILLBOX:      return int(TrPC.m_bShowHUDKillbox);
    case EHST_DEATHCAM:     return int(TrPC.m_bShowHUDDeathcam);
    case EHST_HEROTEXT:     return int(TrPC.m_bShowHUDHeroText);
    case EHST_PROMPTPANEL:  return int(TrPC.m_bShowHUDPromptPanel);
    case EHST_RESPAWNTIMER: return int(TrPC.m_bShowHUDRespawnTimer);
    case EHST_SKIBARS:      return int(TrPC.m_bShowHUDSkiBars);
    case EHST_FRIENDCOLOR:  return int(TrPC.m_bShowHUDFriendColoring);
    case EHST_CRACKS:       return int(TrPC.m_bShowHUDCracks);
    default:
        break;
    }

    return -1;
}

defaultproperties
{
   Name="Default__TrHUDSettings"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
