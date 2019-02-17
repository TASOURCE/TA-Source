class GFxTrMenuSounds extends Object within GFxTrMenuMoviePlayer;

enum EMenuSound
{
    EMS_CLASS_ROLLOVER,
    EMS_CLASS_SELECTED,
    EMS_CLASS_UNLOCKED,
    EMS_CLASS_DENIED,
    EMS_SKILL_ROLLOVER,
    EMS_SKILL_SELECTED,
    EMS_SKILL_UNLOCKED,
    EMS_QUEUE_SELECTED,
    EMS_QUEUE_EXIT,
    EMS_TOOLTIP_OPEN,
    EMS_TOOLTIP_CLOSE,
    EMS_XP_GAIN,
    EMS_XP_POINT_POSITIVE,
    EMS_XP_POINT_NEGATIVE,
    EMS_PAGE_FORWARD,
    EMS_PAGE_BACK
};

function SoundToolTip(bool bOpened)
{
    if (bOpened)
    {
        PlayMenuSound(EMS_TOOLTIP_OPEN);
    }
    else
    {
        PlayMenuSound(EMS_TOOLTIP_CLOSE);
    }
}

function SoundXPGain(int Val)
{
    switch (Val)
    {
    case 1:
        PlayMenuSound(EMS_XP_GAIN);
        break;
    case 2:
        PlayMenuSound(EMS_XP_POINT_POSITIVE);
        break;
    case 3:
        PlayMenuSound(EMS_XP_POINT_NEGATIVE);
        break;
    default:
        break;
    }
}


function SoundSkillType(int Val)
{
    switch (Val)
    {
    case 1:
        PlayMenuSound(EMS_SKILL_ROLLOVER);
        break;
    case 2:
        PlayMenuSound(EMS_SKILL_SELECTED);
        break;
    case 2:
        PlayMenuSound(EMS_SKILL_UNLOCKED);
        break;
    default:
        break;
    }
}

function SoundClassType(int Val)
{
    switch (Val)
    {
    case 1:
        PlayMenuSound(EMS_CLASS_ROLLOVER);
        break;
    case 2:
        PlayMenuSound(EMS_CLASS_SELECTED);
        break;
    default:
        break;
    }
}

function SoundPurchaseSkill()
{
    PlayMenuSound(EMS_SKILL_UNLOCKED);
}

function SoundSelectedQueue()
{
    PlayMenuSound(EMS_QUEUE_SELECTED);
}

function LeaveQueue()
{
    PlayMenuSound(EMS_QUEUE_EXIT);
}

function PageForward()
{
    PlayMenuSound(EMS_PAGE_FORWARD);
}

function PageBack()
{
    PlayMenuSound(EMS_PAGE_BACK);
}

function ClassRollover()
{
    PlayMenuSound(EMS_CLASS_ROLLOVER);
}

function ClassSelected()
{
    PlayMenuSound(EMS_CLASS_SELECTED);
}

function ClassLocked()
{
    PlayMenuSound(EMS_CLASS_DENIED);
}

function PlayMenuSound(EMenuSound MenuSound)
{
    local PlayerController PC;

    PC = Outer.GetPC();

    if (PC != none)
    {
        switch (MenuSound)
        {
        case EMS_CLASS_ROLLOVER:
            PC.PlaySound(SoundCue'Aud_menu.Loadout_Menu.A_CUE_MENU_Loadout_Button_Rollover_1');
            break;
        case EMS_CLASS_SELECTED:
            PC.PlaySound(SoundCue'Aud_menu.Loadout_Menu.A_CUE_MENU_Loadout_Button_Press_1');
            break;
        case EMS_CLASS_DENIED:
            PC.PlaySound(SoundCue'Aud_menu.Class_Skills.A_CUE_MENU_ClassSkills_Locked_Skill_Selected');
            break;
        case EMS_SKILL_SELECTED:
            //PC.PlaySound(SoundCue'Aud_menu.Class_Skills.A_CUE_MENU_ClassSkills_Locked_Skill_Selected');
            break;
        case EMS_SKILL_UNLOCKED:
            PC.PlaySound(SoundCue'Aud_menu.Class_Skills.A_CUE_MENU_ClassSkills_Skill_Unlocked');
            break;
        case EMS_QUEUE_SELECTED:
            PC.PlaySound(SoundCue'Aud_menu.Join_Queue.A_CUE_UI_JoinQueue_ButtonPress');
            break;
        case EMS_QUEUE_EXIT:
            PC.PLaySound(SoundCue'Aud_menu.Join_Queue.A_CUE_UI_LeaveQueue_ButtonPress');
            break;
        case EMS_TOOLTIP_OPEN:
            PC.PlaySound(SoundCue'Aud_menu.Tool_Tips.A_CUE_UI_ToolTip_PopUp');
            break;
        case EMS_TOOLTIP_CLOSE:
            PC.PlaySound(SoundCue'Aud_menu.Tool_Tips.A_CUE_UI_ToolTip_Closed');
            break;
        case EMS_XP_GAIN:
            PC.PlaySound(SoundCue'Aud_menu.XP_Summary.A_CUE_MENU_XPSummary_Profile_XP_Gain');
            break;
        case EMS_XP_POINT_POSITIVE:
            PC.PlaySound(SoundCue'Aud_menu.XP_Summary.A_CUE_MENU_XPSummary_Profile_XP_PointBreak_Positive');
            break;
        case EMS_XP_POINT_NEGATIVE:
            PC.PlaySound(SoundCue'Aud_menu.XP_Summary.A_CUE_MENU_XPSummary_Profile_XP_PointBreak_Negative');
            break;
        case EMS_PAGE_FORWARD:
            PC.PlaySound(SoundCue'Aud_menu.Loadout_Menu.A_CUE_UI_FINAL_Default_PageForward_1');
            break;
        case EMS_PAGE_BACK:
            PC.PlaySound(SoundCue'Aud_menu.Loadout_Menu.A_CUE_UI_FINAL_Default_PageBack_1');
            break;
        default:
            break;
        }
    }
}

defaultproperties
{
   Name="Default__GFxTrMenuSounds"
   ObjectArchetype=Object'Core.Default__Object'
}
