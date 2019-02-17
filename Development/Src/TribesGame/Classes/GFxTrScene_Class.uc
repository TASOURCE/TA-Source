class GFxTrScene_Class extends GFxTrScene;
    /*native;

var int        ActiveClassId;
var int        GFxObjectCount;
var GFxObject  GFxObjectList;

var bool       m_bClassVendorLoaded;
var bool       m_bSkillVendorLoaded;

/** Id used for paper doll. */
var int        m_nPaperDollClassId;
var bool       m_bIsClassScreenShowing;

var Actor       m_ModelHolder;
var TrPaperDoll m_PaperDoll;


struct native GFxPerkStruct
{
    var int    ItemId;
    var int    IconId;
    var int    UnlockClassId;
    var bool   bOwned;
    var string PerkName;
    var string Description;
};

struct native GFxSkillStruct
{
    var int    Cost;
    var int    VendorItemId;
    var int    DatabaseItemId;
    var int    ParentIndex;
    var int    IconId;
    var bool   bOwned;
    var bool   bAvailable;
    var string SkillName;
};

struct native GFxClassStruct
{
    var int    ClassId;
    var int    ClassXP;

    var int    SaleType;
    var int    GPPurchasePrice;
    var int    HPPurchasePrice;
    var int    VendorItemIdPurchase;

    var bool   bOwned;
    var bool   bRented;
    var bool   bActive;
    var bool   bShimmer;

    var int    Perk1ItemId;
    var int    Perk2ItemId;

    var class<TrFamilyInfo>   FamilyInfo;
    var array<GFxSkillStruct> SkillTree;
};

var array<GFxPerkStruct>  m_PerkList;
var array<GFxClassStruct> m_CharClassList;

native function FlushClassData();
native function ReadProfileCharClasses();
native function SaveActivePerks(int ClassId, int PerkOneId, int PerkTwoId);
native function bool RequestClassPurchase(int ClassId, int Type);
native function bool RequestSkillPurchase(int ClassId, int SkillItemId);
native function int  GetSkillTreeMask(int ClassId);
native function int  GetPerkId(int ClassId, int SlotId);

native function int ReadActiveCharClass();
native function WriteActiveCharClass(int ClassId);

cpptext
{
    void ReadActiveCharClasses(CMarshal* pMarshal);
    void ReadClassVendorData();
    void ReadSkillVendorData();
    void RequestClassVendorData();
}

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();

    InitializeGFxPerkList();
    InitializeGFxClassList();

    bSceneCreated = true;
}

event bool CheckLoadComplete()
{
    if (m_bClassVendorLoaded && m_bSkillVendorLoaded)
    {
        return true;
    }

    return false;
}

/*********************************************************************************************
 * Class-related functions
 * *******************************************************************************************/

/**
 * Populate m_CharClassList with initial values for all classes available.
 * 
 * Later, we will iterate through each class after the players' profile is loaded on login
 * to set the owned and rented flags, and fill in the price and loot id's when the store is created
 */
function InitializeGFxClassList()
{
    local int i;
    local int j;
    local GFxSkillStruct newSkill;
    local GFxClassStruct newCharClass;
    local class<TrFamilyInfoList> InfoList;

    newSkill.bAvailable     = false;
    newSkill.bOwned         = false;
    newSkill.Cost           = -1;
    newSkill.VendorItemId   = -1;
    newSkill.SkillName      = "";
    newSkill.IconId         = -1;

	InfoList = class<TrFamilyInfoList>(DynamicLoadObject("TribesGame.TrFamilyInfoList", class'Class'));

    for (i = 0; i < InfoList.default.ClassList.Length; i++)
    {
        newCharClass.FamilyInfo = class<TrFamilyInfo>(DynamicLoadObject("TribesGame."$InfoList.default.ClassList[i], class'Class'));
        newCharClass.ClassId = newCharClass.FamilyInfo.default.ClassId;

        for (j = newCharClass.SkillTree.Length; j > 0; j--)
        {
            newCharClass.SkillTree.Remove(j-1, 1);
        }

        for (j = 0; j < newCharClass.FamilyInfo.default.m_SkillGrid.Length; j++)
        {
            newSkill.IconId = newCharClass.FamilyInfo.default.m_SkillGrid[j].IconId;
            newSkill.SkillName = newCharClass.FamilyInfo.default.m_SkillNodeNames[j];
            newSkill.ParentIndex = newCharClass.FamilyInfo.default.m_SkillGrid[j].ParentIndex;
            newSkill.DatabaseItemId = newCharClass.FamilyInfo.default.m_SkillGrid[j].ValueModifier.DatabaseItemId;

            newCharClass.SkillTree.AddItem(newSkill);
        }

        m_CharClassList.AddItem(newCharClass);
    }
}

