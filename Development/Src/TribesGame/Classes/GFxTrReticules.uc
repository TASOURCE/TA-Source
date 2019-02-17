class GFxTrReticules extends GFxObject;


var GFxTrHud    Hud;
var WorldInfo	ThisWorld;
var GFxObject   ReticulesMC;
var GFxObject   ActiveReticule;

var Weapon      LastWeapon;
var int         LastCrossMode;
var float       LastAccuracy;
var float       LastHitEnemyTime;
var float       LastReticuleDepth;

var bool       m_bVisible;

var private int m_nCurrentReticuleIndex;

function CallShowReticule(int nIndex)
{
     ActionScriptVoid("ShowReticule");
}

function CallSetReticuleColor(int nType)
{
     ActionScriptVoid("SetReticuleColor");
}

function ASC_SetCustomReticule(GFxObject Data)
{
     ActionScriptVoid("SetCustomReticule");
}

function CallSetReticuleDepth(float fDepth)
{
	local Matrix DepthMatrix;

	// Cap the reticule depth.
	if (fDepth < 1.0f)
	{
		fDepth = 1.0f;
	}

    DepthMatrix.XPlane.X = fDepth;
    DepthMatrix.YPlane.Y = fDepth;
    DepthMatrix.ZPlane.Z = fDepth;
    DepthMatrix.WPlane.W = fDepth;

	ReticulesMC.SetDisplayMatrix3D(DepthMatrix);
}

function ChangeReticule(int nIndex)
{
    // Reticule changed, force the 3P HUD to change if we aren't in a vehicle.
	if (!Hud.m_bLastInVehicle)
	{
		Hud.m_bLastIn3P = !Hud.m_bLastIn3P;
	}

    if (SetCustomReticule())
    {
	    CallSetAccuracy(100);
    }
    else
    {
	    // reset the current reticule
	    CallSetReticuleColor(0);
	    CallSetAccuracy(100);

	    // show the new one
	    CallShowReticule(nIndex);
	    m_nCurrentReticuleIndex = nIndex;
    }

    if (nIndex > 9)
    {
	    ActiveReticule = GetVariableObject("_root.reticulesMC.reticules.reticule_"$nIndex$"_mc.hit");
    }
    else
    {
        ActiveReticule = GetVariableObject("_root.reticulesMC.reticules.reticule_0"$nIndex$"_mc.hit");
    }

	// invalidate so that it gets refreshed
	LastAccuracy = -1;
	LastCrossMode = -2;
}

function bool SetCustomReticule()
{
    local TrDevice  device;
    local GFxObject data;
    local TrPlayerController TrPC;

    device = TrDevice(LastWeapon);
    TrPC = Hud.m_TrPC;

    if (TrPC == none || device == none)
    {
        return false;
    }

    if (!TrPC.m_TrEquipInterface.OwnsReticule(device.default.DBWeaponId))
    {
        return false;
    }

    data = CreateObject("Object");

    m_nCurrentReticuleIndex = TrPC.m_TrEquipInterface.GetReticuleValue(device.default.DBWeaponId, RDT_TYPE);

    data.SetFloat("reticule", m_nCurrentReticuleIndex);
    data.SetFloat("opacity", TrPC.m_TrEquipInterface.GetReticuleValue(device.default.DBWeaponId, RDT_OPACITY));
    data.SetString("color", TrPC.m_TrEquipInterface.GetReticuleString(device.default.DBWeaponId, RDT_COLOR));

    ASC_SetCustomReticule(data);

    return true;
}

function int GetCurrentReticuleIndex()
{
	return m_nCurrentReticuleIndex;
}

function CallSetAccuracy(int nAccuracy)
{
     ActionScriptVoid("SetAccuracy");
}

/** Called when local pawn has successfully damaged another player/object. */
function CallShowHit()
{
     ActionScriptVoid("ShowHit");
}

function DisableVehicleAmmoClip()
{
	ActionScriptVoid("turnOffClip");
}

function EnableVehicleAmmoClip()
{
	ActionScriptVoid("turnOnClip");
}

function SetVehicleAmmoClip(string ammoCount)
{
	ActionScriptVoid("SetAmmoClip");
}

function SetPowerupPercentage(int pPercentage)
{
 	ActionScriptVoid("SetPowerupPercentage");
}

function SetLaserPowerupPercentage(int pPercentage)
{
	ActionScriptVoid("SetLaserPowerupPercentage");
}

