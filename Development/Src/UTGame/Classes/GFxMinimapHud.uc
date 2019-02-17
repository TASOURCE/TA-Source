/**********************************************************************

Copyright   :   Copyright 2006-2007 Scaleform Corp. All Rights Reserved.

Portions of the integration code is from Epic Games as identified by Perforce annotations.
Copyright 2010 Epic Games, Inc. All rights reserved.

Licensees may use this file in accordance with the valid Scaleform
Commercial License Agreement provided with the software.

This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING 
THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR ANY PURPOSE.

**********************************************************************/

//$$ Modified from original source.

class GFxMinimapHud extends GFxMoviePlayer;

var WorldInfo    ThisWorld;
var GFxMinimap   Minimap;
var float        Radius;
var float        CurZoomf, NormalZoomf, MaxZoomf, MinZoomf;

struct MessageRow
{
	var GFxObject  MC, TF;
	var float     StartFadeTime;
	var int       Y;
};

struct HeEnDisplay
{
    var float       LastHealth;
    var float       LastEnergy;
    var GFxObject   HealthTF;
    var GFxObject   HealthBarMC;
    var GFxObject   HealthNormMC;
    var GFxObject   HealthCritMC;
    var bool        HealthNormOn;
    var GFxObject   EnergyTF;
    var GFxObject   EnergyBarMC;
};

var HeEnDisplay     PlayerHE;
var HeEnDisplay     VehicleHE;

var GFxObject       LogMC;
var array<MessageRow>   Messages, FreeMessages;
var float               MessageHeight;
var int                 NumMessages;

var GFxObject   PlayerStatsMC, TeamStatsMC;
var GFxObject   TimeTF;

var GFxObject   CenterTextMC, CenterTextTF;
var GFxObject   EnemyNameTF;
var GFxObject   OffhandsAndFlagMC, CreditsAndStreaksMC;

var GFxObject   HitLocMC[8], MultiKillN_TF, MultiKillMsg_TF, MultiKillMC;

var UTVehicle   LastVehicle;
var UTWeapon    LastWeapon;
var int         LastAmmoCount;
var int         LastScore[2];
var byte        LastFlagHome[2];
var UTPlayerReplicationInfo LastEnemy, LastFlagCarrier[2];

var UTGameReplicationInfo GRI;

/** IF true, set this HUD up a a team HUD */
var bool bIsTeamHUD;

/** If true, let weapons draw their crosshairs instead of using GFx crosshair */
var bool bDrawWeaponCrosshairs;

/*
 * Callback fired from Flash when Minimap is loaded.
 *   "ExternalInterface.call("RegisterMinimapView", this)";
 *   
 * Used to pass a reference to the MovieClip which is loaded
 * from Flash back to UnrealScript.
 */
function registerMiniMapView(GFxMinimap mc, float r)
{
    Minimap = mc;
	Radius = r;
	CurZoomf = 64;
	NormalZoomf = 64;
	Minimap.Init(self);
	Minimap.SetVisible(false);
	Minimap.SetFloat("_xscale", 85);
	Minimap.SetFloat("_yscale", 85);
}


function SetAmmoCountTF(Weapon Wep, String Ammo)
{
}

/*
 * Creates a new LogMessage MovieClip for use in the 
 * log.
 */
function GFxObject CreateMessageRow()
{
    //$$ JR
    if (LogMC == none) return none;

	return LogMC.AttachMovie("LogMessage", "logMessage"$NumMessages++);
}

/*
 * Initalizes a new MessageRow and adds it to the list
 * of available log MessageRow MovieClips for reuse.
 */
function GFxObject InitMessageRow()
{
	local MessageRow mrow;


	mrow.Y = 0;
	mrow.MC = CreateMessageRow();

    //$$ JR
    if (mrow.MC == none) return none;

	mrow.TF = mrow.MC.GetObject("message").GetObject("textField");
	mrow.TF.SetBool("html", true);
	mrow.TF.SetString("htmlText", "");

	FreeMessages.AddItem(mrow);
	return mrow.MC;
}

