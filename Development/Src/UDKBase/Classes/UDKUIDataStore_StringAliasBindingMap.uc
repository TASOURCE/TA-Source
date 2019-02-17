/**
 * This datastore allows games to map aliases to strings that may change based on the current platform or language setting.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 */
class UDKUIDataStore_StringAliasBindingMap extends UIDataStore_StringAliasMap
	native
	Config(Game);

/** Debug variable to fake a platform: -1 = Normal, 0 = PC, 1 = XBox360, 2 = PS3 */
var config int FakePlatform;

const SABM_FIND_FIRST_BIND = -2;

/** Struct to map localized text from [GameMappedStrings] to [ButtonFont] for non-PC platforms */
struct native ControllerMap
{
	/** The key - which is a [GameMappedStrings] */
	var name KeyName;
	/** The XBox360 mapping */
	var String XBoxMapping;
	/** The PS3 mapping */
	var String PS3Mapping;
};

struct native BindCacheElement
{
	var name KeyName;
	var String MappingString;
	var int FieldIndex;
};

/**
* Map of command names of the form GBA_ to the key bindings that should be drawn on screen
* since its heavy on string compares
*/
var	const	transient	native	Map_Mirror	CommandToBindNames{TMap<FName, FBindCacheElement>};

/** Array of mappings for localized text from [GameMappedStrings] to [ButtonFont] for non-PC platforms */
var config array<ControllerMap> ControllerMapArray;

/**
 * Set MappedString to be the localized string using the FieldName as a key
 * Returns the index into the mapped string array of where it was found.
 */
native virtual function int GetStringWithFieldName( String FieldName, out String MappedString );

/**
 * Called by GetStringWithFieldName() to retreive the string using the input binding system.
 */
native virtual function int GetBoundStringWithFieldName( String FieldName, out String MappedString, optional out int StartIndex, optional out String BindString );

/* 
* Given an input command of the form GBA_ return the mapped keybinding string 
* Returns TRUE if it exists, FALSE otherwise
*/
native protected final function bool FindMappingInBoundKeyCache(string Command, out string MappingStr, out int FieldIndex);

/** Given a input command of the form GBA_ and its mapping store that in a lookup for future use */
native protected final function AddMappingToBoundKeyCache(string Command, string MappingStr, int FieldIndex);

/** Clear the command to input keybinding cache	*/
native final function ClearBoundKeyCache();

