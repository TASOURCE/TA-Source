/**
 * 
 */
class TrChatConsoleCommands extends Object within TrPlayerController
    native;

native function ChatConsoleCommand(string Command);
native function ReportPlayer(string PlayerName, string Reason);

exec function Say(string Msg)
{       
	Outer.Say(Msg);    
}

exec function TeamSay(string Msg)
{
    Outer.TeamSay(Msg);
}

exec function Mute(string PlayerName)
{
    MutePlayer(PlayerName);    
}

exec function Unmute(string PlayerName)
{
    UnmutePlayer(PlayerName);    
}

exec function Votekick(string PlayerName)
{
    Outer.RequestKickVote(PlayerName);
}

exec function Report(string PlayerName, string Reason)
{
    ReportPlayer(PlayerName, Reason);    
}

exec function Tell(string PlayerName, string Message)
{
    Outer.SendPrivateChatMessage(PlayerName, Message);
}

exec function Exit()
{
    Outer.ConsoleCommand("Exit");
}

exec function Quit()
{
    Outer.ConsoleCommand("Quit");
}

//this command is safeguarded by tgna_dev, of which we have few in Live
exec function GiveCredits(int Count)
{
    Outer.GiveCredits(Count);
}

exec function SC(string fsRequest)
{
    Outer.SendCtrlRequest(fsRequest);
}

exec function SendCtrlRequest(string fsRequest)
{
    Outer.SendCtrlRequest(fsRequest);
}

exec function SendGameRequest(string fsRequest)
{
    Outer.SendGameRequest(fsRequest);
}

exec function SpecList()
{
    Outer.SpecList();
}

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__TrChatConsoleCommands"
   ObjectArchetype=Object'Core.Default__Object'
}