/*
 * Initialization method for HUD.
 * 
 * Caches all the references to MovieClips that will be updated throughout
 * the HUD's lifespan.
 * 
 * For the record, GetVariableObject is not as fast as GFxObject::GetObject() but
 * nevertheless is used here for convenience.
 * 
 */
function Init(optional LocalPlayer player)
{
	local int j;
	local GFxObject TempWidget;
	
	super.Init(player);

	ThisWorld = GetPC().WorldInfo;
	GRI = UTGameReplicationInfo(GetPC().WorldInfo.GRI);

    Start();
    Advance(0);

    NumMessages = 0;
	LastAmmoCount = -110;
	LastScore[0] = -110;
	LastScore[1] = -110;

	TempWidget = GetVariableObject("_root.expBar"); 
	if ( TempWidget != None ) 
	{ 
		TempWidget.SetBool("_visible", false);
	}

    TempWidget = GetVariableObject("_root.rank"); 
	if ( TempWidget != None ) 
	{
		TempWidget.SetBool("_visible", false);
	}

    TempWidget = GetVariableObject("_root.billboard"); 
	if ( TempWidget != None ) 
	{
		TempWidget.SetBool("_visible", false);
	}

	TempWidget = GetVariableObject("_root.title"); 
	if ( TempWidget != None ) 
	{
		TempWidget.SetBool("_visible", false);
	}
    TempWidget = GetVariableObject("_root.stats"); 
	if ( TempWidget != None ) 
	{
		TempWidget.SetBool("_visible", false);
	}

    TempWidget = GetVariableObject("_root.flag"); 
	if ( TempWidget != None ) 
	{
		TempWidget.SetVisible(false);
	}

	TempWidget = GetVariableObject("_root.teamStats.redWinning"); 
	if ( TempWidget != None ) 
	{
		TempWidget.SetVisible(false);
	}

	TempWidget = GetVariableObject("_root.teamStats.blueWinning"); 
	if ( TempWidget != None ) 
	{
		TempWidget.SetVisible(false);
	}

    LogMC = GetVariableObject("_root.log");
    for (j = 0; j < 15; j++)
		InitMessageRow();

    TeamStatsMC = GetVariableObject("_root.teamStats");
    PlayerStatsMC = GetVariableObject("_root.playerStats");
    LoadHeEn(PlayerHE, "_root.playerStats");

    PlayerStatsMC.GotoAndStopI(3);
    LoadHeEn(VehicleHE, "_root.playerStats.vehicle");

    PlayerStatsMC.GotoAndStopI(1);

	EnemyNameTF = GetVariableObject("_root.teamStats.redName");
	CenterTextTF = GetVariableObject("_root.centerTextMC.centerText.textField");
	CenterTextMC = GetVariableObject("_root.centerTextMC");

	MultiKillMC = GetVariableObject("_root.popup");

    TimeTF = GetVariableObject("_root.teamStats.roundTime");
    OffhandsAndFlagMC = GetVariableObject("_root.offhands_and_flag");
    CreditsAndStreaksMC = GetVariableObject("_root.credits_and_streaks");

	HitLocMC[0] = GetVariableObject("_root.dirHit.t");
	HitLocMC[1] = GetVariableObject("_root.dirHit.tr");
	HitLocMC[2] = GetVariableObject("_root.dirHit.r");
	HitLocMC[3] = GetVariableObject("_root.dirHit.br");
	HitLocMC[4] = GetVariableObject("_root.dirHit.b");
	HitLocMC[5] = GetVariableObject("_root.dirHit.bl");
	HitLocMC[6] = GetVariableObject("_root.dirHit.l");
	HitLocMC[7] = GetVariableObject("_root.dirHit.tl");

	if (LogMC != none)
		LogMC.SetFloat("_yrotation", -15);

	if (TeamStatsMC != none)
	{
		TeamStatsMC.SetVisible(bIsTeamHUD);
		TeamStatsMC.SetFloat("_xscale", 55);
		TeamStatsMC.SetFloat("_yscale", 55);
	}

	if (PlayerStatsMC != none)
	{
		PlayerStatsMC.SetFloat("_xscale", 55);
		PlayerStatsMC.SetFloat("_yscale", 55);
	}

	if (OffhandsAndFlagMC != none)
	{
		OffhandsAndFlagMC.SetFloat("_xscale", 55);
		OffhandsAndFlagMC.SetFloat("_yscale", 55);
	}

	if (CreditsAndStreaksMC != none)
	{
		CreditsAndStreaksMC.SetFloat("_xscale", 90);
		CreditsAndStreaksMC.SetFloat("_yscale", 90);
	}

    ClearStats(true);
}

