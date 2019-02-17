//=============================================================================
// CheatManager
// Object within playercontroller that manages "cheat" commands
//=============================================================================

class TrCheatManager extends UTCheatManager within TrPlayerController;


exec function Weapon GiveWeapon( String WeaponClassStr )
{
    local Weapon Weap;
    local class<Weapon> WeaponClass;    

    Weap = Super.GiveWeapon(WeaponClassStr);

	if (Weap!=None)
	{
		return Weap;
	}
	
    WeaponClass = class<Weapon>(DynamicLoadObject(WeaponClassStr, class'Class'));
	WeaponClassStr = "TribesGame.TrDevice_"$WeaponClassStr;
	;
	WeaponClass = class<Weapon>(DynamicLoadObject(WeaponClassStr, class'Class'));
	Weap = Weapon(Pawn.CreateInventory( WeaponClass ));
	
	return Weap;
}

defaultproperties
{
   Name="Default__TrCheatManager"
   ObjectArchetype=UTCheatManager'UTGame.Default__UTCheatManager'
}
