class TrChatConsole extends UTConsole
    within TrGameViewportClient
	transient        
	config(Input);

var string                              ChannelStr;
var config array<AutoCompleteCommand>	TribesAutoCompleteList;
var int                                 LastFriendCount;
var localized string                    SlashHelp;
var localized string                    TellHelp;
var localized string                    TabHelp;
var localized string                    EscHelp;
var float                               m_fTypingTime;
var TrPlayerController                  m_TrPC;

function Initialized()
{
    Super.Initialized();
    
    //kludge to support shipping and nonshipping versions (needs localization, etc)
        
    ManualAutoCompleteList.Remove(0,ManualAutoCompleteList.Length);
    ManualAutoCompleteList = TribesAutoCompleteList; 
    
}

function GetPlayerController()
{
    local TrPlayerController TrPC;

    // If there are any players, execute the command in the first players context.
    if(GamePlayers.Length > 0 && GamePlayers[0].Actor != None)
	{
        TrPC = TrPlayerController(GamePlayers[0].Actor);
        if(TrPC != None)
        {
			m_TrPC = TrPC;
        }
    }
}

function ConsoleCommand(string Command)
{
	if (m_TrPC == none)
	{
		GetPlayerController();
	}
	if (m_TrPC != none && m_TrPC.m_PlayerCommands != none)
	{
		m_TrPC.m_PlayerCommands.ChatConsoleCommand(Command);
	}
}

function StartTypingChat(coerce string Text, optional bool bFullConsole = false, optional string startText="")
{
	ChannelStr = Text;
    if(bFullConsole)
    {
        GotoState('Open');
    }
    else
    {
	    GotoState('Typing');
    }
	SetInputText(startText);
	SetCursorPos(Len(startText));

    // Fetch the typing start time.
	if (m_TrPC == none)
	{
		GetPlayerController();
	}
	if (m_TrPC != none)
	{
		m_fTypingTime = m_TrPC.WorldInfo.TimeSeconds;
	}
}

function StartTyping(coerce string Text)
{
	ChannelStr = Text;
	GotoState('Typing');
	SetInputText("");
	SetCursorPos(0);

    // Fetch the typing start time.
	if (m_TrPC == none)
	{
		GetPlayerController();
	}
	if (m_TrPC != none)
	{
		m_fTypingTime = m_TrPC.WorldInfo.TimeSeconds;
	}
}

function bool IsSlashCommand()
{
     return(Left(TypedStr,1) == "/");
}

function bool IsPlayerTell()
{
    return(Left(TypedStr,1) == "@");
}

function PostRender_Console(Canvas Canvas);

function bool InputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE )
{
    


	// Don't allow console commands when in seamless travel.
	if ( ConsoleTargetPlayer != None && ConsoleTargetPlayer.Actor.WorldInfo.IsInSeamlessTravel() )
	{
		return false;
	}

	if ( Event == IE_Pressed )
	{
		bCaptureKeyInput = false;

		//if ( Key == ConsoleKey )
		//{
		//	GotoState('Open');
        //    ChannelStr = "Say"; //hackyhack
		//	// this already gets set in Open.BeginState, but no harm in being explicit
		//	bCaptureKeyInput = true;
		//}
		//else 
        if ( Key == TypeKey )
		{
			GotoState('Typing');
			// this already gets set in Typing.BeginState, but no harm in being explicit
			bCaptureKeyInput = true;
		}
	}    

	return bCaptureKeyInput;
    
}

function AddOnlineFriendHelp()
{
    local int i;
    local array<string> friends;
    local AutoCompleteCommand cmd;
    
    GetPlayerController();
    if(m_TrPC == None) return;

    ManualAutoCompleteList.Remove(ManualAutoCompleteList.Length - LastFriendCount, LastFriendCount);
    //ManualAutoCompleteList = TribesAutoCompleteList; 
    
    //create friends
    m_TrPC.GetOnlineFriends(friends);
    
    //ManualAutoCompleteList.Append(TellAutoCompleteList);
    for(i=0;i<friends.length;++i)
    {
        cmd.Command = "@"$friends[i];
        cmd.Desc = cmd.Command@"<message>";
        ManualAutoCompleteList.AddItem(cmd);
    }
    lastFriendCount = friends.Length;

    BuildRuntimeAutoCompleteList(true);
}

