/**
 * This datastore provides aliases for input keys.  These aliases allow gameplay code to be decoupled from actual input key
 * names (which can change based on platform or language) by storing the association between a gameplay concept or event
 * (such as "Jump") with the name of the input key which should trigger that event (such as LeftMouseButton) in a way that
 * can be easily customized for different platforms and/or languages, without the need to touch gameplay code.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UIDataStore_InputAlias extends UIDataStore_StringBase
	native(inherit)
	config(Input);

/**
 * Stores an input key name (and optional modifier keys) and a button icon markup string.
 */
struct native UIInputKeyData
{
	/**
	 * The name of the actual input key (LeftMouseButton) and optional modifiers (Ctrl, Alt, Shift).
	 */
	var	config	RawInputKeyEventData	InputKeyData;

	/**
	 * A string containing data store markup for this key's graph from an icon font.  Can refer to the button icon
	 * directly (such as <Fonts:GamepadKeyFont>X<Fonts:/>), or cases where the button itself might be different in another
	 * language (e.g. Circle and Square are swapped on PS3 in Japan) can refer to a localized string containing the button
	 * markup (i.e. <Strings:UILocFile.ButtonIcons.CircleButton>).
	 */
	var	config	string					ButtonFontMarkupString;
};

/**
 * Defines a single input alias (i.e. Accept) along with the raw input keys for each platform which should activate that alias.
 */
struct native UIDataStoreInputAlias
{
	/**
	 * The name of the alias which will be referenced by the game (i.e. Accept, Cancel, ShiftUp, etc.).
	 */
	var	config	name			AliasName;

	/**
	 * Input keys associated with this alias, per platform.
	 */
	var	config	UIInputKeyData	PlatformInputKeys[EInputPlatformType.IPT_MAX];
};

/*
TODO
	- do we need to provide access to the owning player (to determine whether they're using a gamepad or not) or should this
		be handled elsewhere.
*/
/**
 * Defines the list of supported aliases and their associated input keys.
 */
var	protected{protected}	config	array<UIDataStoreInputAlias>		InputAliases;

/**
 * Mapping of input alias name => index into the InputAliases array for the UIDataStoreInputAlias associated with that
 * input alias.  Provides a way to quickly access the input key data for an input alias without linear searching.
 * Generated when the data store is registered.
 */
var	protected{protected}	const	transient	native	map{FName,INT}	InputAliasLookupMap;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Retrieves the button icon font markup string for an input alias
 *
 * @param	DesiredAlias		the name of the alias (i.e. Accept) to get the markup string for
 * @param	OverridePlatform	specifies which platform's markup string is desired; if not specified, uses the current
 *								platform, taking into account whether the player is using a gamepad (PC) or a keyboard (console).
 *
 * @return	the markup string for the button icon associated with the alias.
 */
native final function string GetAliasFontMarkup( name DesiredAlias, optional EInputPlatformType OverridePlatform=IPT_MAX ) const;
/**
 * Retrieves the button icon font markup string for an input alias
 *
 * @param	AliasIndex			the index [into the InputAliases array] for the alias to get the markup string for.
 * @param	OverridePlatform	specifies which platform's markup string is desired; if not specified, uses the current
 *								platform, taking into account whether the player is using a gamepad (PC) or a keyboard (console).
 *
 * @return	the markup string for the button icon associated with the alias.
 */
native final function string GetAliasFontMarkupByIndex( int AliasIndex, optional EInputPlatformType OverridePlatform=IPT_MAX ) const;

/**
 * Retrieves the associated input key name for an input alias
 *
 * @param	AliasIndex			the index [into the InputAliases array] for the alias to get the input key for.
 * @param	OverridePlatform	specifies which platform's input key is desired; if not specified, uses the current
 *								platform, taking into account whether the player is using a gamepad (PC) or a keyboard (console).
 *
 * @return	the name of the input key (i.e. LeftMouseButton) which triggers the alias.
 */
native final function name GetAliasInputKeyName( name DesiredAlias, optional EInputPlatformType OverridePlatform=IPT_MAX ) const;
/**
 * Retrieves the associated input key name for an input alias
 *
 * @param	AliasIndex			the index [into the InputAliases array] for the alias to get the input key for.
 * @param	OverridePlatform	specifies which platform's markup string is desired; if not specified, uses the current
 *								platform, taking into account whether the player is using a gamepad (PC) or a keyboard (console).
 *
 * @return	the name of the input key (i.e. LeftMouseButton) which triggers the alias.
 */
native final function name GetAliasInputKeyNameByIndex( int AliasIndex, optional EInputPlatformType OverridePlatform=IPT_MAX ) const;

