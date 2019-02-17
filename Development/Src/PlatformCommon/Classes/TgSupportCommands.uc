//=============================================================================
// TgSupportCommands
// Object within playercontroller that manages "cheat" commands
//=============================================================================

class TgSupportCommands extends Object
	native;

enum GC_ALERT_PRIORITY
{
GC_APT_MINIMAL,
GC_APT_NORMAL,
GC_APT_HIGH,
GC_APT_CRITICAL
};

const GC_OS_TYPE_BELOW_XP=10300;
const GC_OS_TYPE_XP=10301;
const GC_OS_TYPE_VISTA=10303;
const GC_OS_TYPE_WIN7=10305;
const GC_OS_TYPE_WIN8=10307;

enum GC_CHAT_CHANNEL
{
GC_CC_GLOBAL,
GC_CC_CLAN,
GC_CC_INSTANCE,
GC_CC_LOCAL_TEAM,
GC_CC_PARTY,
GC_CC_CITY,
GC_CC_PERSONAL,
GC_CC_PRIVATE_1,
GC_CC_EOM_LOBBY,
GC_CC_SYSTEM,
GC_CC_TRADE,
GC_CC_LFG,
GC_CC_HELP,
GC_CC_VOIP_NEWS,
GC_CC_COUNT,
GC_CC_VOIP_ECHO,
GC_CC_VOIP_CONF,
GC_CC_COMBAT,
GC_CC_EMOTE,
GC_CC_INVALID,
GC_CC_LAST
};

enum GC_STEAM_TXN_TYPES
{
GC_STT_INVALID,
GC_STT_GETUSERINFO,
GC_STT_INIT,
GC_STT_FINALIZE,
GC_STT_DECLINE,
GC_STT_MAX,
};

#linenumber 9

var const transient PlayerController PC;
var const transient WorldInfo        WorldInfo;

exec native function gmMatchForce(optional int nQueueId = 0);
exec native function gmMatchNext(int nMapId);

exec native function gmCommand(string sCommand);
exec native function gmC(string sCommand);

native function GPerfDebugFeet(int feet);
native function GPerfDebugSkips(int skips);
native function GPerfDebugRelevMode(int mode);

ServerCmd function scLog(string LogName, bool bEnabled = true)
{
	local string Prefix;

	if( bEnabled )
	{
		;
	}
	else
	{
		;
	}
	Prefix = bEnabled ? "UnSuppress" : "Suppress";
	WorldInfo.Game.ConsoleCommand(Prefix@LogName);
}

ServerCmd function scLogMark(string Comment)
{
    ;
}

ServerCmd function scStartGame(string Reason = "Admin")
{
    local FrameworkGame game;
    game = FrameworkGame(WorldInfo.Game);
    if (game != none)
    {
        ;
        game.TgStartGame(Reason);
    }
}

ServerCmd function scEndGame(string Reason = "Admin")
{
    local FrameworkGame game;
    game = FrameworkGame(WorldInfo.Game);
    if (game != none)
    {
        ;
        game.TgEndGame(Reason);
    }
}

ServerCmd function scScore(int nTeam, optional int nCount = 1)
{
    local FrameworkGame game;
    game = FrameworkGame(WorldInfo.Game);
    if (game != none)
    {
        ;
        game.TgChangeScore(nTeam, nCount);
    }
}

ServerCmd function scTime(int nSeconds)
{
    local FrameworkGame game;
    game = FrameworkGame(WorldInfo.Game);
    if (game != none)
    {
        ;
        game.TgChangeTime(nSeconds);
    }
}

ServerCmd function scTimer(string sCommand)
{
    local FrameworkGame game;

    game = FrameworkGame(WorldInfo.Game);

    if (game != none)
    {
        game.TgTimer(sCommand);
    }
}

ServerCmd function scDemoRec()
{
    WorldInfo.Game.ConsoleCommand("DEMOREC");
}

ServerCmd function scDemoStop()
{
    WorldInfo.Game.ConsoleCommand("DEMOSTOP");
}

ServerCmd function scPerfDebugFeet(int feet)
{
    GPerfDebugFeet(feet);
}

ServerCmd function scPerfDebugSkip(int skips)
{
    GPerfDebugSkips(skips);
}
ServerCmd function scPerfDebugRelevMode(int mode)
{
    GPerfDebugRelevMode(mode);
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__TgSupportCommands"
   ObjectArchetype=Object'Core.Default__Object'
}
