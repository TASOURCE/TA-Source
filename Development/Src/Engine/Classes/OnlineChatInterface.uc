//$$BE Added chat interface.

/** This interface provides access to basic chat functionality. */
interface OnlineChatInterface
	dependson(OnlineSubsystem);

/** Delegate used when a chat message has been received. */
delegate OnChatMessage(int Channel, string Sender, string Message);

/** Adds the delegate used to notify when a chat message has been received. */
function AddChatMessageDelegate(delegate<OnChatMessage> ChatDelegate);

/** Adds the delegate used to notify when a chat message has been received. */
function ClearChatMessageDelegate(delegate<OnChatMessage> ChatDelegate);

/** Sends a chat message on the designated channel. */
function SendChatMessage(int Channel, string Message);

/** Sends a chat message to the designated player. */
function SendPrivateChatMessage(string PlayerName, string Message);

/** Notifies the subsystem of a team change. */
function NotifyTeamChange(QWORD PlayerUid, byte TeamId);

defaultproperties
{
   Name="Default__OnlineChatInterface"
   ObjectArchetype=Interface'Core.Default__Interface'
}
