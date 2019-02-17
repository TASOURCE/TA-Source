class TrRibbonManager extends Object within GFxTrMenuMoviePlayer;

struct RibbonData
{
    var int Id;
    var int Type;
    var int Ribbon;
};

var int PreviousXP;
var int PreviousGold;

var bool bDirty;
var bool bHaveUnlocks;
var bool bOnlyUnlocks;
var bool bHaveUpgrades;
var bool bOnlyUpgrades;

var array<RibbonData> ClassRibbons;
var array<RibbonData> TypeRibbons;
var array<RibbonData> EquipRibbons;

function CalculateRibbons(int Gold, int XP, bool bForce)
{
    local int i, j;
    local int type;
    //local int level;
    local int gpPrice;
    local int xpPrice;
    local int classId;
    local int equipId;
    //local int upgradeId;
    local RibbonData data;
    //local class<TrDevice> equip;

    if (!bEquipmentLoaded)
    {
        return;
    }

    if (!bForce && (PreviousGold == Gold && PreviousXP == XP))
    {
        return;
    }

    bHaveUnlocks = false;
    bOnlyUnlocks = true;
    bHaveUpgrades = false;
    bOnlyUpgrades = true;

    PreviousXP = XP;
    PreviousGold = Gold;

    for (i = ClassRibbons.Length; i > 0; i--) ClassRibbons.Remove(i-1, 1);
    for (i = TypeRibbons.Length; i > 0; i--) TypeRibbons.Remove(i-1, 1);
    for (i = EquipRibbons.Length; i > 0; i--) EquipRibbons.Remove(i-1, 1);

    for (i = 0; i < EquipInterface.GetClassCount(); i++)
    {
        classId = EquipInterface.GetClassId(i);

        if (!EquipInterface.IsClassOwned(ClassId))
        {
            gpPrice = EquipInterface.GetClassPrice(classId, 0);
            xpPrice = EquipInterface.GetClassPrice(classId, 1);

            if ((gpPrice > 0 && Gold >= gpPrice) || (xpPrice > 0 && XP >= xpPrice))
            {
                bHaveUnlocks = true;
                bOnlyUpgrades = false;

                data.Id = classId;
                data.Type = 0;
                data.Ribbon = 1;
                ClassRibbons.AddItem(data);
            }

            continue;
        }

        for (type = 0; type < EQP_MAX; type++)
        {
            data.Type = type;
            
            for (j = 0; j < EquipInterface.GetEquipCount(classId, type); j++)
            {
                equipId = EquipInterface.GetEquipId(classId, type, j);

                if (equipId == 0) continue;
                
                if (!EquipInterface.IsEquipOwned(classId, type, equipId))
                {
                    gpPrice = EquipInterface.GetEquipPrice(classId, type, equipId, 0);
                    xpPrice = EquipInterface.GetEquipPrice(classId, type, equipId, 1);
                    
                    if ((gpPrice > 0 && Gold >= gpPrice) || (xpPrice > 0 && XP >= xpPrice))
                    {
                        if (GetClassRibbon(classId) == 0)
                        {
                            data.Id = classId;
                            data.Ribbon = 2;
                            ClassRibbons.AddItem(data);
                        }
                        
                        if (GetTypeRibbon(classId, type) == 0)
                        {
                            data.Id = classId;
                            data.Type = type;
                            data.Ribbon = 2;
                            TypeRibbons.AddItem(data);
                        }

                        bHaveUnlocks = true;
                        bOnlyUpgrades = false;

                        data.Id = equipId;
                        data.Ribbon = 1;
                        EquipRibbons.AddItem(data);
                    }

                    continue;
                }
                // No more upgrade tabs
                /*
                equip = EquipHelper.GetEquipClass(equipId);

                if (equip == none || EquipInterface.IsEquipMaxed(classId, type, equipId) || equip.default.Upgrades.Length == 0) continue;

                level = EquipInterface.GetEquipLevel(classId, type, equipId);

                if (level > equip.default.Upgrades.Length-1) continue;

                upgradeId = equip.default.Upgrades[level].DatabaseItemId;
                
                if (upgradeId <= 0) continue;

                gpPrice = EquipInterface.GetUpgradePrice(classId, type, equipId, upgradeId, 0);
                xpPrice = EquipInterface.GetUpgradePrice(classId, type, equipId, upgradeId, 1);
                
                if ((gpPrice > 0 && Gold >= gpPrice) || (xpPrice > 0 && XP >= xpPrice))
                {
                    data.Ribbon = 3;

                    bOnlyUnlocks = false;
                    bHaveUpgrades = true;

                    if (GetClassRibbon(classId) == 0)
                    {
                        data.Id = classId;
                        ClassRibbons.AddItem(data);
                    }
                        
                    if (GetTypeRibbon(classId, type) == 0)
                    {
                        data.Id = classId;
                        TypeRibbons.AddItem(data);
                    }

                    data.Id = equipId;
                    EquipRibbons.AddItem(data);
                }*/
            }
        }
    }
}

function int GetClassRibbon(int ClassId)
{
    local int i;

    for (i = 0; i < ClassRibbons.Length; i++)
    {
        if (ClassRibbons[i].Id == ClassId) return ClassRibbons[i].Ribbon;
    }
    
    return 0;
}

function int GetTypeRibbon(int ClassId, int Type)
{
    local int i;

    for (i = 0; i < TypeRibbons.Length; i++)
    {
        if (TypeRibbons[i].Id == ClassId && TypeRibbons[i].Type == Type) return TypeRibbons[i].Ribbon;
    }

    return 0;
}

function int GetEquipRibbon(int EquipId)
{
    local int i;

    for (i = 0; i < EquipRibbons.Length; i++)
    {
        if (EquipRibbons[i].Id == EquipId) return EquipRibbons[i].Ribbon;
    }

    return 0;
}

defaultproperties
{
   Name="Default__TrRibbonManager"
   ObjectArchetype=Object'Core.Default__Object'
}
