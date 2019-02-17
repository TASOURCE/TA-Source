class GFxTrDevices extends GFxObject;

//var public PlayerController PlayerOwner;

var GFxMinimapHud           Hud;
var WorldInfo				ThisWorld;
var bool					bNeedsUpdateData;

function Init(GFxMinimapHud h)
{
	Hud = h;
	bNeedsUpdateData = true;
	ThisWorld = GetPC().WorldInfo;
}


function GFxObject GetAmmonClip()
{
    return (GetObject("weapons").GetObject("ammocount_mc").GetObject("ammoclip_mc").GetObject("ammoclip_label"));
}


function GFxObject GetAmmonPool()
{
    return (GetObject("weapons").GetObject("ammocount_mc").GetObject("ammoclip_mc").GetObject("ammopool_label"));
}


function UpdateData()
{
	SetVisible(true);
    bNeedsUpdateData = false;
}

function Update()
{

    if (bNeedsUpdateData)
		UpdateData();
}

defaultproperties
{
   Name="Default__GFxTrDevices"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