function LoadHeEn(out HeEnDisplay info, String base)
{
	info.LastHealth   = -110;
    info.LastEnergy   = -110;
    info.HealthTF     = GetVariableObject(base$".healthN");
    info.HealthBarMC  = GetVariableObject(base$".health.healthMask");
    info.HealthNormMC = GetVariableObject(base$".health.healthNorm");
    info.HealthCritMC = GetVariableObject(base$".health.healthCrit");
    info.EnergyTF     = GetVariableObject(base$".energyN");
    info.EnergyBarMC  = GetVariableObject(base$".energy.energyMask");

	if (info.HealthCritMC != none)
		info.HealthCritMC.SetVisible(false);
}

function UpdateHealth(out HeEnDisplay info, float NewHealth, float HealthMax)
{
	local GFxObject.ASDisplayInfo DI;

	if( info.HealthTF != none )
	{
		info.HealthTF.SetText(int(NewHealth));
	}

    DI.hasXScale = true;
	DI.XScale = ((100.0 * NewHealth) / HealthMax);

    if (DI.XScale <= 30)
    {
        if (info.HealthNormOn == true)
        {
            info.HealthNormOn = false;
			if( info.HealthCritMC != none )
			{
				info.HealthCritMC.SetVisible(true);
			}

			if( info.HealthNormMC != none )
			{
				info.HealthNormMC.SetVisible(false);
			}
        }

        if (DI.XScale <= 0)
        {
            DI.XScale = 0.01;
        }
    }
    else
    {
        if (info.HealthNormOn == false)
        {
            info.HealthNormOn = true;

			if( info.HealthNormMC != none )
			{
				info.HealthNormMC.SetVisible(true);
			}
			if( info.HealthCritMC != none )
			{
				info.HealthCritMC.SetVisible(false);
			}
        }
    }

	if( info.HealthBarMC != None )
	{
		info.HealthBarMC.SetDisplayInfo(DI);
	}
	info.LastHealth = NewHealth;
}

function UpdateEnergy(out HeEnDisplay info, float NewEnergy, float EnergyMax)
{
	local GFxObject.ASDisplayInfo DI;

    info.EnergyTF.SetText(int(NewEnergy));

    DI.hasXScale = true;

	if (EnergyMax > 0)
	{
		DI.XScale = ((100.0 * NewEnergy) / EnergyMax);
	}

    if (DI.XScale <= 0)
    {
        DI.XScale = 0.01;
    }

	if (info.EnergyBarMC!=none)
		info.EnergyBarMC.SetDisplayInfo(DI);

    info.LastEnergy = NewEnergy;
}


static function string FormatTime(int Seconds)
{
	local int Hours, Mins;
	local string NewTimeString;

	Hours = Seconds / 3600;
	Seconds -= Hours * 3600;
	Mins = Seconds / 60;
	Seconds -= Mins * 60;
	if (Hours > 0)
		NewTimeString = ( Hours > 9 ? String(Hours) : "0"$String(Hours)) $ ":";
	NewTimeString = NewTimeString $ ( Mins > 9 ? String(Mins) : "0"$String(Mins)) $ ":";
	NewTimeString = NewTimeString $ ( Seconds > 9 ? String(Seconds) : "0"$String(Seconds));

	return NewTimeString;
}

