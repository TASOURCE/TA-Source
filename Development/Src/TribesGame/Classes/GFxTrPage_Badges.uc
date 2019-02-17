class GFxTrPage_Badges extends GFxTrPage;



const STAT_GAME_MAP                         = 200001;
const STAT_GAME_TYPE                        = 200002;
const STAT_GAME_TIME                        = 200003;
const STAT_GAME_OVERTIME                    = 200004;
const STAT_GAME_WINNER                      = 200005;


const STAT_CLASS_TYPE                       = 201000;
const STAT_CLASS_SCORE                      = 201001;
const STAT_CLASS_KILLS                      = 201002;
const STAT_CLASS_DEATHS                     = 201003;
const STAT_CLASS_ASSISTS                    = 201004;
const STAT_CLASS_CREDITS_EARNED             = 201005;
const STAT_CLASS_CREDITS_SPENT              = 201006;


const STAT_WEAPON_TYPE                      = 202000;
const STAT_WEAPON_DAMAGE                    = 202001;
const STAT_WEAPON_KILLS                     = 202002;
const STAT_WEAPON_SHOTS                     = 202003;
const STAT_WEAPON_HITS                      = 202004;
const STAT_WEAPON_TIME                      = 202005;
const STAT_WEAPON_DISTANCE                  = 202006;

const STAT_ACO_KS_FIVE                      = 203001; 
const STAT_ACO_KS_TEN                       = 203002;
const STAT_ACO_KS_FIFTEEN                   = 203003;
const STAT_ACO_KS_TWENTY                    = 203004;
const STAT_ACO_KS_TWENTYFIVE                = 203005;
const STAT_ACO_KS_FIVE_SNIPING              = 203006;
const STAT_ACO_KS_TEN_SNIPING               = 203007;
const STAT_ACO_KS_FIFTEEN_SNIPING           = 203008;
const STAT_ACO_KS_FIVE_EXPLOSIVE            = 203009;
const STAT_ACO_KS_TEN_EXPLOSIVE             = 203010;
const STAT_ACO_KS_FIFTEEN_EXPLOSIVE         = 203011;
const STAT_ACO_KS_FIVE_SPINFUSOR            = 203012;
const STAT_ACO_KS_TEN_SPINFUSOR             = 203013;
const STAT_ACO_KS_FIFTEEN_SPINFUSOR         = 203014;
const STAT_ACO_MK_DOUBLE                    = 203015;
const STAT_ACO_MK_TRIPLE                    = 203016;
const STAT_ACO_MK_QUATRA                    = 203017;
const STAT_ACO_MK_ULTRA                     = 203018;
const STAT_ACO_MK_TEAM                      = 203019;
const STAT_ACO_NOJOY                        = 203020;
const STAT_ACO_REVENGE                      = 203021;
const STAT_ACO_AFTERMATH                    = 203022;
const STAT_ACO_FIRSTBLOOD                   = 203023;
const STAT_ACO_BLUEPLATESPECIAL             = 203024;
const STAT_ACO_STICKYKILL                   = 203025;
const STAT_ACO_HEADSHOT                     = 203026;
const STAT_ACO_ARTILLERYSTRIKE              = 203027;
const STAT_ACO_MELEE                        = 203028;
const STAT_ACO_ROADKILL                     = 203029;
const STAT_ACO_FLAG_CAPTURE                 = 203030;
const STAT_ACO_FLAG_GRAB                    = 203031;
const STAT_ACO_BK_GEN                       = 203032;
const STAT_ACO_RABBITKILL                   = 203033;
const STAT_ACO_KILLASRABBIT                 = 203034;
const STAT_ACO_FINALBLOW                    = 203035;
const STAT_ACO_REPAIR                       = 203036;
const STAT_ACO_BK_TURRET                    = 203037;
const STAT_ACO_ASSIST                       = 203039;
const STAT_ACO_FLAG_RETURN                  = 203040;
const STAT_ACO_BK_RADAR                     = 203041;
const STAT_ACO_FLAG_ASSIST                  = 203042;
const STAT_ACO_AIRMAIL                      = 203043;
const STAT_ACO_GAME_COMPLETE                = 203044;
const STAT_ACO_GAME_WINNER                  = 203045;
const STAT_ACO_FLAG_GRABDM                  = 203046;
const STAT_ACO_FLAG_HOLDER                  = 203047;
const STAT_ACO_FLAG_KILLER                  = 203048;
const STAT_ACO_FLAG_GRABFAST                = 203049;
const STAT_ACO_DEFENSE_GEN                  = 203050;
const STAT_ACO_DEFENSE_FLAG                 = 203051;
const STAT_ACO_VD_BIKE                      = 203052;
const STAT_ACO_VD_TANK                      = 203053;
const STAT_ACO_VD_SHRIKE                    = 203054;
const STAT_ACO_FLAG_GRABE                   = 203055;
const STAT_ACO_FLAG_GRABLLAMA               = 203056;
const STAT_ACO_ASSIST_VEHICLE               = 203057;
const STAT_ACO_FLAG_GRABULTRA               = 203058;
const STAT_ACO_BENCHEM                      = 203059;
const STAT_ACO_DOUBLEDOWN                   = 203060;
const STAT_ACO_LASTMANSTANDING              = 203061;
const STAT_ACO_MIRACLE                      = 203062;
const STAT_ACO_NOTAMONGEQUALS               = 203063;
const STAT_ACO_ONEMANARMY                   = 203064;
const STAT_ACO_TRIBALHONOR                  = 203065;
const STAT_ACO_UNITEDWESTAND                = 203066;
const STAT_ACO_HOLDTHELINE                  = 203067;
const STAT_ACO_CAPTUREANDHOLD               = 203068;
const STAT_ACO_BASEASSIST                   = 203069;
const STAT_ACO_TURRETASSIST                 = 203070;
const STAT_ACO_HOTAIR                       = 203071;