/**
 * Retrieves both the input key name and modifier keys for an input alias
 *
 * @param	DesiredAlias		the name of the alias (i.e. Accept) to get the input key data for
 * @param	OverridePlatform	specifies which platform's markup string is desired; if not specified, uses the current
 *								platform, taking into account whether the player is using a gamepad (PC) or a keyboard (console).
 *
 * @return	the struct containing the input key name and modifier keys associated with the alias.
 */
native final function bool GetAliasInputKeyData( out RawInputKeyEventData out_InputKeyData, name DesiredAlias, optional EInputPlatformType OverridePlatform=IPT_MAX ) const;
/**
 * Retrieves both the input key name and modifier keys for an input alias
 *
 * @param	AliasIndex			the index [into the InputAliases array] for the alias to get the input key data for.
 * @param	OverridePlatform	specifies which platform's markup string is desired; if not specified, uses the current
 *								platform, taking into account whether the player is using a gamepad (PC) or a keyboard (console).
 *
 * @return	the struct containing the input key name and modifier keys associated with the alias.
 */
native final function bool GetAliasInputKeyDataByIndex( out RawInputKeyEventData out_InputKeyData, int AliasIndex, optional EInputPlatformType OverridePlatform=IPT_MAX ) const;

/**
 * Finds the location [in the InputAliases array] for an input alias.
 *
 * @param	DesiredAlias	the name of the alias (i.e. Accept) to find
 *
 * @return	the index into the InputAliases array for the alias, or INDEX_NONE if it doesn't exist.
 */
native final function int FindInputAliasIndex( name DesiredAlias ) const;

/**
 * Determines whether an input alias is supported on a particular platform.
 *
 * @param	DesiredAlias		the name of the alias (i.e. Accept) to check
 * @param	DesiredPlatform		the platform to check for an input key
 *
 * @return	TRUE if the alias has a corresponding input key for the specified platform.
 */
native final function bool HasAliasMappingForPlatform( name DesiredAlias, EInputPlatformType DesiredPlatform ) const;

cpptext
{
	/* === UUIDataStore_InputAlias interface === */
	/**
	 * Populates the InputAliasLookupMap based on the elements of the InputAliases array.
	 */
	void InitializeLookupMap();

	/**
	 * @return	the platform that should be used (by default) when retrieving data associated with input aliases
	 */
	EInputPlatformType GetDefaultPlatform() const;

	/* === UUIDataStore interface === */
	/**
	 * Hook for performing any initialization required for this data store.
	 *
	 * This version builds the InputAliasLookupMap based on the elements in the InputAliases array.
	 */
	virtual void InitializeDataStore();

	/* === UUIDataProvider interface === */
	/**
	 * Gets the list of data fields exposed by this data provider
	 *
	 * @param OutFields Filled in with the list of fields supported by its aggregated providers
	 */
	virtual void GetSupportedDataFields(TArray<FUIDataProviderField>& OutFields);

protected:
	/**
	 * Gets the value for the specified field
	 *
	 * @param	FieldName		the field to look up the value for
	 * @param	OutFieldValue	out param getting the value
	 * @param	ArrayIndex		ignored
	 */
	virtual UBOOL GetFieldValue(const FString& FieldName,FUIProviderFieldValue& OutFieldValue,INT ArrayIndex=INDEX_NONE );

}