function InitializeGFxPerkList()
{
    local int i;
    local GFxPerkStruct newPerk;
    local class<TrPerk> perkClass;
    local class<TrPerkList> AllPerkList;

	AllPerkList = class<TrPerkList>(DynamicLoadObject("TribesGame.TrPerkList", class'Class'));

    for (i = 0; i < AllPerkList.default.PerkList.Length; i++)
    {
        perkClass = class<TrPerk>(DynamicLoadObject("TribesGame."$AllPerkList.default.PerkList[i], class'Class'));

        newPerk.IconId = perkClass.default.IconId;
        newPerk.ItemId = perkClass.default.DatabaseItemId;
        newPerk.bOwned = perkClass.default.m_bFree;
        newPerk.PerkName = perkClass.default.FriendlyName;
        newPerk.Description = perkClass.default.Description;    
        newPerk.UnlockClassId = perkClass.default.m_UnlockClassId;

        m_PerkList.AddItem(newPerk);
    }
}

function LoadGFxClassData(GFxObject List)
{
    GFxObjectCount = 0;
    GFxObjectList = List;

    if (GFxObjectList != none)
    {
        // Read our online profile to see what we own
        ReadProfileCharClasses();
            
        // Load the classes and their family data into the GFx object
        LoadGFxClasses();

        // Set the active class to whatever last used (or default)
        LoadGFxActiveClass();
    }
}

function LoadGFxClasses()
{
    local int i;

    m_CharClassList.Sort(ArmorSort);

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].bActive && m_CharClassList[i].bOwned)
        {
            LoadGFxClass(i);
        }
    }

    m_CharClassList.Sort(PriceSort);
    
    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].bActive && !m_CharClassList[i].bOwned)
        {
            LoadGFxClass(i);
        }
    }
}

delegate int PriceSort(GFxClassStruct A, GFxClassStruct B) { return (A.GPPurchasePrice > B.GPPurchasePrice) ? -1 : 0; }
delegate int ArmorSort(GFxClassStruct A, GFxClassStruct B) { return (GetArmorTypeFromClass(A.FamilyInfo) > GetArmorTypeFromClass(B.FamilyInfo)) ? -1 : 0; }

function LoadGFxActiveClass()
{
    if (ActiveClassId == 0 || !ClassIsAvailable(ActiveClassId))
    {
        if (ClassIsAvailable(TrOuter.m_User.m_ClassId))
        {
            ActiveClassId = TrOuter.m_User.m_ClassId;
        }
        else
        {
            ActiveClassId = 1693;
        }
    }

    // Update the UI
    TrOuter.ASC_UpdateClassSlot(0, ActiveClassId);
}

function LoadGFxClassDevices(int ClassId, GFxObject List)
{
    local int i;
    local class<TrDevice> DeviceClass;
    local class<TrFamilyInfo> FamilyInfo;

    FamilyInfo = GetFamilyInfoFromId(ClassId);

    if (FamilyInfo == none) return;
    
    GFxObjectCount = 0;
    GFxObjectList = List;

    if (GFxObjectList != none)
    {
        // Hack to show armor type in the temp menu
        AddDevice(-1, Caps(GetArmorStringFromClass(FamilyInfo))@"ARMOR");
        
	    for (i = 0; i < FamilyInfo.default.DevSelectionList.Length; i++)
	    {
		    DeviceClass = FamilyInfo.default.DevSelectionList[i].DeviceClass;

            if (IsValidEquipPoint(FamilyInfo.default.DevSelectionList[i].EquipPoint))
            {
		        AddDevice(DeviceClass.default.DBWeaponId, Caps(DeviceClass.default.ItemName));
            }
	    }
    }
}

/**
 * This function loads the values for the UI to show from each class type
 */