const ACT_ACO_KS_FIVE                       = 56;
const ACT_ACO_KS_TEN                        = 63;
const ACT_ACO_KS_FIFTEEN                    = 55;
const ACT_ACO_KS_TWENTY                     = 64;
const ACT_ACO_KS_TWENTYFIVE                 = 65;
const ACT_ACO_KS_FIVE_SNIPING               = 58;
const ACT_ACO_KS_TEN_SNIPING                = 59;
const ACT_ACO_KS_FIFTEEN_SNIPING            = 57;
const ACT_ACO_KS_FIVE_EXPLOSIVE             = 53;
const ACT_ACO_KS_TEN_EXPLOSIVE              = 54;
const ACT_ACO_KS_FIFTEEN_EXPLOSIVE          = 52;
const ACT_ACO_KS_FIVE_SPINFUSOR             = 61;
const ACT_ACO_KS_TEN_SPINFUSOR              = 62;
const ACT_ACO_KS_FIFTEEN_SPINFUSOR          = 60;
const ACT_ACO_MK_DOUBLE                     = 66;
const ACT_ACO_MK_TRIPLE                     = 67;
const ACT_ACO_MK_QUATRA                     = 68;
const ACT_ACO_MK_ULTRA                      = 69;
const ACT_ACO_MK_TEAM                       = 70;
const ACT_ACO_NOJOY                         = 89;
const ACT_ACO_REVENGE                       = 90;
const ACT_ACO_AFTERMATH                     = 73;
const ACT_ACO_FIRSTBLOOD                    = 78;
const ACT_ACO_BLUEPLATESPECIAL              = 29;
const ACT_ACO_STICKYKILL                    = 92;
const ACT_ACO_HEADSHOT                      = 84;
const ACT_ACO_ARTILLERYSTRIKE               = 75;
const ACT_ACO_MELEE                         = 88;
const ACT_ACO_ROADKILL                      = 91;
const ACT_ACO_FLAG_CAPTURE                  = 42;
const ACT_ACO_FLAG_GRAB                     = 80;
const ACT_ACO_BK_GEN                        = 48;
const ACT_ACO_RABBITKILL                    = 72;
const ACT_ACO_KILLASRABBIT                  = 71;
const ACT_ACO_FINALBLOW                     = 49;
const ACT_ACO_REPAIR                        = 39;
const ACT_ACO_BK_TURRET                     = 40;
const ACT_ACO_ASSIST                        = 76;
const ACT_ACO_FLAG_RETURN                   = 46;
const ACT_ACO_BK_RADAR                      = 38;
const ACT_ACO_FLAG_ASSIST                   = 41;
const ACT_ACO_AIRMAIL                       = 74;
const ACT_ACO_GAME_COMPLETE                 = 82;
const ACT_ACO_GAME_WINNER                   = 83;
const ACT_ACO_FLAG_HOLDER                   = 51;
const ACT_ACO_FLAG_KILLER                   = 81;
const ACT_ACO_FLAG_GRABFAST                 = 77;
const ACT_ACO_DEFENSE_GEN                   = 47;
const ACT_ACO_DEFENSE_FLAG                  = 79;
const ACT_ACO_VD_BIKE                       = 87;
const ACT_ACO_VD_TANK                       = 85;
const ACT_ACO_VD_SHRIKE                     = 86;
const ACT_ACO_FLAG_GRABE                    = 44;
const ACT_ACO_FLAG_GRABLLAMA                = 45;
const ACT_ACO_ASSIST_VEHICLE                = 94;
const ACT_ACO_FLAG_GRABULTRA                = 93;
const ACT_ACO_BENCHEM                       = 30;
const ACT_ACO_DOUBLEDOWN                    = 31;
const ACT_ACO_LASTMANSTANDING               = 32;
const ACT_ACO_MIRACLE                       = 33;
const ACT_ACO_NOTAMONGEQUALS                = 34;
const ACT_ACO_ONEMANARMY                    = 35;
const ACT_ACO_TRIBALHONOR                   = 36;
const ACT_ACO_UNITEDWESTAND                 = 37;
const ACT_ACO_HOLDTHELINE					= 117;
const ACT_ACO_CAPTUREANDHOLD				= 118;
const ACT_ACO_BASEASSIST 				    = 121;
const ACT_ACO_TURRETASSIST  				= 122;
const ACT_ACO_HOTAIR                        = 123;


