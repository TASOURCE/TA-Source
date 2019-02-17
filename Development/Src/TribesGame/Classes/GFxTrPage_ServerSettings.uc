class GFxTrPage_ServerSettings extends GFxTrPage;

var int  LocalNameNumber;
var int  PopupNumber;
var bool bPopup;

function Initialize()
{
    AddActionNumber(LocalNameNumber);
    AddActionNumber(QUEUE_CONFIG_SERVERNAME);
    AddActionNumber(QUEUE_CONFIG_SERVERDESCRIPTION);
    AddActionPage(Pages.RegionSettingsPage);
    AddActionNumber(QUEUE_CONFIG_ADMINPASSWORD);
    AddActionNumber(QUEUE_CONFIG_GENPASSWORD);
}

function SpecialAction(GFxTrAction Action)
{
    if (Action.ActionPage == Pages.RegionSettingsPage)
    {
        Pages.RegionSettingsPage.bServer = true;
    }
    else
    {
        bPopup = true;
        PopupNumber = Action.ActionNumber;
        QueuePopup();
    }
}

function PopupData(GFxObject Obj)
{
    switch (PopupNumber)
    {
    case LocalNameNumber:
        Obj.SetString("popupInput", QueueManager.GetServerName(QueueManager.ServerIndex));
        Obj.SetString("popupTitle", Strings.Change@Strings.TrLocal@Strings.TrName);
        break;
    case QUEUE_CONFIG_SERVERNAME:
        Obj.SetString("popupInput", QueueManager.GetProfileName());
        Obj.SetString("popupTitle", Strings.Change@Strings.Display@Strings.TrName);
        break;
    case QUEUE_CONFIG_SERVERDESCRIPTION:
        Obj.SetString("popupInput", QueueManager.GetProfileDesc());
        Obj.SetString("popupTitle", Strings.Change@Strings.Display@Strings.Description);
        break;
    case QUEUE_CONFIG_ADMINPASSWORD:
        Obj.SetString("popupInput", QueueManager.GetAdminPassword());
        Obj.SetString("popupTitle", Strings.Change@Strings.Admin@Strings.Password);
        break;
    case QUEUE_CONFIG_GENPASSWORD:
        Obj.SetString("popupInput", QueueManager.GetPublicPassword());
        Obj.SetString("popupTitle", Strings.Change@Strings.TrPublic@Strings.Password);
        break;
    default:
        break;
    }

    Obj.SetString("buttonLabel2", Strings.Accept);
    Obj.SetString("buttonLabel3", Strings.Cancel);
    Obj.SetFloat("enterKeyIndex", 1);
    Obj.SetFloat("type", 2);
}

function PopupComplete(int Action, string TextInput)
{
    if (bPopup)
    {
        bPopup = false;

        if (Action == 1)
        {
            TextInput = Left(TextInput, 255);

            switch (PopupNumber)
            {
            case LocalNameNumber:
                //QueueManager.SetLocalName(TextInput);
                QueueManager.CustomSetName(TextInput);
                QueueManager.RefreshRentedServers();
                bOpeningMenu=true;
                StartMainMenu();
                break;
            case QUEUE_CONFIG_SERVERNAME:
            case QUEUE_CONFIG_SERVERDESCRIPTION:
                QueueManager.SetPropString(PopupNumber, TextInput, SPT_QUEUE);
                QueueManager.RefreshRentedServers();
                bOpeningMenu=true;
                StartMainMenu();
                break;
            case QUEUE_CONFIG_ADMINPASSWORD:
            case QUEUE_CONFIG_GENPASSWORD:
                QueueManager.SetPropString(PopupNumber, TextInput, SPT_QUEUE);
                QueueManager.RefreshRentedServers();
                RefreshButtons();
                break;
            default:
                break;
            }
        }
    }
}

function FillData(GFxObject DataList)
{
    SetOverrides();

    super.FillData(DataList);
    
    CheckDescription(DataList);
}

function GFxObject FillOption(int ActionIndex)
{
    local GFxObject obj;

    obj = super.FillOption(ActionIndex);

    if (PageActions[ActionIndex].ActionNumber == QUEUE_CONFIG_ADMINPASSWORD)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);

        if (QueueManager.GetAdminPassword() == "")
        {
            obj.SetString("itemRibbonLabel", "<"$Strings.TrNone$">");
        }
        else
        {
            obj.SetString("itemRibbonLabel", "'"$QueueManager.GetAdminPassword()$"'");
        }
    }
    else if (PageActions[ActionIndex].ActionNumber == QUEUE_CONFIG_GENPASSWORD)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);

        if (QueueManager.GetPublicPassword() == "")
        {
            obj.SetString("itemRibbonLabel", "<"$Strings.TrNone$">");
        }
        else
        {
            obj.SetString("itemRibbonLabel", "'"$QueueManager.GetPublicPassword()$"'");
        }
    }
    else if (PageActions[ActionIndex].ActionPage == Pages.RegionSettingsPage)
    {
        obj.SetFloat("hasRibbon", 1);
        obj.SetFloat("ribbonType", 2);

        if (QueueManager.GetProfileRegion() == 0)
        {
            obj.SetString("itemRibbonLabel", Strings.TrDefault);
        }
        else
        {
            obj.SetString("itemRibbonLabel", SettingsManager.RegionSettings.GetRegionName(QueueManager.GetPropNumber(QUEUE_CONFIG_SITEID, SPT_QUEUE)));
        }
    }

    return obj;
}

function RefreshButtons()
{
    SetOverrides();

    super.RefreshButtons();
}

function SetOverrides()
{
    PageLabelOverride = QueueManager.GetProfileName();
}

function CheckDescription(GFxObject DataList)
{
    local GFxObject obj;
    local GFxObject descObj;

    obj = CreateObject("Object");
    obj.SetFloat("elementId", MENU_ELEMENT_DESCRIPTION);

    descObj = FillDescription(DataList);

    if (descObj != none)
    {
        obj.SetObject("data", descObj);

        if (DataList != none) DataList.SetElementObject(DataCount++, obj);
    }
}

function GFxObject FillDescription(GFxObject DataList)
{
    local GFxObject obj;

    obj = CreateObject("Object");
    obj.SetString("descTitle", QueueManager.GetProfileName());
    obj.SetString("description", QueueManager.GetProfileDesc());

    return obj;
}

defaultproperties
{
   LocalNameNumber=1
   PageLabel="SERVER SETTINGS"
   OptionTitles(0)="LOCAL NAME"
   OptionTitles(1)="DISPLAY NAME"
   OptionTitles(2)="DISPLAY DESCRIPTION"
   OptionTitles(3)="REGION"
   OptionTitles(4)="ADMIN PASSWORD"
   OptionTitles(5)="PUBLIC PASSWORD"
   OptionSubtext(0)="SELECT TO CHANGE"
   OptionSubtext(1)="SELECT TO CHANGE"
   OptionSubtext(2)="SELECT TO CHANGE"
   OptionSubtext(3)="SELECT TO CHANGE"
   OptionSubtext(4)="SELECT TO CHANGE"
   OptionSubtext(5)="SELECT TO CHANGE"
   Name="Default__GFxTrPage_ServerSettings"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