function LoadGFxClass(int Index)
{
    local int i;
    local int classXP;
    local int perk1Index;
    local int perk2Index;
    local int ownedSkills;
    local int totalSkills;
    local int deviceCount;
    local string deviceString;
    local GFxObject obj;
    local class<TrDevice> DeviceClass;

    if (Index < 0 || Index >= m_CharClassList.Length)
    {
        return;
    }

    classXP = TrOuter.GetCurrentPoints(m_CharClassList[Index].ClassId);
    
    obj = Outer.CreateObject("Object");
    obj.SetFloat("classId", m_CharClassList[Index].ClassId);
    obj.SetFloat("classXP", classXP);
    obj.SetString("className", m_CharClassList[Index].FamilyInfo.default.FriendlyName);
    obj.SetFloat("armorType", GetArmorTypeFromClass(m_CharClassList[Index].FamilyInfo));
    obj.SetString("classBlurb", m_CharClassList[Index].FamilyInfo.default.ClassDescription);

    obj.SetFloat("price1", GetClassPrice(m_CharClassList[Index].ClassId, 1));
    obj.SetFloat("price2", GetClassPrice(m_CharClassList[Index].ClassId, 2));
    obj.SetFloat("price3", GetClassPrice(m_CharClassList[Index].ClassId, 3));

    if (m_CharClassList[Index].bOwned)
    {
        perk1Index = GetPerkIndex(m_CharClassList[Index].Perk1ItemId);
        perk2Index = GetPerkIndex(m_CharClassList[Index].Perk2ItemId);
    }
    else
    {
        perk1Index = GetPerkIndexByClass(m_CharClassList[Index].ClassId, 1);
        perk2Index = GetPerkIndexByClass(m_CharClassList[Index].ClassId, 2);
    }

    if (perk1Index >= 0)
    {    
        obj.SetFloat("perk1Item", m_PerkList[perk1Index].ItemId);
        obj.SetFloat("perk1Icon", m_PerkList[perk1Index].IconId);
        obj.SetString("perk1Name", m_PerkList[perk1Index].PerkName);
        obj.SetString("perk1Description", m_PerkList[perk1Index].Description);
    }
        
    if (perk2Index >= 0)
    {    
        obj.SetFloat("perk2Item", m_PerkList[perk2Index].ItemId);
        obj.SetFloat("perk2Icon", m_PerkList[perk2Index].IconId);
        obj.SetString("perk2Name", m_PerkList[perk2Index].PerkName);
        obj.SetString("perk2Description", m_PerkList[perk2Index].Description);
    }
    
    deviceCount = 1;

	for (i = 0; i < m_CharClassList[Index].FamilyInfo.default.DevSelectionList.Length; i++)
	{
		DeviceClass = m_CharClassList[Index].FamilyInfo.default.DevSelectionList[i].DeviceClass;

        if (IsValidEquipPoint(m_CharClassList[Index].FamilyInfo.default.DevSelectionList[i].EquipPoint))
        {
            deviceString = "Device"$deviceCount;
            obj.SetString(deviceString, Caps(DeviceClass.default.ItemName));
            deviceCount++;
        }
	}

    ownedSkills = GetSkillCount(m_CharClassList[Index].ClassId, true);
    totalSkills = GetSkillCount(m_CharClassList[Index].ClassId, false);

    obj.SetString("unlockSeries", ownedSkills$"/"$totalSkills);
    obj.SetFloat("bHasUnlocks", IsAnySkillPurchasable(m_CharClassList[Index].ClassId, TrOuter.GetCurrentPoints(m_CharClassList[Index].ClassId)) ? 1 : 0);
    obj.SetFloat("mastered", (totalSkills > 0 && ownedSkills == totalSkills) ? 1 : 0);

    obj.SetFloat("rangeBar",        m_CharClassList[Index].FamilyInfo.default.Stat_Range);
    obj.SetFloat("controlBar",      m_CharClassList[Index].FamilyInfo.default.Stat_Mobility);
    obj.SetFloat("antiarmorBar",    m_CharClassList[Index].FamilyInfo.default.Stat_AntiArmor);
    obj.SetFloat("durabilityBar",   m_CharClassList[Index].FamilyInfo.default.Stat_Durability);
    obj.SetFloat("difficultyBar",   m_CharClassList[Index].FamilyInfo.default.Stat_Difficulty);

    if (ClassIsAvailable(m_CharClassList[Index].ClassId))
    {
        obj.SetString("owned", "true");
        obj.SetFloat("ribbonType", -1);
        obj.SetFloat("bShimmer", 0);
    }
    else
    {
        obj.SetString("owned", "false");

        if (ClassIsAffordable(m_CharClassList[Index].ClassId))
        {
            obj.SetFloat("ribbonType", 4);
            obj.SetFloat("bShimmer", int(m_CharClassList[Index].bShimmer));
        }
        else if (m_CharClassList[Index].ClassId == CLASS_TYPE_LIGHT_PATHFINDER ||
            m_CharClassList[Index].ClassId == CLASS_TYPE_HEAVY_JUGGERNAUGHT)
        {
            obj.SetFloat("ribbonType", 3);
            obj.SetFloat("bShimmer", 0);
        }
        else 
        {
            obj.SetFloat("ribbonType", -1);
            obj.SetFloat("bShimmer", 0);
        }
    }

    if (GFxObjectList != none)
    {
        GFxObjectList.SetElementObject(GFxObjectCount++, obj);
    }
}

function bool RequestActiveClass(int SlotId, int ClassId)
{
    local TrPlayerController TrPC;

	UpdatePaperDoll(ClassId);

    if (ActiveClassId == ClassId)
    {        
        return true;
    }

    TrPC = TrPlayerController(GetPC());

    if (ClassIsAvailable(ClassId) || TrPC.InTraining())
    {
        ActiveClassId = ClassId;
        RegisterActiveClass();
    }

    return true;
}