function ClearStats(optional bool clearScores)
{
	local GFxObject.ASDisplayInfo DI;
	DI.hasXScale = true;
	DI.XScale = 0;

	if (LastVehicle != none)
	{
		if( PlayerStatsMC != None )
		{
			PlayerStatsMC.GotoAndStopI(2);
		}
		LastVehicle = none;
	}
	if( PlayerHE.LastHealth != -10)
	{
		if( PlayerHE.HealthTF != none )
		{
			PlayerHE.HealthTF.SetString("text", "");
		}
		if( PlayerHE.HealthBarMC != none )
		{
			PlayerHE.HealthBarMC.SetDisplayInfo(DI);
		}
		PlayerHE.LastHealth = -10;
	}
	if (LastAmmoCount != -10)
	{
		LastAmmoCount = -10;
	}
	if (LastWeapon != none)
	{
		LastWeapon = none;
	}

	if (clearScores && LastScore[0] != -100000)
	{
		if( TimeTF != none )
		{
			TimeTF.SetString("text", "");
		}
		LastEnemy = none;

		if( EnemyNameTF != none )
		{
			EnemyNameTF.SetText("");
		}
	}
}

function RemoveMessage()
{

}

function AddMessage(string type, string msg)
{
	local MessageRow mrow;
	local GFxObject.ASDisplayInfo DI;
	local int j;

	if (Len(msg) == 0)
		return;

	if (FreeMessages.Length > 0)
	{
		mrow = FreeMessages[FreeMessages.Length-1];
		FreeMessages.Remove(FreeMessages.Length-1,1);
	}
	//$$BE
	else if (Messages.Length > 0)
	{
		mrow = Messages[Messages.Length-1];
		Messages.Remove(Messages.Length-1,1);
	}
	else
		return;

    //$$ JR
    if (mrow.TF == none || mrow.MC == none) return;

	mrow.TF.SetString(type, msg);
	mrow.Y = 0;
	DI.hasY = true;
	DI.Y = 0;
	mrow.MC.SetDisplayInfo(DI);
	mrow.MC.GotoAndPlay("show");
	for (j = 0; j < Messages.Length; j++)
	{
		Messages[j].Y -= MessageHeight;
		DI.Y = Messages[j].Y;
		Messages[j].MC.SetDisplayInfo(DI);
	}
	Messages.InsertItem(0,mrow);
}

function UpdateGameHUD(UTPlayerReplicationInfo PRI)
{
	local UTPlayerReplicationInfo MaxPRI;
	local int i, j;

	MaxPri = none;
	i = -10000000;
	for (j = 0; j < GRI.PRIArray.length; j++)
	{
		if (GRI.PRIArray[j] != PRI && GRI.PRIArray[j].Score > i && (GRI.PRIArray[j].Score > 0 || GRI.PRIArray[j].Score > PRI.Score))
		{
			i = GRI.PRIArray[j].Score;
			MaxPRI = UTPlayerReplicationInfo(GRI.PRIArray[j]);
		}
	}
	if( EnemyNameTF != none && MaxPri != LastEnemy )
	{
		EnemyNameTF.SetText(MaxPRI != none ? MaxPRI.PlayerName : "");
		LastEnemy = MaxPri;
	}
}