const ACO_TYPE_GENERAL                      = 0;
const ACO_TYPE_COMBAT                       = 1;
const ACO_TYPE_FLAG                         = 2;
const ACO_TYPE_OBJECTIVE                    = 3;
const ACO_TYPE_SPREES                       = 4;
const ACO_TYPE_MULTIKILL                    = 5;
const ACO_TYPE_ARENA                        = 6;



const STAT_ACOW_KS_FIVE                     = 5; 
const STAT_ACOW_KS_TEN                      = 12;
const STAT_ACOW_KS_FIFTEEN                  = 20;
const STAT_ACOW_KS_TWENTY                   = 40;
const STAT_ACOW_KS_TWENTYFIVE               = 100;
const STAT_ACOW_KS_FIVE_SNIPING             = 5;
const STAT_ACOW_KS_TEN_SNIPING              = 12;
const STAT_ACOW_KS_FIFTEEN_SNIPING          = 20;
const STAT_ACOW_KS_FIVE_EXPLOSIVE           = 5;
const STAT_ACOW_KS_TEN_EXPLOSIVE            = 12;
const STAT_ACOW_KS_FIFTEEN_EXPLOSIVE        = 20;
const STAT_ACOW_KS_FIVE_SPINFUSOR           = 5;
const STAT_ACOW_KS_TEN_SPINFUSOR            = 12;
const STAT_ACOW_KS_FIFTEEN_SPINFUSOR        = 20;
const STAT_ACOW_MK_DOUBLE                   = 6;
const STAT_ACOW_MK_TRIPLE                   = 20;
const STAT_ACOW_MK_QUATRA                   = 50;
const STAT_ACOW_MK_ULTRA                    = 75;
const STAT_ACOW_MK_TEAM                     = 100;
const STAT_ACOW_NOJOY                       = 3;
const STAT_ACOW_REVENGE                     = 1;
const STAT_ACOW_AFTERMATH                   = 1;
const STAT_ACOW_FIRSTBLOOD                  = 1;
const STAT_ACOW_BLUEPLATESPECIAL            = 6;
const STAT_ACOW_STICKYKILL                  = 1;
const STAT_ACOW_HEADSHOT                    = 1;
const STAT_ACOW_ARTILLERYSTRIKE             = 3;
const STAT_ACOW_MELEE                       = 1;
const STAT_ACOW_ROADKILL                    = 1;
const STAT_ACOW_FLAG_CAPTURE                = 30;
const STAT_ACOW_FLAG_GRAB                   = 1;
const STAT_ACOW_BK_GEN                      = 2;
const STAT_ACOW_RABBITKILL                  = 1;
const STAT_ACOW_KILLASRABBIT                = 1;
const STAT_ACOW_FINALBLOW                   = 4;
const STAT_ACOW_REPAIR                      = 1;
const STAT_ACOW_BK_TURRET                   = 1;
const STAT_ACOW_ASSIST                      = 1;
const STAT_ACOW_FLAG_RETURN                 = 1;
const STAT_ACOW_BK_RADAR                    = 1;
const STAT_ACOW_FLAG_ASSIST                 = 1;
const STAT_ACOW_AIRMAIL                     = 6;
const STAT_ACOW_HOTAIR                      = 3;
const STAT_ACOW_GAME_COMPLETE               = 1;
const STAT_ACOW_GAME_WINNER                 = 1;
const STAT_ACOW_FLAG_GRABDM                 = 1;
const STAT_ACOW_FLAG_HOLDER                 = 1;
const STAT_ACOW_FLAG_KILLER                 = 3;
const STAT_ACOW_FLAG_GRABFAST               = 1;
const STAT_ACOW_DEFENSE_GEN                 = 1;
const STAT_ACOW_DEFENSE_FLAG                = 1;
const STAT_ACOW_VD_BIKE                     = 2;
const STAT_ACOW_VD_TANK                     = 2;
const STAT_ACOW_VD_SHRIKE                   = 2;
const STAT_ACOW_FLAG_GRABE                  = 5;
const STAT_ACOW_FLAG_GRABLLAMA              = 1;
const STAT_ACOW_ASSIST_VEHICLE              = 1;
const STAT_ACOW_FLAG_GRABULTRA              = 2;
const STAT_ACOW_BASEASSIST                  = 1;
const STAT_ACOW_TURRETASSIST                = 1;