function OnOpened()
{
	if( m_bIsClassScreenShowing )
	{
		UpdatePaperDoll(m_nPaperDollClassId == INDEX_NONE ? ActiveClassId : m_nPaperDollClassId);
	}
}

function OnClosed()
{
	if( m_bIsClassScreenShowing )
	{
		UpdatePaperDoll(INDEX_NONE);
	}
}

function bool OnShowClassScreen(bool bShow)
{
	m_bIsClassScreenShowing = bShow;

	if( TrOuter.bMovieIsOpen )
	{
		return UpdatePaperDoll( bShow ? (m_nPaperDollClassId == INDEX_NONE ? ActiveClassId : m_nPaperDollClassId) : INDEX_NONE);
	}

    return false;
}

function bool UpdatePaperDoll(int ClassId)
{
	/*
    local TrPlayerController TrPC;
	local class<TrFamilyInfo> FIClass;

    TrPC = TrPlayerController(GetPC());

	if (TrPC == none)
	{
        return false;
	}

	if( ClassId != INDEX_NONE )
	{
		FIClass = TrPC.GetFamilyInfoFromId(ClassId);
        m_nPaperDollClassId = ClassId;
	}

	// Commented this out because we now need to pass in the weapon class --Mick
	//TrPC.UpdatePaperDoll(FIClass);
*/
    return true;
}

function RemovePaperDoll()
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (TrPC != none)
    {
        TrPC.m_PaperDoll = none;
        m_bIsClassScreenShowing = false;
    }
}

/**
 * This function sets our class selection locally and updates the UI as well.
 */
function RegisterActiveClass()
{
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    // Update the UI
    TrOuter.ASC_UpdateClassSlot(0, ActiveClassId);

    TrOuter.m_User.SaveClassId(ActiveClassId);
    
    if (TrPC != none)
    {
        // Update the pending armor and weapons for the in-game player
        TrPC.RegisterPendingClass(ActiveClassId);
    }
}

function int GetClassPrice(int ClassId, int Type)
{
    local int i;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            switch (Type)
            {
            case 1:
                return -1;//m_CharClassList[i].GPRentPrice;
            case 2:
                return m_CharClassList[i].GPPurchasePrice;
            case 3:
                return m_CharClassList[i].HPPurchasePrice;
            default:
                break;
            }
        }
    }

    return 0;
}

function bool CheckForAffordableClasses()
{
    local int i;
    local int bitMask;
    local int classBit;
    local int classIcon;
    local int bitCompare;
    local int newClassAffordCount;
    local string className;
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());
    
    for (i = 0; i < m_CharClassList.Length; i++)
    {
        classBit = TrPC.GetClassBit(m_CharClassList[i].ClassId);
        bitCompare = TrOuter.m_PlayerProfile.InfoMask & classBit;

        if (ClassIsAffordable(m_CharClassList[i].ClassId) && bitCompare == 0)
        {
            m_CharClassList[i].bShimmer = true;

            newClassAffordCount++;

            if (classIcon == 0)
            {
                classIcon = m_CharClassList[i].FamilyInfo.default.m_IconId;
                className = m_CharClassList[i].FamilyInfo.default.FriendlyName;
            }

            bitMask += classBit;
        }
    }

    if (newClassAffordCount > 0)
    {
        if (newClassAffordCount > 1)
        {
            TrOuter.NewClassAffordable("NEW CLASSES", classIcon);
        }
        else
        {
            TrOuter.NewClassAffordable(className, classIcon);
        }
            
        // Hate doing it this way, but tell the server we have seen this class(es)
        TrPlayerController(GetPC()).ServerSetClassAffordable(bitMask);   

        return true;
    }

    return false;
}

function bool ClassIsAffordable(int ClassId)
{
    local int i;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId && !m_CharClassList[i].bOwned && m_CharClassList[i].bActive)
        {
            return (TrOuter.m_PlayerProfile.Tokens >= m_CharClassList[i].GPPurchasePrice);
        }
    }

    return false;
}

function bool ClassIsAvailable(int ClassId)
{
    local int i;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            return (m_CharClassList[i].bOwned || m_CharClassList[i].bRented);
        }
    }

    return false;
}

function int GetClassIconId(int ClassId)
{
    local int i;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            return m_CharClassList[i].FamilyInfo.default.m_IconId;
        }
    }

    return 0;
}

function AddDevice(int DeviceId, string DeviceName)
{
    local GFxObject obj;

    obj = Outer.CreateObject("Object");
    obj.SetFloat("deviceId", DeviceId);
    obj.SetString("deviceName", DeviceName);
    obj.setFloat("iconId", 0);

    GFxObjectList.SetElementObject(GFxObjectCount++, obj);
}

function int GetArmorTypeFromClass(class<TrFamilyInfo> FamilyInfo)
{
    if (ClassIsChildOf(FamilyInfo, class'TrFamilyInfo_Light')) return 1;
    else if (ClassIsChildOf(FamilyInfo, class'TrFamilyInfo_Heavy')) return 3;
    else return 2;
}

