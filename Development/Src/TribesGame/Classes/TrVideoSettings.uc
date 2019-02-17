/**
 * 
 */
class TrVideoSettings extends GFxObject
    native;

var int       m_ResolutionCount;
var int       m_VideoSettingsCount;
var GFxObject m_ResolutionList;
var GFxObject m_VideoSettingsList;

/** Cache off settings until Apply All */
var int m_Cached_ShadowDetail;
var int m_Cached_TextureDetail;
var int m_Cached_ScreenType;
var int m_Cached_MotionBlur;
var int m_Cached_VerticalSync;
var int m_Cached_Resolution;
var int m_Cached_SmoothFramerate;

enum EVisualDetail
{
	EVQ_Off,
	EVQ_Low,
	EVQ_Med,
	EVQ_High,
	EVQ_VHigh
};

enum EAntiAliasing
{
	EAA_Off,
	EAA_1X,
	EAA_2X,
	EAA_4X,
};

enum EScreenFrameType
{
    ESFT_FullScreen,
    ESFT_Windowed,
    ESFT_Borderless,
};

enum EVideoSettingType
{
	EVST_ShadowDetail,
	EVST_TextureDetail,
	EVST_ScreenType,
	EVST_MotionBlur,
	EVST_VerticalSync,
	EVST_AntiAliasing,
	EVST_Resolution,
    EVST_SmoothFramerate,
	EVST_MAX
};

struct native ResolutionData
{
    var int ResX;
    var int ResY;
};

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native function int GetCurrentSettingValue(EVideoSettingType Type);
native function GetAllowedResolutions(out array<ResolutionData> ResolutionList);
native function ApplyVideoSettings();
native function ChangeScreenType(int Index);
native function ChangeResolution(int Index);
native function ChangeShadowDetail(int Index);
native function ChangeTextureDetail(int Index);
native function GetResolutions(out array<PropertyPair> ResolutionList);
native function SetVSync(bool bEnable);
native function SetMotionBlur(bool bEnable);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

function LoadVideoSettings(GFxObject List)
{
	local int i;
    local int val;
    local string settingName;

    m_VideoSettingsCount = 0;
    m_VideoSettingsList = List;

	for (i = 0; i < EVST_MAX; i++)
	{
        settingName = GetSettingNameFromType(EVideoSettingType(i));
        val = GetCurrentSettingValue(EVideoSettingType(i));

		AddVideoSettingToList(settingName, val);
	}
}

function AddVideoSettingToList(string SettingName, int Val)
{
    local GFxObject obj;

    obj = CreateObject("Object");           
    obj.SetString("label", SettingName);
    obj.SetFloat("value", float(Val));

    m_VideoSettingsList.SetElementObject(m_VideoSettingsCount++, obj);
}

function LoadVideoResolutions(GFxObject List)
{
    LoadResolutions(List);
}

function LoadResolutions(GFxObject List)
{
	local int i;
    local String resolutionString;
	local array<ResolutionData> resolutionList;

    m_ResolutionCount = 0;
    m_ResolutionList = List;

	GetAllowedResolutions(resolutionList);

	for (i = 0; i < resolutionList.Length; i++)
	{
        resolutionString = resolutionList[i].ResX@"x"@resolutionList[i].ResY;

        AddResolutionToList(resolutionString);
	}
}

function AddResolutionToList(string Resolution)
{
    local GFxObject obj;

    obj = CreateObject("Object");           
    obj.SetString("label", Resolution);
    obj.SetString("value", Resolution);

    m_ResolutionList.SetElementObject(m_ResolutionCount++, obj);
}

function String GetSettingNameFromType(EVideoSettingType Index)
{
    switch (Index)
    {
    case EVST_ShadowDetail:
        return "ShadowDetail";
    case EVST_TextureDetail:
        return "TextureDetail";
    case EVST_ScreenType:
        return "ScreenType";
	case EVST_MotionBlur:
        return "MotionBlur";
	case EVST_VerticalSync:
        return "VerticalSync";
	case EVST_AntiAliasing:
        return "AntiAliasing";
	case EVST_Resolution:
        return "Resolution";    
    case EVST_SmoothFramerate:
        return "FramerateSmoothing";
    default:
        break;
    }

    return "N/A";
}

function EVideoSettingType GetSettingTypeFromName(String Val)
{
    switch (Val)
    {
    case "ShadowDetail":
        return EVST_ShadowDetail;
    case "TextureDetail":
        return EVST_TextureDetail;
    case "ScreenType":
        return EVST_ScreenType;
	case "MotionBlur":
        return EVST_MotionBlur;
	case "VerticalSync":
        return EVST_VerticalSync;
	case "AntiAliasing":
        return EVST_AntiAliasing;
	case "Resolution":
        return EVST_Resolution;
    case "FramerateSmoothing":
        return EVST_SmoothFramerate;
    default:
        break;
    }

    return -1;
}

function CacheVideoSetting(int Index, int Val)
{
    switch (Index)
    {
    case EVST_ShadowDetail:
        m_Cached_ShadowDetail = Val;
        break;
    case EVST_TextureDetail:
        m_Cached_TextureDetail = Val;
        break;
    case EVST_ScreenType:
        m_Cached_ScreenType = Val;
        break;
	case EVST_MotionBlur:
        m_Cached_MotionBlur = Val;
        break;
	case EVST_VerticalSync:
        m_Cached_VerticalSync = Val;
        break;
	case EVST_Resolution:
        m_Cached_Resolution = Val;
        break;
    case EVST_SmoothFramerate:
        m_Cached_SmoothFramerate = Val;
    default:
        break;
    }
}

event int GetSmoothFramerateValue()
{
    local TrGameEngine Eng;

    Eng = TrGameEngine(class'Engine'.static.GetEngine());

    if (Eng != none)
    {
        return Eng.bSmoothFrameRate ? 1 : 0;
    }

    return 0;
}

event SetSmoothFramerateValue(int Val)
{
    local TrGameEngine Eng;

    Eng = TrGameEngine(class'Engine'.static.GetEngine());

    if (Eng != none)
    {
        Eng.bSmoothFrameRate = Val > 0 ? true : false;
        Eng.SaveConfig();
    }
}

defaultproperties
{
   m_Cached_ShadowDetail=-1
   m_Cached_TextureDetail=-1
   m_Cached_ScreenType=-1
   m_Cached_MotionBlur=-1
   m_Cached_VerticalSync=-1
   m_Cached_Resolution=-1
   m_Cached_SmoothFramerate=-1
   Name="Default__TrVideoSettings"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