const STAT_AWD_CREDITS_EARNED               = 204001;
const STAT_AWD_CREDITS_SPENT                = 204002;
const STAT_AWD_DESTRUCTION_DEPLOYABLE       = 204003;
const STAT_AWD_DESTRUCTION_VEHICLE          = 204004;
const STAT_AWD_DISTANCE_HEADSHOT            = 204005;
const STAT_AWD_DISTANCE_KILL                = 204006;
const STAT_AWD_DISTANCE_SKIED               = 204007;
const STAT_AWD_KILLS                        = 204008;
const STAT_AWD_KILLS_DEPLOYABLE             = 204009;
const STAT_AWD_KILLS_MIDAIR                 = 204010;
const STAT_AWD_KILLS_VEHICLE                = 204011;
const STAT_AWD_REPAIRS                      = 204012;
const STAT_AWD_SPEED_FLAGCAP                = 204013;
const STAT_AWD_SPEED_FLAGGRAB               = 204014;
const STAT_AWD_SPEED_SKIED                  = 204015;
const STAT_AWD_FLAG_RETURNS                 = 204016;
const STAT_AWD_DEATHS                       = 204017;



const STAT_AWDW_CREDITS_EARNED              = 98;
const STAT_AWDW_CREDITS_SPENT               = 89;
const STAT_AWDW_DESTRUCTION_DEPLOYABLE      = 84;
const STAT_AWDW_DESTRUCTION_VEHICLE         = 88;
const STAT_AWDW_DISTANCE_HEADSHOT           = 87;
const STAT_AWDW_DISTANCE_KILL               = 93;
const STAT_AWDW_DISTANCE_SKIED              = 90;
const STAT_AWDW_KILLS                       = 86;
const STAT_AWDW_KILLS_DEPLOYABLE            = 92;
const STAT_AWDW_KILLS_MIDAIR                = 94;
const STAT_AWDW_KILLS_VEHICLE               = 81;
const STAT_AWDW_REPAIRS                     = 96;
const STAT_AWDW_SPEED_FLAGCAP               = -100;
const STAT_AWDW_SPEED_FLAGGRAB              = 97;
const STAT_AWDW_SPEED_SKIED                 = 95;
const STAT_AWDW_FLAG_RETURNS                = 85;
const STAT_AWDW_DEATHS                      = 1;

