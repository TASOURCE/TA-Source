class GFxDeviceAmmoCount extends GFxMoviePlayer;

var GFxObject     AmmoCountTF;

function Init(optional LocalPlayer player)
{
    super.Init(player);
    AmmoCountTF = GetVariableObject("_root.ammo_count");
}

defaultproperties
{
   bDisplayWithHudOff=False
   bAllowInput=False
   bAllowFocus=False
   bAutoPlay=True
   Name="Default__GFxDeviceAmmoCount"
   ObjectArchetype=GFxMoviePlayer'GFxUI.Default__GFxMoviePlayer'
}
