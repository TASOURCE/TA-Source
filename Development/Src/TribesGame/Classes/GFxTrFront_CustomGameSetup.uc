class GFxTrFront_CustomGameSetup extends Object within GFxTrFront;
/* DEPRECATED
var int       OptionCount;
var GFxObject OptionList;

struct CommandFriend
{
	var string CmdName;
	var string FriendlyName;
};

// List of Commands user can change, and their friendly names
var array<CommandFriend> m_AllowedCommands;

function LoadCustomParameters(GFxObject List, array<KeyBind> Bindings)
{
	local int index;
	local bool bFoundKey;
    local KeyBind key;

    OptionCount = 0;
    OptionList = List;

	if (m_AllowedCommands.Length <= 0)
	{
		InitializeCommands();
	}

	for (index = 0; index < m_AllowedCommands.Length; index++)
	{
		bFoundKey = false;

		foreach Bindings(key)
		{
			if (m_AllowedCommands[index].CmdName == key.Command && InStr(key.Name,"Xbox") < 0)
			{
				AddCustomParameterOption(m_AllowedCommands[index].FriendlyName, String(key.Name));
				bFoundKey = true;
				break;
			}
		}

		if (!bFoundKey)
		{
			AddCustomParameterOption(m_AllowedCommands[index].FriendlyName, "None");
		}
	}
}

function SaveCustomParameters(GFxObject List, PlayerInput playerIn)
{
	local int i, j;
    local GFxObject elm;
    local String cmdName;
    local Name value;

	// For each new binding, find its pair in our settings and replace
    i = 0;

	if (m_AllowedCommands.Length <= 0)
	{
		InitializeCommands();
	}

    do
    {
        elm = List.GetElementObject(i++);

        if (elm != none)
        {
            cmdName = elm.GetString("name");

			for (j = 0; j < m_AllowedCommands.Length; j++)
			{
				// Resolve friendly name with actual command
				if (m_AllowedCommands[j].FriendlyName == cmdName)
				{
					cmdName = m_AllowedCommands[j].CmdName;
					break;
				}
			}

            value = Name(elm.GetString("text"));

			// Find the key to set
		    for (j = 0; j < playerIn.Bindings.Length; j++)
		    {
			    if (playerIn.Bindings[j].Name == value && InStr(playerIn.Bindings[j].Name,"Xbox") < 0)
			    {
					PlayerIn.SetBind(value,cmdName);
				    break;
			    }
		    }
        }
	}
    until (elm == none);

}

function AddCustomParameterOption(String optName, String value)
{
    local GFxObject obj;

    obj = Outer.CreateObject("Object");           
    obj.SetString("name",    optName);
    obj.SetString("label",   Caps(optName));
    obj.SetString("text",    value);
	obj.SetString("control", "input");

    OptionList.SetElementObject(OptionCount++, obj);
}

function AddSelectOption(String optName, int nCurrent, Array<String> values)
{
    local int i;
    local GFxObject opts;
    local GFxObject obj;

    opts = Outer.CreateArray();

    for (i = 0; i < values.Length; i++)
    {
        obj = Outer.CreateObject("Object");           
        obj.SetString("label", values[i]);
        obj.SetString("value", String(i));
        opts.SetElementObject(i, obj);
    }

    obj = Outer.CreateObject("Object");           
    obj.SetString("name", optName);
    obj.SetString("label", Caps(optName));
    obj.SetString("control", "stepper");
    obj.SetObject("dataProvider", opts);  
    obj.SetFloat("optIndex", nCurrent);

    OptionList.SetElementObject(OptionCount++, obj);
}

function InitializeCommands()
{
	local CommandFriend friend;

	friend.CmdName = "GBA_DeployableMenu";
	friend.FriendlyName = "Toggle Deployable Menu";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "| onrelease ToggleLoadoutMenu";
	friend.FriendlyName = "Toggle Loadout Menu";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_ActivateMelee";
	friend.FriendlyName = "Melee";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_ActivatePack";
	friend.FriendlyName = "Activate Pack";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_ActivateBelt";
	friend.FriendlyName = "Activate Belt";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "DoZoom";
	friend.FriendlyName = "Zoom";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_ShowMenu";
	friend.FriendlyName = "Show Menu";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_ShowScores";
	friend.FriendlyName = "Show Scoreboard";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_ShowObjectMarkers";
	friend.FriendlyName = "Show Objectives";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_DropFlag";
	friend.FriendlyName = "Drop Flag";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_Use";
	friend.FriendlyName = "Use";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "ToggleInventory";
	friend.FriendlyName = "Inventory";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_DoSki";
	friend.FriendlyName = "Ski";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_ToggleSki";
	friend.FriendlyName = "Toggle Ski Mode";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_NextWeapon";
	friend.FriendlyName = "Next Weapon";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_TurnLeft";
	friend.FriendlyName = "Left";
	m_AllowedCommands.AddItem(friend);
	
	friend.CmdName = "GBA_TurnRight";
	friend.FriendlyName = "Right";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_MoveForward";
	friend.FriendlyName = "Forward";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_Backward";
	friend.FriendlyName = "Back";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_StrafeLeft";
	friend.FriendlyName = "Strafe Left";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_StrafeRight";
	friend.FriendlyName = "Strafe Right";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_Reload";
	friend.FriendlyName = "Reload";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_Fire";
	friend.FriendlyName = "Fire";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_ToggleJetpack";
	friend.FriendlyName = "Jetpack";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_WeaponSwitch";
	friend.FriendlyName = "Switch Weapon";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_SwitchToSeat1";
	friend.FriendlyName = "Swap To Seat 1";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_SwitchToSeat2";
	friend.FriendlyName = "Swap To Seat 2";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_SwitchToSeat3";
	friend.FriendlyName = "Swap To Seat 3";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_SwitchToSeat4";
	friend.FriendlyName = "Swap To Seat 4";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_SwitchToSeat5";
	friend.FriendlyName = "Swap To Seat 5";
	m_AllowedCommands.AddItem(friend);

	friend.CmdName = "GBA_SwitchToSeat6";
	friend.FriendlyName = "Swap To Seat 6";
	m_AllowedCommands.AddItem(friend);
}

defaultproperties
{
}*/

defaultproperties
{
   Name="Default__GFxTrFront_CustomGameSetup"
   ObjectArchetype=Object'Core.Default__Object'
}