const MIN_CREDITS_FOR_XP                    = 100;

#linenumber 4;

const FRIEND_REFERRAL_ACTIVITY = 115;
const HIDDEN_IF_UNEARNED_TYPE = 10378;

var int ActiveType;

// Hacky for now
var array<int> CombatType;
var array<int> ObjectiveType;
var array<int> VehicleType;
var array<int> TacticalType;
var array<int> SingleType;
var array<int> ReferralType;

function Initialize()
{
    AddActionSet(none, 0, "COMBAT");
    AddActionSet(none, 0, "OBJECTIVES");
    AddActionSet(none, 0, "VEHICLES");
    AddActionSet(none, 0, "TACTICAL");
    AddActionSet(none, 0, "ONE-TIMERS");
    AddActionSet(none, 0, "REFER-A-FRIEND");
}

function SpecialAction(GFxTrAction Action)
{
    NewAction = 0;
    ActiveIndex = 0;

    if (Action.ActionString == "COMBAT")
    {
        ActiveType = 0;
    }
    else if (Action.ActionString == "OBJECTIVES")
    {
        ActiveType = 1;
    }
    else if (Action.ActionString == "VEHICLES")
    {
        ActiveType = 2;
    }
    else if (Action.ActionString == "TACTICAL")
    {
        ActiveType = 3;
    }
    else if (Action.ActionString == "ONE-TIMERS")
    {
        ActiveType = 4;
    }
    else if (Action.ActionString == "REFER-A-FRIEND")
    {
        ActiveType = 5;
    }
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    NewAction = 0;

    if (ActionIndex == GoBack || PageActions.Length == 0)
    {
        NewAction = -1;
        Pages.PopPage().FillData(DataList);
    }
    else
    {
        SpecialAction(PageActions[ActionIndex]);
        FillData(DataList);
        NewAction = -2;
    }

    return NewAction;
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_None);
}

function int TakeFocus(int ActionIndex, GFxObject DataList)
{
    if (DataList != none) // HACK, tell Brian to fix 13
    {
        FillData(DataList);
    }

    return 0;
}

function FillData(GFxObject DataList)
{
    local GFxObject obj;
    
    ScrollIndex = 0;
    DataCount   = 0;
    
    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_PROFILE);
    obj.SetObject("data", FillProfile());

    super.FillData(DataList);

    DataList.SetElementObject(DataCount++, obj);
}

function GFxObject FillProfile()
{
    local int length;
    local GFxObject obj;
    
    obj = CreateObject("Object");
    
    obj.SetString("pageType", "badges");
    obj.SetString("pageTitle",  Strings.Earned@Strings.Badges);
    obj.SetFloat("pageUpActionID", 999);
    obj.SetFloat("pageDownActionID", 998);

    switch (ActiveType)
    {
    case 0: FillCombatType(obj);    length = CombatType.Length; break;
    case 1: FillObjectiveType(obj); length = ObjectiveType.Length; break;
    case 2: FillVehicleType(obj);   length = VehicleType.Length; break;
    case 3: FillTacticalType(obj);  length = TacticalType.Length; break;
    case 4: FillSingleType(obj);    length = SingleType.Length; break;
    case 5: FillReferralType(obj);  length = ReferralType.Length; break;
    default: break;
    }

    if ((length - (5 * ActiveIndex)) > 5) obj.SetFloat("bAllowPageDown", 1);
    else obj.SetFloat("bAllowPageDown", 0);

    if (ActiveIndex > 0) obj.SetFloat("bAllowPageUp", 1);
    else obj.SetFloat("bAllowPageUp", 0);

    obj.SetString("pageLabel", Strings.Page@ActiveIndex+1$"/"$(length/6 + 1));

    return obj;
}