defaultproperties
{
   FakePlatform=1
   ControllerMapArray(0)=(KeyName="GMS_XBoxTypeS_A",XBoxMapping="Xenon_A",PS3Mapping="PS3_X")
   ControllerMapArray(1)=(KeyName="GMS_XBoxTypeS_B",XBoxMapping="Xenon_B",PS3Mapping="PS3_Circle")
   ControllerMapArray(2)=(KeyName="GMS_XBoxTypeS_X",XBoxMapping="Xenon_X",PS3Mapping="PS3_Square")
   ControllerMapArray(3)=(KeyName="GMS_XBoxTypeS_Y",XBoxMapping="Xenon_Y",PS3Mapping="PS3_Triangle")
   ControllerMapArray(4)=(KeyName="GMS_XBoxTypeS_Start",XBoxMapping="Xenon_Start",PS3Mapping="PS3_Start")
   ControllerMapArray(5)=(KeyName="GMS_XBoxTypeS_Back",XBoxMapping="Xenon_Back",PS3Mapping="PS3_Select")
   ControllerMapArray(6)=(KeyName="GMS_XBoxTypeS_LeftShoulder",XBoxMapping="Xenon_LeftBumper",PS3Mapping="PS3_L1")
   ControllerMapArray(7)=(KeyName="GMS_XBoxTypeS_RightShoulder",XBoxMapping="Xenon_RightBumper",PS3Mapping="PS3_R1")
   ControllerMapArray(8)=(KeyName="GMS_XBoxTypeS_LeftTrigger",XBoxMapping="Xenon_LeftTrigger",PS3Mapping="PS3_L2")
   ControllerMapArray(9)=(KeyName="GMS_XBoxTypeS_RightTrigger",XBoxMapping="Xenon_RightTrigger",PS3Mapping="PS3_R2")
   ControllerMapArray(10)=(KeyName="GMS_XBoxTypeS_DPad_Up",XBoxMapping="Xenon_DPadUp",PS3Mapping="PS3_DPadUp")
   ControllerMapArray(11)=(KeyName="GMS_XBoxTypeS_DPad_Down",XBoxMapping="Xenon_DPadDown",PS3Mapping="PS3_DPadDown")
   ControllerMapArray(12)=(KeyName="GMS_XBoxTypeS_DPad_Left",XBoxMapping="Xenon_DPadLeft",PS3Mapping="PS3_DPadLeft")
   ControllerMapArray(13)=(KeyName="GMS_XBoxTypeS_DPad_Right",XBoxMapping="Xenon_DPadRight",PS3Mapping="PS3_DPadRight")
   ControllerMapArray(14)=(KeyName="GMS_XBoxTypeS_LeftThumbstick",XBoxMapping="Xenon_LeftStickButton",PS3Mapping="PS3_LeftStickButton")
   ControllerMapArray(15)=(KeyName="GMS_XBoxTypeS_RightThumbstick",XBoxMapping="Xenon_RightStickButton",PS3Mapping="PS3_RightStickButton")
   ControllerMapArray(16)=(KeyName="GMS_XboxTypeS_LeftX",XBoxMapping="Xenon_LeftStick",PS3Mapping="PS3_LeftStick")
   ControllerMapArray(17)=(KeyName="GMS_XboxTypeS_LeftY",XBoxMapping="Xenon_LeftStick",PS3Mapping="PS3_LeftStick")
   ControllerMapArray(18)=(KeyName="GMS_XboxTypeS_RightX",XBoxMapping="Xenon_RightStick",PS3Mapping="PS3_RightStick")
   ControllerMapArray(19)=(KeyName="GMS_XboxTypeS_RightY",XBoxMapping="Xenon_RightStick",PS3Mapping="PS3_RightStick")
   MenuInputMapArray(1)=(FieldName="GBA_MoveForward")
   MenuInputMapArray(2)=(FieldName="GBA_Backward")
   MenuInputMapArray(3)=(FieldName="GBA_StrafeLeft")
   MenuInputMapArray(4)=(FieldName="GBA_StrafeRight")
   MenuInputMapArray(5)=(FieldName="GBA_TurnLeft")
   MenuInputMapArray(6)=(FieldName="GBA_TurnRight")
   MenuInputMapArray(7)=(FieldName="GBA_Jump")
   MenuInputMapArray(8)=(FieldName="GBA_Duck")
   MenuInputMapArray(9)=(FieldName="GBA_Fire")
   MenuInputMapArray(10)=(FieldName="GBA_AltFire")
   MenuInputMapArray(11)=(FieldName="GBA_Use")
   MenuInputMapArray(12)=(FieldName="GBA_FeignDeath")
   MenuInputMapArray(13)=(FieldName="GBA_SwitchToBestWeapon")
   MenuInputMapArray(14)=(FieldName="GBA_PrevWeapon")
   MenuInputMapArray(15)=(FieldName="GBA_NextWeapon")
   MenuInputMapArray(16)=(FieldName="GBA_SwitchWeapon1")
   MenuInputMapArray(17)=(FieldName="GBA_SwitchWeapon2")
   MenuInputMapArray(18)=(FieldName="GBA_SwitchWeapon3")
   MenuInputMapArray(19)=(FieldName="GBA_SwitchWeapon4")
   MenuInputMapArray(20)=(FieldName="GBA_SwitchWeapon5")
   MenuInputMapArray(21)=(FieldName="GBA_SwitchWeapon6")
   MenuInputMapArray(22)=(FieldName="GBA_SwitchWeapon7")
   MenuInputMapArray(23)=(FieldName="GBA_SwitchWeapon8")
   MenuInputMapArray(24)=(FieldName="GBA_SwitchWeapon9")
   MenuInputMapArray(25)=(FieldName="GBA_SwitchWeapon10")
   MenuInputMapArray(26)=(FieldName="GBA_ToggleTranslocator")
   MenuInputMapArray(27)=(FieldName="GBA_ToggleSpeaking")
   MenuInputMapArray(28)=(FieldName="GBA_Talk")
   MenuInputMapArray(29)=(FieldName="GBA_TeamTalk")
   MenuInputMapArray(30)=(FieldName="GBA_Taunt1")
   MenuInputMapArray(31)=(FieldName="GBA_Taunt2")
   MenuInputMapArray(32)=(FieldName="GBA_Horn")
   MenuInputMapArray(33)=(FieldName="GBA_ShowMenu")
   MenuInputMapArray(34)=(FieldName="GBA_ShowCommandMenu")
   MenuInputMapArray(35)=(FieldName="GBA_ShowScores")
   MenuInputMapArray(36)=(FieldName="GBA_ShowMap")
   MenuInputMapArray(37)=(FieldName="GBA_ToggleMinimap")
   MenuInputMapArray(38)=(FieldName="GBA_GrowHud")
   MenuInputMapArray(39)=(FieldName="GBA_ShrinkHud")
   MenuInputMapArray(40)=(FieldName="GBA_ToggleMelee")
   MenuInputMapArray(41)=(FieldName="GBA_WeaponPicker")
   MenuInputMapArray(42)=(FieldName="GBA_Jump_Gamepad")
   MenuInputMapArray(43)=(FieldName="GBA_MoveForward_Gamepad")
   MenuInputMapArray(44)=(FieldName="GBA_TurnLeft_Gamepad")
   Tag="StringAliasBindings"
   Name="Default__UDKUIDataStore_StringAliasBindingMap"
   ObjectArchetype=UIDataStore_StringAliasMap'Engine.Default__UIDataStore_StringAliasMap'
}
