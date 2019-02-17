/**
 * 
 */
class TrRegionSettings extends GFxObject
    native;

var int       m_RegionSettingsCount;
var GFxObject m_RegionSettingsList;

var array<PropertyInfo> AvailableRegions;

native function     LoadRegions();
native function int GetPreferredSiteId();
native function     SetPreferredSiteId(int SiteId);

function LoadRegionLabels(GFxObject List)
{
    local int i;

    m_RegionSettingsCount = 0;
    m_RegionSettingsList = List;
    
    for (i = 0; i < AvailableRegions.Length; i++)
    {
        AddSetting(AvailableRegions[i].PropertyName, i+1);
    }
}

function string LoadRegionSetting()
{
    local int i;
    local int siteId;
    
    siteId = GetPreferredSiteId();
    
    for (i = 0; i < AvailableRegions.Length; i++)
    {
        if (siteId == int(AvailableRegions[i].PropertyValue))
        {
            return string(AvailableRegions[i].PropertyName);
        }
    }

    return "North America";
}

function int GetRegionIndexByName(string RegionName)
{
    local int i;
    
    for (i = 0; i < AvailableRegions.Length; i++)
    {
        if (string(AvailableRegions[i].PropertyName) == RegionName)
        {
            return i;
        }
    }

    return INDEX_NONE;
}

function int GetRegionIdAtIndex(int Index)
{
    return int(AvailableRegions[Index].PropertyValue);
}

function string GetRegionName(int SiteId)
{
    local int i;
    
    for (i = 0; i < AvailableRegions.Length; i++)
    {
        if (SiteId == int(AvailableRegions[i].PropertyValue))
        {
            return string(AvailableRegions[i].PropertyName);
        }
    }

    return "DEFAULT";
}

function SetPreferredRegion(int Index)
{
    if (AvailableRegions.Length > Index)
    {
        SetPreferredSiteId(int(AvailableRegions[Index].PropertyValue));
    }
}

event AddRegion(string RegionName, int Id, bool bCustomOnly)
{
    local int i;
    local PropertyInfo region;

    for (i = 0; i < AvailableRegions.Length; i++)
    {
         if (AvailableRegions[i].PropertyName == name(RegionName))
         {
             AvailableRegions[i].PropertyValue = string(Id);
             return;
         }
    }

    region.bModifyProperty = bCustomOnly;
    region.PropertyName = name(RegionName);
    region.PropertyValue = string(Id);

    AvailableRegions.AddItem(region);
}

function AddSetting(name RegionName, int Id)
{
    local GFxObject obj;

    obj = CreateObject("Object");           
    obj.SetString("label", string(RegionName));
    obj.SetString("value", string(Id));

    m_RegionSettingsList.SetElementObject(m_RegionSettingsCount++, obj);
}

defaultproperties
{
   Name="Default__TrRegionSettings"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
