/**
 *  Manages loading content for Tribes.
 */
class TrContentLoader extends Object
	native;

/** Starts the loading of content data class based on WeaponClass. */
native function bool StartLoadingDeviceContentPackage(class<TrDevice> WeaponClass);

/** Starts the loading of skin data based on ClassId. */
native function StartLoadingPlayerSkin(int ClassId, int SkinId, bool bLoad1PData);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__TrContentLoader"
   ObjectArchetype=Object'Core.Default__Object'
}