function TickHud(float DeltaTime)
{
	local int i;
	local UTPawn UTP;
	local UTVehicle UTV;
	local UTWeaponPawn UWP;
	local UTWeapon Weapon;
	local UTPlayerReplicationInfo PRI;
	local PlayerController PC;

	PC = GetPC();

	GRI = UTGameReplicationInfo(PC.WorldInfo.GRI);
	PRI = UTPlayerReplicationInfo(PC.PlayerReplicationInfo);

	if ( GRI != None )
	{
		// score & time
		if( TimeTF != none )
		{
			TimeTF.SetString("text", FormatTime(GRI.TimeLimit != 0 ? GRI.RemainingTime : GRI.ElapsedTime));
		}

		if ( PRI != None )
		{
			UpdateGameHUD(PRI);
		}
	}

	UTP = UTPawn(PC.Pawn);

	if (UTP == None)
	{
		UTV = UTVehicle(PC.Pawn);
		if ( UTV == None )
		{
			UWP = UTWeaponPawn(PC.Pawn);
			if ( UWP != None )
			{
				UTV = UTVehicle(UWP.MyVehicle);
				UTP = UTPawn(UWP.Driver);
			}
		}
		else
		{
			UTP = UTPawn(UTV.Driver);
		}

		if (UTV == None)
		{
			ClearStats();
			return;
		}
	}

//	Minimap.Update(CurZoomf);
	if (UTV != LastVehicle)
	{
        if (UTV == none)
        {
			if (PlayerStatsMC != none) PlayerStatsMC.GotoAndStopI(2);
        }
		else
        {
			if (PlayerStatsMC != none) PlayerStatsMC.GotoAndStopI(3);

            VehicleHE.HealthNormOn = true;

			if (VehicleHE.HealthNormMC != none)
				VehicleHE.HealthNormMC.SetVisible(true);

			if (VehicleHE.HealthCritMC != none)
				VehicleHE.HealthCritMC.SetVisible(false);

            // Tribes is handling its own vehicle health since we show both health bars at once
            //UpdateHealth(VehicleHE, UTV.Health, UTV.HealthMax);
        }

		LastVehicle = UTV;
		PlayerHE.LastHealth = -101;
		LastAmmoCount = -101;
		LastWeapon = none;
	}

	if (PlayerHE.LastHealth != UTP.Health)
	{
        UpdateHealth(PlayerHE, UTP.Health, UTP.HealthMax);
	}

	Weapon = UTWeapon(UTP.Weapon);
	if (Weapon != none && UTV == none)
	{
		//$$BE Refactored to properly handle changing weapons.
		/*if (Weapon != LastWeapon)
		{
			if (Weapon.AmmoDisplayType == EAWDS_None)
				SetAmmoCountTF(Weapon, "");
			i = (Weapon.MaxAmmoCount > 50 ? 50 : Weapon.MaxAmmoCount);
			LastWeapon = Weapon;
		}
		i = Weapon.GetAmmoCount();
		if (i != LastAmmoCount)
		{
			LastAmmoCount = i;
			SetAmmoCountTF(Weapon, string(i));
			if (i > 50)
				i = 50;
		}*/
		if (Weapon != LastWeapon)
		{
			LastAmmoCount = Weapon.GetAmmoCount();
			LastWeapon = Weapon;

			if (Weapon.AmmoDisplayType == EAWDS_None)
				SetAmmoCountTF(Weapon, "");
			else
				SetAmmoCountTF(Weapon, string(LastAmmoCount));
		}
		else
		{
			i = Weapon.GetAmmoCount();
			if (i != LastAmmoCount)
			{
				LastAmmoCount = i;
				SetAmmoCountTF(Weapon, string(i));
				if (i > 50)
					i = 50;
			}
		}
	}
	else if (Weapon != LastWeapon)
	{
		SetAmmoCountTF(Weapon, "");
	}

	if (UTV != none && UTV.Health != VehicleHE.LastHealth)
	{
        // Tribes is handling its own vehicle health since we show both health bars at once
        //UpdateHealth(VehicleHE, UTV.Health, UTV.HealthMax);
	}
}