function FillCombatType(GFxObject Obj)
{
    local int i;
    local int count;
    local int badgeIndex;

    for (i = ActiveIndex * 5; i < CombatType.Length; i++)
    {
        count++;
        badgeIndex = GetHighestBadgeIndex(CombatType[i]);
        FillBadge(Obj, count, badgeIndex);
    }
}

function FillObjectiveType(GFxObject Obj)
{
    local int i;
    local int count;
    local int badgeIndex;

    for (i = ActiveIndex * 5; i < ObjectiveType.Length; i++)
    {
        count++;
        badgeIndex = GetHighestBadgeIndex(ObjectiveType[i]);
        FillBadge(Obj, count, badgeIndex);
    }
}


function FillVehicleType(GFxObject Obj)
{
    local int i;
    local int count;
    local int badgeIndex;

    for (i = ActiveIndex * 5; i < VehicleType.Length; i++)
    {
        count++;
        badgeIndex = GetHighestBadgeIndex(VehicleType[i]);
        FillBadge(Obj, count, badgeIndex);
    }
}


function FillTacticalType(GFxObject Obj)
{
    local int i;
    local int count;
    local int badgeIndex;

    for (i = ActiveIndex * 5; i < TacticalType.Length; i++)
    {
        count++;

        // Ski Speed is ugh
        if (TacticalType[i] == 28)
        {
            badgeIndex = GetHighestSkiBadgeIndex();
            FillBadge(Obj, count, badgeIndex, true);
        }
        else
        {
            badgeIndex = GetHighestBadgeIndex(TacticalType[i]);
            FillBadge(Obj, count, badgeIndex);
        }
    }
}


function FillSingleType(GFxObject Obj)
{
    local int i;
    local int count;
    local int badgeIndex;

    for (i = ActiveIndex * 5; i < SingleType.Length; i++)
    {
        count++;
        badgeIndex = GetHighestBadgeIndex(SingleType[i]);
        if(PlayerProfile.Badges[badgeIndex].Category != HIDDEN_IF_UNEARNED_TYPE || PlayerProfile.Badges[badgeIndex].Progress > 0)
        {
            FillBadge(Obj, count, badgeIndex, false, true);
        }
    }
}

function FillReferralType(GFxObject Obj)
{
    local int i;
    local int count;
    local int badgeIndex;
    local int activityId;

    for (i = ActiveIndex * 5; i < ReferralType.Length; i++)
    {
        count++;
        activityId = ReferralType[i];
        badgeIndex = GetHighestBadgeIndex(activityId);
        if(activityId == FRIEND_REFERRAL_ACTIVITY)
        {
            FillBadge(Obj, count, badgeIndex, false, false, true);
        }
        else if(PlayerProfile.Badges[badgeIndex].Category != HIDDEN_IF_UNEARNED_TYPE || PlayerProfile.Badges[badgeIndex].Progress > 0) //This should hide it if unearned.
        {
            FillBadge(Obj, count, badgeIndex, false, true);
        }
    }
}

