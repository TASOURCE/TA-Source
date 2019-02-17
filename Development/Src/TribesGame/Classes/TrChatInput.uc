/** TrChatInput provides all text input for chat (in-game team and global, party chat, etc) */
class TrChatInput extends Interaction
	within TrGameViewportClient
	transient
	config(Input);

/** The player which the next console command should be executed in the context of.  If NULL, execute in the viewport. */
var LocalPlayer ConsoleTargetPlayer;

var Texture2D		DefaultTexture_Black;
var Texture2D		DefaultTexture_White;

/** The command the user is currently typing. */
var string TypedStr;
var int TypedStrPos;

var string ChannelStr;

/**
 * Indicates that InputChar events should be captured to prevent them from being passed on to other interactions.  Reset
 * when the another keydown event is received.
 */
var	transient	bool bCaptureKeyInput;

/** True while a control key is pressed. */
var bool bCtrl;

var config bool bEnableUI;

/**
 * Called when the Console is added to the GameViewportClient's Interactions array.
 */
function Initialized()
{
	Super.Initialized();
}

function SetInputText( string Text )
{
	TypedStr = Text;
}

function SetCursorPos( int Position )
{
	TypedStrPos = Position;
}

/**
 * Executes a console command.
 * @param Command - The command to execute.
 */
function ConsoleCommand(string Command)
{
	if(ConsoleTargetPlayer != None)
	{
		// If there is a console target player, execute the command in the player's context.
		ConsoleTargetPlayer.Actor.ConsoleCommand(Command);
	}
	else if(GamePlayers.Length > 0 && GamePlayers[0].Actor != None)
	{
		// If there are any players, execute the command in the first players context.
		GamePlayers[0].Actor.ConsoleCommand(Command);
	}
	else
	{
		// Otherwise, execute the command in the context of the viewport.
		Outer.ConsoleCommand(Command);
	}
}

/**
 * Opens the typing bar with text already entered.
 * @param Text - The text to enter in the typing bar.
 */
function StartTyping(coerce string Text)
{
	ChannelStr = Text;
	GotoState('Typing');
	SetInputText("");
	SetCursorPos(0);
}

function PostRender_Console(Canvas Canvas);

/**
 * Process an input key event routed through unrealscript from another object. This method is assigned as the value for the
 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
 *
 * @param	ControllerId	the controller that generated this input key event
 * @param	Key				the name of the key which an event occured for (KEY_Up, KEY_Down, etc.)
 * @param	EventType		the type of event which occured (pressed, released, etc.)
 * @param	AmountDepressed	for analog keys, the depression percent.
 *
 * @return	true to consume the key event, false to pass it on.
 */
function bool InputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE )
{
	return false;
}

/**
 * Process a character input event (typing) routed through unrealscript from another object. This method is assigned as the value for the
 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
 *
 * @param	ControllerId	the controller that generated this character input event
 * @param	Unicode			the character that was typed
 *
 * @return	True to consume the character, false to pass it on.
 */
function bool InputChar( int ControllerId, string Unicode )
{
	return bCaptureKeyInput;
}

/**
 * Clears out all pressed keys from the player's input object.
 */
function FlushPlayerInput()
{
	local PlayerController PC;

	if(ConsoleTargetPlayer != None)
	{
		PC = ConsoleTargetPlayer.Actor;
	}
	else if(GamePlayers.Length > 0 && GamePlayers[0].Actor != None)
	{
		// If there are any players, execute the command in the first players context.
		PC = GamePlayers[0].Actor;
	}

	if ( PC != None && PC.PlayerInput != None )
	{
		PC.PlayerInput.ResetInput();
	}
}

/** looks for Control key presses and the copy/paste combination that apply to both the console bar and the full open console */
function bool ProcessControlKey(name Key, EInputEvent Event)
{
	if (Key == 'LeftControl' || Key == 'RightControl')
	{
		if (Event == IE_Released)
		{
			bCtrl = false;
		}
		else if (Event == IE_Pressed)
		{
			bCtrl = true;
		}

		return true;
	}
	else if (bCtrl && Event == IE_Pressed && GamePlayers.length > 0 && GamePlayers[0].Actor != None)
	{
		if (Key == 'v')
		{
			// paste
			AppendInputText(GamePlayers[0].Actor.PasteFromClipboard());
			return true;
		}
		else if (Key == 'c')
		{
			// copy
			GamePlayers[0].Actor.CopyToClipboard(TypedStr);
			return true;
		}
		else if (Key == 'x')
		{
			// cut
			if (TypedStr != "")
			{
				GamePlayers[0].Actor.CopyToClipboard(TypedStr);
				SetInputText("");
				SetCursorPos(0);
			}
			return true;
		}
	}

	return false;
}