function string GetArmorStringFromClass(class<TrFamilyInfo> FamilyInfo)
{
    if (ClassIsChildOf(FamilyInfo, class'TrFamilyInfo_Light')) return "Light Armor";
    else if (ClassIsChildOf(FamilyInfo, class'TrFamilyInfo_Heavy')) return "Heavy Armor";
    else return "Medium Armor";
}

function bool IsValidEquipPoint(int eqp)
{
	switch (eqp)
	{
	case EQP_Primary:
	case EQP_Secondary:
	case EQP_Pack:
	case EQP_Belt:
	case EQP_Deployable:
        return true;
    default:
        return false;
	}

	return false;
}

function class<TrFamilyInfo> GetFamilyInfoFromId(int ClassId)
{
    local int i;
    local class<TrFamilyInfo> FamilyInfo;
    local class<TrFamilyInfoList> InfoList;

	InfoList = class<TrFamilyInfoList>(DynamicLoadObject("TribesGame.TrFamilyInfoList", class'Class'));

    for (i = 0; i < InfoList.default.ClassList.Length; i++)
    {
	    FamilyInfo = class<TrFamilyInfo>(DynamicLoadObject("TribesGame."$InfoList.default.ClassList[i], class'Class'));

        if (FamilyInfo.default.ClassId == ClassId) return FamilyInfo;
    }

    return none;
}

event PurchasedClass(int VendorItemId, bool bSuccess, string Message)
{
    local int i;

    if (!bSuccess)
    {
        if (Message == "")
        {
            // Fall back message.
            Message = "You do not have enough points to complete this transaction.";
        }

        TrOuter.ASC_PurchaseComplete(false, Message);
        return;
    }

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].VendorItemIdPurchase == VendorItemId)
        {
            ActiveClassId = m_CharClassList[i].FamilyInfo.default.ClassId;
            RegisterActiveClass();

            TrOuter.ASC_PurchaseComplete(true, "");
            TrOuter.MenuSounds.SoundPurchaseClass();
            TrOuter.ASC_UnlockedItem(Caps(m_CharClassList[i].FamilyInfo.default.FriendlyName), "UNLOCKED", "classIcons", m_CharClassList[i].FamilyInfo.default.m_IconId);
            TrOuter.FillProfileData();
            return;
        }
    }

    TrOuter.ASC_PurchaseComplete(false, "Unknown request. Please try again.");
}

function int GetLowestClassPrice()
{
    local int i;
    local int classPrice;

    classPrice = -1;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].bOwned || !m_CharClassList[i].bActive)
        {
            continue;
        }

        if (classPrice == -1 || (m_CharClassList[i].GPPurchasePrice < classPrice))
        {
            classPrice = m_CharClassList[i].GPPurchasePrice;
        }
    }

    return classPrice;
}

function string GetClassName(int ClassId)
{
    local int i;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            return m_CharClassList[i].FamilyInfo.default.FriendlyName;
        }
    }

    return "Class";
}

function int GetClassColor(int ClassId)
{
    local int i;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            return m_CharClassList[i].FamilyInfo.default.m_IconColor;
        }
    }

    return 1;
}

function int GetClassCount(bool bUnlockOnly)
{
    local int i;
    local int count;
    local GFxClassStruct myClass;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        myClass = m_CharClassList[i];

        if (!myClass.bActive)
        {
            continue;
        }

        if (!bUnlockOnly)
        {
            count++;
        }
        else if (myClass.bOwned)
        {
            count++;
        }
    }
    
    return count;
}

/*********************************************************************************************
 * Skill-related functions
 * *******************************************************************************************/

function LoadGFxClassSkills(int ClassId, GFxObject List)
{
    local int i;
    local int parentIndex;
    local int parentItemId;
    local GFxSkillStruct skill;
    local class<TrFamilyInfo> FamilyInfo;

    GFxObjectCount = 0;
    GFxObjectList = List;

    FamilyInfo = GetFamilyInfoFromId(ClassId);

    if (FamilyInfo == none)
    {
        return;
    }
    
	for (i = 0; i < FamilyInfo.default.m_SkillGrid.Length; i++)
	{
        skill = GetClassSkill(ClassId, i);
        parentIndex = FamilyInfo.default.m_SkillGrid[i].ParentIndex;
        parentItemId = -1;

        if (parentIndex >= 0)
        {
            parentItemId = FamilyInfo.default.m_SkillGrid[parentIndex].ValueModifier.DatabaseItemId;
        }

        AddSkill(FamilyInfo.default.m_SkillGrid[i].ValueModifier.DatabaseItemId,
                 FamilyInfo.default.m_SkillGrid[i].IconId,
                 FamilyInfo.default.m_SkillNodeNames[i],
                 FamilyInfo.default.m_SkillNodeShortDescriptions[i],
                 FamilyInfo.default.m_SkillNodeDescriptions[i],
                 FamilyInfo.default.m_SkillGrid[i].IconPosX,
                 FamilyInfo.default.m_SkillGrid[i].IconPosY,
                 parentItemId,
                 skill.Cost,
                 !skill.bOwned,
                 skill.bAvailable);
	}
}

