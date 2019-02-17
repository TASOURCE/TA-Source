class GFxTrPage_Login extends GFxTrPage;

var localized string HelpLabel;
var localized string SubmitLabel;
var localized string AccountLabel;
var localized string BetaKeyLabel;
var localized string UsernameLabel;
var localized string PasswordLabel;
var localized string CheckboxLabel;
var localized string HelpUsernameLabel;
var localized string HelpPasswordLabel;
var localized string CreateAccountLabel;

enum MENU_ACTION_LOGIN
{
    MAL_LOAD,
    MAL_SUBMIT,
    MAL_BETAKEY,
    MAL_EXIT,
    MAL_HELPUSERNAME,
    MAL_HELPPASSWORD,
    MAL_NEWACCOUNT,
    MAL_REMEMBERME,
    MAL_MAX
};

function int TakeAction(int ActionIndex, GFxObject DataList)
{
    switch (ActionIndex)
    {
    case MAL_LOAD:         FillData(DataList);                return 1;
    case MAL_SUBMIT:       Pages.MainPage.FillData(DataList); return 1;
    case MAL_BETAKEY:      Browser.ActivateKey();             break;
    case MAL_HELPUSERNAME: Browser.RecoverUsername();         break;
    case MAL_HELPPASSWORD: Browser.RecoverPassword();         break;
    case MAL_NEWACCOUNT:   Browser.RecoverPassword();         break;
    case MAL_REMEMBERME:   /*Do something;*/                  break;
    case MAL_EXIT:         ExitPopup();                       break;
    default: break;
    }
    
    return super.TakeAction(ActionIndex, DataList);
}

function FillData(GFxObject DataList)
{
    local GFxObject obj;

    DataCount = 0;

    if (HaveEntry())
    {
        ShowModel();

        Pages.PushPage(self);
        
        obj = CreateObject("Object");
        
        obj.SetFloat("elementId", MENU_ELEMENT_LOGIN);
        obj.SetObject("data", FillOption(0));

        DataList.SetElementObject(DataCount++, obj);
    }
    else
    {
        bWaitingForEntry = true;
    }
}

function GFxObject FillOption(int ActionIndex)
{
    local int actionSubmit;
    local int actionBetaKey;
    local int actionExit;
    local int actionHelpUsername;
    local int actionHelpPassword;
    local int actionRememberMe;
    local GFxObject obj;

    actionSubmit       = MAL_SUBMIT;
    actionBetaKey      = MAL_BETAKEY;
    actionExit         = MAL_EXIT;
    actionHelpUsername = MAL_HELPUSERNAME;
    actionHelpPassword = MAL_HELPPASSWORD;
    actionRememberMe   = 0;

    if (User.m_Username != "" && User.m_Password != "") actionRememberMe = 1;

    obj = CreateObject("Object");

    obj.SetFloat("exitID", actionExit);
    obj.SetFloat("submitID", actionSubmit);
    obj.SetFloat("betaKeyID", actionBetaKey);
    obj.SetFloat("questUsernameID", actionHelpUsername);
    obj.SetFloat("questPasswordID", actionHelpPassword);
    obj.SetFloat("checkboxRememberPassword", actionRememberMe);
        
    if (User.m_Username == "")
    {
        obj.SetString("username", "");
        obj.SetString("password", "");
    }
    else
    {
        obj.SetString("username", User.m_Username);
        obj.SetString("password", User.DecryptPassword());
    }

    obj.SetString("accountTitleLabel", AccountLabel);
    obj.SetString("usernameLabel", UsernameLabel);
    obj.SetString("passwordLabel", PasswordLabel);
    obj.SetString("checkboxLabel", CheckboxLabel);
    obj.SetString("submitBtnLabel", SubmitLabel);
    obj.SetString("betaBtnLabel", CreateAccountLabel);//BetaKeyLabel);
    obj.SetString("helpBetaKey", "F1");
    obj.SetString("questTitle", HelpLabel);
    obj.SetString("questUsernameLabel", HelpUsernameLabel);
    obj.SetString("questPasswordLabel", HelpPasswordLabel);
    obj.SetString("questAccountLabel", CreateAccountLabel);
    obj.SetString("versionNumber", GetVersionString());
    obj.SetString("helpButtonALabel", HelpButtonALabel);
    obj.SetString("helpButtonBLabel", HelpButtonBLabel);
    obj.SetString("helpButtonYLabel", HelpButtonYLabel);
    obj.SetString("helpButtonXLabel", HelpButtonXLabel);
    obj.SetString("helpButtonBKey", "Esc");
    if (HelpButtonXKey != "") obj.SetString("helpButtonXKey", HelpButtonXKey);
    if (HelpButtonYKey != "") obj.SetString("helpButtonYKey", HelpButtonYKey);

    return obj;
}

function ShowModel()
{
    local TrEntryPlayerController TrEPC;

    TrEPC = TrEntryPlayerController(GetPC());
    TrEPC.UpdateMainMenuPaperDoll_Mesh(CDT_Login);
}

defaultproperties
{
   HelpLabel="HELP"
   SubmitLabel="SUBMIT"
   AccountLabel="ACCOUNT INFO"
   BetaKeyLabel="CREATE ACCOUNT"
   UsernameLabel="USERNAME"
   PasswordLabel="PASSWORD"
   CheckboxLabel="REMEMBER CREDENTIALS"
   HelpUsernameLabel="WHAT IS MY USERNAME?"
   HelpPasswordLabel="WHAT IS MY PASSWORD?"
   CreateAccountLabel="CREATE ACCOUNT"
   bAllowBack=False
   PageLabel="LOGIN"
   HelpButtonBLabel="EXIT GAME"
   Name="Default__GFxTrPage_Login"
   ObjectArchetype=GFxTrPage'TribesGame.Default__GFxTrPage'
}