function FillBadge(GFxObject Obj, int Count, int BadgeIndex, optional bool bSkiBadge = false, optional bool bSingle = false, optional bool bReferralBadge = false)
{
    local int tier;
    local int icon;

    if (badgeIndex >= 0)
    {
        obj.SetString("badgeItem"$Count$"Title", PlayerProfile.Badges[BadgeIndex].Title);
        obj.SetString("badgeItem"$Count$"Desc", PlayerProfile.Badges[BadgeIndex].Description);

        if (bSkiBadge)
        {
            obj.SetString("badgeItem"$Count$"Score", PlayerProfile.FastestSki$"/"$PlayerProfile.Badges[BadgeIndex].MaxValue);
            obj.SetFloat("badgeItem"$Count$"Percent", float(PlayerProfile.FastestSki)/float(PlayerProfile.Badges[BadgeIndex].MaxValue) * 100);
        }
        else
        {
            obj.SetString("badgeItem"$Count$"Score", PlayerProfile.Badges[badgeIndex].Progress$"/"$PlayerProfile.Badges[BadgeIndex].MaxValue);
            obj.SetFloat("badgeItem"$Count$"Percent", float(PlayerProfile.Badges[badgeIndex].Progress)/float(PlayerProfile.Badges[BadgeIndex].MaxValue) * 100);
        }

        tier = PlayerProfile.Badges[badgeIndex].Tier;
        icon = PlayerProfile.Badges[BadgeIndex].Icon;

        if (bSingle) tier = 1;

        if (PlayerProfile.Badges[BadgeIndex].MaxValue > 0 && (PlayerProfile.Badges[badgeIndex].Progress < PlayerProfile.Badges[BadgeIndex].MaxValue))
        {
            tier--;

            if (tier > 0)
            {
                icon++;
            }
        }

        if (tier <= 0) obj.SetFloat("badgeItem"$Count$"Gray", 1);
        else obj.SetFloat("badgeItem"$Count$"Gray", 0);
        
        obj.SetFloat("badgeItem"$Count$"Index", icon);

        if (bSingle)
        {
            if (tier > 0) obj.SetString("badgeItem"$Count$"Rank", Strings.Completed);
            else obj.SetString("badgeItem"$Count$"Rank", Strings.NotEarned);
        }
        else if(bReferralBadge)
        {   switch (tier)
            {
            case 1:  obj.SetString("badgeItem"$Count$"Rank", "RECRUITER");              break;
            case 2:  obj.SetString("badgeItem"$Count$"Rank", "FRIENDS WITH BENEFITS");  break;
            case 3:  obj.SetString("badgeItem"$Count$"Rank", "BIG TALKER");             break;
            case 4:  obj.SetString("badgeItem"$Count$"Rank", "WORD OF MOUTH");          break;
            case 5:  obj.SetString("badgeItem"$Count$"Rank", "PREMIUM RECRUITER");      break;
            case 6:  obj.SetString("badgeItem"$Count$"Rank", "SENIOR RECRUITER");       break;
            case 7:  obj.SetString("badgeItem"$Count$"Rank", "PLAY TO WIN");            break;
            case 8:  obj.SetString("badgeItem"$Count$"Rank", "MASTER RECRUITER");       break;
            case 9:  obj.SetString("badgeItem"$Count$"Rank", "HEAD TURNER");            break;
            case 10: obj.SetString("badgeItem"$Count$"Rank", "CELEBRITY");              break;
            case 11: obj.SetString("badgeItem"$Count$"Rank", "WEAPON SMITH");           break; //space added on purpose ... in game, one word has last letter wrapped to 2nd line
            case 12: obj.SetString("badgeItem"$Count$"Rank", "MADE MAN");               break;
            case 13: obj.SetString("badgeItem"$Count$"Rank", "REFERRUS MAXIMUS");       break;
            case 0:
            default: obj.SetString("badgeItem"$Count$"Rank", Strings.NotEarned);             break;
            }
        }
        else
        {
            switch (tier)
            {
            case 1:  obj.SetString("badgeItem"$Count$"Rank", "BRONZE");     break;
            case 2:  obj.SetString("badgeItem"$Count$"Rank", "SILVER");     break;
            case 3:  obj.SetString("badgeItem"$Count$"Rank", "GOLD");       break;
            case 4:  obj.SetString("badgeItem"$Count$"Rank", "OBSIDIAN");   break;
            case 0:
            default: obj.SetString("badgeItem"$Count$"Rank", Strings.NotEarned); break;
            }
        }
    }
}