function GFxSkillStruct GetClassSkill(int ClassId, int Index)
{
    local int i;
    local GFxSkillStruct skill;

    skill.Cost = -1;
    skill.bOwned = false;
    skill.bAvailable = false;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            if (Index >= 0 && Index < m_CharClassList[i].SkillTree.Length)
            {
                skill.Cost = m_CharClassList[i].SkillTree[Index].Cost;
                skill.bOwned = m_CharClassList[i].SkillTree[Index].bOwned;
                skill.bAvailable = m_CharClassList[i].SkillTree[Index].bAvailable;
            }

            break;
        }
    }

    return skill;
}

function AddSkill(int DatabaseItemId, int IconId, string NodeName, string ShortDesc, string LongDesc, int XPos, int YPos, int ParentNode, int Cost, bool bLocked, bool bAvailable)
{
    local GFxObject obj;

    obj = Outer.CreateObject("Object");
    obj.SetString("nodeName", NodeName);
    obj.SetString("shortDesc", ShortDesc);
    obj.SetString("longDesc", LongDesc);
    obj.SetFloat("itemId", DatabaseItemId);
    obj.SetFloat("iconId", IconId);
    obj.SetFloat("xPos", XPos);
    obj.SetFloat("yPos", YPos);
    obj.SetFloat("parentNode", ParentNode);
    obj.SetFloat("cost", Cost);
    obj.SetFloat("bLocked", int(bLocked));
    obj.SetFloat("bAvailable", int(bAvailable));
    obj.SetFloat("bPerk", int(IsAPerk(DatabaseItemId)));
    
    GFxObjectList.SetElementObject(GFxObjectCount++, obj);
}

event PurchasedSkill(int VendorItemId, bool bSuccess, optional string Message)
{
    local int i;
    local int j;
    local int ownedSkills;
    local int totalSkills;
    local bool bFound;

    if (!bSuccess)
    {
        if (Message == "")
        {
            Message = "You do not have enough points to complete this transaction.";
        }

        TrOuter.ASC_PurchaseComplete(false, Message);
        return;
    }

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        for (j = 0; j < m_CharClassList[i].SkillTree.Length; j++)
        {
            if (m_CharClassList[i].SkillTree[j].VendorItemId == VendorItemId)
            {
                bFound = true;

                m_CharClassList[i].SkillTree[j].bOwned = true;

                TrOuter.ASC_PurchaseComplete(true, "");

                if (IsAPerk(VendorItemId))
                {
                    TrOuter.ASC_UnlockedItem(m_CharClassList[i].FamilyInfo.default.m_SkillNodeNames[j], "UNLOCKED", "perkIcon", m_CharClassList[i].FamilyInfo.default.m_SkillGrid[j].IconId);
                    TrOuter.MenuSounds.SoundPurchasePerk();
                }
                else
                {
                    TrOuter.ASC_UnlockedItem(m_CharClassList[i].FamilyInfo.default.m_SkillNodeNames[j], "UNLOCKED", "skillIcons", m_CharClassList[i].FamilyInfo.default.m_SkillGrid[j].IconId);
                    TrOuter.MenuSounds.SoundPurchaseSkill();
                }

                ownedSkills = GetSkillCount(m_CharClassList[i].ClassId, true);
                totalSkills = GetSkillCount(m_CharClassList[i].ClassId, false);

                // Mastered baby!
                if (totalSkills > 0 && ownedSkills == totalSkills)
                {
                    TrOuter.ASC_UnlockedItem("YOU HAVE MASTERED", CAPS(m_CharClassList[i].FamilyInfo.default.FriendlyName), "classIcons", m_CharClassList[i].FamilyInfo.default.m_IconId);
                    TrOuter.ASC_ProfileUpdated();
                }

                break;
            }
        }
    }

    if (!bFound)
    {
        TrOuter.PurchaseFailed();
    }
}

