class GFxTrPage_Class extends GFxTrPage;

var int  PopupNum;
var int  NumRenameLoadout;
var bool bClassLocked;
var bool bViewingEquip;

enum MENU_ACTION_CLASS
{
    MAC_PRIMARY,
    MAC_SECONDARY,
    MAC_BELT,
    MAC_PACK,
    MAC_ARMOR,
    MAC_PERKA,
    MAC_PERKB,
    MAC_SKIN,
    MAC_VOICE,
    MAC_MAX
};

function Initialize()
{
    local int i;

    super.Initialize();

    for (i = 0; i < MAC_MAX; i++)
    {
        AddActionSet(Pages.EquipPage, GetEquipType(i));
    }

    AddActionNumber(NumRenameLoadout);
}

function FillData(GFxObject DataList)
{
    local int equipId;
    local class<TrSkin> skinClass;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;

    TrPC = TrPlayerController(GetPC());

    if (User.NeedsToSeeNewItemsClass(LoadoutClassId))
    {
        User.SeenNewItemsClass(LoadoutClassId);
    }

    super.FillData(DataList);
    
    if (bViewingEquip)
    {
        bViewingEquip = false;

        if (TrPC != none)
        {
            equipId = EquipInterface.GetActiveEquipId(LoadoutClassId, EQP_Primary, ActiveLoadout);
            FamilyInfo = EquipHelper.GetFamilyClass(LoadoutClassId);
            skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(LoadoutClassId, EQP_Skin, ActiveLoadout));

            TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
        }
    }
}

function SpecialAction(GFxTrAction Action)
{
    local int i;
    local int equipType;

    if (Action.ActionNumber == NumRenameLoadout)
    {
        if (EquipInterface.IsClassOwned(LoadoutClassId) && EquipInterface.IsLoadoutOwned(LoadoutClassId, ActiveLoadout))
        {
            PopupNum = NumRenameLoadout;
            QueuePopup();
        }
    }
    else
    {
        equipType = Action.ActionNumber;

        Pages.EquipPage.bParentLocked = bClassLocked;

        Pages.EquipPage.ClearActions();
        Pages.EquipPage.ActiveLoadout = ActiveLoadout;
        Pages.EquipPage.LoadoutClassId = LoadoutClassId;
        Pages.EquipPage.LoadoutEquipType = equipType;

        bViewingEquip = true;

        for (i = 0; i < EquipInterface.GetEquipCount(LoadoutClassId, equipType); i++)
        {
            Pages.EquipPage.AddActionNumber(EquipInterface.GetEquipId(LoadoutClassId, equipType, i));
        }
    }
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    return super.TakeAction(ActionIndex, DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local int equipId;
    local int equipType;
    local GFxObject obj;    

    if (PageActions[ActionIndex].ActionNumber == NumRenameLoadout)
    {
        obj = CreateObject("Object");
        
        obj.SetFloat("actionID", ActionIndex);
        obj.SetString("itemTitle", Strings.RenameLoadout);
        obj.SetString("itemSubTitle", Strings.SelectToRenameThisLoadout);
        
        if (!EquipInterface.IsClassOwned(LoadoutClassId) || !EquipInterface.IsLoadoutOwned(LoadoutClassId, ActiveLoadout))
        {
            obj.SetFloat("bLocked", 1);
        }
    }
    else
    {    
        equipType = PageActions[ActionIndex].ActionNumber;
        equipId = EquipInterface.GetActiveEquipId(LoadoutClassId, equipType, ActiveLoadout);

        return FillEquipTypes(equipId, ActionIndex);
    }

    return obj;
}

function int GetEquipType(int ActionIndex)
{
    switch (ActionIndex)
    {
    case MAC_PRIMARY:   return EQP_PRIMARY;
    case MAC_SECONDARY: return EQP_SECONDARY;
    case MAC_PACK:      return EQP_PACK;
    case MAC_BELT:      return EQP_BELT;
    case MAC_ARMOR:     return EQP_ARMOR;
    case MAC_PERKA:     return EQP_PERKA;
    case MAC_PERKB:     return EQP_PERKB;
    case MAC_SKIN:      return EQP_SKIN;
    case MAC_VOICE:     return EQP_Voice;
    default:            break;
    }

    return -1;
}

function CheckDescription(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject descObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_DESCRIPTION);
    obj.SetObject("data", FillDescription(DataList));
    
    descObj = FillDescription(DataList);

    if (descObj != none)
    {
        obj.SetObject("data", descObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }
}

function GFxObject FillDescription(GFxObject DataList)
{
    local string loadout;
    local GFxObject obj;
    local class<TrFamilyInfo> FamilyInfo;

    FamilyInfo = EquipHelper.GetFamilyClass(LoadoutClassId);

    if (FamilyInfo == none) return none;

    obj = CreateObject("Object");

    obj.SetString("descTitle", Caps(FamilyInfo.default.FriendlyName));
    obj.SetString("description", Caps(FamilyInfo.default.ClassDescription));

    obj.SetString("loadoutTitle", Strings.Loadout);
    obj.SetString("type", Strings.Primary$"\n"$Strings.Secondary$"\n"$Strings.Belt$"\n"$Strings.Pack$"\n\n"$Strings.Perk@"1\n"$Strings.Perk@"2");
    
    /*loadout = GetArmorName(FamilyInfo);
    loadout = loadout$"\n";*/
    loadout = loadout$GetEquipName(EQP_Primary);
    loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_Secondary);
    loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_Belt);
    loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_Pack);
    loadout = loadout$"\n\n";
    loadout = loadout$GetEquipName(EQP_PerkA);
    loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_PerkB);
    /*loadout = loadout$"\n";
    loadout = loadout$GetEquipName(EQP_Skin);*/

    obj.SetString("loadout", loadout);

    return obj;
}

