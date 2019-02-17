class TrEquipInterface extends Object
    native;

var bool m_bLoadComplete;

delegate DelegateOnMarshalEvent(pointer pMarEvent{FMAR_EVENT});

/** Initialization */
native function        LoadInventory();
native function        InitClass(int ClassId);
native function        SetDefaultEquip(int ClassId, int Type, int Equip);

/** Register tie-in to backend */
native function        OnMarshalEvent(pointer pMarEvent{FMAR_EVENT});
native function bool   RegisterMarshalCallback(delegate<DelegateOnMarshalEvent> MarshalEventDelegate);

/** Class Interface */
native function int    GetClassId(int Index);
native function bool   IsClassOwned(int ClassId);
native function int    GetClassCount();
native function int    GetClassPrice(int ClassId, int Currency);
native function int    GetNextClassId(int PrevClass);
native function int    GetClassRibbon(int ClassId);
native function int    GetFirstClassId();
native function float  GetClassUnlockPercent(int ClassId);

/** Equipment Interface */
native function int    GetEquipId(int ClassId, int Type, int Index);
native function bool   IsEquipOwned(int ClassId, int Type, int Equip);
native function bool   IsEquipMaxed(int ClassId, int Type, int Equip);
native function int    GetEquipLevel(int ClassId, int Type, int Equip);
native function int    GetEquipCount(int ClassId, int Type);
native function int    GetEquipPrice(int ClassId, int Type, int Equip, int Currency);
native function int    GetNextEquipId(int ClassId, int Type, int PrevClass);
native function int    GetEquipRibbon(int ClassId, int Type, int Equip);
native function int    GetFirstEquipId(int ClassId, int Type);
native function int    GetMasteryPrice(int ClassId, int Type, int Equip);

native function bool   IsLoadoutOwned(int ClassId, int Loadout);
native function string GetLoadoutName(int ClassId, int Loadout);
native function int    GetLoadoutPrice(int ClassId, int Loadout, int Currency);
native function bool   SetLoadoutName(int Classid, int Loadout, string LoadoutName);

native function bool   IsBundleOwned(int BundleId);
native function int    GetBundleParent(int BundleId);

native function bool   IsDailyDealOwned();
native function int    GetDailyDealType();
native function int    GetDailyDealClass();
native function int    GetDailyDealItemId();
native function int    GetDailyDealLootId();
native function int    GetDailyDealXPPrice();
native function int    GetDailyDealOldPrice();
native function int    GetDailyDealNewPrice();
native function int    GetDailyDealSecsLeft();
native function int    GetDailyDealPercentOff();
native function bool   RequestPurchaseDeal(int Currency);

/** Active Equipment Interface */
native function        RetrieveActives();
native function int    GetActiveEquipId(int ClassId, int Type, int Loadout);
native function bool   SetActiveEquipId(int ClassId, int Type, int Loadout, int Equip);

/** Upgrade Interface */
native function int    GetUpgradePrice(int ClassId, int Type, int Equip, int Upgrade, int Currency);

/** Purchasing Interface */
native function bool   RequestPurchaseClass(int ClassId, int Currency);
native function bool   RequestPurchaseMastery(int ClassId, int Type, int Equip);
native function bool   RequestPurchaseLoadout(int ClassId, int Loadout, int Currency);
native function bool   RequestPurchaseEquip(int ClassId, int Type, int Equip, int Currency);
native function bool   RequestPurchaseReticule(int ClassId, int Type, int Equip, int Currency);
native function bool   RequestPurchaseUpgrade(int ClassId, int Type, int Equip, int Upgrade, int Currency);

native function        SaveProfile();

/** Non-equipment Interface (refactor) */
native function bool   RequestPurchaseGeneral(int VendorId, int VendorItemId, int Currency, string UserCustomInput);
native function int    GetVendorSize(int VendorId);
native function int    GetVendorItemId(int VendorId, int Index);
native function bool   GetVendorItemInfo(int VendorId, int VendorItemId, out string itemName, out string itemDescr, out string ribbonDesc);
native function bool   GetVendorItemPrice(int VendorId, int VendorItemId, int Currency, out int Price);

native function bool   HasReticule(int EquipId);
native function bool   OwnsReticule(int EquipId);
native function int    GetReticuleValue(int EquipId, ReticuleDataType Type);
native function bool   SetReticuleValue(int EquipId, ReticuleDataType Type, int nValue);
native function string GetReticuleString(int EquipId, ReticuleDataType Type);
native function bool   SetReticuleString(int EquipId, ReticuleDataType Type, string sValue);

function InitEquipManager()
{
    RegisterMarshalCallback(OnMarshalEvent);

    InitClassList();
}

function InitClassList()
{
    local int i;
    local int j;
    local int equipId;
    local int equipType;
    local class<TrSkin> skinClass;
    local class<TrFamilyInfo> FamilyInfo;
    local class<TrFamilyInfoList> InfoList;

	InfoList = class<TrFamilyInfoList>(DynamicLoadObject("TribesGame.TrFamilyInfoList", class'Class'));

    for (i = 0; i < InfoList.default.ClassList.Length; i++)
    {
        FamilyInfo = class<TrFamilyInfo>(DynamicLoadObject("TribesGame."$InfoList.default.ClassList[i], class'Class'));

        InitClass(FamilyInfo.default.ClassId);
        
	    for (j = 0; j < FamilyInfo.default.DevSelectionList.Length; j++)
	    {
            equipId = FamilyInfo.default.DevSelectionList[j].DeviceClass.default.DBWeaponId;
            equipType = FamilyInfo.default.DevSelectionList[j].EquipPoint;

            SetDefaultEquip(FamilyInfo.default.ClassId, equipType, equipId);
        }

        skinClass = FamilyInfo.default.DefaultSkinClass;

        if (skinClass != none)
        {
            SetDefaultEquip(FamilyInfo.default.ClassId, EQP_Skin, skinClass.default.ItemId);
        }
    }
}

defaultproperties
{
   Name="Default__TrEquipInterface"
   ObjectArchetype=Object'Core.Default__Object'
}