function ToggleCrosshair(bool bToggle)
{
	local UTHUDBase UTHB;
	local UTPlayerController PC;

	PC = UTPlayerController(GetPC());
	UTHB = UTHUDBase(GetPC().myHUD);
	if( PC != none && UTHB != none )
	{
		bToggle = !bDrawWeaponCrosshairs && bToggle && !PC.bNoCrosshair && UTHB.bCrosshairShow;
	}
}

function MinimapZoomOut()
{
	if (CurZoomf < MaxZoomf)
		CurZoomf *= 2;
}

function MinimapZoomIn()
{
	if (CurZoomf > MinZoomf)
		CurZoomf *= 0.5;
}

function DisplayHit(vector HitDir, int Damage, class<DamageType> damageType)
{
	local Vector Loc;
	local Rotator Rot;
	local float DirOfHit;
	local vector AxisX, AxisY, AxisZ;
	local vector ShotDirection;
	local bool bIsInFront;
	local vector2D	AngularDist;

	if ( class<UTDamageType>(damagetype) != none && class<UTDamageType>(damageType).default.bLocationalHit )
	{
		// Figure out the directional based on the victims current view
		GetPC().GetPlayerViewPoint(Loc, Rot);
		GetAxes(Rot, AxisX, AxisY, AxisZ);

		ShotDirection = Normal(HitDir - Loc);
		bIsInFront = GetAngularDistance( AngularDist, ShotDirection, AxisX, AxisY, AxisZ);
		GetAngularDegreesFromRadians(AngularDist);
		DirOfHit = AngularDist.X;

		if( bIsInFront )
		{
			DirOfHit = AngularDist.X;
			if (DirOfHit < 0)
			DirOfHit += 360;
		}
		else
			DirOfHit = 180 + AngularDist.X;
	}
	else
		DirOfHit = 180;

	HitLocMC[int(DirOfHit/45.f)].GotoAndPlay("on");
}

function ShowMultiKill(int n, string msg)
{
	if (MultiKillN_TF == none)
	{
		MultiKillN_TF = GetVariableObject("_root.popup.popupNumber.textField");
		MultiKillMsg_TF = GetVariableObject("_root.popup.popupText.textField");
	}

    //$$ JR
	if (MultiKillN_TF != none) MultiKillN_TF.SetText(n+1);
	if (MultiKillMsg_TF != none) MultiKillMsg_TF.SetText(msg);
	if (MultiKillMC != none) MultiKillMC.GotoAndPlay("on");
}

function SetCenterText(string text)
{
/**
this needs to call the method not directly control the textfield and movie animation
	CenterTextTF.SetText(text);
	CenterTextMC.GotoAndPlay("on");
**/
}

function string GetRank(PlayerReplicationInfo PRI)
{
	local int i;
	local int j;

	i = -10000000;
	for (j = 0; j < GRI.PRIArray.length; j++)
	{
		if (GRI.PRIArray[j].Score > i)
		{
			i = GRI.PRIArray[j].Score;
		}
	}
	if (PRI.Score >= i && PRI.Score > 0)
		return "<img src='rank15'>";
	return "";
}

function AddDeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Killed, class<UTDamageType> Dmg)
{
	local string msg;
	local byte index;

	if (Killer != none)
		msg = GetRank(Killer) @ Killer.PlayerName;
	if ((Dmg!= None) && (Dmg.default.DamageWeaponClass != none) )
	{
		index = Dmg.default.DamageWeaponClass.default.InventoryGroup;
	}

	if ( index < 12 )
		msg @= "<img src='ut3_weapon" $ index $ "'>";
	else
		msg @= "<img src='skull'>";

	msg @= GetRank(Killed) @ Killed.PlayerName;

	AddMessage("htmlText", msg);
}

defaultproperties
{
   MaxZoomf=128.000000
   MinZoomf=16.000000
   MessageHeight=38.000000
   bDisplayWithHudOff=False
   bAllowInput=False
   bAllowFocus=False
   Name="Default__GFxMinimapHud"
   ObjectArchetype=GFxMoviePlayer'GFxUI.Default__GFxMoviePlayer'
}