defaultproperties
{
   InputAliases(0)=(AliasName="Generic_A",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_A"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_A>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_A"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_A>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_A"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_X>"))
   InputAliases(1)=(AliasName="Generic_B",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_B"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_B>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_B"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_B>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_B"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_Circle>"))
   InputAliases(2)=(AliasName="Generic_X",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_X"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_X>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_X"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_X>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_X"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_Square>"))
   InputAliases(3)=(AliasName="Generic_Y",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_Y"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_Y>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_Y"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_Y>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_Y"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_Triangle>"))
   InputAliases(4)=(AliasName="Generic_LT",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_LeftTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftTrigger>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftTrigger>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_LeftTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_L2>"))
   InputAliases(5)=(AliasName="Generic_RT",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_RightTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightTrigger>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_RightTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightTrigger>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_RightTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_R2>"))
   InputAliases(6)=(AliasName="Generic_LB",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_LeftShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftBumper>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftBumper>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_LeftShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_L1>"))
   InputAliases(7)=(AliasName="Generic_RB",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_RightShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightBumper>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_RightShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightBumper>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_RightShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_R1>"))
   InputAliases(8)=(AliasName="Generic_Start",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_Start"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_Start>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_Start"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_Start>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_Start"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_Start>"))
   InputAliases(9)=(AliasName="Generic_Back",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_Back"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_Back>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_Back"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_Back>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_Back"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_Select>"))
   InputAliases(10)=(AliasName="Generic_DPad_Up",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadUp>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadUp>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_DPadUp>"))
   InputAliases(11)=(AliasName="Generic_DPad_Down",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadDown>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadDown>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_DPadDown>"))
   InputAliases(12)=(AliasName="Generic_DPad_Left",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadLeft>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadLeft>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_DPadLeft>"))
   InputAliases(13)=(AliasName="Generic_DPad_Right",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadRight>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadRight>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_DPad_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_DPadRight>"))
   InputAliases(14)=(AliasName="Gamepad_LeftStick_Up",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadUp>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadUp>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_LeftStick>"))
   InputAliases(15)=(AliasName="Gamepad_LeftStick_Down",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadDown>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadDown>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_LeftStick>"))
   InputAliases(16)=(AliasName="Gamepad_LeftStick_Left",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadLeft>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadLeft>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_LeftStick>"))
   InputAliases(17)=(AliasName="Gamepad_LeftStick_Right",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadRight>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadRight>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="Gamepad_LeftStick_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_LeftStick>"))
   InputAliases(18)=(AliasName="Gamepad_RightStick_Up",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStick>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStick>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Up"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_RightStick>"))
   InputAliases(19)=(AliasName="Gamepad_RightStick_Down",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStick>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStick>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Down"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_RightStick>"))
   InputAliases(20)=(AliasName="Gamepad_RightStick_Left",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStick>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStick>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Left"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_RightStick>"))
   InputAliases(21)=(AliasName="Gamepad_RightStick_Right",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStick>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStick>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="Gamepad_RightStick_Right"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_RightStick>"))
   InputAliases(22)=(AliasName="Generic_LeftStickButton",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_LeftThumbStick"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftStickButton>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftThumbStick"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftStickButton>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_LeftThumbStick"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_LeftStickButton>"))
   InputAliases(23)=(AliasName="Generic_RightStickButton",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="XboxTypeS_RightThumbStick"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStickButton>"),PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftThumbStick"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStickButton>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_RightThumbStick"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_RightStickButton>"))
   InputAliases(24)=(AliasName="CycleLeft",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadLeft>"))
   InputAliases(25)=(AliasName="CycleRight",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_RightShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_DPadRight>"))
   InputAliases(26)=(AliasName="AnyKey",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="*"),ButtonFontMarkupString="<Strings:UDKGameUI.Generic.Fire>"))
   InputAliases(27)=(AliasName="Accept",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_A"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_A>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_A"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_X>"))
   InputAliases(28)=(AliasName="Cancel",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_B"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_B>"),PlatformInputKeys[2]=(InputKeyData=(InputKeyName="XboxTypeS_B"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.PS3_Circle>"))
   InputAliases(29)=(AliasName="SpecialLeft",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_X"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_X>"))
   InputAliases(30)=(AliasName="SpecialTop",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_Y"),ButtonFontMarkupString="<Color:R=1,G=1,B=1,A=1><Fonts:UI_Fonts.Fonts.UI_Fonts_Xbox18>Y<Fonts:/><Color:/>"))
   InputAliases(31)=(AliasName="Start",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_Start"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_Start>"))
   InputAliases(32)=(AliasName="back",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_Back"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_Back>"))
   InputAliases(33)=(AliasName="ShiftUp",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftBumper>"))
   InputAliases(34)=(AliasName="ShiftDown",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_RightShoulder"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightBumper>"))
   InputAliases(35)=(AliasName="ShiftUpPage",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftTrigger>"))
   InputAliases(36)=(AliasName="ShiftDownPage",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_RightTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightTrigger>"))
   InputAliases(37)=(AliasName="ShiftBoth",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftTrigger+XboxTypeS_RightTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftTrigger><Strings:UDKGameUI.ButtonFont.Xenon_RightTrigger>"))
   InputAliases(38)=(AliasName="Defaults",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftTrigger"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftTrigger>"))
   InputAliases(39)=(AliasName="MouseLeft",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="LeftMouseButton"),ButtonFontMarkupString="LEFT MOUSE"))
   InputAliases(40)=(AliasName="MouseRight",PlatformInputKeys[0]=(InputKeyData=(InputKeyName="RightMouseButton"),ButtonFontMarkupString="RIGHT MOUSE"))
   InputAliases(41)=(AliasName="ClickLeft",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_LeftThumbStick"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_LeftStickButton>"))
   InputAliases(42)=(AliasName="ClickRight",PlatformInputKeys[1]=(InputKeyData=(InputKeyName="XboxTypeS_RightThumbStick"),ButtonFontMarkupString="<Strings:UDKGameUI.ButtonFont.Xenon_RightStickButton>"))
   Tag="ButtonCallouts"
   Name="Default__UIDataStore_InputAlias"
   ObjectArchetype=UIDataStore_StringBase'Engine.Default__UIDataStore_StringBase'
}
