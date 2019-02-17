/**
 * Inherited version of the game resource datastore that has UT specific dataproviders.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UDKUIDataStore_MenuItems extends UIDataStore_GameResource
	native
	implements(UIListElementCellProvider)
	Config(Game);
	
var class<UDKUIDataProvider_MapInfo> MapInfoDataProviderClass;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Array of enabled mutators, the available mutators list will not contain any of these mutators. */
var array<int> EnabledMutators;

/** Array of maps, the available maps list will not contain any of these maps. */
var array<int> MapCycle;

/** Priority listing of the weapons, index 0 being highest priority. */
var array<int> WeaponPriority;

/** Current game mode to filter by. */
var int GameModeFilter;

/** @return Returns the number of providers for a given field name. */
native function int GetProviderCount(name FieldName) const;

/** @return Whether or not the specified provider is filtered or not. */
native function bool IsProviderFiltered(name FieldName, int ProviderIdx);

/** finds all UIResourceDataProvider objects defined in all .ini files in the game's config directory
 * static and script exposed to allow access to map/mutator/gametype/weapon lists outside of the menus
 */
native static final function GetAllResourceDataProviders(class<UDKUIResourceDataProvider> ProviderClass, out array<UDKUIResourceDataProvider> Providers);

/**
 * Attempts to find the index of a provider given a provider field name, a search tag, and a value to match.
 *
 * @return	Returns the index of the provider or INDEX_NONE if the provider wasn't found.
 */
native function int FindValueInProviderSet(name ProviderFieldName, name SearchTag, string SearchValue);

/**
 * Attempts to find the value of a provider given a provider cell field.
 *
 * @return	Returns true if the value was found, false otherwise.
 */
native function bool GetValueFromProviderSet(name ProviderFieldName, name SearchTag, int ListIndex, out string OutValue);

/** 
 * Attempts to retrieve all providers with the specified provider field name.
 *
 * @param ProviderFieldName		Name of the provider set to search for
 * @param OutProviders			A set of providers with the given name
 * 
 * @return	TRUE if the set was found, FALSE otherwise.
 */
native function bool GetProviderSet(name ProviderFieldName, out array<UDKUIResourceDataProvider> OutProviders);

/**
 * Finds or creates the UIResourceDataProvider instances referenced by ElementProviderTypes, and stores the result
 * into the ListElementProvider map.
 * Script event called after C++ version has created base map
 */
event InitializeListElementProviders()
{
	local array<UDKUIResourceDataProvider> WeaponProviders;
	local UDKUIResourceDataProvider Provider;
	local int WeaponIdx;

	// Generate DropDownWeapons provider set
	GetProviderSet('Weapons', WeaponProviders);
	RemoveListElementProvidersKey('DropDownWeapons');

	for( WeaponIdx=0; WeaponIdx<WeaponProviders.Length; WeaponIdx++ )
	{
		Provider = WeaponProviders[WeaponIdx];

		if( Provider != None )
		{
			AddListElementProvidersKey('DropDownWeapons', Provider);
		}
	}
}

/**
  * Remove key from ListElementProviders multimap
  */
native function RemoveListElementProvidersKey(Name KeyName);

/**
  * Add to ListElementProviders multimap
  */
native function AddListElementProvidersKey(Name KeyName, UDKUIResourceDataProvider Provider);

defaultproperties
{
   MapInfoDataProviderClass=Class'UDKBase.UDKUIDataProvider_MapInfo'
   Tag="UDKMenuItems"
   WriteAccessType=ACCESS_WriteAll
   Name="Default__UDKUIDataStore_MenuItems"
   ObjectArchetype=UIDataStore_GameResource'Engine.Default__UIDataStore_GameResource'
}
