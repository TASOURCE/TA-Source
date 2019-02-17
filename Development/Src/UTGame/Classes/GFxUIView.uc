class GFxUIView extends GFxObject
    dependson(WorldInfo);










const GS_USERNAME_MAXLENGTH					 = 15;
const GS_PASSWORD_MAXLENGTH					 = 30;
const GS_MESSAGE_MAXLENGTH					 = 255;
const GS_EMAIL_MAXLENGTH					 = 50;
const GS_CDKEY_PART_MAXLENGTH				 = 4;


const CONTEXT_PRESENCE_MENUPRESENCE              = 0;

const CONTEXT_GAME_MODE							 = 0x0000800B;


const CONTEXT_GAME_MODE_DM                       = 0;
const CONTEXT_GAME_MODE_CTF                      = 1;
const CONTEXT_GAME_MODE_WAR                      = 2;
const CONTEXT_GAME_MODE_VCTF					 = 3;
const CONTEXT_GAME_MODE_TDM                      = 4;
const CONTEXT_GAME_MODE_DUEL                     = 5;
const CONTEXT_GAME_MODE_CUSTOM                   = 6;
const CONTEXT_GAME_MODE_CAMPAIGN                 = 7;

const CONTEXT_MAPNAME                            = 0;
const CONTEXT_LOCKEDSERVER                       = 1;
const CONTEXT_ALLOWKEYBOARD                      = 2;

const CONTEXT_BOTSKILL                           = 10;
const CONTEXT_PURESERVER                         = 11;
const CONTEXT_VSBOTS                             = 12;
const CONTEXT_CAMPAIGN                           = 13;
const CONTEXT_FORCERESPAWN                       = 14;
const CONTEXT_FULLSERVER                         = 15;
const CONTEXT_EMPTYSERVER                        = 16;
const CONTEXT_DEDICATEDSERVER                    = 17;


const CONTEXT_MAPNAME_CUSTOM                     = 0;



const CONTEXT_BOTSKILL_NOVICE                    = 0;
const CONTEXT_BOTSKILL_AVERAGE                   = 1;
const CONTEXT_BOTSKILL_EXPERIENCED               = 2;
const CONTEXT_BOTSKILL_SKILLED                   = 3;
const CONTEXT_BOTSKILL_ADEPT                     = 4;
const CONTEXT_BOTSKILL_MASTERFUL                 = 5;
const CONTEXT_BOTSKILL_INHUMAN                   = 6;
const CONTEXT_BOTSKILL_GODLIKE                   = 7;



const CONTEXT_GOALSCORE_5                        = 0;
const CONTEXT_GOALSCORE_10                       = 1;
const CONTEXT_GOALSCORE_15                       = 2;
const CONTEXT_GOALSCORE_20                       = 3;
const CONTEXT_GOALSCORE_30                       = 4;



const CONTEXT_NUMBOTS_0                          = 0;
const CONTEXT_NUMBOTS_1                          = 1;
const CONTEXT_NUMBOTS_2                          = 2;
const CONTEXT_NUMBOTS_3                          = 3;
const CONTEXT_NUMBOTS_4                          = 4;
const CONTEXT_NUMBOTS_5                          = 5;
const CONTEXT_NUMBOTS_6                          = 6;
const CONTEXT_NUMBOTS_7                          = 7;
const CONTEXT_NUMBOTS_8                          = 8;



const CONTEXT_TIMELIMIT_5                        = 0;
const CONTEXT_TIMELIMIT_10                       = 1;
const CONTEXT_TIMELIMIT_15                       = 2;
const CONTEXT_TIMELIMIT_20                       = 3;
const CONTEXT_TIMELIMIT_30                       = 4;



const CONTEXT_PURESERVER_NO                      = 0;
const CONTEXT_PURESERVER_YES                     = 1;
const CONTEXT_PURESERVER_ANY                     = 2;



const CONTEXT_LOCKEDSERVER_NO                    = 0;
const CONTEXT_LOCKEDSERVER_YES                   = 1;



const CONTEXT_CAMPAIGN_NO                        = 0;
const CONTEXT_CAMPAIGN_YES                       = 1;



const CONTEXT_FORCERESPAWN_NO                        = 0;
const CONTEXT_FORCERESPAWN_YES                       = 1;



const CONTEXT_ALLOWKEYBOARD_NO                        = 0;
const CONTEXT_ALLOWKEYBOARD_YES                       = 1;
const CONTEXT_ALLOWKEYBOARD_ANY						= 2;


const CONTEXT_FULLSERVER_NO						= 0;
const CONTEXT_FULLSERVER_YES					= 1;


const CONTEXT_EMPTYSERVER_NO					= 0;
const CONTEXT_EMPTYSERVER_YES					= 1;


const CONTEXT_DEDICATEDSERVER_NO                = 0;
const CONTEXT_DEDICATEDSERVER_YES               = 1;



const  CONTEXT_VSBOTS_NONE                       = 0;
const  CONTEXT_VSBOTS_1_TO_2                     = 1;
const  CONTEXT_VSBOTS_1_TO_1                     = 2;
const  CONTEXT_VSBOTS_3_TO_2					 = 3;
const  CONTEXT_VSBOTS_2_TO_1                     = 4;
const  CONTEXT_VSBOTS_3_TO_1                     = 5;
const  CONTEXT_VSBOTS_4_TO_1                     = 6;

