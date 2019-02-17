class GFxTrPage_Game extends GFxTrPage;

var int TeamLoadoutNum;

var bool bRemovePartyTemp;

var localized string strParty;
var localized string strSocial;
var localized string strStore;
var localized string strSettings;
var localized string strManageServers;
var localized string strExitMatch;

function Initialize()
{
    // On the fly
}

function FillData(GFxObject DataList)
{
    ClearActions();
    
    AddActionNumber(TeamLoadoutNum);
    AddActionPage(Pages.ClassesPage);

    if (!bRemovePartyTemp && PartyManager.InParty())
    {
        AddActionPage(Pages.PartyPage);
    }

    bRemovePartyTemp = false;

    AddActionPage(Pages.SocialPage);
    AddActionPage(Pages.StorePage);
    AddActionPage(Pages.SettingsPage);
    AddActionPage(Pages.ManageServersPage);
    AddActionString("ExitMatch");

    PageLabelOverride = PageLabel@"("$SettingsManager.KeyBindings.m_MainMenuHotkey$")";

    super.FillData(DataList);
}

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    if (PlayerNeedsTeam() || PlayerNeedsClass()) bEndOfLine = false;

    super.TakeAction(ActionIndex, DataList);

    if (ActionIndex == GoBack)
    {
        NewAction = 0;
        
        if (!bEndOfMatch)
        {
            HideMovie();
        }
    }
    else if (PageActions[ActionIndex].ActionNumber == TeamLoadoutNum)
    {
        if (PlayerNeedsTeam())
        {
            HideMovie();
            TrHUD(TrPlayerController(GetPC()).myHUD).TeamSelectionMenuMovie.MovieClip.SetVisible(true);
        }
        else
        {
            NewAction = 1;
            Pages.ClassSelectPage.FillData(DataList);
        }
    }

    return NewAction;
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionString == "ExitMatch")
    {
        NewAction = 0;
        LeaveMatch();
    }
}

function GFxObject FillOption(int ActionIndex)
{
    local int count;
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionNumber == TeamLoadoutNum)
    {
        if (PlayerNeedsTeam())
        {
            obj.SetString("itemTitle", Strings.Team@Strings.Select);
            obj.SetString("itemSubTitle", Strings.ChooseYourTeam);
        }
        else
        {
            obj.SetString("itemTitle", Strings.TrClass@Strings.Select);
            obj.SetString("itemSubTitle", Strings.Select@Strings.TrClass@Strings.ToSpawn);
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.ClassesPage)
    {
        if (RibbonManager.bHaveUnlocks && RibbonManager.bOnlyUnlocks)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", Strings.Unlocks@Strings.Available);
            obj.SetString("itemSubTitle", Strings.Modify@Strings.TrClasses);
        }
        else if (RibbonManager.bHaveUpgrades && RibbonManager.bOnlyUpgrades)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 1);
            obj.SetString("itemRibbonLabel", Strings.Upgrades@Strings.available);
            obj.SetString("itemSubTitle", Strings.Modify@Strings.TrClasses);
        }
        else if (RibbonManager.bHaveUnlocks || RibbonManager.bHaveUpgrades)
        {
            obj.SetFloat("hasRibbon", 1);
            obj.SetFloat("ribbonType", 2);
            obj.SetString("itemRibbonLabel", Strings.Unlocks@Strings.Available);
            obj.SetString("itemSubTitle", Strings.Modify@Strings.TrClasses);
        }
    }   
    else if (PageActions[ActionIndex].ActionPage == Pages.SocialPage)
    {
        obj.SetString("itemTitle", strSocial);

        count = Friends.GetOnlineFriendCount();

        if (count > 0)
        {
            obj.SetFloat("hasRibbon", 1);
            if(count == 1)
            {
                obj.SetString("itemRibbonLabel", count@Strings.Friend@Strings.Online);
            }
            else
            {
                obj.SetString("itemRibbonLabel", count@Strings.Friends@Strings.Online);
            }   
        }
        else
        {
            count = Friends.GetOnlineFollowerCount();

            if (count > 0)
            {
                obj.SetFloat("hasRibbon", 1);
                if(count == 1)
                {
                    obj.SetString("itemRibbonLabel", count@Strings.Follower@Strings.Online);
                }
                else
                {
                    obj.SetString("itemRibbonLabel", count@Strings.Followers@Strings.Online);
                }
            }
            else
            {
                obj.SetFloat("hasRibbon", 0);            
                obj.SetString("itemRibbonLabel", "");
            }            
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.PartyPage)
    {
        obj.SetString("itemTitle", strParty);
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.StorePage)
    {
        obj.SetString("itemTitle", strStore);
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.SettingsPage)
    {
        obj.SetString("itemTitle", strSettings);
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.ManageServersPage)
    {
        obj.SetString("itemTitle", strManageServers);
    }
    else if (PageActions[ActionIndex].ActionString == "ExitMatch")
    {
        obj.SetString("itemTitle", strExitMatch);
    }

    return obj;
}

function PushModel()
{
    local int classId;
    local int equipId;
    local class<trSkin> skinClass;
    local class<TrFamilyInfo> FamilyInfo;
    local TrPlayerController TrPC; 
	local TrPlayerReplicationInfo TrPRI;
    
    TrPC = TrPlayerController(GetPC());

    if (TrPC != none && (bOpeningMenu || bMovieIsOpen))
    {
		TrPRI = TrPlayerReplicationInfo(TrPC.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			classId = TrPC.GetActiveClassId();

			if (classId > 0)
			{
                equipId = EquipInterface.GetActiveEquipId(classId, EQP_Primary, ActiveLoadout);
                FamilyInfo = EquipHelper.GetFamilyClass(classId);
                skinClass = EquipHelper.GetSkinClass(EquipInterface.GetActiveEquipId(classId, EQP_Skin, ActiveLoadout));

                TrPC.UpdatePaperDoll(FamilyInfo, EquipHelper.GetEquipClass(equipId), skinClass, bShowDiamondSword ? 1 : 0);
			}
		}
    }
}


function HelpButton(int ActionIndex)
{
    if (bBlockHotkey) return;

    if (ActionIndex == HelpButtonANum)
    {
        if (PlayerNeedsTeam())
        {
            HideMovie();
        }
        if (PlayerNeedsClass())
        {
            bOpeningMenu = true;
            Pages.PushPage(Pages.ClassSelectPage);
            StartMainMenu();
        }
        else
        {
            HideMovie();
        }
    }
    else if (ActionIndex == HelpButtonYNum)
    {
        Pages.NavigateGold();
    }
    else if (ActionIndex == HelpButtonXNum)
    {
        QuitGame();
    }
}

defaultproperties
{
   TeamLoadoutNum=1
   strParty="PARTY"
   strSocial="SOCIAL"
   strStore="STORE"
   strSettings="SETTINGS"
   strManageServers="MANAGE SERVERS"
   strExitMatch="EXIT MATCH"
   bAllowBack=False
   PageLabel="IN GAME MENU"
   OptionTitles(0)="SELECT CLASS"
   OptionTitles(1)="CLASSES"
   OptionSubtext(0)=
   OptionSubtext(1)=
   OptionSubtext(2)=
   OptionSubtext(3)=
   OptionSubtext(4)=
   OptionSubtext(5)=
   OptionSubtext(6)=
   OptionSubtext(7)=
   Name="Default__GFxTrPage_Game"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