function string GetArmorName(class<TrFamilyInfo> FamilyInfo)
{
    if (class<TrFamilyInfo_Heavy>(FamilyInfo) != none)
    {
        return "- HEAVY -";
    }
    else if (class<TrFamilyInfo_Light>(FamilyInfo) != none)
    {
        return "- LIGHT -";
    }

    return "- MEDIUM -";
}

function string GetEquipName(int EquipType)
{
    local int equipId;
    local class<TrDevice> equip;

    equipId = EquipInterface.GetActiveEquipId(LoadoutClassId, EquipType, ActiveLoadout);

    if (equipId > 0)
    {
        equip = EquipHelper.GetEquipClass(equipId);

        if (equip != none)
        {
            return Caps(equip.default.ItemName);
        }
    }

    return "";
}

function HelpButton(int ActionIndex)
{
    local int equipId;
    local class<trSkin> skinClass;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC;

    if (bBlockHotkey) return;

    if (ActionIndex == HelpButtonXNum)
    {
        bShowDiamondSword = !bShowDiamondSword;
                
        TrPC = TrPlayerController(GetPC());

        if (TrPC != none)
        {
            if (LoadoutClassId > 0)
            {
                equipId = EquipInterface.GetActiveEquipId(LoadoutClassId, EQP_Primary, ActiveLoadout);
                FamilyInfo = EquipHelper.GetFamilyClass(LoadoutClassId);
                skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(LoadoutClassId, EQP_Skin, ActiveLoadout));

                TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
            }
        }

        return;
    }

    super.HelpButton(ActionIndex);
}


function PopupData(GFxObject Obj)
{
    if (Obj == none) return;
    
    if (PopupNum == NumRenameLoadout)
    {        
        Obj.SetString("popupTitle", Strings.RenameLoadout);
        Obj.SetString("popupBody", EquipInterface.GetLoadoutName(LoadoutClassId, ActiveLoadout));
        Obj.SetString("buttonLabel2", Strings.Accept);
        Obj.SetString("buttonLabel3", Strings.Cancel);
        Obj.SetFloat("enterKeyIndex", 1);
        Obj.SetFloat("type", 2);
    }
}

function PopupComplete(int Action, string TextInput)
{
    if (PopupNum == NumRenameLoadout)
    {
        if (Action == 1 && TextInput != "")
        {
            EquipInterface.SetLoadoutName(LoadoutClassId, ActiveLoadout, TextInput);
            RefreshButtons();
        }

        PopupNum = INDEX_NONE;
    }
}

defaultproperties
{
   PopupNum=-1
   NumRenameLoadout=99
   PageLabel="CLASS"
   HelpButtonXKey="*"
   HelpButtonXLabel="CHANGE TRIBE"
   OptionSubtext(0)="PRIMARY WEAPON"
   OptionSubtext(1)="SECONDARY WEAPON"
   OptionSubtext(2)="BELT ITEM"
   OptionSubtext(3)="PACK"
   OptionSubtext(4)="ARMOR UPGRADE"
   OptionSubtext(5)="PRIMARY PERK"
   OptionSubtext(6)="SECONDARY PERK"
   OptionSubtext(7)="SKIN"
   OptionSubtext(8)="VOICE"
   Name="Default__GFxTrPage_Class"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