function int GetHighestBadgeIndex(int ActivityId)
{
    local int i;
    local int prevBadge;
    local int nextTier;
    local int maxTier;

    prevBadge = -1;
    nextTier = 0;

    if(ActivityId == FRIEND_REFERRAL_ACTIVITY)
    {
        maxTier = 13;
    }
    else
    {
        maxTier = 4;
    }

    while (nextTier <= maxTier)
    {
        for (i = 0; i < PlayerProfile.Badges.Length; i++)
        {
            if (PlayerProfile.Badges[i].ActivityId == ActivityId)
            {
                if (PlayerProfile.Badges[i].Tier == nextTier)
                {
                    if (prevBadge < 0 || 
                       (PlayerProfile.Badges[i].MaxValue > 0 &&
                       (PlayerProfile.Badges[i].Progress >= PlayerProfile.Badges[i].MaxValue)))
                    {
                        prevBadge = i;
                    }

                    if (PlayerProfile.Badges[i].MaxValue <= 0 ||
                       (PlayerProfile.Badges[i].Progress < PlayerProfile.Badges[i].MaxValue))
                    {
                        return i;
                    }                       
                }
            }
        }
        
        nextTier++;
    }

    return prevBadge;
}

function int GetHighestSkiBadgeIndex()
{
    local int i;
    local int prevBadge;
    local int nextActId;

    prevBadge = -1;
    nextActId = 28;

    while (nextActId < 98)
    {
        for (i = 0; i < PlayerProfile.Badges.Length; i++)
        {
            if (PlayerProfile.Badges[i].ActivityId == nextActId)
            {
                if (prevBadge < 0 || 
                   (PlayerProfile.Badges[i].MaxValue > 0 &&
                   (PlayerProfile.Badges[i].Progress >= PlayerProfile.Badges[i].MaxValue)))
                {
                    prevBadge = i;
                }

                if (PlayerProfile.Badges[i].MaxValue <= 0 ||
                   (PlayerProfile.Badges[i].Progress < PlayerProfile.Badges[i].MaxValue))
                {
                    return i;
                }   
            }
        }
        
        if (nextActId == 28)
        {
            nextActId = 95;
        }
        else
        {
            nextActId++;
        }
    }

    return prevBadge;
}

function ProfileUp(int ActionIndex)
{
    ActiveIndex--;

    if (ActiveIndex < 0) ActiveIndex = 0;

    bOpeningMenu = true;
    StartMainMenu();
}

function ProfileDown(int ActionIndex)
{
    ActiveIndex++;
    
    bOpeningMenu = true;
    StartMainMenu();
}

defaultproperties
{
   CombatType(0)=3
   CombatType(1)=1
   CombatType(2)=6
   CombatType(3)=7
   CombatType(4)=8
   CombatType(5)=9
   CombatType(6)=10
   CombatType(7)=11
   CombatType(8)=15
   ObjectiveType(0)=16
   ObjectiveType(1)=17
   ObjectiveType(2)=18
   ObjectiveType(3)=19
   ObjectiveType(4)=20
   ObjectiveType(5)=21
   ObjectiveType(6)=25
   VehicleType(0)=22
   VehicleType(1)=23
   VehicleType(2)=24
   TacticalType(0)=5
   TacticalType(1)=13
   TacticalType(2)=12
   TacticalType(3)=14
   TacticalType(4)=28
   SingleType(0)=26
   SingleType(1)=27
   SingleType(2)=120
   ReferralType(0)=115
   ReferralType(1)=119
   PageLabel="BADGES"
   OptionTitles(0)="COMBAT"
   OptionTitles(1)="OBJECTIVE"
   OptionTitles(2)="VEHICLES"
   OptionTitles(3)="TACTICAL"
   OptionTitles(4)="ONE-TIMERS"
   OptionTitles(5)="REFER-A-FRIEND"
   OptionSubtext(0)="COMBAT BADGES"
   OptionSubtext(1)="OBJECTIVE  BADGES"
   OptionSubtext(2)="VEHICLE BADGES"
   OptionSubtext(3)="TACTICAL BADGES"
   OptionSubtext(4)="ONE AND DONE BADGES"
   OptionSubtext(5)="REFERRAL BADGES"
   Name="Default__GFxTrPage_Badges"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