/** appends the specified text to the string of typed text */
function AppendInputText(string Text)
{
	local int Character;

	while (Len(Text) > 0)
	{
		Character = Asc(Left(Text, 1));
		Text = Mid(Text, 1);

		if (Character >= 0x20 && Character < 0x100)
		{
			SetInputText(Left(TypedStr, TypedStrPos) $ Chr(Character) $ Right(TypedStr, Len(TypedStr) - TypedStrPos));
			SetCursorPos(TypedStrPos + 1);
		}
	};
}

/**
 * This state is used when the typing bar is open.
 */
state Typing
{
	/**
	 * Process a character input event (typing) routed through unrealscript from another object. This method is assigned as the value for the
	 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
	 *
	 * @param	ControllerId	the controller that generated this character input event
	 * @param	Unicode			the character that was typed
	 *
	 * @return	True to consume the character, false to pass it on.
	 */
	function bool InputChar( int ControllerId, string Unicode )
	{
		if ( bCaptureKeyInput )
		{
			return true;
		}

		AppendInputText(Unicode);

		return true;
	}

	/**
	 * Process an input key event routed through unrealscript from another object. This method is assigned as the value for the
	 * OnRecievedNativeInputKey delegate so that native input events are routed to this unrealscript function.
	 *
	 * @param	ControllerId	the controller that generated this input key event
	 * @param	Key				the name of the key which an event occured for (KEY_Up, KEY_Down, etc.)
	 * @param	EventType		the type of event which occured (pressed, released, etc.)
	 * @param	AmountDepressed	for analog keys, the depression percent.
	 *
	 * @return	true to consume the key event, false to pass it on.
	 */
	function bool InputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE )
	{
		local string Temp;
		local int NewPos, SpacePos, PeriodPos;

		//`log(`location@`showvar(Key));

		if ( Event == IE_Pressed )
		{
			bCaptureKeyInput = false;
		}

		if (ProcessControlKey(Key, Event))
		{
			return true;
		}
		else if( bGamepad )
		{
			return FALSE;
		}
		else if( Key == 'Escape' && Event == IE_Released )
		{
			if( TypedStr!="" )
			{
				SetInputText("");
				SetCursorPos(0);
				return true;
			}
			else
			{
				GotoState( '' );
			}

			return true;
		}
		else if( Key=='Enter' && Event == IE_Released )
		{
			if( TypedStr!="" )
			{
				// Make a local copy of the string.
				Temp=ChannelStr@TypedStr;

				SetInputText("");
				SetCursorPos(0);

				ConsoleCommand(Temp);

				GotoState('');
			}
			else
			{
				GotoState('');
			}

			return true;
		}
		else if( Global.InputKey( ControllerId, Key, Event, AmountDepressed, bGamepad ) )
		{
			return true;
		}
		else if( Event != IE_Pressed && Event != IE_Repeat )
		{
			if( !bGamepad )
			{
				return	Key != 'LeftMouseButton'
					&&	Key != 'MiddleMouseButton'
					&&	Key != 'RightMouseButton';
			}
			return FALSE;
		}
		else if( Key=='backspace' )
		{
			if( TypedStrPos>0 )
			{
				SetInputText(Left(TypedStr,TypedStrPos-1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos));
				SetCursorPos(TypedStrPos-1);
			}

			return true;
		}
		else if ( Key=='delete' )
		{
			if ( TypedStrPos < Len(TypedStr) )
			{
				SetInputText(Left(TypedStr,TypedStrPos) $ Right(TypedStr, Len(TypedStr) - TypedStrPos - 1));
			}
			return true;
		}
		else if ( Key=='left' )
		{
			if (bCtrl)
			{
				// find the nearest '.' or ' '
				NewPos = Max(InStr(TypedStr,".",TRUE,FALSE,TypedStrPos),InStr(TypedStr," ",TRUE,FALSE,TypedStrPos));
				SetCursorPos(Max(0,NewPos));
			}
			else
			{
				SetCursorPos(Max(0, TypedStrPos - 1));
			}
			return true;
		}
		else if ( Key=='right' )
		{
			if (bCtrl)
			{
				// find the nearest '.' or ' '
				SpacePos = InStr(TypedStr," ",FALSE,FALSE,TypedStrPos+1);
				PeriodPos = InStr(TypedStr,".",FALSE,FALSE,TypedStrPos+1);
				// pick the closest valid index
				NewPos = SpacePos < 0 ? PeriodPos : (PeriodPos < 0 ? SpacePos : Min(SpacePos,PeriodPos));
				// jump to end if nothing in between
				if (NewPos == INDEX_NONE)
				{
					NewPos = Len(TypedStr);
				}
				SetCursorPos(Min(Len(TypedStr),Max(TypedStrPos,NewPos)));
			}
			else
			{
				SetCursorPos(Min(Len(TypedStr), TypedStrPos + 1));
			}
			return true;
		}
		else if ( Key=='home' )
		{
			SetCursorPos(0);
			return true;
		}
		else if ( Key=='end' )
		{
			SetCursorPos(Len(TypedStr));
			return true;
		}

		return TRUE;
	}

	event PostRender_Console(Canvas Canvas)
	{
		local float xl, yl, ClipX, ClipY, LeftPos;
		local string OutStr;

		Global.PostRender_Console(Canvas);

		// Blank out a space

		// use the smallest font
		Canvas.Font	 = class'Engine'.Static.GetSmallFont();
		// determine the position for the cursor
		OutStr = ChannelStr$">"@TypedStr;
		Canvas.Strlen(OutStr,xl,yl);

		ClipX = Canvas.ClipX;
		ClipY = Canvas.ClipY;
		LeftPos = 0;

		if (Class'WorldInfo'.Static.IsConsoleBuild())
		{
			ClipX	-= 32;
			ClipY	-= 32;
			LeftPos	 = 32;
		}

		// start at the bottom of the screen, then come up 6 pixels more than the height of the font
		Canvas.SetPos(LeftPos,ClipY-6-yl);
		// draw the background texture
		//Canvas.DrawTile( DefaultTexture_Black, ClipX, yl+6,0,0,32,32);
		Canvas.SetDrawColor(1,22,10);
		Canvas.DrawRect(ClipX, yl+6.0f);

		Canvas.SetPos(LeftPos,ClipY-6-yl);

		// Set the text color.
		Canvas.SetDrawColor(199,254,218);

		// draw the top border of the typing region
		Canvas.DrawTile( DefaultTexture_White, ClipX, 2,0,0,32,32);

		// center the text between the bottom of the screen and the bottom of the border line
		Canvas.SetPos(LeftPos,ClipY-3-yl);
		Canvas.bCenter = False;
		Canvas.DrawText( OutStr, false );

		// determine the cursor position
		OutStr = ChannelStr$">"@Left(TypedStr,TypedStrPos);
		//OutStr = "(>"@Left(TypedStr,TypedStrPos);
		Canvas.StrLen(OutStr,xl,yl);

		// move the pen to that position
		Canvas.SetPos(LeftPos + xl,ClipY-1-yl);

		// draw the cursor
		Canvas.DrawText("_");
	}

	event BeginState(Name PreviousStateName)
	{
		if ( PreviousStateName == '' )
		{
			FlushPlayerInput();
		}
		bCaptureKeyInput = true;
	}

	event EndState( Name NextStateName )
	{
	}
}

defaultproperties
{
   DefaultTexture_Black=Texture2D'EngineResources.Black'
   DefaultTexture_White=Texture2D'EngineResources.WhiteSquareTexture'
   __OnReceivedNativeInputKey__Delegate=Default__TrChatInput.InputKey
   __OnReceivedNativeInputChar__Delegate=Default__TrChatInput.InputChar
   Name="Default__TrChatInput"
   ObjectArchetype=Interaction'Engine.Default__Interaction'
}
