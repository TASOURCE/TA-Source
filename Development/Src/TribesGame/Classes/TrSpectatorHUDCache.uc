/**
 *  TrSpectatorHUDCache keeps track of the spectator HUD values
 *  that we send to Action Script. Expensive per-tick values that don't
 *  change from the gameplay get referenced here and will only 
 *  call Action Script if they don't match.
 */

class TrSpectatorHUDCache extends Object;

/** Player Panel. */
var transient bool CachedPlayerPanelFlagCarried;
var transient string CachedPlayerPanelPlayerName;
var transient string CachedPlayerPanelClassName;
var transient string CachedPlayerPanelNextRegen;
var transient int CachedPlayerPanelHealthBarFill;
var transient string CachedPlayerPanelHealth;
var transient int CachedPlayerPanelEnergyFillBar;
var transient string CachedPlayerPanelEnergy;
var transient string CachedPlayerPanelPrimaryWeaponName;
var transient string CachedPlayerPanelPrimaryAmmoCount;
var transient string CachedPlayerPanelSecondaryWeaponName;
var transient string CachedPlayerPanelSecondaryAmmoCount;
var transient int CachedPlayerPanelOffhandIcon;
var transient string CachedPlayerPanelOffhandAmmo;
var transient string CachedPlayerPanelOffhandName;
var transient int CachedPlayerPanelPackIcon;
var transient string CachedPlayerPanelPackAmmo;
var transient string CachedPlayerPanelPackName;
var transient int CachedPlayerPanelPerk1Icon;
var transient string CachedPlayerPanelPerk1Name;
var transient int CachedPlayerPanelPerk2Icon;
var transient string CachedPlayerPanelPerk2Name;
var transient int CachedPlayerPanelSkiFillBar;
var transient string CachedPlayerPanelSkiSpeed;
var transient int CachedPlayerPanelSelected;

/** Vehicle Panel. */
var transient bool CachedVehiclePanelFlagCarried;
var transient string CachedVehiclePanelVehicleName;
var transient string CachedVehiclePanelDriverName;
var transient string CachedVehiclePanelPassengerName;
var transient int CachedVehiclePanelHealthFillBar;
var transient string CachedVehiclePanelHealth;
var transient int CachedVehiclePanelEnergyFillBar;
var transient string CachedVehiclePanelEnergy;
var transient string CachedVehiclePanelPrimaryWeaponName;
var transient int CachedVehiclePanelPrimaryWeaponReady;
var transient bool CachedVehiclePanelPrimaryWeaponVisible;
var transient string CachedVehiclePanelSecondaryWeaponName;
var transient int CachedVehiclePanelSecondaryWeaponReady;
var transient bool CachedVehiclePanelSecondaryWeaponVisible;
var transient int CachedVehiclePanelSkiFillBar;
var transient string CachedVehiclePanelSkiSpeed;
var transient int CachedVehiclePanelSelected;

/** Bookmark Panel.*/
var transient string CachedBookmarkPanelTitle;
var transient string CachedBookmarkPanelName;

/** Objective Panel. */
var transient string CachedObjectivePanelObjectiveName;
var transient string CachedObjectivePanelObjectiveDescription;
var transient int CachedObjectivePanelHealthFillFrameIndex;
var transient int CachedObjectivePanelHealth;

/** Float Camera Panel.*/
var transient string CachedFloatCameraPanelName;
var transient string CachedFloatCameraPanelDescription;

defaultproperties
{
   Name="Default__TrSpectatorHUDCache"
   ObjectArchetype=Object'Core.Default__Object'
}