const PROPERTY_NUMBOTS							 = 0x100000F7;
const PROPERTY_TIMELIMIT				         = 0x1000000A;
const PROPERTY_GOALSCORE						 = 0x1000000B;
const PROPERTY_LEADERBOARDRATING	             = 0x20000004;
const PROPERTY_EPICMUTATORS                      = 0x10000105;


const PROPERTY_CUSTOMMAPNAME                     = 0x40000001;
const PROPERTY_CUSTOMGAMEMODE                    = 0x40000002;
const PROPERTY_SERVERDESCRIPTION                 = 0x40000003;
const PROPERTY_CUSTOMMUTATORS                    = 0x40000004;


const QUERY_DM									 = 0;
const QUERY_TDM									 = 1;
const QUERY_CTF									 = 2;
const QUERY_VCTF								 = 3;
const QUERY_WAR									 = 4;
const QUERY_DUEL								 = 5;
const QUERY_CAMPAIGN							 = 6;



const STATS_VIEW_DM_PLAYER_ALLTIME                         = 1;
const STATS_VIEW_DM_RANKED_ALLTIME                         = 2;
const STATS_VIEW_DM_WEAPONS_ALLTIME                        = 3;
const STATS_VIEW_DM_VEHICLES_ALLTIME                       = 4;
const STATS_VIEW_DM_VEHICLEWEAPONS_ALLTIME                 = 5;
const STATS_VIEW_DM_VEHICLES_RANKED_ALLTIME                = 6;
const STATS_VIEW_DM_VEHICLEWEAPONS_RANKED_ALLTIME          = 7;
const STATS_VIEW_DM_WEAPONS_RANKED_ALLTIME                 = 8;

#linenumber 4
/**
 * TRUE to indicate that this scene requires a valid network connection in order to be opened.  If no network connection is
 * available, the scene will be closed.
 */
var(Flags)							bool					bRequiresNetwork;

/**
 * Retrieves a reference to a LocalPlayer.
 *
 * @param	PlayerIndex		if specified, returns the player at this index in the GamePlayers array.  Otherwise, returns
 *							the player associated with the owner scene.
 *
 * @return	the player that owns this scene or is located in the specified index of the GamePlayers array.
 */
final function LocalPlayer GetPlayerOwner( optional int PlayerIndex=INDEX_NONE )
{    
    return Outer.GetLP();
}

/** Get the UDKPlayerController that is associated with this HUD. */
final function UDKPlayerController GetUDKPlayerOwner(optional int PlayerIndex=-1)
{
    return UDKPlayerController(Outer.GetPC());
}

/** @return Returns the current status of the platform's network connection. */
static final function bool HasLinkConnection()
{
	return class'UIInteraction'.static.HasLinkConnection();
}

// @todo sf: True implementation needs to be added.
function String GetPlayerName()
{
	return "Player";
}

/** @return Returns whether or not the player with the specified controller id is logged i.n */
event bool IsLoggedIn( optional int ControllerId=255, optional bool bRequireOnlineLogin )
{
	if ( ControllerId == 255 )
	{
        ControllerId = 0;
	}
	return class'UIInteraction'.static.IsLoggedIn(ControllerId, bRequireOnlineLogin);
}

/** @return Generates a set of URL options common to both instant action and host game. */
function String GetCommonOptionsURL()
{
	local string URL;
	local string OutStringValue;

	// Set player name using the OnlinePlayerData	    
	URL $= "?name=" $ "Player"; // GetPlayerName();

	// Set player alias
	if(class'UIRoot'.static.GetDataStoreStringValue("<OnlinePlayerData:ProfileData.Alias>", OutStringValue, GetPlayerOwner()) && Len(OutStringValue)>0)
	{
		OutStringValue = Repl(OutStringValue," ","_");
		OutStringValue = Repl(OutStringValue,"?","_");
		OutStringValue = Repl(OutStringValue,"=","_");

		URL $= "?alias="$OutStringValue;
	}

	return URL;
}

/** @return Returns the player index of the player owner for this scene. */
function int GetPlayerIndex()
{
	local int PlayerIndex;
	local LocalPlayer LP;

	LP = GetPlayerOwner();
	if ( LP != None )
	{
		PlayerIndex = class'UIInteraction'.static.GetPlayerIndex(LP.ControllerId);
	}
	else
	{
		//PlayerIndex = class'UIScreenObject'.static.GetBestPlayerIndex();
	}

	return PlayerIndex;
}

/** @return Returns the controller id of a player given its player index. */
function int GetPlayerControllerId(int PlayerIndex)
{
	return class'UIInteraction'.static.GetPlayerControllerId(PlayerIndex);;
}

/**
 * Executes a console command.
 *
 * @param string Cmd	Command to execute.
 */
final function ConsoleCommand(string Cmd, optional bool bWriteToLog)
{
    if (GetPC() != none)
        Outer.ConsoleCommand(Cmd);
}

defaultproperties
{
   Name="Default__GFxUIView"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
