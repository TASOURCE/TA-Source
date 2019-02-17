/**
 * This class extension is used so that we can tick for server updates while
 * in the main menu. Normal Actor class ticks do not process during this time
 * since the game is technically in a Paused state.
 * */
class TrGameViewportClient extends UTGameViewportClient
	config(Game);

/** The chat console. */
//var TrChatInput ChatConsole;
var TrChatConsole           ChatConsole;




















event bool Init(out string OutError)
{
	// Create the viewport's console.
	ChatConsole = new(Self) class'TrChatConsole';
	if (InsertInteraction(ChatConsole) == -1)
	{
		OutError = "Failed to add interaction to GlobalInteractions array:" @ ChatConsole;
		return false;
	}

	return super.Init(OutError);
}

event PostRender(Canvas Canvas)
{
	super.PostRender(Canvas);

	// Don't render chat console unless we aren't in the ViewportConsole.
	if (ViewportConsole != None && (ViewportConsole.IsInState('Typing') || ViewportConsole.IsInState('Open')))
		return;

	ChatConsole.PostRender_Console(Canvas);
}

defaultproperties
{
   Name="Default__TrGameViewportClient"
   ObjectArchetype=UTGameViewportClient'UTGame.Default__UTGameViewportClient'
}
