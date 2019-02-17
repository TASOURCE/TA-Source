/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTVehicleCTFGame extends UTCTFGame
	abstract;

// Returns whether a mutator should be allowed with this gametype
static function bool AllowMutator( string MutatorClassName )
{
	if ( (MutatorClassName ~= "UTGame.UTMutator_WeaponsRespawn")
		|| (MutatorClassName ~= "UTGame.UTMutator_LowGrav") )
	{
		return false;
	}
	return Super.AllowMutator(MutatorClassName);
}

defaultproperties
{
   bStartWithLockerWeaps=True
   bAllowHoverboard=True
   bMidGameHasMap=True
   Acronym="VCTF"
   Description="Traditional Capture The Flag with vehicles and Hoverboards instead of Translocators. The Flag may not be carried in any vehicle but the Hoverboard."
   MapPrefixes(0)="VCTF"
   GameName="Vehicle CTF"
   OnlineGameSettingsClass=Class'UTGame.UTGameSettingsVCTF'
   Name="Default__UTVehicleCTFGame"
   ObjectArchetype=UTCTFGame'UTGame.Default__UTCTFGame'
}
