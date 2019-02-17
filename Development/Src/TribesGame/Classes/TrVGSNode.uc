class TrVGSNode extends Object
	dependson(TrVGSCommandList);

/** Key bind in the VGS menu associated with this node. */
var name m_KeyBind;

/** Name for this node in the VGS menu. */
var localized string m_MenuString;

/** Children VGS nodes. */
var array<class<TrVGSNode> > m_Children;

/** Commands that this node can play in any game type. */
var array<VGSCommandType> m_Commands;

/** Commands that this node will ignore in CTF. */
var array<VGSCommandType> m_IgnoreCTFCommand;

/** Commands that this node will ignore in TeamRabbit. */
var array<VGSCommandType> m_IgnoreTeamRabbitCommand;

/** Commands that this node will ignore in Arena. */
var array<VGSCommandType> m_IgnoreArenaCommand;

/** Commands that this node will ignore in CaH. */
var array<VGSCommandType> m_IgnoreCaHCommand;

/** Should this node be ignored by CTF? */
var bool m_bIgnoreCTF;

/** Should this node be ignored by TeamRabbit? */
var bool m_bIgnoreTeamRabbit;

/** Should this node be ignored by Arena? */
var bool m_bIgnoreArena;

/** Should this node be ignored by CaH? */
var bool m_bIgnoreCaH;

/** Does this menu have a header (used to not have a header on the root menu for quick fix with spacing). */
var bool m_bDrawHeader;

static function class<TrVGSNode> ProcessKeyInput(name Key, TrPlayerInput PlayerInput, class<GameInfo> GameClass)
{
	local int i;

	// Loop through children to find a match.
	for( i = 0; i < default.m_Children.Length; i++ )
	{
		if( default.m_Children[i].default.m_KeyBind == Key )
		{
			if( VerifyVGSChild(default.m_Children[i], GameClass) )
			{
				return default.m_Children[i];
			}
			else
			{
				// The current game type does not support this child.
				return none;
			}
		}
	}

	return none;
}

/** Verify the command is supported by the game type. */
static function bool VerifyVGSCommandEntry(VGSCommandType Command, class<GameInfo> GameClass)
{
	if( class<TrGame_TrCTF>(GameClass) != none )
	{
		// CTF mode.
		if( default.m_IgnoreCTFCommand.Find(Command) != INDEX_NONE )
		{
			return false;
		}
	}
	else if( class<TrGame_TrCaH>(GameClass) != none )
	{
		// CaH mode.
		if( default.m_IgnoreCaHCommand.Find(Command) != INDEX_NONE )
		{
			return false;
		}
	}
	else if( class<TrGame_TrTeamRabbit>(GameClass) != none )
	{
		// Team Rabbit mode.
		if( default.m_IgnoreTeamRabbitCommand.Find(Command) != INDEX_NONE )
		{
			return false;
		}
	}
	else if( class<TrGame_TrArena>(GameClass) != none )
	{
		// Arena mode.
		if( default.m_IgnoreArenaCommand.Find(Command) != INDEX_NONE )
		{
			return false;
		}
	}
	return true;
}

static function bool VerifyVGSChild(class<TrVGSNode> VGSNodeClass, class<GameInfo> GameClass)
{
	if( class<TrGame_TrCTF>(GameClass) != none )
	{
		return !(VGSNodeClass.default.m_bIgnoreCTF);
	}
	else if( class<TrGame_TrCaH>(GameClass) != none )
	{
		return !(VGSNodeClass.default.m_bIgnoreCaH);
	}
	else if( class<TrGame_TrTeamRabbit>(GameClass) != none )
	{
		return !(VGSNodeClass.default.m_bIgnoreTeamRabbit);
	}
	else if( class<TrGame_TrArena>(GameClass) != none )
	{
		return !(VGSNodeClass.default.m_bIgnoreArena);
	}
	return true;
}

static function GetGametypeSpecificCommands(out array<VGSCommandType> outGametypeSpecificCommands, class<GameInfo> GameClass)
{
	local int i;

	for( i = 0; i < default.m_Commands.Length; i++ )
	{
		if( VerifyVGSCommandEntry(default.m_Commands[i], GameClass) )
		{
			outGametypeSpecificCommands.AddItem(default.m_Commands[i]);
		}
	}
}

static function GetGametypeSpecificChildrenNodes(out array<class<TrVGSNode> > outVGSNodeChildrenClasses, class<GameInfo> GameClass)
{
	local int i;

	for( i = 0; i < default.m_Children.Length; i++ )
	{
		if( VerifyVGSChild(default.m_Children[i], GameClass) )
		{
			outVGSNodeChildrenClasses.AddItem(default.m_Children[i]);
		}
	}
}

defaultproperties
{
   m_bDrawHeader=True
   Name="Default__TrVGSNode"
   ObjectArchetype=Object'Core.Default__Object'
}
