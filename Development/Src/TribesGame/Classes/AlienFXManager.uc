class AlienFXManager extends Object
	native;

enum FXArea
{
	FXA_ALL,
	FXA_RIGHT,
	FXA_LEFT,
	FXA_UPPER,
	FXA_LOWER,
	FXA_FRONT,
	FXA_REAR,
	FXA_MAX,	
};

enum FXOverlay
{
	FXO_NONE,
	FXO_RAGE,
	FXO_REGEN,
	FXO_DYING,
	FXO_INVULN,
	FXO_JAMMER,
	FXO_SHIELD,
	FXO_STEALTH,
};

var int   nTeam;
var int   nHealth;
var bool  bShowFX;
var bool  bLoaded;
var bool  bMenuOpen;
var float fDamageTime;
var float fObjectiveTime;
var float fDamages[8];

/** Ticking values */
var int   nTarget;        // Target color
var bool  bBrighten;      // Brighten if true, darker if not
var float fLowBounds;     // Minimum brightness percentage
var float fHighBounds;    // Maximum brightness percentage
var float fBoundsPct;     // Current place between low and high bounds
var float fSpeed;         // How fast in ms oscillation should occur
var float fInterval;      // Rate at which lights should change
var float fIntervalCount; // Current place for the interval

var FXOverlay eCurrOverlay;
var FXOverlay eLastOverlay;

native function Init(bool bEnable);
native function Close();
native function Queued();
native function Objective();
native function SwapWeapon();
native function CheckHealth();
native function Menu(bool bOpen);
native function Damage(FXArea Area);
native function SetTeam(int TeamNum);
native function SetHealth(int Health);
native function Tick(float DeltaTime);
native function Overlay(FXOverlay Type);

function DamageConvert(string Area)
{
	switch (Area)
	{
	case "Hit_F":  Damage(FXA_REAR);                     break;
	case "Hit_FR": Damage(FXA_REAR);  Damage(FXA_RIGHT); break;
	case "Hit_FL": Damage(FXA_REAR);  Damage(FXA_LEFT);  break;
	case "Hit_B":  Damage(FXA_FRONT);                    break;
	case "Hit_BR": Damage(FXA_FRONT); Damage(FXA_RIGHT); break;
	case "Hit_BL": Damage(FXA_FRONT); Damage(FXA_LEFT);  break;
	case "Hit_L":  Damage(FXA_LEFT);                     break;
	case "Hit_R":  Damage(FXA_RIGHT);                    break;
	default:
		break;
	}
}

defaultproperties
{
   bMenuOpen=True
   fDamageTime=0.500000
   fObjectiveTime=0.500000
   fLowBounds=0.350000
   fHighBounds=1.000000
   fBoundsPct=1.000000
   fSpeed=0.300000
   fInterval=0.050000
   Name="Default__AlienFXManager"
   ObjectArchetype=Object'Core.Default__Object'
}
