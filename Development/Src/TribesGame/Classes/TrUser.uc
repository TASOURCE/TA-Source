class TrUser extends Object
    config(User)
    native;

var int         CurrencyCode;
var init string CurrencyName;

var globalconfig int    m_ClassId;
var globalconfig bool   m_DidLogin;
var globalconfig bool   m_ChoseRegion;
var globalconfig bool   m_ChoseRegion2;
var globalconfig bool   m_SeenClanTags;
var globalconfig bool   m_SeenNewGametype;
var globalconfig bool   m_SeenNewItemsMain;
var globalconfig bool   m_SeenNewBundlesMain;
var globalconfig string m_GameType;
var globalconfig string m_Username;
var globalconfig string m_Password;

struct native NewItem
{
    var int ClassId;
    var int Type;
    var int ItemId;
};

var array<NewItem> NewItems;
var array<NewItem> NewBundles;
var globalconfig array<NewItem> SeenNewItems;
var globalconfig array<int> FavServers;

var GFxTrMenuMoviePlayer mainMenu;

native function string EncryptPassword(string Password);
native function string DecryptPassword();

function Initialize(GFxTrMenuMoviePlayer Movie)
{
    mainMenu = Movie;
}

function SaveCredentials(string NewUsername, string NewPassword)
{
    m_Username = NewUsername;
    m_Password = EncryptPassword(NewPassword);
	SaveConfig();
}

function SaveClassId(int NewClassId)
{
    m_ClassId = NewClassId;
	SaveConfig();
}

function SaveGameType(string NewGameType)
{
    m_GameType = NewGameType;
	SaveConfig();
}

function SaveDidLogin()
{
    m_DidLogin = true;
	SaveConfig();
}

function SaveChoseRegion()
{
    m_ChoseRegion = true;
    m_ChoseRegion2 = true;
	SaveConfig();
}

function SeenNewGametype()
{
    m_SeenNewGametype = true;
    SaveConfig();
}

function SeenNewItemsMain()
{
    m_SeenNewItemsMain = true;
    SaveConfig();
}

function SeenNewBundlesMain()
{
    m_SeenNewBundlesMain = true;
    SaveConfig();
}

function SeenClanTags()
{
    m_SeenClanTags = true;
    SaveConfig();
}

function SeenNewBundle(int ItemId)
{
    local NewItem item;

    item.ItemId = ItemId;

    SeenNewItems.AddItem(item);
    SaveConfig();
}

function SeenNewItemsClass(int ClassId)
{
    local NewItem item;

    item.ClassId = ClassId;

    SeenNewItems.AddItem(item);
    SaveConfig();
}

function SeenNewItemsType(int ClassId, int Type)
{
    local NewItem item;

    item.ClassId = ClassId;
    item.Type = Type;

    SeenNewItems.AddItem(item);
    SaveConfig();
}

function bool NeedsToSeeClanTags()
{
    return !m_SeenClanTags;
}

function bool NeedsToSeeNewItemsClass(int ClassId)
{
    local int i;

    if (!NeedToSeeAnyNewItem()) return false;

    for (i = 0; i < SeenNewItems.Length; i++)
    {
        if (SeenNewItems[i].ClassId == ClassId)
        {
            return false;
        }
    }

    for (i = 0; i < NewItems.Length; i++)
    {
        if (NewItems[i].ClassId == ClassId)
        {
            return true;
        }
    }

    return false;
}

function bool NeedsToSeeNewItemsType(int ClassId, int Type)
{
    local int i;

    if (!NeedToSeeAnyNewItem()) return false;

    for (i = 0; i < SeenNewItems.Length; i++)
    {
        if (SeenNewItems[i].ClassId == ClassId && SeenNewItems[i].Type == Type)
        {
            return false;
        }
    }

    for (i = 0; i < NewItems.Length; i++)
    {
        if (NewItems[i].ClassId == ClassId && NewItems[i].Type == Type)
        {
            return true;
        }
    }

    return false;
}

function bool NeedsToSeeNewItem(int EquipId)
{
    local int i;

    if (mainMenu.PlayerProfile.Rank < 5) return false;
    
    for (i = 0; i < NewItems.Length; i++)
    {
        if (NewItems[i].ItemId == EquipId)
        {
            return true;
        }
    }

    return false;
}

function bool NeedsToSeeNewBundle(int ItemId)
{
    local int i;
    
    for (i = 0; i < NewBundles.Length; i++)
    {
        if (NewBundles[i].ItemId == ItemId)
        {
            return true;
        }
    }

    return false;
}

function bool NeedToSeeAnyNewItem()
{
    local int i;
    local int index;
    local int count;

    if (mainMenu.PlayerProfile.Rank < 5) return false;

    for (index = 0; index < NewItems.Length; index++)
    {
        count = mainMenu.EquipInterface.GetEquipCount(NewItems[index].ClassId, NewItems[index].Type);

        for (i = 0; i < count; i++)
        {
            if (mainMenu.EquipInterface.GetEquipId(NewItems[index].ClassId, NewItems[index].Type, i) == NewItems[index].ItemId)
            {
                return true;
            }
        }
    }

    return false;
}

function bool NeedToSeeNewBundle(optional int ItemId = 0)
{
    local int i;
    local int j;
    local bool bFound;

    for (i = 0; i < NewBundles.Length; i++)
    {
        bFound = false;

        if (ItemId > 0 && NewBundles[i].ItemId != ItemId)
        {
            continue;
        }

        for (j = 0; j < SeenNewItems.Length; j++)
        {
            if (NewBundles[i].ItemId == SeenNewItems[j].ItemId)
            {
                bFound = true;
                break;
            }
        }

        if (!bFound)
        {
            return true;
        }
    }

    return false;
}

function SetFavoriteServer(int ServerId)
{
    local int i;

    for (i = 0; i < FavServers.Length; i++)
    {
        if (FavServers[i] == ServerId)
        {
            FavServers.Remove(i, 1);
            SaveConfig();
            return;
        }
    }
    
    FavServers.AddItem(ServerId);
    SaveConfig();
}

function bool IsFavoriteServer(int ServerId)
{
    local int i;

    for (i = 0; i < FavServers.Length; i++)
    {
        if (FavServers[i] == ServerId)
        {            
            return true;
        }
    }
    
    return false;
}

defaultproperties
{
   m_GameType="TEAM DEATHMATCH"
   NewItems(0)=(ClassId=1686,Type=2,ItemId=8254)
   NewItems(1)=(ClassId=1686,Type=3,ItemId=8239)
   NewItems(2)=(ClassId=1686,Type=5,ItemId=8240)
   NewBundles(0)=(ItemId=9214)
   NewBundles(1)=(ItemId=9510)
   Name="Default__TrUser"
   ObjectArchetype=Object'Core.Default__Object'
}