state Open 
{
    function BeginState(Name PreviousStateName)
    {
        Super.BeginState(PreviousStateName);
        AddOnlineFriendHelp();        
    }

    function bool InputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE )
    {
        local string Temp;
        if( Key=='Enter' && Event == IE_Released )
		{
			if (m_TrPC != none && (m_TrPC.WorldInfo.TimeSeconds - m_fTypingTime) < 0.15f)
			{
				return true;
			}

			if( TypedStr!="" )
			{
				// Make a local copy of the string.
                if (IsSlashCommand())
	            {
		            Temp = Mid(TypedStr, 1, Len(TypedStr) - 1);
	            }
                else if (IsPlayerTell())
                {
                    Temp = "Tell"@(Mid(TypedStr, 1, Len(TypedStr) - 1));
                }
                else
                {
                    Temp=ChannelStr@TypedStr;
                }                

				SetInputText("");
				SetCursorPos(0);

				ConsoleCommand(Temp);

				//GotoState('');
                UpdateCompleteIndices();
			}
			else
			{
				GotoState('');
			}

			return true;
		}
        else if(Key == 'Tab' && Event == IE_Pressed)
	    {
		    if (AutoCompleteIndices.Length > 0 && !bAutoCompleteLocked)
		    {
                TypedStr = AutoCompleteList[AutoCompleteIndices[AutoCompleteIndex]].Command$" ";            
			    SetCursorPos(Len(TypedStr));
			    
		    }		    
		    return true;
	    }
        //don't close this with the console key
        else if( Key==ConsoleKey && Event == IE_Pressed )
		{	
            return true;			
		}
        
        return Super.InputKey(ControllerId, Key, Event, AmountDepressed, bGamepad);
    }

    event PostRender_Console(Canvas Canvas)
	{

		local float Height;
		local float xl, yl, y, ScrollLineXL, ScrollLineYL, info_xl, info_yl;
		local string OutStr;
		local int idx, MatchIdx, remlen;
        local Color DefaultColor;        

		// render the buffer

		// Blank out a space
		Canvas.Font = class'Engine'.Static.GetSmallFont();

		// the height of the buffer will be 75% of the height of the screen
		Height = Canvas.ClipY * 0.75;

	    // Set the text color.
        if(IsSlashCommand())
        {
            Canvas.SetDrawColor(0,255,0);		    
        }
        else
        {
            Canvas.SetDrawColor(199,254,218);
        }
		// move the pen to the top-left pixel
		Canvas.SetPos(0,0);

		// draw the black background tile
		Canvas.DrawTile( DefaultTexture_Black, Canvas.ClipX, Height,0,0,32,32);

		// now render the typing region
		OutStr = ChannelStr$">"@TypedStr;

		// determine the height of the text
		Canvas.Strlen(OutStr,xl,yl);

		// move the pen up + 12 pixels of buffer (for the green borders and some space)
		Canvas.SetPos(0,Height-12-yl);

		// Set the text color.
        if(IsSlashCommand())
        {
            Canvas.SetDrawColor(0,255,0);		    
        }
        else
        {
            Canvas.SetDrawColor(199,254,218);
        }

		// draw the top typing region border
		Canvas.DrawTile( DefaultTexture_White, Canvas.ClipX, 2,0,0,32,32);

		// move the pen to the bottom of the console buffer area
		Canvas.SetPos(0,Height);

		// draw the bottom typing region border
		Canvas.DrawTile( DefaultTexture_White, Canvas.ClipX, 2,0,0,32,32);

		// center the pen between the two borders
		Canvas.SetPos(0,Height-5-yl);
		Canvas.bCenter = False;

		// render the text that is being typed
		Canvas.DrawText( OutStr, false );

		// draw the remaining text for matching auto-complete
		if (AutoCompleteIndices.Length > 0)
		{
			Idx = AutoCompleteIndices[0];
			//Canvas.StrLen(OutStr,xl,yl);
			Canvas.SetPos(0+xl,Height-5-yl);
			Canvas.SetDrawColor(87,148,87);
            remlen = Len(AutoCompleteList[Idx].Command) - Len(TypedStr);
			Canvas.DrawText(Right(AutoCompleteList[Idx].Command,remlen),FALSE);
            if (remlen > 0)
            {
                Canvas.DrawText("   "@TabHelp);
            }

			Canvas.StrLen(ChannelStr$">", xl, yl);
			y = Height + 5;
			for (MatchIdx = 0; MatchIdx < AutoCompleteIndices.Length && MatchIdx < 10; MatchIdx++)
			{
				Idx = AutoCompleteIndices[MatchIdx];
				Canvas.SetPos(0 + xl, y);
				Canvas.StrLen(AutoCompleteList[Idx].Desc, info_xl, info_yl);
				Canvas.SetDrawColor(0, 0, 0);
				Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0, 0, 32, 32);
				Canvas.SetPos(0 + xl, y);
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText(AutoCompleteList[Idx].Desc, false);
				y += info_yl;
			}
		}
        else if(TypedStr=="" )
        {
            Canvas.SetPos(0+xl,Height-5-yl);
			Canvas.SetDrawColor(87,148,87);
            Canvas.DrawText("      "@EscHelp);
            
            y = Height + 5;
			Canvas.SetPos(0 + xl, y);
			Canvas.StrLen(Default.SlashHelp, info_xl, info_yl);
			Canvas.SetDrawColor(0, 0, 0);
			Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0, 0, 32, 32);
			Canvas.SetPos(0 + xl, y);
			Canvas.SetDrawColor(0, 255, 0);
			Canvas.DrawText(Default.SlashHelp, false);
			y += info_yl;			
            Canvas.SetPos(0 + xl, y);
			Canvas.StrLen(Default.TellHelp, info_xl, info_yl);
			Canvas.SetDrawColor(0, 0, 0);
			Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0, 0, 32, 32);
			Canvas.SetPos(0 + xl, y);
			Canvas.SetDrawColor(0, 255, 0);
			Canvas.DrawText(Default.TellHelp, false);
			y += info_yl;			
        }

		OutStr = ChannelStr$">"@Left(TypedStr,TypedStrPos);

		// position the pen at the cursor position
		Canvas.StrLen(OutStr,xl,yl);
		Canvas.SetPos(xl,Height-3-yl);

		// render the cursor
		Canvas.DrawText("_");

		// figure out which element of the scrollback buffer to should appear first (at the top of the screen)
		idx = SBHead - SBPos;
		y = Height-16-(yl*2);

		if (ScrollBack.Length==0)
			return;

		// change the draw color to white
        DefaultColor = class'HUD'.default.WhiteColor;		

		// while we have enough room to draw another line and there are more lines to draw
		while (y>yl && idx>=0)
		{
			// move the pen to the correct position
			Canvas.SetPos(0, y);

			// adjust the location for any word wrapping due to long text lines
			Canvas.StrLen(ScrollBack[idx].Text, ScrollLineXL, ScrollLineYL);
			if (ScrollLineYL > yl)
			{
				y -= (ScrollLineYL - yl);
				Canvas.CurY = y;
			}
            
            if(ScrollBack[idx].OverrideColor != class'UTHUD'.default.BlackColor)
            {
                Canvas.SetDrawColorStruct(ScrollBack[idx].OverrideColor);
            }
            else
            {
                Canvas.SetDrawColorStruct(DefaultColor);
            }

			// draw the next line down in the buffer
			Canvas.DrawText(Scrollback[idx].Text,false);
			idx--;
			y-=yl;
		}
	}
}

