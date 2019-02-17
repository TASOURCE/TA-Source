class TrBrowserManager extends Object
    native;

var string URLGold;
var string URLAlert;
var string URLStore;
var string URLBooster;
var string URLSupport;
var string URLProfile;
var string URLRedirect;
var string URLClassVideo;
var string URLActivateKey;
var string URLCreateAccount;
var string URLRecoverPassword;
var string URLRecoverUsername;
var string URLCreateSteamAccount;

native function OpenURL(string URL);
native function OpenVideo(string URL);
native function string GetLanguageString();

function Alert()            { OpenURL(URLAlert$GetLangParam()); }
function Gold()             { OpenURL(URLRedirect$URLGold$GetLangParam()); }
function Store()            { OpenURL(URLRedirect$URLStore$GetLangParam()); }
function Booster()          { OpenURL(URLRedirect$URLBooster$GetLangParam()); }
function Support()          { OpenURL(URLRedirect$URLSupport$GetLangParam()); }
function Profile()          { OpenURL(URLRedirect$URLProfile$GetLangParam()); }
function ActivateKey()      { OpenURL(URLRedirect$URLCreateAccount$GetLangParam()); }
function RecoverPassword()  { OpenURL(URLRedirect$URLRecoverPassword$GetLangParam()); }
function RecoverUsername()  { OpenURL(URLRedirect$URLRecoverUsername$GetLangParam()); }
function ClassVideo(int Id) { OpenVideo(URLClassVideo); }

function CreateAccount(bool bUsingSteam)
{
    if (bUsingSteam)
    {
        OpenURL(URLRedirect$URLCreateSteamAccount$GetLangParam());
    }
    else
    {
        OpenURL(URLRedirect$URLCreateAccount$GetLangParam());
    }
}

function string GetLangParam()
{
    local string language;

    language = GetLanguageString();

    if (language == "" || language == "INT")
    {
        return "";
    }
    
    return "&lang="$language;
}

defaultproperties
{
   URLGold="Gold"
   URLAlert="http://www.tribesascend.com/globalalert"
   URLStore="Store"
   URLBooster="Booster"
   URLSupport="Support"
   URLProfile="Profile"
   URLRedirect="https://account.hirezstudios.com/tribesingameredirect.aspx?dest="
   URLClassVideo="https://account.hirezstudios.com/tribesascend/gameclass/soldier.htm"
   URLActivateKey="ACTIVATEKEY"
   URLCreateAccount="CREATEACCOUNT"
   URLRecoverPassword="RECOVERPASSWORD"
   URLRecoverUsername="RECOVERUSER"
   URLCreateSteamAccount="CREATESTEAMACCOUNT"
   Name="Default__TrBrowserManager"
   ObjectArchetype=Object'Core.Default__Object'
}
