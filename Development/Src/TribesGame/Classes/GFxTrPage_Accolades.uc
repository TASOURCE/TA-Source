class GFxTrPage_Accolades extends GFxTrPage;



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

var int AccoladeType;

function Initialize()
{
    AddActionSet(none, 0, "GENERAL");
    AddActionSet(none, 0, "COMBAT");
    AddActionSet(none, 0, "FLAG");
    AddActionSet(none, 0, "OBJECTIVE");
    AddActionSet(none, 0, "SPREES");
    AddActionSet(none, 0, "MULTIKILL");
    AddActionSet(none, 0, "ARENA");
}

function SpecialAction(GFxTrAction Action)
{
    NewAction = 0;
    ActiveIndex = Action.ActionIndex;

    if (Action.ActionString == "GENERAL")
    {
        AccoladeType = ACO_TYPE_GENERAL;
    }
    else if (Action.ActionString == "COMBAT")
    {
        AccoladeType = ACO_TYPE_COMBAT;
    }
    else if (Action.ActionString == "FLAG")
    {
        AccoladeType = ACO_TYPE_FLAG;
    }
    else if (Action.ActionString == "OBJECTIVE")
    {
        AccoladeType = ACO_TYPE_OBJECTIVE;
    }
    else if (Action.ActionString == "SPREES")
    {
        AccoladeType = ACO_TYPE_SPREES;
    }
    else if (Action.ActionString == "MULTIKILL")
    {
        AccoladeType = ACO_TYPE_MULTIKILL;
    }
    else if (Action.ActionString == "ARENA")
    {
        AccoladeType = ACO_TYPE_ARENA;
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
    obj.SetObject("data", FillAccolades());

    super.FillData(DataList);

    DataList.SetElementObject(DataCount++, obj);
}

function GFxObject FillAccolades()
{
    local int i;
    local int count;
    local GFxObject obj;
    
    obj = CreateObject("Object");

    obj.SetString("pageType", "accolades");
    obj.SetString("pageTitle", Strings.Accolades@Strings.Earned);
    obj.SetFloat("bAllowPageUp", 1);
    obj.SetFloat("pageUpActionID", 999);
    obj.SetFloat("bAllowPageDown", 1);
    obj.SetFloat("pageDownActionID", 998);
    obj.SetString("pageLabel", Strings.Page@"1/1");
    obj.SetString("subcategoryLabel", Strings.Category$":"@OptionTitles[ActiveIndex]);

    for (i = 0; i < PlayerProfile.Accolades.Length; i++)
    {
        if (PlayerProfile.Accolades[i].Type == AccoladeType)
        {
            count++;
            obj.SetObject("accoladeItem"$count, FillAccolade(PlayerProfile.Accolades[i]));
        }
    }

    obj.SetFloat("accoladeLength", count);

    return obj;
}

function GFxObject FillAccolade(AccoladeStruct Accolade)
{
    local GFxObject obj;
    local class<TrAccolade> accoladeClass;

    accoladeClass = GetAccoladeClass(Accolade.AccoladeId);

    if (accoladeClass == none) return none;

    obj = CreateObject("Object");

    obj.SetFloat("accoladeIndex", accoladeClass.default.IconIndex);
    obj.SetString("accoladeRank", "");
    obj.SetString("accoladeCount", "x"$Accolade.Value);
    obj.SetString("accoladeName", Caps(accoladeClass.default.FriendlyName));
    obj.SetString("accoladeDesc", Caps(accoladeClass.default.Description));
    obj.SetString("accoladeRankDesc", "");

    return obj;
}

function class<TrAccolade> GetAccoladeClass(int AccoladeId)
{
    local int i;
    local class<TrAccolade> accoladeClass;
    local class<TrAccoladeList> accoladeList;

	accoladeList = class<TrAccoladeList>(DynamicLoadObject("TribesGame.TrAccoladeList", class'Class'));

	if (accoladeList != none)
	{
        for (i = 0; i < accoladeList.default.AccoladeList.Length; i++)
        {
	        accoladeClass = class<TrAccolade>(DynamicLoadObject("TribesGame."$accoladeList.default.AccoladeList[i], class'Class'));

            if (accoladeClass.default.DatabaseId == AccoladeId) return accoladeClass;
        }
	}

    return none;
}

defaultproperties
{
   PageLabel="ACCOLADES"
   OptionTitles(0)="GENERAL"
   OptionTitles(1)="COMBAT"
   OptionTitles(2)="FLAG"
   OptionTitles(3)="OBJECTIVE"
   OptionTitles(4)="SPREE"
   OptionTitles(5)="MULTIKILL"
   OptionTitles(6)="ARENA"
   OptionSubtext(0)="GENERIC ACCOLADES"
   OptionSubtext(1)="COMBAT ACCOLADES"
   OptionSubtext(2)="FLAG TYPE ACCOLADES"
   OptionSubtext(3)="OBJECTIVE TYPE ACCOLADES"
   OptionSubtext(4)="KILLING SPREE ACCOLADES"
   OptionSubtext(5)="MUTLIKILL ACCOLADES"
   OptionSubtext(6)="ARENA SPECIFIC ACCOLADES"
   Name="Default__GFxTrPage_Accolades"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