state Typing
{
    function BeginState(Name PreviousStateName)
    {
        Super.BeginState(PreviousStateName);
        AddOnlineFriendHelp();        
    }

    function bool InputKey( int ControllerId, name Key, EInputEvent Event, float AmountDepressed = 1.f, bool bGamepad = FALSE )
    {
        local string Temp;
        if( Key=='Enter' && Event == IE_Released )
		{
			if (m_TrPC != none && (m_TrPC.WorldInfo.TimeSeconds - m_fTypingTime) < 0.15f)
			{
				return true;
			}

			if( TypedStr!="" )
			{
				// Make a local copy of the string.
                if (IsSlashCommand())
	            {
		            Temp = Mid(TypedStr, 1, Len(TypedStr) - 1);
	            }
                else if (IsPlayerTell())
                {
                    Temp = "Tell"@(Mid(TypedStr, 1, Len(TypedStr) - 1));
                }
                else
                {
                    Temp=ChannelStr@TypedStr;
                }                

				SetInputText("");
				SetCursorPos(0);

				ConsoleCommand(Temp);
                ChannelStr = "";

                UpdateCompleteIndices();

				GotoState('');
			}
			else
			{
				GotoState('');
			}

			return true;
		}
        else if(Key == 'Tab' && Event == IE_Pressed)
	    {
		    if (AutoCompleteIndices.Length > 0 && !bAutoCompleteLocked)
		    {
                TypedStr = AutoCompleteList[AutoCompleteIndices[AutoCompleteIndex]].Command$" ";            
			    SetCursorPos(Len(TypedStr));
			    
		    }		    
		    return true;
	    }
        return Super.InputKey(ControllerId, Key, Event, AmountDepressed, bGamepad);
    }

    event PostRender_Console(Canvas Canvas)
	{
    	local float xl, yl, ClipX, ClipY, LeftPos, y, info_xl, info_yl;
		local string OutStr;
        local int idx, MatchIdx, remlen;
        
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
        if(IsSlashCommand())
        {
            Canvas.SetDrawColor(0,255,0);		    
        }
        else
        {
            Canvas.SetDrawColor(199,254,218);            
        }

		// draw the top border of the typing region
		Canvas.DrawTile( DefaultTexture_White, ClipX, 2,0,0,32,32);

		// center the text between the bottom of the screen and the bottom of the border line
		Canvas.SetPos(LeftPos,ClipY-3-yl);
		Canvas.bCenter = False;
		Canvas.DrawText( OutStr, false );

        // draw the remaining text for matching auto-complete
		if (AutoCompleteIndices.Length > 0)
		{
			Idx = AutoCompleteIndices[0];
			//Canvas.StrLen(OutStr,xl,yl);
			Canvas.SetPos(0+xl,ClipY-3-yl);
			Canvas.SetDrawColor(87,148,87);
            Canvas.StrLen(AutoCompleteList[Idx].Desc, info_xl, info_yl);
            remlen = Len(AutoCompleteList[Idx].Command) - Len(TypedStr);
			Canvas.DrawText(Right(AutoCompleteList[Idx].Command,remlen),FALSE);
            if (remlen > 0)
            {
                Canvas.DrawText("   "@TabHelp);
            }

			Canvas.StrLen(ChannelStr$">", xl, yl);
			y = ClipY-3-yl-5-info_yl;
			for (MatchIdx = 0; MatchIdx < AutoCompleteIndices.Length && MatchIdx < 10; MatchIdx++)
			{
				Idx = AutoCompleteIndices[MatchIdx];
				Canvas.SetPos(0 + xl, y);
				Canvas.StrLen(AutoCompleteList[Idx].Desc, info_xl, info_yl);
				Canvas.SetDrawColor(0, 0, 0);
				Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0, 0, 32, 32);
				Canvas.SetPos(0 + xl, y);
				Canvas.SetDrawColor(0, 255, 0);
				Canvas.DrawText(AutoCompleteList[Idx].Desc, false);
				y -= info_yl;
			}
		}
        else if(TypedStr=="" && TrHUD(m_TrPC.myHUD)== None)  //don't show help text in-game
        {
            Canvas.SetDrawColor(87,148,87);
            Canvas.DrawText("    "@Default.TellHelp);	
            Canvas.SetDrawColor(199,254,218);  
        }

		// determine the cursor position
		OutStr = ChannelStr$">"@Left(TypedStr,TypedStrPos);
		//OutStr = "(>"@Left(TypedStr,TypedStrPos);
		Canvas.StrLen(OutStr,xl,yl);

		// move the pen to that position
		Canvas.SetPos(LeftPos + xl,ClipY-1-yl);

		// draw the cursor
		Canvas.DrawText("_");
	}
}

defaultproperties
{
   TribesAutoCompleteList(0)=(Command="/stat fps",Desc="/stat fps (Display your FPS)")
   TribesAutoCompleteList(1)=(Command="/report",Desc="/report <Player> <Reason For Reporting> (Send a confidential report to Hi-Rez)")
   TribesAutoCompleteList(2)=(Command="/mute",Desc="/mute <Player> (Stop displaying chat from a player)")
   TribesAutoCompleteList(3)=(Command="/unmute",Desc="/unmute <Player> (Remove a player from your muted list)")
   TribesAutoCompleteList(4)=(Command="/votekick",Desc="/votekick <Player> (Call an in-game vote to remove a player from the match)")
   TribesAutoCompleteList(5)=(Command="/quit",Desc="/quit (Exit the program)")
   SlashHelp="Press '/' to enter a command."
   TellHelp="Type "@<PlayerName> [Message]" to message a player."
   TabHelp="(Press Tab to autocomplete)"
   EscHelp="(Press [ESC] to close)"
   Name="Default__TrChatConsole"
   ObjectArchetype=UTConsole'UTGame.Default__UTConsole'
}