function SetVehiclePowerupPercentage(int pPercentage)
{
 	ActionScriptVoid("SetVehiclePowerupPercentage");
}

function SetGenericPowerupPercentage(int pPercentage)
{
 	ActionScriptVoid("SetGenericPowerupPercentage");
}

function Init(GFxTrHud h)
{
	Hud = h;
	ThisWorld = GetPC().WorldInfo;

    ReticulesMC = GetObject("reticules");
    ReticulesMC.SetVisible(true);
}

function SetReticuleVisible(bool bNewVisible)
{
	if( bNewVisible != m_bVisible )
	{
		ReticulesMC.SetVisible(bNewVisible);
		m_bVisible = bNewVisible;
	}
}

function UpdateReticule(Pawn pPawn, optional bool bForceUpdate = false)
{
    local TrDevice dev;
    local TrVehicleWeapon vw;
    local TrPlayerController TrPC;
	local bool bShouldBeVisibileThisTick, bFlashReticule;

	// Check to see if the player has hit someone.
	/* We don't want to show the hit reticule marker when we hit someone
	 * while we were dead (i.e. from one of our mines or claymores).
	 * So update our last hit enemy time, and say we want to update the 
	 * hit reticule... so that if we are alive we can then flash the reticule.
	 */
    TrPC = TrPlayerController(GetPC());
    if( TrPC != None )
    {
		if( LastHitEnemyTime != TrPC.m_fLastHitEnemyTime && TrPC.m_fLastHitEnemyTime > 0.f  )
		{
			bFlashReticule = true;
			LastHitEnemyTime = TrPC.m_fLastHitEnemyTime;
		}
    }

    if (pPawn == None)
    {
        if (LastWeapon != None)
        {
            ChangeReticule(0);
            LastWeapon = None;
        }

        return;
    }

    dev = TrDevice(pPawn.Weapon);
    vw = TrVehicleWeapon(pPawn.Weapon);

    if (LastWeapon != pPawn.Weapon || bForceUpdate)
    {
        LastWeapon = pPawn.Weapon;

        if (dev == None)
        {
            ChangeReticule(vw != None ? vw.m_nReticuleIndex : 0);
        }
        else
        {
            ChangeReticule(dev.m_nReticuleIndex);
        }
    } 

    if (dev != None)
    {
        if (LastAccuracy != dev.GetAccuracy())
        {
            LastAccuracy = dev.GetAccuracy();
            CallSetAccuracy(Int(LastAccuracy * 100));
        }
    }

	if (vw != none)
	{
        if (LastAccuracy != vw.GetAccuracy())
        {
            LastAccuracy = vw.GetAccuracy();
            CallSetAccuracy(Int(LastAccuracy * 100));
        }
	}

    if( TrPC != None )
    {
		if (bFlashReticule)
		{
			if (ActiveReticule != none)
			{
				ActiveReticule.GotoAndPlayI(1);
			}
			//CallShowHit();

			TrPC.ClientPlayReticuleHitSound();
		}

		// Visibility
		bShouldBeVisibileThisTick = true;
		if( TrPC.bFreeCamera )
		{
			// Make invisible when using freecam.
			bShouldBeVisibileThisTick = false;
		}
		if( bShouldBeVisibileThisTick && dev != none && !dev.m_bAllowFireWhileZoomed && TrPC.GetZoomedState() != ZST_NotZoomed)
		{
			// Make invisible when zooming with a weapon that doesn't support firing while zoomed.
			bShouldBeVisibileThisTick = false;
		}

		SetReticuleVisible(bShouldBeVisibileThisTick);
    }

    if (LastCrossMode != HUD.m_nCrossHairMode)
    {
        LastCrossMode = HUD.m_nCrossHairMode;

        if (LastCrossMode != 0)
        {
            CallSetReticuleColor(LastCrossMode);
        }
        else if (!SetCustomReticule())
        {
            CallSetReticuleColor(LastCrossMode);
        }
    }

	if (LastReticuleDepth != HUD.m_fCrosshairDepth)
	{
		LastReticuleDepth = HUD.m_fCrosshairDepth;
		CallSetReticuleDepth(LastReticuleDepth);
	}
}

defaultproperties
{
   Name="Default__GFxTrReticules"
   ObjectArchetype=GFxObject'GFxUI.Default__GFxObject'
}