function GFxSkillStruct GetNextLowestSkill(int ClassId, int MinSearchCost)
{
    local int i;
    local int classIndex;
    local int skillPrice;
    local GFxSkillStruct skill;
    local GFxSkillStruct maxSkill;
    local GFxSkillStruct nextSkill;

    maxSkill.Cost = -1;
    nextSkill.Cost = -1;
    skillPrice = -1;
    classIndex = -1;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            classIndex = i;
        }
    }

    if (classIndex >= 0)
    {
        for (i = 0; i < m_CharClassList[classIndex].SkillTree.Length; i++)
        {
            skill = m_CharClassList[classIndex].SkillTree[i];

            if (skill.bOwned || !skill.bAvailable)
            {
                continue;
            }

            // Save off the max in case the player is over all available skills (purchase one already!)
            if (skill.Cost > maxSkill.Cost)
            {
                maxSkill = skill;
            }

            if (skill.Cost <= MinSearchCost)
            {
                continue;
            }

            if (skillPrice == -1)
            {
                nextSkill = skill;
                skillPrice = skill.Cost;
                continue;
            }

            if (skill.Cost < skillPrice)
            {
                nextSkill = skill;
                skillPrice = skill.Cost;
            }
        }
    }

    if (nextSkill.Cost > 0)
    {
        return nextSkill;
    }

    return maxSkill;
}

function int GetSkillCount(int ClassId, bool bUnlockOnly)
{
    local int i;
    local int count;
    local GFxClassStruct myClass;
    local GFxSkillStruct mySkill;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            myClass = m_CharClassList[i];

            if (!bUnlockOnly)
            {
                return myClass.SkillTree.Length;
            }

            for (i = 0; i < myClass.SkillTree.Length; i++)
            {
                mySkill = myClass.SkillTree[i];

                if (mySkill.bOwned)
                {
                    count++;
                }
            }

            break;
        }
    }
    
    return count;
}

function int GetUnlocksAvailable(int ClassId, int MinSearchCost)
{
    local int i;
    local int j;
    local int count;
    local GFxClassStruct myClass;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            myClass = m_CharClassList[i];

            for (j = 0; j < myClass.SkillTree.Length; j++)
            {
                if (!myClass.SkillTree[j].bOwned && myClass.SkillTree[j].bAvailable && myClass.SkillTree[j].Cost < MinSearchCost)
                {
                    count++;
                }
            }

            break;
        }
    }

    return count;
}

function bool IsAnySkillPurchasable(int ClassId, int ClassXP)
{
    local int i;
    local int j;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            for (j = 0; j < m_CharClassList[i].SkillTree.Length; j++)
            {
                if (!m_CharClassList[i].SkillTree[j].bOwned && m_CharClassList[i].SkillTree[j].bAvailable &&
                     m_CharClassList[i].SkillTree[j].Cost <= ClassXP)
                {
                    return true;
                }
            }

            break;
        }
    }

    return false;
}

function bool HaveBoughtASingleSkill()
{
    local int i;
    local int j;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (!m_CharClassList[i].bOwned)
        {
            continue;
        }

        for (j = 0; j < m_CharClassList[i].SkillTree.Length; j++)
        {
            if (m_CharClassList[i].SkillTree[j].bOwned)
            {
                return true;
            }
        }
    }

    return false;
}

function GetSkillOptions(GFxObject Options, int ClassId, int SkillItemId)
{
    local int i;
    local int classXP;
    local bool bFound;
    local GFxClassStruct pClass;
    local GFxSkillStruct pSkill;
    
    bFound = false;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            pClass = m_CharClassList[i];
            bFound = true;
            break;
        }
    }

    if (!bFound)
    {
        `log("ERROR: Did not find class for id"@ClassId);
        return;
    }

    bFound = false;

    for (i = 0; i < pClass.SkillTree.Length; i++)
    {
        pSkill = pClass.SkillTree[i];
        
        if (pSkill.DatabaseItemId == SkillItemId)
        {
            bFound = true;
            break;
        }
    }

    if (!bFound)
    {
        `log("ERROR: Did not find skill for id"@SkillItemId);
        return;
    }

    classXP = TrOuter.GetCurrentPoints(ClassId);

    if (pSkill.Cost <= classXP)
    {
        Options.SetFloat("pShowConfirm", 1);
        Options.SetFloat("pNeedUpgrade", 0);
        Options.SetString("pMessage", "Purchase "$pSkill.SkillName$" for\n"$pSkill.Cost@pClass.FamilyInfo.default.FriendlyName@"XP?");
    }
    else if (pSkill.Cost <= (classXP + TrOuter.m_PlayerProfile.SharedXP))
    {
        i = pSkill.Cost - classXP;
        Options.SetFloat("pShowConfirm", 1);
        Options.SetFloat("pNeedUpgrade", 0);
        Options.SetString("pMessage", "Purchase "$pSkill.SkillName$" for\n"$classXP@pClass.FamilyInfo.default.FriendlyName@"XP and"@i@"Shared XP?");
    }
    else if (pSkill.Cost <= GetAllXP())
    {
        Options.SetFloat("pShowConfirm", 1);
        Options.SetFloat("pNeedUpgrade", 1);
        Options.SetString("pMessage", "Not enough"@pClass.FamilyInfo.default.FriendlyName@"XP or Shared XP to purchase this skill.\nShare other class XP to make this affordable.");
    }
    else
    {
        Options.SetFloat("pShowConfirm", 0);
        Options.SetFloat("pNeedUpgrade", 0);
        Options.SetString("pMessage", "Not enough"@pClass.FamilyInfo.default.FriendlyName@"XP or Shared XP to purchase this skill.\nPlay matchmaking to earn more XP.");
    }
}

function int GetAllXP()
{
    local int i;
    local int xpTotal;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        xpTotal += TrOuter.GetCurrentPoints(m_CharClassList[i].ClassId);
    }

    xpTotal += TrOuter.m_PlayerProfile.SharedXP;

    return xpTotal;
}

/*********************************************************************************************
 * Perk-related functions
 * *******************************************************************************************/

function LoadGFxPerkData(int ClassId, GFxObject List)
{
    local int i;
    local int j;

    GFxObjectCount = 0;
    GFxObjectList = List;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ActiveClassId)
        {
	        for (j = 0; j < m_PerkList.Length; j++)
	        {
                AddPerk(i, j);
	        }

            break;
        }
    }
}

function AddPerk(int ClassIndex, int PerkIndex)
{
    local GFxObject obj;

    if (PerkIndex < 0 || PerkIndex >= m_PerkList.Length)
    {
        return;
    }

    obj = Outer.CreateObject("Object");
    obj.SetString("nodeName", m_PerkList[PerkIndex].PerkName);
    obj.SetString("shortDesc", m_PerkList[PerkIndex].Description);
    obj.SetString("longDesc", m_PerkList[PerkIndex].Description);
    obj.SetFloat("itemId", m_PerkList[PerkIndex].ItemId);
    obj.SetFloat("iconId", m_PerkList[PerkIndex].IconId);
    obj.SetFloat("bLocked", int(!m_PerkList[PerkIndex].bOwned));
    obj.SetString("classParent", Caps(GetClassName(m_PerkList[PerkIndex].UnlockClassId)));

    if (m_CharClassList[ClassIndex].Perk1ItemId == m_PerkList[PerkIndex].ItemId ||
        m_CharClassList[ClassIndex].Perk2ItemId == m_PerkList[PerkIndex].ItemId ||
        !m_PerkList[PerkIndex].bOwned)
    {
        obj.SetFloat("bAvailable", 0);
    }
    else
    {
        obj.SetFloat("bAvailable", 1);
    }
    
    GFxObjectList.SetElementObject(GFxObjectCount++, obj);
}

function bool PerkIsAvailable(int PerkId)
{
    local int i;

    for (i = 0; i < m_PerkList.Length; i++)
    {
        if (m_PerkList[i].ItemId == PerkId)
        {
            return m_PerkList[i].bOwned;
        }
    }

    return false;
}

function int GetPerkIndex(int ItemId)
{
    local int i;

    for (i = 0; i < m_PerkList.Length; i++)
    {
        if (m_PerkList[i].ItemId == ItemId)
        {
            return i;
        }
    }

    return -1;
}

function int GetPerkIndexByClass(int ClassId, int Slot)
{
    local int i;
    local bool bFoundFirst;

    for (i = 0; i < m_PerkList.Length; i++)
    {
        if (m_PerkList[i].UnlockClassId == ClassId)
        {
            if (bFoundFirst || Slot == 1)
            {
                return i;
            }

            bFoundFirst = true;
        }
    }

    return -1;
}

function bool IsAPerk(int ItemId)
{
    local int i;

    for (i = 0; i < m_PerkList.Length; i++)
    {
        if (m_PerkList[i].ItemId == ItemId)
        {
            return true;
        }
    }

    return false;
}

function bool RequestActivePerk(int ClassId, int PerkId, int SlotId)
{
    local int i;
    local int classIndex;

    if (SlotId > 2 || !PerkIsAvailable(PerkId))
    {
        return false;
    }

    classIndex = -1;

    for (i = 0; i < m_CharClassList.Length; i++)
    {
        if (m_CharClassList[i].ClassId == ClassId)
        {
            classIndex = i;
        }
    }

    if (classIndex < 0)
    {
        return false;
    }
    
    TrOuter.MenuSounds.SoundSelectedPerk();

    if (m_CharClassList[classIndex].Perk1ItemId == PerkId ||
        m_CharClassList[classIndex].Perk2ItemId == PerkId)
    {
        // We have already assigned this perk
        return true;
    }

    if (SlotId == 1)
    {
        m_CharClassList[classIndex].Perk1ItemId = PerkId;
    }
    else if (SlotId == 2)
    {
        m_CharClassList[classIndex].Perk2ItemId = PerkId;
    }

    SaveActivePerks(ClassId, m_CharClassList[classIndex].Perk1ItemId, m_CharClassList[classIndex].Perk2ItemId);

    FlushClassData();

    return true;
}*/

defaultproperties
{
   Name="Default__GFxTrScene_Class"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
