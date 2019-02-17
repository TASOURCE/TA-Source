/**
 * 
 */
class TrDevice extends UTWeapon
    dependson(TrObject)
	config(Weapon)
    native;



const THR_SPINFUSOR         = 1;
const THR_SMG               = 2;
const THR_RIFLE             = 3;
const THR_LOCKED_ON         = 4;
const THR_CROSSBOW          = 5;
const THR_FLAME_THROWER     = 6;
const THR_CHAIN_GUN         = 7;
const THR_MISSILE           = 8;
const THR_NANITE            = 9;
const THR_SHOTGUN           = 10;
const THR_UNKNOWN           = 11;
const THR_LASER             = 12;
const THR_CH_V13            = 13;
const THR_SCOPE             = 14;
const THR_STANDARD          = 15;
const THR_GRENADE_LAUNCHER  = 16;
const THR_MELEE             = 17;
const THR_SHRIKE            = 18;
const THR_FREE_SPECTATOR    = 19;
const THR_RED_DOT           = 20;
const THR_BXT1              = 21;
const THR_PHASERIFLE        = 22;
const THR_SAP20             = 23;
const THR_PLASMAGUN         = 24;


const HAE_KILL_STREAK_LEVEL_1    = 1;
const HAE_KILL_STREAK_LEVEL_2    = 2;
const HAE_KILL_STREAK_LEVEL_3    = 3;
const HAE_KILL_STREAK_LEVEL_4    = 4;
const HAE_KILL_STREAK_LEVEL_5    = 5;




const TRHUD_PACK_STEALTH               = 1;
const TRHUD_PACK_DAMAGE                = 2;
const TRHUD_PACK_OMNI				   = 3;
const TRHUD_PACK_ERECHARGE             = 4;
const TRHUD_PACK_AIRTURRET             = 5;
const TRHUD_PACK_BLINK                 = 6;
const TRHUD_PACK_ENERGY                = 7;
const TRHUD_PACK_SHIELD                = 8;
const TRHUD_PACK_JAMMER                = 9;
const TRHUD_PACK_LIGHTTURRET           = 10;
const TRHUD_PACK_FORCEFIELD            = 11;
const TRHUD_PACK_WALLTURRET            = 12;
const TRHUD_PACK_REGEN                 = 13;
const TRHUD_PACK_DROPJAMMER            = 14;
const TRHUD_TBD1                       = 15;
const TRHUD_TBD2                       = 16;
const TRHUD_TBD3					   = 17;
const TRHUD_BELT_STICKYGREN            = 18;
const TRHUD_BELT_FRAG                  = 19;
const TRHUD_BELT_CLAYMORE              = 20;
const TRHUD_BELT_NITRON                = 21;
const TRHUD_BELT_MOTIONALARM           = 22;
const TRHUD_BELT_SPIKEGREN             = 23;
const TRHUD_BELT_WHITEOUT              = 24;
const TRHUD_BELT_APGREN                = 25;
const TRHUD_BELT_STGREN                = 26;
const TRHUD_BELT_PRISMMINES            = 27;
const TRHUD_BELT_FLARE                 = 28;
const TRHUD_BELT_EMPGREN               = 29;
const TRHUD_BELT_MINES                 = 30;
const TRHUD_BELT_DISKTOSS              = 31;
const TRHUD_TBD4                       = 32;
const TRHUD_TBD5                       = 33;
const TRHUD_MEDAL_ASSIST               = 34;


const TRHUD_CLAYMOREMINE            = 35;
const TRHUD_PRISMMINE               = 36;
const TRHUD_LIGHTTURRET             = 37;
const TRHUD_AATURRET                = 38;
const TRHUD_MOTIONSENSOR            = 39;
const TRHUD_MINES                   = 40;
const TRHUD_FORCESHIELD             = 41;
const TRHUD_DROPJAMMER              = 42;
const TRHUD_GENERATOR               = 43;
const TRHUD_SKIING                  = 44;
const TRHUD_MEDAL_KILLINGSPREE      = 45;
const TRHUD_MEDAL_KILLINGRAMPAGE    = 46;
const TRHUD_MEDAL_UNSTOPPABLE       = 47;
const TRHUD_MEDAL_RELENTLESS        = 48;
const TRHUD_MEDAL_THESLAYER         = 49;
const TRHUD_MEDAL_SNIPINGSPREE      = 50;
const TRHUD_MEDAL_MARKSMAN          = 51;
const TRHUD_MEDAL_SHARPSHOOTER      = 52;
const TRHUD_MEDAL_AIRMAIL           = 53;
const TRHUD_MEDAL_DEMOLITIONSEXPERT = 54;
const TRHUD_MEDAL_HURTLOCKER        = 55;
const TRHUD_MEDAL_CLASSICSPREE      = 56;
const TRHUD_MEDAL_DISKJOCKEY        = 57;
const TRHUD_MEDAL_TRIBALFANATIC     = 58;
const TRHUD_MEDAL_DOUBLEKILL        = 59;
const TRHUD_MEDAL_TRIPLEKILL        = 60;
const TRHUD_MEDAL_QUATRAKILL        = 61;
const TRHUD_MEDAL_ULTRAKILL         = 62;
const TRHUD_MEDAL_TEAMKILL          = 63;
const TRHUD_MEDAL_NOJOY             = 64;
const TRHUD_MEDAL_REVENGE           = 65;
const TRHUD_MEDAL_AFTERMATH         = 66;
const TRHUD_MEDAL_FIRSTBLOOD        = 67;
const TRHUD_MEDAL_BLUEPLATE         = 68;
const TRHUD_MEDAL_STICKYKILL        = 69;
const TRHUD_MEDAL_HEADSHOT          = 70;
const TRHUD_MEDAL_ARTILLERYSHOT     = 71;
const TRHUD_MEDAL_MARTIALART        = 72;
const TRHUD_MEDAL_SQUISH            = 73;
const TRHUD_MEDAL_FLAGGOLD          = 74;
const TRHUD_MEDAL_FLAGSILVER        = 75;
const TRHUD_MEDAL_FLAGBRONZE        = 75;
const TRHUD_MEDAL_FLAGLLAMA         = 75;
const TRHUD_MEDAL_GENERHATER        = 76;
const TRHUD_MEDAL_RABBITHUNTER      = 77;
const TRHUD_MEDAL_CAERBANNOG        = 78;
const TRHUD_MEDAL_FINALBLOW         = 79;

const TRHUD_MEDAL_GENDEFENSE        = 76;
const TRHUD_MEDAL_FLAGDEFENSE       = 75;
const TRHUD_MEDAL_VDESTROY          = 73;
const TRHUD_MEDAL_HOTAIR            = 284;

const TRICON_RANK_1                 = 80;
const TRICON_RANK_2                 = 81;
const TRICON_RANK_3                 = 82;
const TRICON_RANK_4                 = 83;
const TRICON_RANK_5                 = 84;
const TRICON_RANK_6                 = 85;
const TRICON_RANK_7                 = 86;
const TRICON_RANK_8                 = 87;
const TRICON_RANK_9                 = 88;
const TRICON_RANK_10                = 89;
const TRICON_RANK_11                = 90;
const TRICON_RANK_12                = 91;
const TRICON_RANK_13                = 92;
const TRICON_RANK_14                = 93;
const TRICON_RANK_15                = 94;
const TRICON_RANK_16                = 95;
const TRICON_RANK_17                = 96;
const TRICON_RANK_18                = 97;
const TRICON_RANK_19                = 98;
const TRICON_RANK_20                = 99;
const TRICON_RANK_21                = 100;
const TRICON_RANK_22                = 101;
const TRICON_RANK_23                = 102;
const TRICON_RANK_24                = 103;
const TRICON_RANK_25                = 104;
const TRICON_RANK_26                = 105;
const TRICON_RANK_27                = 106;
const TRICON_RANK_28                = 107;
const TRICON_RANK_29                = 108;
const TRICON_RANK_30                = 109;
const TRICON_RANK_31                = 110;
const TRICON_RANK_32                = 111;
const TRICON_RANK_33                = 112;
const TRICON_RANK_34                = 113;
const TRICON_RANK_35                = 114;
const TRICON_RANK_36                = 115;
const TRICON_RANK_37                = 116;
const TRICON_RANK_38                = 117;
const TRICON_RANK_39                = 118;
const TRICON_RANK_40                = 119;
const TRICON_RANK_41                = 120;
const TRICON_RANK_42                = 121;
const TRICON_RANK_43                = 122;
const TRICON_RANK_44                = 123;
const TRICON_RANK_45                = 124;
const TRICON_RANK_46                = 125;
const TRICON_RANK_47                = 126;
const TRICON_RANK_48                = 127;
const TRICON_RANK_49                = 128;
const TRICON_RANK_50                = 129;
const TRICON_KILLTYPE_EXPLOSIVE     = 130;
const TRICON_KILLTYPE_STICKY        = 131;
const TRICON_KILLTYPE_SQUISH        = 132;
const TRICON_KILLTYPE_MELEE         = 133;
const TRICON_KILLTYPE_FALLING       = 134;
const TRICON_KILLTYPE_VEHICLE       = 135;
const TRICON_KILLTYPE_BULLET        = 136;
const TRICON_KILLTYPE_SNIPER        = 137;
const TRICON_KILLTYPE_BASE_TURRET   = 138;
const TRICON_KILLTYPE_HEADSHOT      = 139;
const TRICON_KILLTYPE_GENERIC       = 140;
const TRICON_KILLTYPE_SPINFUSOR     = 141;
const TRICON_KILLTYPE_TURRET        = 142;
const TRICON_ACCOLADE_BASE_DESTROY  = 143;
const TRICON_ACCOLADE_BASE_REPAIR   = 144;
const TRICON_ACCOLADE_MIRACLE       = 145;
const TRICON_ACCOLADE_ULTRAKILLNORED   = 146;
const TRICON_ACCOLADE_NOTAMONGEQUALS   = 147;
const TRICON_ACCOLADE_EXPLOSIVESPREE   = 148;
const TRICON_ACCOLADE_ULTRAFASTGRAB    = 149;
const TRICON_ACCOLADE_ONEMANARMY       = 150;
const TRICON_ACCOLADE_GAMEWINNER       = 151;
const TRICON_ACCOLADE_UNITEDWESTAND    = 152;
const TRICON_ACCOLADE_DOUBLEDOWN       = 153;
const TRICON_ACCOLADE_FASTFLAGGRAB     = 154;
const TRICON_ACCOLADE_SHRIKEDOWN       = 155;
const TRICON_ACCOLADE_GRAVCYCLEDOWN    = 156;
const TRICON_ACCOLADE_BEOWULFDOWN      = 157;
const TRICON_ACCOLADE_FINALBLOW        = 158;
const TRICON_ACCOLADE_BENCHEM          = 159;
const TRICON_ACCOLADE_LASTMANSTANDING  = 160;
const TRICON_ACCOLADE_TRIBALHONOR      = 161;
const TRICON_ACCOLADE_FLAGKILLER       = 162;
const TRICON_ACCOLADE_GAMECOMPLETE     = 163;
const TRICON_ACCOLADE_FLAGDEFENSE      = 164;
const TRICON_ACCOLADE_GENERATORDEFENSE = 165;
const TRICON_ACCOLADE_LLAMAGRAB        = 166;
const TRICON_ACCOLADE_EGRAB            = 167;
const TRICON_ACCOLADE_TURRETDESTROYED  = 168;
const TRICON_ACCOLADE_ALTFLAGCARRY     = 169;
const TRICON_ACCOLADE_HOLDTHELINE      = 281;
const TRICON_ACCOLADE_CAPTUREANDHOLD   = 282;
const TRICON_BADGE_FLAGDEFENSE_4       = 170;
const TRICON_BADGE_FLAGDEFENSE_3       = 171;
const TRICON_BADGE_FLAGDEFENSE_2       = 172;
const TRICON_BADGE_FLAGDEFENSE_1       = 173;
const TRICON_BADGE_OPERATOR_4          = 174;
const TRICON_BADGE_OPERATOR_3          = 175;
const TRICON_BADGE_OPERATOR_2          = 176;
const TRICON_BADGE_OPERATOR_1          = 177;
const TRICON_BADGE_CALLINKILLS_4       = 178;
const TRICON_BADGE_CALLINKILLS_3       = 179;
const TRICON_BADGE_CALLINKILLS_2       = 180;
const TRICON_BADGE_CALLINKILLS_1       = 181;
const TRICON_BADGE_MELEEKILLS_4        = 182;
const TRICON_BADGE_MELEEKILLS_3        = 183;
const TRICON_BADGE_MELEEKILLS_2        = 184;
const TRICON_BADGE_MELEEKILLS_1        = 185;
const TRICON_BADGE_ONEMANARMY_4        = 186;
const TRICON_BADGE_ONEMANARMY_3        = 187;
const TRICON_BADGE_ONEMANARMY_2        = 188;
const TRICON_BADGE_ONEMANARMY_1        = 189;
const TRICON_BADGE_FLAGCAPPER_4        = 190;
const TRICON_BADGE_FLAGCAPPER_3        = 191;
const TRICON_BADGE_FLAGCAPPER_2        = 192;
const TRICON_BADGE_FLAGCAPPER_1        = 193;
const TRICON_BADGE_TOUROFDUTY_4        = 194;
const TRICON_BADGE_TOUROFDUTY_3        = 195;
const TRICON_BADGE_TOUROFDUTY_2        = 196;
const TRICON_BADGE_TOUROFDUTY_1        = 197;
const TRICON_BADGE_MULTIKILL_4         = 198;
const TRICON_BADGE_MULTIKILL_3         = 199;
const TRICON_BADGE_MULTIKILL_2         = 200;
const TRICON_BADGE_MULTIKILL_1         = 201;
const TRICON_BADGE_COMBATSTAR_4        = 202;
const TRICON_BADGE_COMBATSTAR_3        = 203;
const TRICON_BADGE_COMBATSTAR_2        = 204;
const TRICON_BADGE_COMBATSTAR_1        = 205;
const TRICON_BADGE_CROSSCOUNTRY_4      = 206;
const TRICON_BADGE_CROSSCOUNTRY_3      = 207;
const TRICON_BADGE_CROSSCOUNTRY_2      = 208;
const TRICON_BADGE_CROSSCOUNTRY_1      = 209;
const TRICON_BADGE_POWERPLAYER_4       = 210;
const TRICON_BADGE_POWERPLAYER_3       = 211;
const TRICON_BADGE_POWERPLAYER_2       = 212;
const TRICON_BADGE_POWERPLAYER_1       = 213;
const TRICON_BADGE_DEMOMAN_4           = 214;
const TRICON_BADGE_DEMOMAN_3           = 215;
const TRICON_BADGE_DEMOMAN_2           = 216;
const TRICON_BADGE_DEMOMAN_1           = 217;
const TRICON_BADGE_SPEEDRUNNER_4       = 218;
const TRICON_BADGE_SPEEDRUNNER_3       = 219;
const TRICON_BADGE_SPEEDRUNNER_2       = 220;
const TRICON_BADGE_SPEEDRUNNER_1       = 221;
const TRICON_BADGE_GOODDRIVER_4        = 222;
const TRICON_BADGE_GOODDRIVER_3        = 223;
const TRICON_BADGE_GOODDRIVER_2        = 224;
const TRICON_BADGE_GOODDRIVER_1        = 225;
const TRICON_BADGE_PURPLEHEART_4       = 226;
const TRICON_BADGE_PURPLEHEART_3       = 227;
const TRICON_BADGE_PURPLEHEART_2       = 228;
const TRICON_BADGE_PURPLEHEART_1       = 229;
const TRICON_BADGE_HAPPENSTOUSALL      = 230;
const TRICON_BADGE_INVSTATION          = 231;
const TRICON_BADGE_ANTIVEHICLE_4       = 232;
const TRICON_BADGE_ANTIVEHICLE_3       = 233;
const TRICON_BADGE_ANTIVEHICLE_2       = 234;
const TRICON_BADGE_ANTIVEHICLE_1       = 235;
const TRICON_BADGE_UTILITYBELT_4       = 236;
const TRICON_BADGE_UTILITYBELT_3       = 237;
const TRICON_BADGE_UTILITYBELT_2       = 238;
const TRICON_BADGE_UTILITYBELT_1       = 239;
const TRICON_BADGE_ONCALL_4            = 240;
const TRICON_BADGE_ONCALL_3            = 241;
const TRICON_BADGE_ONCALL_2            = 242;
const TRICON_BADGE_ONCALL_1            = 243;
const TRICON_BADGE_SUPPORT_4           = 244;
const TRICON_BADGE_SUPPORT_3           = 245;
const TRICON_BADGE_SUPPORT_2           = 246;
const TRICON_BADGE_SUPPORT_1           = 247;
const TRICON_BADGE_MARKSMAN_4          = 248;
const TRICON_BADGE_MARKSMAN_3          = 249;
const TRICON_BADGE_MARKSMAN_2          = 250;
const TRICON_BADGE_MARKSMAN_1          = 251;
const TRICON_BADGE_ASSISTOR_4          = 252;
const TRICON_BADGE_ASSISTOR_3          = 253;
const TRICON_BADGE_ASSISTOR_2          = 254;
const TRICON_BADGE_ASSISTOR_1          = 255;
const TRICON_BADGE_BUILDER_4           = 256;
const TRICON_BADGE_BUILDER_3           = 257;
const TRICON_BADGE_BUILDER_2           = 258;
const TRICON_BADGE_BUILDER_1           = 259;
const TRICON_BADGE_GOINGFAST_4         = 260;
const TRICON_BADGE_GOINGFAST_3         = 261;
const TRICON_BADGE_GOINGFAST_2         = 262;
const TRICON_BADGE_GOINGFAST_1         = 263;


const RANK_XP_1                     = 0;
const RANK_XP_2                     = 1350;
const RANK_XP_3                     = 2781;
const RANK_XP_4                     = 4298;
const RANK_XP_5                     = 5906;
const RANK_XP_6                     = 11212;	
const RANK_XP_7                     = 16836;
const RANK_XP_8                     = 22798;
const RANK_XP_9                     = 31741;
const RANK_XP_10                    = 41130;
const RANK_XP_11                    = 50990;
const RANK_XP_12                    = 61342;
const RANK_XP_13                    = 76870;
const RANK_XP_14                    = 93020;
const RANK_XP_15                    = 109815;
const RANK_XP_16                    = 127283;
const RANK_XP_17                    = 145449;
const RANK_XP_18                    = 172698;
const RANK_XP_19                    = 200765;
const RANK_XP_20                    = 229673;
const RANK_XP_21                    = 259449;
const RANK_XP_22                    = 290118;
const RANK_XP_23                    = 321707;
const RANK_XP_24                    = 369091;
const RANK_XP_25                    = 417896;
const RANK_XP_26                    = 468166;
const RANK_XP_27                    = 519943;
const RANK_XP_28                    = 573274;
const RANK_XP_29                    = 628205;
const RANK_XP_30                    = 684783;
const RANK_XP_31                    = 743059;
const RANK_XP_32                    = 803084;
const RANK_XP_33                    = 864909;
const RANK_XP_34                    = 928589;
const RANK_XP_35                    = 994179;
const RANK_XP_36                    = 1061737;
const RANK_XP_37                    = 1131321;
const RANK_XP_38                    = 1202994;
const RANK_XP_39                    = 1276816;
const RANK_XP_40                    = 1352853;
const RANK_XP_41                    = 1431171;
const RANK_XP_42                    = 1511839;
const RANK_XP_43                    = 1594926;
const RANK_XP_44                    = 1680507;
const RANK_XP_45                    = 1768654;
const RANK_XP_46                    = 1859447;
const RANK_XP_47                    = 1952963;
const RANK_XP_48                    = 2049284;
const RANK_XP_49                    = 2148495;
const RANK_XP_50                    = 2250682;


const ACCOLADE_TYPE_MISC            = 0;
const ACCOLADE_TYPE_MULTIKILL       = 1;
const ACCOLADE_TYPE_KILLSTREAK      = 2;


const TRICON_PERK_ICON_WIP                  = 1;
const TRICON_PERK_BONUS_KILL_CREDITS        = 1;
const TRICON_PERK_STICKY_HANDS              = 2;
const TRICON_PERK_REDUCED_VEHICLE_COST      = 3;
const TRICON_PERK_REDUCED_SELF_DAMAGE       = 4;
const TRICON_PERK_REDUCED_RUN_OVER          = 5;
const TRICON_PERK_REDUCED_BASE_UPGRADE_COST = 6;
const TRICON_PERK_REDUCED_FALL_DMG          = 7;
const TRICON_PERK_REDUCED_AIR_VEHICLE_COST  = 8;
const TRICON_PERK_TRAP_DETECTION            = 9;
const TRICON_PERK_PICKUP_ENERGY_HEALTH      = 10;
const TRICON_PERK_MELEE_FLAG_DROP           = 11;
const TRICON_PERK_EXTRA_MINES               = 12;
const TRICON_PERK_EXTRA_ENERGY              = 13;
const TRICON_PERK_EXTRA_GRENADE_PICKUP      = 14;
const TRICON_PERK_EXTRA_AMMO                = 15;
const TRICON_PERK_EXTRA_GRENADE             = 16;
const TRICON_PERK_BEOWULF_HEALTH_INCREASE   = 17;
const TRICON_PERK_EJECTION_SEAT             = 18;
const TRICON_PERK_ORBITAL_STRIKE            = 19;
const TRICON_PERK_REDUCED_MELEE_DAMAGE      = 20;
const TRICON_PERK_MELEE_BACKSTAB            = 21;
const TRICON_PERK_DEMOLITIONS               = 22;
const TRICON_PERK_SQUIRRELLY                = 23;
const TRICON_PERK_STEALTHY                  = 24;
const TRICON_PERK_ULTRA_CAPACITOR           = 25;
const TRICON_PERK_DETERMINATION             = 26;


const TRICON_SKILL_SPEED                    = 1;
const TRICON_SKILL_ENERGY                   = 2;
const TRICON_SKILL_PING                     = 3;
const TRICON_SKILL_AMMO                     = 4;
const TRICON_SKILL_ANTI_ARMOR               = 5;
const TRICON_SKILL_GRENADE                  = 6;
const TRICON_SKILL_RADIUS                   = 7;
const TRICON_SKILL_HEALTH                   = 8;
const TRICON_SKILL_BOOT                     = 9;
const TRICON_SKILL_TIMER                    = 10;


const TRICON_CLASS_SENTINEL                 = 1;
const TRICON_CLASS_PATHFINDER               = 2;
const TRICON_CLASS_JUMPER                   = 3;
const TRICON_CLASS_INFILTRATOR              = 4;
const TRICON_CLASS_WARDER                   = 30;
const TRICON_CLASS_TECHNICIAN               = 31;
const TRICON_CLASS_SOLDIER                  = 32;
const TRICON_CLASS_SCRAMBLER                = 33;
const TRICON_CLASS_RANGER                   = 34;
const TRICON_CLASS_RAIDER                   = 35;
const TRICON_CLASS_ENGINEER                 = 36;
const TRICON_CLASS_ROOK                     = 60;
const TRICON_CLASS_MARAUDER                 = 61;
const TRICON_CLASS_JUGGERNAUT               = 62;
const TRICON_CLASS_DOOMBRINGER              = 63;
const TRICON_CLASS_BRUTE                    = 64;
const TRICON_CLASS_WIP                      = 88;


const ICON_UPGRADE_NONE                     = 0;


const MOD_TYPE_NONE                         = 1;
const MOD_TYPE_HEALTH                       = 2;
const MOD_TYPE_MASSPCT                      = 3;
const MOD_TYPE_RADARLINK                    = 4;
const MOD_TYPE_FLAGREACH                    = 5;
const MOD_TYPE_BUILDUPPCT                   = 6;
const MOD_TYPE_CLOTHESLINE                  = 7;
const MOD_TYPE_STICKYHANDS                  = 8;
const MOD_TYPE_MAXSKISPEED                  = 9;
const MOD_TYPE_EXTRAENERGY                  = 10;
const MOD_TYPE_EJECTIONSEAT                 = 11;
const MOD_TYPE_SELFDAMAGEPCT                = 12;
const MOD_TYPE_REPAIRRATEPCT                = 13;
const MOD_TYPE_EXTRAMINESOUT                = 14;
const MOD_TYPE_VEHICLEEXTRAHEALTH           = 15;
const MOD_TYPE_GROUNDSPEEDPCT               = 16;
const MOD_TYPE_ENERGYDRAINPCT               = 17;
const MOD_TYPE_UPGRADECOSTPCT               = 18;
const MOD_TYPE_CANDETECTTRAPS               = 19;
const MOD_TYPE_SPLATDAMAGEPCT               = 20;
const MOD_TYPE_WEAPONSWITCHPCT              = 21;
const MOD_TYPE_POTENTIALENERGY              = 22;
const MOD_TYPE_MAXJETTINGSPEED              = 23;
const MOD_TYPE_CREDITSFROMKILLS             = 24;
const MOD_TYPE_TERMINALSKISPEED             = 25;
const MOD_TYPE_MAXSKICONTROLPCT             = 26;
const MOD_TYPE_HASDETERMINATION             = 27;
const MOD_TYPE_DEPLOYABLEHEALTH             = 28;
const MOD_TYPE_EXTRAOFFHANDAMMO             = 29;
const MOD_TYPE_EXTRAPRIMARYAMMO             = 30;
const MOD_TYPE_PRIMARYRELOADPCT             = 31;
const MOD_TYPE_SENSORDISTANCEPCT            = 32;
const MOD_TYPE_PACKENERGYCOSTPCT            = 33;
const MOD_TYPE_AMMOFROMPICKUPPCT            = 34;
const MOD_TYPE_TIMETOREGENENERGY            = 35;
const MOD_TYPE_SECONDARYRELOADPCT           = 36;
const MOD_TYPE_EXTRASECONDARYAMMO           = 37;
const MOD_TYPE_ENERGYREGENRATEPCT           = 38;
const MOD_TYPE_HEALTHREGENRATEPCT           = 39;
const MOD_TYPE_DEPLOYABLERANGEPCT           = 40;
const MOD_TYPE_JAMMERPACKRADIUSPCT          = 41;
const MOD_TYPE_BLINKPACKPOTENCYPCT          = 42;
const MOD_TYPE_PEAKSKICONTROLSPEED          = 43;
const MOD_TYPE_CANCALLINSUPPLYDROP          = 44;
const MOD_TYPE_EXTRADEPLOYABLESOUT          = 45;
const MOD_TYPE_HEALTHFROMPICKUPPCT          = 46;
const MOD_TYPE_ENERGYFROMPICKUPPCT          = 47;
const MOD_TYPE_TERMINALJETTINGSPEED         = 48;
const MOD_TYPE_TIMETOREGENHEALTHPCT         = 49;
const MOD_TYPE_VEHICLECOSTPCT               = 50;
const MOD_TYPE_SKICONTROLSIGMASQUARE        = 51;
const MOD_TYPE_RECEIVEMELEEDAMAGEPCT        = 52;
const MOD_TYPE_VICTIMDROPFLAGONMELEE        = 53;
const MOD_TYPE_PRIMARYWEAPONRANGEPCT        = 54;
const MOD_TYPE_OFFHANDDAMAGERADIUSPCT       = 55;
const MOD_TYPE_TURRETACQUIRETARGETPCT       = 56;
const MOD_TYPE_WHITEOUTINTERPSPEEDPCT       = 57;
const MOD_TYPE_BACKSTABMELEEDAMAGEPCT       = 58;
const MOD_TYPE_MAXSTOPPINGDISTANCEPCT       = 59;
const MOD_TYPE_SECONDARYWEAPONRANGEPCT      = 60;
const MOD_TYPE_EXTRAGRENADESFROMPICKUP      = 61;
const MOD_TYPE_SHIELDPACKEFFECTIVENESS      = 62;
const MOD_TYPE_STEALTHPACKPULSETIMEPCT      = 63;
const MOD_TYPE_PRIMARYINCREASEDCLIPSIZE     = 64;
const MOD_TYPE_EXTRACREDITSFROMBELTKILLS    = 65;
const MOD_TYPE_TURRETARMORPENETRATIONPCT    = 66;
const MOD_TYPE_SECONDARYINCREASEDCLIPSIZE   = 67;
const MOD_TYPE_OFFHANDARMORPENETRATIONPCT   = 68;
const MOD_TYPE_PRIMARYARMORPENETRATIONPCT   = 69;
const MOD_TYPE_RUNOVERDAMAGEPROTECTIONPCT   = 70;
const MOD_TYPE_PRIMARYWEAPONENERGYCOSTPCT   = 71;
const MOD_TYPE_ACQUIRETIMEBYENEMYTURRETPCT  = 72;
const MOD_TYPE_SECONDARYARMORPENETRATIONPCT = 73;
const MOD_TYPE_VEHICLEEXTRAENERGY           = 74;
const MOD_TYPE_AMMOPICKUPREACH              = 75;
const MOD_TYPE_VEHICLEPASSENGERDMGPROTPCT   = 76;
const MOD_TYPE_DAMAGEREPAIRENEMYOBJECTIVES  = 77;
const MOD_TYPE_POTENTIALENERGYFALLDAMAGE    = 78;
const MOD_TYPE_FASTERTHROWBELTBUFFPCT       = 79;
const MOD_TYPE_IGNOREGRENADESECONDARYONSELF = 80;
const MOD_TYPE_POTENTIALENERGYDMGTRANSFERPCT= 81;
const MOD_TYPE_FLAGREACHTIER                = 82;
const MOD_TYPE_SONICPUNCH                   = 83;
const MOD_TYPE_SONICPUNCHDIST               = 84;
const MOD_TYPE_SONICPUNCHKNOCKBACK          = 85;
const MOD_TYPE_RAGE                         = 86;
const MOD_TYPE_RAGEENERGYREGEN              = 87;
const MOD_TYPE_RAGETIMELENGTH               = 88;
const MOD_TYPE_RAGEHEALTHRESTOREPCT         = 89;
const MOD_TYPE_IGNOREPULSESTEALTHTIME       = 90;
const MOD_TYPE_RAGEMASSREDUCTION            = 91;
const MOD_TYPE_REPAIRDEPLOYABLERATEPCT      = 92;
#linenumber 9

struct native EffectInfo
{
    var byte fireModeNum;
    var class<TrEffect> effectClass;
    var EffectType type;
    var float lifetime;
    var float value;
    var float interval;

    StructDefaultProperties
	{
		type = ET_HIT;
        fireModeNum = 0;
        lifetime = 0;
        value = 0;
        interval = 0;
	}
};

var int                             DBWeaponId;                    // Database Id for weapon
var int                             DBWeaponBaseId;                // Database Id for parent type
var int                             DBWeaponTypeId;                // Database Id for fire type
var int                             DBXPActivityId;                // Database Id for XP gathering

var TR_EQUIP_POINT                  r_eEquipAt;

var array<EffectInfo>               m_EffectInfo;
var array<DeviceTargeterType>       m_eTargetType;
var array<DeviceAttackType>         m_eAttackType;
var array<int>                      m_PowerPoolCost;
var float                           m_fDamageRadius;
var float                           m_fConeAttackAngle;
var bool                            m_bAllowMultipleTargets;
var bool                            m_bEquipEffectsApplied;
var bool                            m_bHighlightEnemies;

var float							m_fDefaultAccuracy;
var float							m_fAccuracyLossOnJump;
var float							m_fAccuracyLossOnWeaponSwitch;
var float							m_fAccuracyLossOnShot;
var float							m_fAccuracyLossMax;
var float							m_fAimingModeAccuracyBonus;
var float							m_fAccuracyCorrectionRate;
var bool							m_bRequireAimMode;

var float	                        m_fQuickRetrieveEquipTime;      // The amount of equip time after a quick retrieve.
var int                             m_nReticuleIndex;               // Reticule that we want to use for this device.
var int                             m_nAltReticuleIndex;            // Reticule that we want to use for this device when zoomed.
var bool                            m_bLowAmmoOn;                   // Indicates that the warning is active.
var int                             m_nLowAmmoWarning;              // Shoot count <= to warning on.
var int								m_nCarriedAmmo;				    // how much ammo am I carrying for this weap? Server will send r_nCarriedAmmoCount to sync the device ammo count periodically
var int                             m_nMaxCarriedAmmo;              // how much ammo can I carry?
var int                             m_RemainingAmmoInClip;
var bool                            m_bAllowReloads;                // Does this device allow reloads?
var float							m_fReloadTime;				    // Amount of time for the reload.
var float                           m_fPctTimeBeforeReload;         // [0.0-1.0] Percentage of time to pass before actually changing the ammo count (typically aligned with animation).
var bool							m_bReloadSingles;			    // does weapon reload one shot at a time?
var transient bool                  m_bPendingReload;               // Is there a pending reload (useful for knowing to go to the reload state after the current state is complete).
var bool                            m_bReloadBulletInChamber;       // Is there a bullet in the chamber when we request reload?
var bool                            m_bCanEarlyAbortReload;         // Can the weapon early abort a reload if there is enough ammo?
var repnotify bool	                r_bReadyToFire;                 // Is the server ready for client to fire?
var SoundCue						m_ReloadAmmoSoundCue;
var SoundCue						m_DryFireSoundCue;
var SoundCue                        m_ZoomInSoundCue;
var SoundCue                        m_ZoomOutSoundCue;
var int                             s_iCheatCountAmmo;              // Number of times cheater has done ServerHit without ammo/fire
var bool                            m_bForceReplicateAmmoOnFire;

struct native ReplicatedAmmoCount
{
	var int CarriedAmmoCount;
	var int ClipAmmoCount;
};
var repnotify ReplicatedAmmoCount r_AmmoCount;

/////////////////////////////////////////////////////////////
var             float               c_fLockTime;                   // Used for buildup of weapons that charge in aim mode.
var             bool                c_bLocking;                    // if this weapon is currently locking the target
var             actor               c_LockedActor;                 // the current actor locked
var             float               m_fLockTargetTime;

var             bool                m_bUsesDeployMode;

/** The Class of Projectile to spawn */
var				Array< class<TrDeployable> >	m_WeaponDeployables;

var TrAnimNodeBlendByDeviceAnim     m_DeviceAnimNode;

/** Tracers */
var() EWeaponTracerType m_TracerType;           // Determines which tracer type to use for this weapon
var() bool              m_bSpawnTracers;        // Does this device support tracers?
var() bool              m_bSpawnTracerBeams;    // Does this device support tracer beams?
var() int               m_nTracerInterval;      // How many shots between tracers?
var() float             m_fShowTracerDistance;  // Min distance between fire location and hit location for drawing a tracer.
var() ParticleSystem    m_TracerBeamTemplate;   // Device will spawn this particle system along the fired direction.

/* pricing in the loadout scene */
var()			int			m_nCreditCost;				// how much it costs to buy
var()			int			m_nIconIndex;		

/** Kickback. */
var(Kickback)   vector2d    m_v2MinMaxKickbackX;        // Min/Max values for amout of kickback along view's X axis to add to each shot.
var(Kickback)   vector2d    m_v2MinMaxKickbackY;        // Min/Max values for amout of kickback along view's Y axis to add to each shot.
var             vector2d    m_v2KickbackAmount;         // How much kickback is currently applied to base aim.
var             float       m_fLastKickbackTime;        // Timestamp for last kickback.
var(Kickback)   float       m_fKickbackBlendOutTime;    // How long to blend back to a non-kickback affected view.
var(Kickback)   bool        m_bIsKickbackAdditive;      // Does kickback add onto previous kickback amounts or reset for each shot?
var(Kickback)   float       m_fMaxKickbackDistanceX;    // The max distance away from center vector to deviate while kicking back.
var(Kickback)   float       m_fMaxKickbackDistanceY;    // The max distance away from center vector to deviate while kicking back.

/** Weapon Lag/Leading */
var                 vector2d    m_v2WeaponLagAimOffset;         // [-1,1] along each axis, represents the amount of weapon lag to be applied to the aim.
var(FirstPerson)    int         m_nMaxWeaponLagYaw;             // The amount of yaw rotation at or above which the aim offset maxes out.
var(FirstPerson)    int         m_nMaxWeaponLagPitch;           // The amount of pitch rotation at or above which the aim offset maxes out.
var(FirstPerson)    vector2d    m_v2WeaponLagInterpSpeed;       // The interpolation speed into a delta.
var(FirstPerson)    vector2d    m_v2WeaponLagSmoothingFactor;   // [0,1] Smooths the constant stream of aim offset values.

/** Is this a passive device, i.e. cannot be fired, toggled, or activated? */
var bool m_bIsPassive;

var transient bool m_bWantsToFire;
var bool m_bAllowHoldDownFire;
var bool m_bAllowFireWhileZoomed;  

var Material r_ReplicatedMaterial;
var array<EffectFormOverwrite>  m_EffectFormOverwrite;

/** Hands mesh seen by players in 1p perspective. */
var() UDKSkeletalMeshComponent m_FirstPersonHandsMesh;

/** Hands overlay mesh. */
var protected UDKSkeletalMeshComponent m_FirstPersonHandsOverlayMesh;

/** Camera shake when this weapon fires. */
var() editinline CameraShake m_FireCameraShake;

/** The pivot offset for positioning the first person weapon. */
var() Vector m_vPositionPivotOffset;

/** Track ammo used */
var int m_ShotsFired;

// Override for player controller setings
var() bool m_bCanZoom;
var() float m_fDesiredZoomFOV;
var() float m_fZoomRate;
var() vector m_vZoomMeshOffset; // Amount to offset the mesh while zoomed.
var() bool m_bUseMeshZoomOffset;
var() bool  m_bEndZoomOnReload;
var() bool  m_bResumeZoomOnReloadEnd;
var() name  m_nmZoomMaterialEffectName;	// Zoom overlay name.
var MaterialInstanceConstant m_ZoomOverlayMaterial;

/** Is the weapon reloading on the authority? */
var repnotify transient bool r_bIsReloading;

/** All anim node sequences for Mesh. */
var transient Array<AnimNodeSequence> m_MeshAnimSequenceNodes;

/** Multiplier to hitbox size of an actor the client said it hit that the shot must be within for the server to agree */
var float m_fClientSideHitLeeway;

/** Overriden fire interval for the last shot in a clip. */
var float m_fFireIntervalForLastShotInClip;

/** Animation set containing overrides for when this weapon has no ammo. */
var Animset m_NoAmmoAnimSet;

/** Counter for generating tether ids.*/
var int m_nTetherCounter;

/** Timestamp representing the last time this device was active. */
var protected transient float m_fLastActiveTime;

/** Min. time the device needs to be inactive before an inactive reload occurs. */
var protected float m_fTimeBeforeInactiveReload;

/** additional offset applied when using small weapons */
var(FirstPerson) vector m_TinyWeaponsOffset;
var(FirstPerson) globalconfig bool m_bTinyWeaponsEnabled;

// Paper doll variables
var PaperDollInfo m_MainMenuPaperDollInfo;
var PaperDollInfo m_InGamePaperDollInfo;

/** Info Panel */
var localized string InfoPanelDescription;
var int InfoPanelDamage;
var int InfoPanelRadius;
var int InfoPanelFireRate;
var int InfoPanelClipSize;

struct native DeviceModification
{
    var int ModType;
    var float Value;
};

/** Upgrades */
struct native DeviceUpgrade
{
    var int IconId;
    var int DatabaseItemId;
    var array<DeviceModification> Modifications;
};

var localized string UpgradeDescription[5];
var array<DeviceUpgrade> Upgrades;
var DeviceUpgrade BaseMod;

var string m_sContentDataClassName;
var TrDeviceContentData m_ContentData;

/** An additional fire offset amount for client-side tracers. */
var() vector m_vClientSideFireOffset;

///////////////////////////////////////////////////////////////////////////////////////////////////////
native function byte                GetFireModeNum();
native function bool                IsValidTarget(Actor target, optional int nFireMode = -1);
native function bool                IsEnemy(Actor target);
native function bool                IsInsideCone(vector SourceLookDir, actor TargetActor, vector StartCone, float MinCosine);
native function bool                ShouldAddToImpactList(actor HitActor, Array<ImpactInfo> ImpactList);
native function                     TickInHandWeapon(float DeltaSeconds);
native function                     ResetLock();
native function actor               GetLockedTarget();
native function TrDeployable        SpawnPet(bool bPet);
native function float               GetAccuracy();
native function float               GetTargetAccuracy();
native function                     RestoreAccuracy(float fTimeStep);
native function                     RestoreKickback(float DeltaSeconds);
native function bool                IsInLOS(Actor TouchedActor, vector ExpectedLocation);
native function                     AttachHandsMesh();
native function TrDeviceContentData LoadMeshData();
native function int                 ValidateClientReportedHit(byte FiringMode, ImpactInfo Impact, bool bHeadShot, bool bDeviceIsFiring);
native function int                 ValidateClientReportedHitInternal(byte FiringMode, ImpactInfo Impact, bool bHeadShot, bool bDeviceIsFiring);
static native function string       GetObjectReferencerName();
static native function string       GetObjectReferencerPackageName();

// Validate hit function call returns
const VALIDATE_HIT_DEFER    = -1;
const VALIDATE_HIT_REJECT   = 0;
const VALIDATE_HIT_APPROVE  = 1;
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
    if (bNetDirty && bNetOwner && Role == ROLE_Authority)
        r_eEquipAt, r_ReplicatedMaterial, r_bIsReloading, r_bReadyToFire, r_AmmoCount;
}

simulated event ReplicatedEvent(name VarName)
{
    if(VarName == 'r_AmmoCount')
    {
        m_nCarriedAmmo = r_AmmoCount.CarriedAmmoCount;
		m_RemainingAmmoInClip = r_AmmoCount.ClipAmmoCount;
        return;
    }
	else if( VarName == 'r_bReadyToFire' )
	{
		//`log(self@"Received r_bReadyToFire"@r_bReadyToFire);
		// Client wants to fire, so let him try.
		if( r_bReadyToFire && m_bWantsToFire )
		{
			StartFire(0);
		}

		return;
	}
	else if (VarName == 'r_bIsReloading')
	{
		// The client has finished reloading, so see if they should resume zoom on end.
		ResumeZoomOnReloadEnd();
	}

    super.ReplicatedEvent(VarName);
}

simulated function PostBeginPlay()
{
	AddAmmo(GetMaxAmmoCount());

	if( Role == ROLE_Authority )
	{
		// replicate this update.
		UpdateReplicatedCarriedAmmo();
	}
    
    super.PostBeginPlay();
}

simulated function int AddAmmo( int Amount )
{
	m_RemainingAmmoInClip = Clamp(m_RemainingAmmoInClip + Amount,0,GetMaxAmmoCount());
	
    return m_RemainingAmmoInClip;
}

simulated function bool ReplicateAmmoOnWeaponFire()
{
	return m_bForceReplicateAmmoOnFire || FireInterval[0] <= 0.35 && MaxAmmoCount > 10;
}

simulated function ConsumeAmmo_Internal(byte FireModeNum)
{
	// Subtract the Ammo
	AddAmmo(-ShotCost[FireModeNum]);

	if( Role == ROLE_Authority && ReplicateAmmoOnWeaponFire() )
	{
		// replicate this update.
		UpdateReplicatedCarriedAmmo();
	}
}

simulated function ConsumeAmmo(byte FireModeNum)
{
	// On the client we will only subtract ammo if we are instant hit, otherwise just consume ammo normally.
	if (WeaponFireTypes[FireModeNum] != EWFT_InstantHit)
	{
		ConsumeAmmo_Internal(FireModeNum);
	}
}

// Who is firing the weapon?
simulated function Actor GetTraceOwner()
{
	local TrPawn aPawn;

	aPawn = TrPawn(Instigator);
	if (aPawn != none && aPawn.DrivenWeaponPawn.BaseVehicle != none)
		return aPawn.DrivenWeaponPawn.BaseVehicle;

	return (Instigator != None) ? Instigator : self;
}

simulated function AttachWeaponTo( SkeletalMeshComponent MeshCpnt, optional Name SocketName )
{
	local class<TrFamilyInfo> FamilyInfo;
	local TrPawn TrP;

	FamilyInfo = TrPawn(Instigator).GetCurrCharClassInfo();
	TrP = TrPawn(Instigator);

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( m_ContentData == none )
		{
			// Make sure the mesh data is loaded.
			m_ContentData = LoadMeshData();
		}
	}

    Super.AttachWeaponTo(MeshCpnt, SocketName);

	// Deployables will have no family info, therefore this code branch doesn't need to be hit.
	if (FamilyInfo == none)
		return;

	// Do everything we need to when we update the hands mesh.
	CentralUpdateHandsMesh(FamilyInfo);

	// Since we may have been in 3p mode when the weapon switch occured, make sure we show the hands mesh
	// if we are in 1p mode.
	if( TrP.IsFirstPerson() && m_FirstPersonHandsMesh != none )
	{
		m_FirstPersonHandsMesh.SetHidden(false);
		m_FirstPersonHandsOverlayMesh.SetHidden(false);
	}
}

simulated function CreateFirstPersonHandsMesh()
{
	local int i;
	local MaterialInstanceConstant HandsMeshMIC;

	if( m_FirstPersonHandsMesh == none )
	{
		m_FirstPersonHandsMesh = new(Outer) class'UDKSkeletalMeshComponent';
	}
	if (m_FirstPersonHandsMesh != none)
	{
		m_FirstPersonHandsMesh.SetDepthPriorityGroup(SDPG_Foreground);
		m_FirstPersonHandsMesh.SetOwnerNoSee(true);
		m_FirstPersonHandsMesh.bOverrideAttachmentOwnerVisibility = true;
		m_FirstPersonHandsMesh.CastShadow = Mesh.CastShadow;
		m_FirstPersonHandsMesh.bSelfShadowOnly = true;
		m_FirstPersonHandsMesh.bAllowAmbientOcclusion = false;

		// Reset the MIC.
		for (i = 0; i < m_FirstPersonHandsMesh.GetNumElements(); i++)
		{
			HandsMeshMIC = new(m_FirstPersonHandsMesh) class'MaterialInstanceConstant';
			HandsMeshMIC.SetParent(m_FirstPersonHandsMesh.SkeletalMesh.Materials[i]);
			m_FirstPersonHandsMesh.SetMaterial(i, HandsMeshMIC);
		}
	}
}

simulated function ChangeVisibility(bool bIsVisible)
{
	super.ChangeVisibility(bIsVisible);

	if (OverlayMesh != none)
	{
		OverlayMesh.SetOwnerNoSee(!bIsVisible || (GetHand() == HAND_Hidden));
	}

	if (m_FirstPersonHandsOverlayMesh != none)
	{
		m_FirstPersonHandsOverlayMesh.SetOwnerNoSee(!bIsVisible || (GetHand() == HAND_Hidden));
		m_FirstPersonHandsOverlayMesh.SetHidden(!bIsVisible || (GetHand() == HAND_Hidden));
	}
}

simulated function CentralUpdateHandsMesh(class<TrFamilyinfo> FamilyInfo)
{
	local int i;
    
	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

	// Actually update the hands mesh.
	UpdateHandsMesh(FamilyInfo);

    // Create MICs for the mesh.
    if( Mesh != None )
    {
        for( i = 0; i < Mesh.GetNumElements(); i++ )
        {
            Mesh.CreateAndSetMaterialInstanceConstant(i);
        }
    }

	// Create the overlay mesh.
	CreateOverlayMesh();
}

simulated function UpdateHandsMesh(class<TrFamilyinfo> FamilyInfo)
{
	local UDKSkeletalMeshComponent SkelMesh;
	local int i;
	local TrPawn TrP;
	
	SkelMesh = UDKSkeletalMeshComponent(Mesh);
	TrP = TrPawn(Instigator);

	if( FamilyInfo != none )
	{
		CreateFirstPersonHandsMesh();

		if( TrP != none && WorldInfo.NetMode != NM_DedicatedServer )//&& m_FirstPersonHandsMesh != none && SkelMesh != none && Instigator.IsLocallyControlled() && m_FirstPersonHandsMesh.SkeletalMesh != TrP.GetHandsMesh(FamilyInfo) )
		{
			m_FirstPersonHandsMesh.SetSkeletalMesh(TrP.GetHandsMesh(FamilyInfo));
			for( i = 0; i < m_FirstPersonHandsMesh.GetNumElements(); i++ )
			{
				m_FirstPersonHandsMesh.SetMaterial(i,m_FirstPersonHandsMesh.SkeletalMesh.Materials[i]);
			}

			m_FirstPersonHandsMesh.SetPhysicsAsset(SkelMesh.PhysicsAsset);
			m_FirstPersonHandsMesh.SetFOV(SkelMesh.FOV);
			AttachHandsMesh(); // Attach native, https://udn.epicgames.com/lists/showpost.php?list=unprog3&id=27569&lessthan=&show=20
			m_FirstPersonHandsMesh.CastShadow = SkelMesh.CastShadow;
			m_FirstPersonHandsMesh.bSelfShadowOnly = true;
			m_FirstPersonHandsMesh.SetShadowParent(SkelMesh);
			m_FirstPersonHandsMesh.SetLightEnvironment(TrP.LightEnvironment);
		}
	}
}

simulated function CreateOverlayMesh()
{
	local SkeletalMeshComponent SKM_Source, SKM_Target;
	local StaticMeshComponent STM;
	local UTPawn P;
	local PlayerController PC;

	if ( WorldInfo.NetMode != NM_Client )
	{
		P = UTPawn(Instigator);
		PC = PlayerController(P.Controller);
		if ( (P == None) || (PC == None) || (LocalPlayer(PC.Player) == None) )
		{
			return;
		}
	}

	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

	if (Mesh != None)
	{
		if (OverlayMesh == None)
		{
			OverlayMesh = new(outer) Mesh.Class;
		}

		if (OverlayMesh != None)
		{
			OverlayMesh.SetScale(1.00);
			OverlayMesh.SetOwnerNoSee(Mesh.bOwnerNoSee);
			OverlayMesh.SetOnlyOwnerSee(true);
			OverlayMesh.SetDepthPriorityGroup(SDPG_Foreground);
			OverlayMesh.CastShadow = false;

			SKM_Target = SkeletalMeshComponent(OverlayMesh);
			if ( SKM_Target != none )
			{
				SKM_Source = SkeletalMeshComponent(Mesh);

				SKM_Target.SetSkeletalMesh(SKM_Source.SkeletalMesh);
				SKM_Target.AnimSets = SKM_Source.AnimSets;
				SKM_Target.SetParentAnimComponent(SKM_Source);
				SKM_Target.bUpdateSkelWhenNotRendered = false;
				SKM_Target.bIgnoreControllersWhenNotRendered = true;

				if (UDKSkeletalMeshComponent(SKM_Target) != none)
				{
					UDKSkeletalMeshComponent(SKM_Target).SetFOV(UDKSkeletalMeshComponent(SKM_Source).FOV);
				}
			}
			else if ( StaticMeshComponent(OverlayMesh) != none )
			{
				STM = StaticMeshComponent(OverlayMesh);
				STM.SetStaticMesh(StaticMeshComponent(Mesh).StaticMesh);
				STM.SetScale3D(Mesh.Scale3D);
				STM.SetTranslation(Mesh.Translation);
				STM.SetRotation(Mesh.Rotation);
			}
			OverlayMesh.SetHidden(Mesh.HiddenGame);
		}
		else
		{
			;
		}
	}

	if( m_FirstPersonHandsMesh != None )
	{
		if (m_FirstPersonHandsOverlayMesh == none)
		{
			m_FirstPersonHandsOverlayMesh = new(Outer) m_FirstPersonHandsMesh.Class;
		}

		if (m_FirstPersonHandsOverlayMesh != None)
		{
			m_FirstPersonHandsOverlayMesh.SetScale(1.00);
			m_FirstPersonHandsOverlayMesh.SetOwnerNoSee(m_FirstPersonHandsMesh.bOwnerNoSee);
			m_FirstPersonHandsOverlayMesh.SetOnlyOwnerSee(true);
			m_FirstPersonHandsOverlayMesh.SetDepthPriorityGroup(SDPG_Foreground);
			m_FirstPersonHandsOverlayMesh.CastShadow = false;

			SKM_Source = SkeletalMeshComponent(Mesh);
			m_FirstPersonHandsOverlayMesh.SetSkeletalMesh(m_FirstPersonHandsMesh.SkeletalMesh);
			m_FirstPersonHandsOverlayMesh.AnimSets = SKM_Source.AnimSets;
			m_FirstPersonHandsOverlayMesh.SetParentAnimComponent(SKM_Source);
			m_FirstPersonHandsOverlayMesh.bUpdateSkelWhenNotRendered = false;
			m_FirstPersonHandsOverlayMesh.bIgnoreControllersWhenNotRendered = true;
			m_FirstPersonHandsOverlayMesh.SetFOV(m_FirstPersonHandsMesh.FOV);
			m_FirstPersonHandsOverlayMesh.SetHidden(m_FirstPersonHandsMesh.HiddenGame);
		}
		else
		{
			;
		}
	}
}

simulated event PostInitAnimTree(SkeletalMeshComponent SkelComp)
{
    if( SkelComp == Mesh )
    {
        // Cache device anim node.
        m_DeviceAnimNode = TrAnimNodeBlendByDeviceAnim(SkelComp.FindAnimNode('DeviceBlendNode'));

		if( Instigator != none && Instigator.IsLocallyControlled() )
		{
			ClearMeshAnimSeqNodes();
			CacheMeshAnimSeqNodes();
		}
    }
}

/**
 * Show the weapon begin equipped
 */
simulated function PlayWeaponEquip()
{
	local TrDevice_AutoFire PreviousAutoFireDevice;
	local TrPawn TrP;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float WeaponSwitchBuff;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				// Weapon switch skill/perk.
				WeaponSwitchBuff = VM.m_fWeaponSwitchPctBuff;
			}
		}
	}

	//`log("*********PreviousWeapon"@TrInventoryManager(InvManager).PreviousWeapon);
	if (InvManager != none)
	{
		PreviousAutoFireDevice = TrDevice_AutoFire(TrInventoryManager(InvManager).PreviousWeapon);
	}

    if( m_DeviceAnimNode != None )
    {
		if( r_bIsReloading )
		{
			// If we are switching to this weapon and it is already in the midst of a reload, play the reload anim instead.
			PlayReloadAnim();
		}
		else
		{
			if( PreviousAutoFireDevice != none )
			{
				// Play a quick retrieve if we just switched from an autofire device.
				m_DeviceAnimNode.PlayQuickRetrieve();
			}
			else
			{
				OnPlayRetrieveAnim();
				m_DeviceAnimNode.PlayRetrieve(GetEquipTime(),WeaponSwitchBuff);
			}
		}
    }

	UpdateLowAmmoWarning();
}

/** Called when the retrieve animation is called (not quick retrieve!) */
simulated function OnPlayRetrieveAnim();

/**
 * Show the weapon being put away
 */
simulated function PlayWeaponPutDown()
{
	local TrPawn TrP;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float WeaponSwitchBuff;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				// Weapon switch skill/perk.
				WeaponSwitchBuff = VM.m_fWeaponSwitchPctBuff;
			}
		}
	}

    if( m_DeviceAnimNode != None )
    {
        m_DeviceAnimNode.PlayPutaway(GetPutDownTime(),WeaponSwitchBuff);
    }
}

// Override UT version so that we don't switch to best weapon when we run out of rounds in clip.
// This is temp -- should be reworked so that "empty" means no more m_nCarriedAmmo.
simulated function WeaponEmpty()
{
}

// called when this device becomes the active weapon of a pawn
simulated function OnSwitchToWeapon()
{
	ResetAltReticule();
	PayAccuracyForWeaponSwitch();

	// If it has been a while since we've used this weapon, give the player a full clip.
	if( m_fLastActiveTime > 0.0 && WorldInfo.TimeSeconds - m_fLastActiveTime > m_fTimeBeforeInactiveReload )
	{
		PerformInactiveReload();
	}
}

// called when this device is no longer the active weapon of a pawn
simulated function OnSwitchAwayFromWeapon();

reliable client function ClientWeaponSet( bool bOptionalSet, optional bool bDoNotActivate )
{
	local TrPlayerController PC;

	PC = TrPlayerController(Instigator.Controller);
	if (PC != none)
	{
		PC.TrEndZoom();
	}

	super.ClientWeaponSet(bOptionalSet, bDoNotActivate);
}

/**
 * PlayFireEffects Is the root function that handles all of the effects associated with
 * a weapon.  This function creates the 1st person effects.  It should only be called
 * on a locally controlled player.
 */
simulated function PlayFireEffects( byte FireModeNum, optional vector HitLocation )
{
    // Spawn a tracer.
    if( ShouldFireTracer() )
    {
        SpawnTracerEffect( HitLocation, VSize(HitLocation - Instigator.Location) );
    }

	// Spawn a tracer beam.
    if( ShouldFireTracerBeam() )
    {
        SpawnTracerBeam(GetEffectLocation(), HitLocation);
    }
}

simulated function PlayFireAnimation(byte FireModeNum)
{
	// Play fire animation.
    if( m_DeviceAnimNode != None )
    {
        m_DeviceAnimNode.PlayFire(0, GetFireInterval(FireModeNum), GetMaxAmmoCount() == 1 ? m_nCarriedAmmo : GetNumRoundsCurrentlyInClip());
    }
}

/** plays view shake on the owning client only */
simulated function ShakeView()
{
	local TrPlayerController PC;

	super.ShakeView();

	PC = TrPlayerController(Instigator.Controller);
	if( PC != none && LocalPlayer(PC.Player) != none && m_FireCameraShake != none && PC.Pawn != none && PC.Pawn.IsFirstPerson() )
	{
		PC.PlayCameraShake(,,m_FireCameraShake);
	}
}

simulated function bool ShouldFireTracer()
{
    return (m_bSpawnTracers) && (WeaponFireTypes[CurrentFireMode] != EWFT_Projectile) && (GetNumRoundsCurrentlyInClip() % m_nTracerInterval == 0);
}

simulated function bool ShouldFireTracerBeam()
{
	return (m_bSpawnTracerBeams) && (m_TracerBeamTemplate != none) && (WeaponFireTypes[CurrentFireMode] != EWFT_Projectile);
}

simulated function SpawnTracerBeam(vector Start, vector End)
{
	local ParticleSystemComponent E;

	E = WorldInfo.MyEmitterPool.SpawnEmitter(m_TracerBeamTemplate, Start);
	E.SetVectorParameter('TracerEnd', End);
    E.SetDepthPriorityGroup(SDPG_World);
	E.SetTickGroup(TG_PostUpdateWork);
}

simulated function TrProj_Tracer SpawnTracerEffect( vector HitLocation, float HitDistance )
{
    local TrProj_Tracer	SpawnedProjectile;
    local vector SpawnLoc;
    local rotator SpawnRot;

    if( HitDistance > m_fShowTracerDistance )
    {
	    SpawnLoc = GetMuzzleLoc();
	    SpawnedProjectile = GetTracer( SpawnLoc, SpawnRot );

	    if ( (SpawnedProjectile != None) && !SpawnedProjectile.bDeleteMe )
	    {
		    SpawnedProjectile.Instigator = Instigator;

		    // init!
		    SpawnedProjectile.InitTracer(SpawnLoc, HitLocation);
	    }
    }

    return SpawnedProjectile;
}

simulated function TrProj_Tracer GetTracer( vector SpawnLocation, rotator SpawnRotation )
{
	return TrGameReplicationInfo(WorldInfo.GRI).m_TrObjectPool.GetTracer( m_TracerType, 0, SpawnLocation, SpawnRotation );
}

simulated function int GetNumRoundsCurrentlyInClip()
{
	return m_RemainingAmmoInClip;
}

//
//	Override HasAmmo to check power pool-based weapons
//
simulated function bool HasAmmo( byte FireModeNum, optional int Amount )
{
    local TrPawn trp;

	if( FireModeNum != 0 )
	{
		return false;
	}

    if (FireModeNum < m_PowerPoolCost.Length && m_PowerPoolCost[FireModeNum] > 0)
    {
        trp = TrPawn(Instigator);
        
        if (trp != None)
        {
            if (m_PowerPoolCost[FireModeNum] <= trp.m_fCurrentPowerPool)
            {
                return (true);
            }
        }

        return (false);
    }

	if (Amount==0)
		return (m_RemainingAmmoInClip >= ShotCost[FireModeNum]);
	else
		return ( m_RemainingAmmoInClip >= Amount );
}

simulated function bool HasAnyAmmo()
{
	return ( ( m_nCarriedAmmo > 0 ) || (m_RemainingAmmoInClip > 0) );
}

simulated function bool AllowSwitchTo(Weapon NewWeapon)
{
	return true;
}

//
//	Calculate damage falloff 
//
function float CalculateRangeDamageFalloff(float Dist)
{
	local class<TrDmgType_Base> TrDamageType;
	local float	damageRange;
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(Instigator.Controller);

	if (WeaponFireTypes[0]==EWFT_Projectile)
	{
		TrDamageType = class<TrDmgType_Base>(WeaponProjectiles[0].default.MyDamageType);
		damageRange = WeaponProjectiles[0].default.DamageRadius;
	}
	else
	{
		TrDamageType = class<TrDmgType_Base>(InstantHitDamageTypes[0]);
		damageRange = GetWeaponRange();
	}

	if (TrDamageType == none)
		return 0;

	return TrDamageType.static.CalculateRangeDamageFalloff(Dist, damageRange, TrPC, r_eEquipAt);
}

/**
 * Performs an 'Instant Hit' shot.
 * Also, sets up replication for remote clients,
 * and processes all the impacts to deal proper damage and play effects.
 *
 * Network: Local Player and Server
 */
simulated function InstantFire()
{
	local vector StartTrace, EndTrace;
	local Array<ImpactInfo>	ImpactList;
	local ImpactInfo RealImpact, NearImpact;
	local int i, FinalImpactIndex;

	// define range to use for CalcWeaponFire()
	StartTrace = InstantFireStartTrace();
	EndTrace = InstantFireEndTrace(StartTrace);
	bUsingAimingHelp = false;
	// Perform shot
	RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);
	FinalImpactIndex = ImpactList.length - 1;

	if (FinalImpactIndex >= 0 && (ImpactList[FinalImpactIndex].HitActor == None || !ImpactList[FinalImpactIndex].HitActor.bProjTarget))
	{
		// console aiming help
		NearImpact = InstantAimHelp(StartTrace, EndTrace, RealImpact);
		if ( NearImpact.HitActor != None )
		{
			bUsingAimingHelp = true;
			ImpactList[FinalImpactIndex] = NearImpact;
		}
	}

	for (i = 0; i < ImpactList.length; i++)
	{
		ProcessInstantHit(CurrentFireMode, ImpactList[i]);
	}

	if (Role == ROLE_Authority)
	{
		// Set flash location to trigger client side effects.
		// if HitActor == None, then HitLocation represents the end of the trace (maxrange)
		// Remote clients perform another trace to retrieve the remaining Hit Information (HitActor, HitNormal, HitInfo...)
		// Here, The final impact is replicated. More complex bullet physics (bounce, penetration...)
		// would probably have to run a full simulation on remote clients.
		if ( NearImpact.HitActor != None )
		{
			SetFlashLocation(NearImpact.HitLocation);
		}
		else
		{
			SetFlashLocation(RealImpact.HitLocation);
		}
	}
}

simulated function ProcessInstantHit(byte FiringMode, ImpactInfo Impact, optional int NumHits)
{
	local TrPawn TrPawnVictim;
	local bool bHeadShot;

	if( Instigator != None && Instigator.Controller != None )
	{
		if( Instigator.IsLocallyControlled() )
		{
			if (WorldInfo.NetMode == NM_Client && Role < ROLE_Authority)
			{
				// If we locally own the hit actor, ignore it.
				if (Impact.HitActor != None && Impact.HitActor.Role == ROLE_Authority)
				{
					return;
				}

				// Determine if we got a headshot.
				TrPawnVictim = TrPawn(Impact.HitActor);
				if( TrPawnVictim != none )
				{
					bHeadShot = TrPawnVictim.CheckHeadShot(Impact);
				}

				// Notify the server of our hit.
				ServerNotifyHit(FiringMode, Impact, bHeadShot);

				ConsumeAmmo_Internal(FiringMode);
			}
			else if(WorldInfo.NetMode == NM_DedicatedServer )
			{
				// The actor is controlled by the server (such as a deployable or objective).
				ServerNotifyHit(FiringMode, Impact, false);
			}
			Instigator.WeaponFired(self, false, Impact.HitLocation);
		}
	}

	// Do not process the hit on clients.
	// Server will process hit via ServerNotifyHit.
	// Only process if we're standalone.
	if( WorldInfo.NetMode == NM_Standalone || WorldInfo.NetMode == NM_ListenServer  )
	{
		ProcessInstantHit_Internal(FiringMode, Impact, TrPawnVictim != None ? TrPawnVictim.CheckHeadShot(Impact) : false);
	}
}

reliable server function ServerNotifyHit(byte FiringMode, ImpactInfo Impact, bool bHeadShot)
{
	local Box HitBox;
	local vector BoxExtent, BoxCenter;
	local int WhatDoesCPPSay;
	local bool bGearsMethod; // Temp. Essentially the method GoW2 used.


    WhatDoesCPPSay = ValidateClientReportedHit(FiringMode, Impact, bHeadShot,IsFiring());
    if (WhatDoesCPPSay == VALIDATE_HIT_REJECT)
    {   // CPP says no hit - do nothing
        return;
    }
    else if (WhatDoesCPPSay == VALIDATE_HIT_APPROVE)
    {   // CPP says hit - do it
		ProcessInstantHit_Internal(FiringMode, Impact, bHeadShot);
        return;
    }

	bGearsMethod = false;

	if( bGearsMethod )
	{
		// (Check taken from Gears of War 2)
		// if HitActor didn't replicate it, try to get it from the hit component
		// this most commonly happens when hitting StaticMeshCollectionActors, as they are created by the cooker and so don't replicate
		if (Impact.HitActor == None && Impact.HitInfo.HitComponent != None)
		{
			Impact.HitActor = Impact.HitInfo.HitComponent.Owner;
		}

		// validate the shot
		// check that we're actually using this fire mode
		// and we're facing in that general direction
		if ( Role == ROLE_Authority && Instigator != None && Impact.HitActor != None &&
			IsFiring() && CurrentFireMode == FiringMode &&
			vector(Instigator.GetViewRotation()) dot Normal(Impact.HitLocation - Instigator.GetWeaponStartTraceLocation()) > 0.7 ) // ~45 degrees
		{
			// assume it told the truth about static things because the hit doesn't have significant gameplay implications
			if (Impact.HitActor.bStatic)
			{
				ProcessInstantHit_Internal(FiringMode, Impact);
			}
			else
			{
				// and the target is really there
				Impact.HitActor.GetComponentsBoundingBox(HitBox);
				// increase both a bit because the hitlocation is usually on the edge of the cylinder
				// and because we want to give a reasonable leeway to the client's results
				BoxExtent = 0.5 * (HitBox.Max - HitBox.Min);
				BoxExtent *= m_fClientSideHitLeeway;
				BoxCenter = (HitBox.Min + HitBox.Max) * 0.5;
				if ( Abs(Impact.HitLocation.Z - BoxCenter.Z) < BoxExtent.Z &&
					Abs(Impact.HitLocation.X - BoxCenter.X) < BoxExtent.X &&
					Abs(Impact.HitLocation.Y - BoxCenter.Y) < BoxExtent.Y )
				{
					ProcessInstantHit_Internal(FiringMode, Impact, bHeadShot);
				}
			}
		}
	}
	else
	{
		// No method for validation, trust the client.
		ProcessInstantHit_Internal(FiringMode, Impact, bHeadShot);
	}
}

function ProcessInstantHit_Internal(byte FiringMode, ImpactInfo Impact, optional bool bHeadShot)
{
	local TrPawn TrPawnVictim;
	local TrPlayerController TrPC;

	TrPawnVictim = TrPawn(Impact.HitActor);
	TrPC = TrPlayerController(Instigator.Controller);

	InstantHitDamage[FiringMode] = ModifyInstantHitDamage(FiringMode, Impact, default.InstantHitDamage[FiringMode]);

    // If headshot, modify the damage. 
	if (bHeadShot)
	{
		if (TrPawnVictim != none)
		{
			TrPawnVictim.bLastHitWasHeadShot = true;
			InstantHitDamage[FiringMode] *= TrPawnVictim.m_fHeadShotDamageMultiple;
		}

		if (TrPC != none)
			TrPC.r_nHitEnemyHeadshot++;
	}
    else
    {
		if (TrPawnVictim != none)
			TrPawnVictim.bLastHitWasHeadShot = false;
    }

    Super.ProcessInstantHit(FiringMode, Impact);

	if ( Impact.HitActor != None )
	{
        ProcessEffect(Impact.HitActor, FiringMode, ET_HIT);
	}

	// Consume our ammo on the server here.
	if (WeaponFireTypes[FiringMode] == EWFT_InstantHit)
	{
		ConsumeAmmo_Internal(FiringMode);
	}
}

/** Gives the chance for a device to modify the configured hit damage, i.e. via scope */
function float ModifyInstantHitDamage(byte FiringMode, ImpactInfo Impact, float damage)
{
	return damage;
}

simulated function ProcessEffect(Actor Target, byte FiringMode, EffectType efType, optional bool bRemove = false)
{
    local TrPawn pawnTarget;
    local int i;
    local class<TrEffect> efClass;
    local TrEffect ef;

    pawnTarget = TrPawn(Target);

    //TODO: effectclass itself might not be unique to identify which eft to remove, 2 weapons could have hit effect with TrEffect_GroundSpeed
    //So need to compare the detailed EffectInfo
    for (i = 0; i < m_EffectInfo.Length; i++)
    {
        if (m_EffectInfo[i].fireModeNum == FiringMode
            && m_EffectInfo[i].type == efType)
        {
            efClass = m_EffectInfo[i].effectClass;
            if (efClass != None)
            {
                //`log(self@"get effec tinfo"@m_EffectInfo[0].firemodenum@m_EffectInfo[i].type @m_EffectInfo[i].effectClass);
                if (bRemove)
                {
                    //`log(self@"remove effect by class"@efClass@efType);
                    pawnTarget.RemoveEffectByClass(efClass);
                }
                else
                {
                    ef = new(self) (efClass);
                    if (ef != None)
                    {
                        //`log(self@"ProcessEffect"@ef);
                        ef.Apply(Target);
                    }
                }
            }
        }
    }
}

//////////////////////////////////////////////////////////////////////

simulated function bool UsesPower()
{
    return m_PowerPoolCost[CurrentFireMode] > 0;
}

simulated function bool IsDeviceCoolingDown(byte FireModeNum)
{
    return false;
}

simulated event EnterDeployMode()
{
}

simulated event ExitDeployMode()
{
}

simulated function ToggleActivate();

// ################# Spread effects
//
//
//When jumping, take into account for accuracy impact
simulated function PayAccuracyForJump()
{
	local TrPawn P;
	P=TrPawn(Instigator);

	if( P != None )
		P.m_fCurrentAccuracy -= m_fAccuracyLossOnJump;
}

//When we swap weapons, set accuracy to the sprinting accuracy
simulated function PayAccuracyForWeaponSwitch()
{
	local TrPawn P;
	P=TrPawn(Instigator);

	if( P != None )
		P.m_fCurrentAccuracy -= m_fAccuracyLossOnWeaponSwitch;
}

simulated function PayAccuracyForShot()
{
	local TrPawn P;
	P=TrPawn(Instigator);

	if( P != None )
		P.m_fCurrentAccuracy -= m_fAccuracyLossOnShot;
}

/**
 * Adds any fire spread offset to the passed in rotator
 * @param Aim the base aim direction
 * @return the adjusted aim direction
 */
simulated function rotator AddSpreadWithAccuracy(rotator BaseAim, float fAccuracy)
{
	local vector X, Y, Z;
	local float CurrentSpread, Rand, RandY, RandZ;

    CurrentSpread = (1 - fAccuracy) / 2;

	if (CurrentSpread == 0)
	{
		return BaseAim;
	}
	else
	{
        // Add in any spread.
		GetAxes(BaseAim, X, Y, Z);

        CurrentSpread *= FRand();   // random radius in the circle
        Rand = FRand() * 2 * PI;    // random angle
		RandY = cos(Rand);  // generate a based on the angle (y = horizontal axis, z = vertical axis)
		RandZ = sin(Rand);
		return rotator(X + CurrentSpread * (RandY * Y + RandZ * Z) );
	}
}

simulated function Rotator ApplyKickbackToAim( rotator Aim )
{
    local vector2d CurrentKickbackAmount;
    local vector X, Y, Z;

    CurrentKickbackAmount = GetCurrentKickbackAmount() / 65536.f;
    GetAxes(Aim, X, Y, Z);
    return rotator(X + (CurrentKickbackAmount.X * Y + CurrentKickbackAmount.Y * Z) );
}

// The amount of kickback applied to the view is based on the last kickback amount blended out based on the blendout time.
simulated function vector2d GetCurrentKickbackAmount()
{
    local vector2d KickbackAmount;

    if( Owner == None )
    {
        ;
        return vect2d(0.0,0.0);
    }

    if( m_fKickbackBlendOutTime <= 0.f )
    {
        KickbackAmount.X = 0.f;
        KickbackAmount.Y = 0.f;
        return KickbackAmount;
    }

    return m_v2KickbackAmount;
}

// Adds kickback after a shot so that subsequent shots may be jostled.
// Return TRUE if kickback was successful.
simulated function bool AddKickback()
{
    local rotator CurrentAdjustedAim;

    if( Owner == None )
    {
        ;
        return FALSE;
    }

    // Do not add any kickback when looking straight up or straight down.
    CurrentAdjustedAim = GetAdjustedAim(Instigator.GetWeaponStartTraceLocation());
    if( CurrentAdjustedAim.Pitch < -15000 || CurrentAdjustedAim.Pitch > 15000 )
    {
        return FALSE;
    }

    // Set the current amout of kickback based on the blending out of a previous kickback.
    m_v2KickbackAmount = GetCurrentKickbackAmount();

    // Add kickback.
    if( m_bIsKickbackAdditive )
    {
        m_v2KickbackAmount.X += RandRange(m_v2MinMaxKickbackX.X, m_v2MinMaxKickbackX.Y);
        m_v2KickbackAmount.Y += RandRange(m_v2MinMaxKickbackY.X, m_v2MinMaxKickbackY.Y);
    }
    else
    {
        m_v2KickbackAmount.X = RandRange(m_v2MinMaxKickbackX.X, m_v2MinMaxKickbackX.Y);
        m_v2KickbackAmount.Y = RandRange(m_v2MinMaxKickbackY.X, m_v2MinMaxKickbackY.Y);
    }

    // Clamp kickback.
    if( m_fMaxKickbackDistanceX > 0.f )
    {
        m_v2KickbackAmount.X = FClamp(m_v2KickbackAmount.X, -m_fMaxKickbackDistanceX, m_fMaxKickbackDistanceX);
    }
    if( m_fMaxKickbackDistanceY > 0.f )
    {
        m_v2KickbackAmount.Y = FClamp(m_v2KickbackAmount.Y, -m_fMaxKickbackDistanceY, m_fMaxKickbackDistanceY);
    }

    m_fLastKickbackTime = Owner.WorldInfo.TimeSeconds;
    
    return TRUE;
}

simulated function Rotator GetAdjustedAim( vector StartFireLoc )
{
	local rotator R;
    local rotator RS;
    local float acc;

    acc = GetAccuracy();

	R = Instigator.GetAdjustedAimFor( Self, StartFireLoc );

	RS = AddSpreadWithAccuracy(R, acc );

	return RS;
}

simulated function bool ShowWeaponRedLowAmmoIndicator()
{
	// single-shot devices use all carried ammo for low warning
	if (GetMaxAmmoCount()==1)
	{
		return m_nCarriedAmmo <= m_nLowAmmoWarning;
	}
	// clip-based devices use the current clip inventory to decide
	else
	{
		return m_RemainingAmmoInClip <= m_nLowAmmoWarning;
	}
}

//
//	are we running low on ammo for this weapon (so we need to visit inventory stations)
//
simulated function bool NeedToVisitInventoryStation()
{
	// single-shot devices use all carried ammo for low warning
	if (GetMaxAmmoCount()==1)
	{
		return m_nCarriedAmmo <= m_nLowAmmoWarning;
	}
	// warn on three clips-worth for other devices
	else
	{
		return m_nCarriedAmmo <= 3*GetMaxAmmoCount();
	}
}

//
//  for weapons that fire once and reload, return ammo count as the current on-hand inventory (not what is in the clip)
//
simulated function int GetAmmoCount()
{
	if (GetMaxAmmoCount()==1)
	{
		return m_nCarriedAmmo;
	}
	else
	{
		return m_RemainingAmmoInClip;
	}
}

simulated function UpdateLowAmmoWarning()
{
	local int i;
	local MaterialInstanceConstant MIC;

    if (m_nLowAmmoWarning > 0)
    {
		m_bLowAmmoOn = ShowWeaponRedLowAmmoIndicator();

		for( i = 0; i < Mesh.Materials.Length; i++ )
		{
			MIC = MaterialInstanceConstant(Mesh.Materials[i]);
			if( MIC != none )
			{
				MIC.SetScalarParameterValue('Warning_Mode', m_bLowAmmoOn ? 1 : 0);
			}
		}
    }
}

simulated function class<Projectile> GetProjectileClass()
{
	return (CurrentFireMode < WeaponProjectiles.length) ? WeaponProjectiles[CurrentFireMode] : None;
}

simulated function vector GetClientSideProjectileFireStartLoc(optional vector AimDir)
{
	local UTPlayerController PC;
	local vector FireStartLoc, HitLocation, HitNormal, FireDir, FireEnd, ProjBox;
	local Actor HitActor;
	local rotator FireRot;
	local class<Projectile> FiredProjectileClass;
	local int TraceFlags;

	if( Instigator != none )
	{
		PC = UTPlayerController(Instigator.Controller);

		FireRot = Instigator.GetViewRotation();
		FireDir = vector(FireRot);
		if (PC == none || PC.bCenteredWeaponFire || PC.WeaponHand == HAND_Centered || PC.WeaponHand == HAND_Hidden)
		{
			FireStartLoc = Instigator.GetPawnViewLocation() + (FireDir * (FireOffset.X + m_vClientSideFireOffset.X));
		}
		else if (PC.WeaponHand == HAND_Left)
		{
			FireStartLoc = Instigator.GetPawnViewLocation() + (((FireOffset + m_vClientSideFireOffset) * vect(1,-1,1)) >> FireRot);
		}
		else
		{
			FireStartLoc = Instigator.GetPawnViewLocation() + ((FireOffset + m_vClientSideFireOffset) >> FireRot);
		}

		if ( (PC != None) || (CustomTimeDilation < 1.0) )
		{
			FiredProjectileClass = GetProjectileClass();
			if ( FiredProjectileClass != None )
			{
				FireEnd = FireStartLoc + FireDir * ProjectileSpawnOffset;
				TraceFlags = bCollideComplex ? TRACEFLAG_Bullet : 0;
				if ( FiredProjectileClass.default.CylinderComponent.CollisionRadius > 0 )
				{
					FireEnd += FireDir * FiredProjectileClass.default.CylinderComponent.Translation.X;
					ProjBox = FiredProjectileClass.default.CylinderComponent.CollisionRadius * vect(1,1,0);
					ProjBox.Z = FiredProjectileClass.default.CylinderComponent.CollisionHeight;
					HitActor = Trace(HitLocation, HitNormal, FireEnd, Instigator.Location, true, ProjBox,,TraceFlags);
					if ( HitActor == None )
					{
						HitActor = Trace(HitLocation, HitNormal, FireEnd, FireStartLoc, true, ProjBox,,TraceFlags);
					}
					else
					{
						FireStartLoc = Instigator.Location - FireDir*FiredProjectileClass.default.CylinderComponent.Translation.X;
						FireStartLoc.Z = FireStartLoc.Z + FMin(Instigator.EyeHeight, Instigator.CylinderComponent.CollisionHeight - FiredProjectileClass.default.CylinderComponent.CollisionHeight - 1.0);
						return FireStartLoc;
					}
				}
				else
				{
					HitActor = Trace(HitLocation, HitNormal, FireEnd, FireStartLoc, true, vect(0,0,0),,TraceFlags);
				}
				return (HitActor == None) ? FireEnd : HitLocation - 3*FireDir;
			}
		}
		return FireStartLoc;
	}

	return Location;
}

simulated function Projectile ProjectileFire()
{
	local vector		RealStartLoc, TraceStart, HitLocation, HitNormal;
	local TrProjectile	SpawnedProjectile;
	local Class<TrProjectile> ProjectileClass;
	local bool bTether, bSpawnedSimProjectile;
	local TrPlayerController TrPC;

	// tell remote clients that we fired, to trigger effects
	IncrementFlashCount();

	ProjectileClass = class<TrProjectile>(GetProjectileClass());
	if( ProjectileClass != none )
	{
		bTether = ProjectileClass.default.m_bTether;
	}

	if( Instigator != none )
	{
		TrPC = TrPlayerController(Instigator.Controller);
	}

	if( WorldInfo.NetMode != NM_DedicatedServer && ProjectileClass.default.m_bSimulateAutonomousProjectiles && TrPC != none )
	{
		if( TrPC.m_bAllowSimulatedProjectiles || WorldInfo.NetMode == NM_Standalone  )
		{
			// Spawn a tracer projectile on the client to simulate the movement of the 'real' projectile.
			// The 'real' projecile will never replicate to the owning pawn in this case.
			RealStartLoc = GetClientSideProjectileFireStartLoc();
			TraceStart = GetPhysicalFireStartLoc();

			// Ideally we will start the projectile at GetClientSideProjectileFireStartLoc, but
			// if there is something between the start location and the muzzle, spawn at muzzle instead.
			if( Trace(HitLocation, HitNormal, RealStartLoc, TraceStart, true,,,TRACEFLAG_Bullet) != none )
			{
				RealStartLoc = TraceStart;
			}

			SpawnedProjectile = Spawn(class'TrProj_ClientTracer',Instigator,, RealStartLoc);
			SpawnedProjectile.InitProjectile( Vector(GetAdjustedAim( RealStartLoc )), ProjectileClass);
			bSpawnedSimProjectile = true;
		}
	}

	if( Role == ROLE_Authority || bTether )
	{
		// this is the location where the projectile is spawned.
		RealStartLoc = GetPhysicalFireStartLoc();

		// Spawn projectile
		SpawnedProjectile = Spawn(ProjectileClass,Instigator,, RealStartLoc);
		if( SpawnedProjectile != None && !SpawnedProjectile.bDeleteMe )
		{
			SpawnedProjectile.InitProjectile( Vector(GetAdjustedAim( RealStartLoc )) );
			SpawnedProjectile.m_SpawnedEquipPoint = r_eEquipAt;

			// If authoritative and have spawned a simualted projectile, hide the real one.
			if( WorldInfo.NetMode != NM_DedicatedServer && ProjectileClass.default.m_bSimulateAutonomousProjectiles && bSpawnedSimProjectile )
			{
				SpawnedProjectile.SetHidden(true);
			}
		
			if( bTether && Instigator != none )
			{
				// Tether id is weapon id shifted 4 bits plus the flash count.
				SpawnedProjectile.r_nTetherId = (DBWeaponId << 4) + m_nTetherCounter;
				m_nTetherCounter++;
				m_nTetherCounter = m_nTetherCounter % 100.0;
				;

				if( WorldInfo.NetMode == NM_Client && SpawnedProjectile.Role == ROLE_Authority )
				{
					if( TrPC != none )
					{
						// Keep track of this projectile so it can be tethered to a simulated projectile later.
						TrPC.AddProjectileToTetherList(SpawnedProjectile);
						
						// Tick the client's simulated projectile after the tethered.
						SpawnedProjectile.SetTickGroup(TG_PostAsyncWork);
					}
				}
			}
			
			DestroyOldestProjectileOverLimit(SpawnedProjectile);
		}

		// Return it up the line
		return SpawnedProjectile;
	}

	return None;
}

simulated function DestroyOldestProjectileOverLimit(Projectile newProjectile)
{
	local TrProjectile TrProj;
	local Controller ACon;

	// make sure the projectile has a valid controller for assignment of kills
	ACon = Instigator.Controller;
	if (ACon == none && Instigator.IsA('TrTurretPawn'))
	{
		ACon = TrTurretPawn(Instigator).m_OwnerDeployable.m_Controller;
	}

	TrProj = TrProjectile(newProjectile);
	if (TrProj != None)
	{
		TrProj.DestroyOldestOverLimit();
	}
}

simulated function FireAmmunition()
{
    local TrPawn P;
    local TrPlayercontroller PC;
    local vector StartTrace, EndTrace, AimVector;
    local bool bKickedBack;

	if( !ReplicateAmmoOnWeaponFire() )
	{
		r_bReadyToFire = false;
	}

	if( !m_bAllowHoldDownFire )
	{
		m_bWantsToFire = false;
	}
    
    Super.FireAmmunition();

	PlayFireAnimation(0);
	CauseMuzzleFlash();
	ShakeView();

	PayAccuracyForShot();
	UpdateShotsFired();

    // Add kickback for this shot.
    bKickedBack = AddKickback();
    
    P = TrPawn(Instigator);

	if (P!=None)
	{
	    PC = TrPlayerController(P.Controller);

	    // Kickback the camera view.
		if( bKickedBack && PC != None && self == TrPawn(Instigator).Weapon )
		{
			StartTrace = TrPawn(Instigator).GetWeaponStartTraceLocation(Self);
			AimVector = vector(GetAimForCamera(StartTrace));
			EndTrace = StartTrace + AimVector * GetWeaponRange();
			PC.OnKickback(rotator(normal(EndTrace - P.GetPawnViewLocation())) - P.GetViewRotation(), m_fKickbackBlendOutTime);
		}
	}
}

/**
 * Returns the Maximum Range for this weapon
 */
simulated function float MaxRange()
{
	local int i;

	if ( CachedMaxRange > 0 )
	{
		return CachedMaxRange;
	}

	// return the range of the fire mode that fires farthest
	if (bInstantHit)
	{
		CachedMaxRange = GetWeaponRange();
	}

	for (i = 0; i < WeaponProjectiles.length; i++)
	{
		if (WeaponProjectiles[i] != None)
		{
			CachedMaxRange = FMax(CachedMaxRange, WeaponProjectiles[i].static.GetRange());
		}
	}
	return CachedMaxRange;
}

simulated function float GetWeaponRange()
{
	return default.WeaponRange;
}

// Camera will try to align to this direction.
simulated function Rotator GetAimForCamera( vector StartFireLoc )
{
    return ApplyKickbackToAim(Instigator.GetAdjustedAimFor( Self, StartFireLoc ));
}

// ###### END SPREAD/ACCURACY

// ###### STATES

simulated function bool CanClientRequestReloadNow()
{
	if( Role < ROLE_Authority )
	{
		if( MaxAmmoCount == 1 )
		{
			// Don't allow manual reloads of single shot weapons.
			return false;
		}
	}

	return (GetNumRoundsCurrentlyInClip() < GetMaxAmmoCount()) && (m_nCarriedAmmo > 0) && m_bAllowReloads;
}

simulated function HolderEnteredVehicle()
{
	m_bWantsToFire = false;
	ClearPendingFire(CurrentFireMode);
	GotoState('Active');
}

simulated state WeaponFiring
{
	/**
	 * Timer event, call is set up in Weapon::TimeWeaponFiring().
	 * The weapon is given a chance to evaluate if another shot should be fired.
	 * This event defines the weapon's rate of fire.
	 */
	simulated function RefireCheckTimer()
	{
		local float Interval;

		// if switching to another weapon, abort firing and put down right away
		if( bWeaponPutDown )
		{
			;
			PutDownWeapon();
			return;
		}

		if( ShouldRefire() )
		{
			;
			// Handle changing the fire interval if it is the last shot in a round.
			ClearTimer(nameof(RefireCheckTimer));
			FireAmmunition();
			Interval = (m_RemainingAmmoInClip == 0 && m_fFireIntervalForLastShotInClip >= 0.0) ? m_fFireIntervalForLastShotInClip : GetFireInterval(0); 
			SetTimer(Interval, true, nameof(RefireCheckTimer));
			return;
		}

		// Otherwise we're done firing
		HandleFinishedFiring();
	}

    simulated function BeginState(name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);
        ProcessEffect(Instigator, CurrentFireMode, ET_FIRE);
	}

    simulated function EndState(name NextStateName)
	{
		EndFire(0);
		Super.EndState(NextStateName);
        ProcessEffect(Instigator, CurrentFireMode, ET_FIRE, true);
	}

    simulated function bool CanFireOffhandNow()
    {
        return TRUE;
    }

	simulated function bool CanAutoDeviceFireNow()
	{
		return true;
	}

	simulated function bool CanViewZoom()
	{
		return true;
	}
}

simulated state WeaponAbortEquip
{
	simulated function BeginState(name PrevStateName)
	{
		m_bWantsToFire = false;
		super.BeginState(PrevStateName);
	}

	simulated function StartFire(byte FireModeNum)
	{
		// Only fire while equipping if the client has been mismatched and the server needs to fire to prevent a dry fire.
		if( Role == ROLE_Authority )
		{
			;
			Global.StartFire(FireModeNum);
		}
	}

	simulated function bool CanClientRequestReloadNow()
	{
		return false;
	}
}

simulated state WeaponEquipping
{
	simulated function bool CanAutoDeviceFireNow()
	{
		return true;
	}

	simulated function bool CanViewZoom()
	{
		return true;
	}

	simulated function StartFire(byte FireModeNum)
	{
		m_bWantsToFire = true;

		// Only fire while equipping if the client has been mismatched and the server needs to fire to prevent a dry fire.
		if( Role == ROLE_Authority )
		{
			;
			Global.StartFire(FireModeNum);
		}
	}

	simulated function BeginFire(Byte FireModeNum)
	{
		// Only fire while equipping if the client has been mismatched and the server needs to fire to prevent a dry fire.
		if( Role == ROLE_Authority )
		{
			//`warn("BeginFire on WeaponEquipping.");
			GotoState('Active');
			BeginFire(FireModeNum);
		}
	}

	simulated function OnClientReloaded()
	{
		//`log(self@"OnClientReloaded State:"@GetStateName());
		//`loginv(`location@"STATE:"@GetStateName());
		//GotoState('DeviceReloading');
		PlayReloadAnim();
	}
}

//############# AMMO_RELOAD
//
//	override the active state of Weapon so we can implement reloading...
//
simulated static function float GetReloadTime(PlayerReplicationInfo PRI, TR_EQUIP_POINT EquipPoint)
{
	local float RateMultiplier;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	RateMultiplier = 1.0;

	// Apply the faster reload perk if necessary, and only on clip-based weapons.
	if( default.MaxAmmoCount > 1 )
	{
		TrPRI = TrPlayerReplicationInfo(PRI);
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				if( EquipPoint == EQP_Primary )
				{
					RateMultiplier -= VM.m_fPrimaryWeaponReloadBuffPct;
				}
				else if( EquipPoint == EQP_Secondary )
				{
					RateMultiplier -= VM.m_fSecondaryWeaponReloadBuffPct;
				}
			}
		}
	}

	return default.m_fReloadTime * RateMultiplier;
}

simulated state Active
{
	simulated function OnClientReloaded()
	{
		//`log(self@"OnClientReloaded State:"@GetStateName());
		//`loginv(`location@"STATE:"@GetStateName());
		//GotoState('DeviceReloading');
		PlayReloadAnim();
	}

	/** Can this weapon be sent to the firing state? */
	simulated function bool CanBeginFireNow(byte FireModeNum)
	{
		local TrPlayerController TrPC;

		if( !m_bAllowFireWhileZoomed )
		{
			TrPC = TrPlayerController(Instigator.Controller);
			if( TrPC != none && TrPC.c_bPressingZoomButton )
			{
				return false;
			}
		}
		return r_bReadyToFire;
	}

	simulated function bool CanViewZoom()
	{
		return true;
	}

	simulated function BeginFire(byte FireModeNum)
	{
		local TrPlayerController PC;

		if (Instigator != none)
			PC = TrPlayerController(Instigator.Controller);

		;
		if( !HasAnyAmmo() )
		{
			if( WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.NetMode == NM_Standalone )
			{
				WeaponPlaySound(m_DryFireSoundCue);
			}

			// Play dryfire animation (the sound should be embedded into the anim sequence).
			if( m_DeviceAnimNode != None )
			{
				m_DeviceAnimNode.PlayDryFire();
			}

			if( PC != none && PC.m_HelpTextManager != none )
			{
				PC.m_HelpTextManager.RequestHelpText(HelpText_OutOfAmmoNotifier);
				PC.m_HelpTextManager.RemoveHelpText(HelpText_OutOfAmmoNotifier, 4.0);
			}
			return;
		}

		/*
		if( !bDeleteMe && Instigator != None )
		{
			if( PC != none && !HasAmmo(FireModeNum) )
			{
				//`log("Doing Crazy reload!"@GetStateName());
				PC.ReloadWeapon();
			}
		}
		*/
		
		super.BeginFire(FireModeNum);
	}

    simulated function bool DoAutoReload()
    {
		if(m_bPendingReload || (m_RemainingAmmoInClip==0) && (m_nCarriedAmmo > 0) && (ShotCost[0] > 0) )
	    {
		    return true;
	    }
		
		return false;
    }
    
	simulated event BeginState(name PreviousStateName)
	{
		local TrPlayerController PC;
		local SkeletalMeshComponent SkelMesh;
		local int idx;

		if (Instigator != none)
		{
			PC = TrPlayerController(Instigator.Controller);
		}

		// Add/Remove no-ammo animset.
		SkelMesh = SkeletalMeshComponent(Mesh);
		if( SkelMesh != none && m_NoAmmoAnimSet != none )
		{
			idx = SkelMesh.AnimSets.Find(m_NoAmmoAnimSet);
			if( HasAnyAmmo() )
			{		
				if( idx != INDEX_NONE )
				{
					SkelMesh.AnimSets.Remove(idx,1);
					SkelMesh.UpdateAnimations();
				}
			}
			else
			{
				if( idx == INDEX_NONE )
				{
					SkelMesh.AnimSets.AddItem(m_NoAmmoAnimSet);
					SkelMesh.UpdateAnimations();
				}
			}
		}

		// Suppress anim notifies from the device mesh if in 3p mode.
		if( PC != none )
		{
			if( Instigator.IsLocallyControlled() )
			{
				SuppressAnimNotifies(PC.bBehindView);
			}
		}
	
		if( Role == ROLE_Authority && DoAutoReload() )
		{
			// Request a reload.
			RequestReload();
		}
		else
		{
			// Check to resume zoom.
			if( Instigator != none )
			{
				if (PC != none)
				{
					PC.CheckZoomButton();
				}
			}

			// Open the ability to fire back up.
			EnableWeaponReadyToFire();

			if( (Role < ROLE_Authority || WorldInfo.NetMode == NM_Standalone) && m_bWantsToFire && r_bReadyToFire && PreviousStateName == 'WeaponEquipping' )
			{
				StartFire(0);
			}

			Super.BeginState(PreviousStateName);
		}
	}

    simulated function bool CanFireOffhandNow()
    {
        return TRUE;
    }

	simulated function bool CanAutoDeviceFireNow()
	{
		return true;
	}
}

simulated function ClearMeshAnimSeqNodes()
{
	m_MeshAnimSequenceNodes.Length = 0;
}

simulated function CacheMeshAnimSeqNodes()
{
	local AnimNodeSequence SequenceNode;
	local SkeletalMeshComponent SkelMesh;

	SkelMesh = SkeletalMeshComponent(Mesh);
	if( SkelMesh != none )
	{
		foreach SkelMesh.AllAnimNodes(class'AnimNodeSequence', SequenceNode)
		{
			m_MeshAnimSequenceNodes.AddItem(SequenceNode);
		}
	}
}

simulated function SuppressAnimNotifies(bool bSuppress)
{
	local int i;

	for( i = 0; i < m_MeshAnimSequenceNodes.Length; i++ )
	{
		m_MeshAnimSequenceNodes[i].m_bSuppressNotifies = bSuppress;
	}
}

simulated function bool IsReloading()
{
    return false;
}

function RequestReload()
{
    if( Role == ROLE_Authority )
    {
		m_bPendingReload = true;
        if( (GetNumRoundsCurrentlyInClip() < GetMaxAmmoCount()) && (m_nCarriedAmmo > 0) && m_bAllowReloads )
        {
            GotoState('DeviceReloading');
        }
    }
}

simulated function OnClientReloaded()
{
	;
    //GotoState('DeviceReloading');
	PlayReloadAnim();
}

function PerformInactiveReload()
{
	local int ammoLoaded;

    if( m_bAllowReloads && Role==ROLE_Authority )
    {
        ammoLoaded = CalcAmountToLoad();
        if (ammoLoaded!=0)
        {
		    // decrement inventory
		    m_nCarriedAmmo -= ammoLoaded;

			// increment magazine content
		    AddAmmo(ammoLoaded);

			if( Role == ROLE_Authority )
			{
				// replicate this update.
				UpdateReplicatedCarriedAmmo();
			}

			// Open the ability to fire back up.
			EnableWeaponReadyToFire();
        }
    }
}

function int CalcAmountToLoad()
{
    local int AmmoToLoad;

	;

    // Assume will deplete all inventory
    AmmoToLoad = m_nCarriedAmmo;
    
    // Don't load more than will fit in the magazine
    if (AmmoToLoad + m_RemainingAmmoInClip > GetMaxAmmoCount())
    {
        AmmoToLoad = GetMaxAmmoCount() - m_RemainingAmmoInClip;
    }
    
    // If we reload in singles, just load one
    if (m_bReloadSingles && AmmoToLoad > 1)
    {
		AmmoToLoad = 1;
    }

    return AmmoToLoad;
}

/*
 * Reload logic overview:
 * 
 * Reloads occur from either a manual request from the player or an "auto reload" when the weapon
 * is ready for use and has available ammo in a clip but not currently loaded.
 * 
 * 1.   Client requests a reload by calling TrPlayerController::ReloadWeapon().
 * 
 * 2.   If the client is in a proper state for reloading, e.g. not in the middle of an existing reload,
 *      call TrPlayerController::ServerReloadWeapon().
 *      
 * 3.   RequestReload is called on the server which sends the device into DeviceReloading state. If the server
 *      is in a state in which a reload is invalid (but the client was not since it requested the server to reload)
 *      then set m_bPendingReload on the server so that the weapon will reload when it returns to a valid reloading state.
 *      
 * 4.   Server enters DeviceReloading. BeginAReload() called on server which tells the client that a reload is now happening by
 *      incrementing r_nFlashReload. Client is notified of r_nFlashReload and also goes into DeviceReloading state and
 *      BeginAReload is called on the client.
 * 
 * 5.   A timer is ran on both client and server for the reload time. After the timer expires, the device returns to 
 *      Active state.
 */

simulated state DeviceReloading
{
	ignores PlayWeaponEquip;

	simulated function BeginState(name PreviousStateName)
	{
		local TrPlayerController PC;

		;

		r_bReadyToFire = false;

		if( m_bEndZoomOnReload && Instigator != None )
		{
			PC = TrPlayerController(Instigator.Controller);
			if( PC != None )
			{
				PC.TrEndZoom();
			}
		}

		m_bReloadBulletInChamber = GetNumRoundsCurrentlyInClip() > 0;

		BeginAReload(); 
		m_bPendingReload = false;
	}  
	
	simulated function EndState(name NextStateName)
	{
		;

		ClearTimer('Reload');
        ClearTimer('ClientFinishedReload');
        ClearTimer('OnReloadComplete');

		m_bPendingReload = false;

		if( Role == ROLE_Authority )
		{
	        EnableWeaponReadyToFire();
			r_bIsReloading = false;
			bNetDirty = true;
			ResumeZoomOnReloadEnd();
		}
	}

	simulated function bool CanClientRequestReloadNow()
	{
		return false;
	}

	function RequestReload()
	{
		// Don't allow for a reload to be requested if the client is still reloading.
		// But if a server is asked to reload by the client, set another pending reload.
		if( WorldInfo.NetMode == NM_DedicatedServer )
		{
			m_bPendingReload = true;
		}
	}

    simulated function BeginAReload()
    {
		local float ReloadTime;
        local float TimeBeforeReload;

		;

		ReloadTime = GetReloadTime(Instigator.PlayerReplicationInfo, r_eEquipAt);

        if( Role == ROLE_Authority )
        {
            ;
            if( CalcAmountToLoad() > 0 )
            {
                // Tell clients to play a reload anim.
				if( r_eEquipAt == EQP_Primary )
				{
					TrPlayerPawn(Instigator).r_nFlashReloadPrimaryWeapon++;
				}
				else if( r_eEquipAt == EQP_Secondary )
				{
					TrPlayerPawn(Instigator).r_nFlashReloadSecondaryWeapon++;
				}
                
                // Play reload anim locally too.
                PlayReloadAnim();

                TimeBeforeReload = ReloadTime * m_fPctTimeBeforeReload;
                if( TimeBeforeReload > 0.f )
                {
                    SetTimer(TimeBeforeReload, false, 'Reload');
                }
                else
                {
                    Reload();
                }

				// Authority is reloading, so don't let clients even attempt to fire if the server
				// isn't ready. Or else the client can become out of sync and 'dry fire'
				r_bIsReloading = true;
				bNetDirty = true;
            }
			else
			{
				;
			}
        }
        else
        {
            // We've authoritatively been told to reload, so skip conditionals for ammo, etc.
            PlayReloadAnim();
            if( ReloadTime > 0.f )
            {
                SetTimer(ReloadTime, false, 'ClientFinishedReload');
            }
            else
            {
                ClientFinishedReload();
            }
        }
    }

	simulated function bool CanAutoDeviceFireNow()
	{
		return true;
	}

    /** If told to reload again when still reloading, begin the reload sequence again. */
    simulated function OnClientReloaded()
    {
		;

        //BeginAReload();
		PlayReloadAnim();
    }   

    function Reload()
    {
        local int ammoLoaded;
        local float TimeAfterReload, ReloadTime;

		ReloadTime = GetReloadTime(Instigator.PlayerReplicationInfo, r_eEquipAt);

		;

        if (Role==ROLE_Authority)
        {
            ammoLoaded = CalcAmountToLoad();
	        if (ammoLoaded!=0)
	        {
			    // decrement inventory
			    m_nCarriedAmmo -= ammoLoaded;

				// increment magazine content
			    AddAmmo(ammoLoaded);

				if( Role == ROLE_Authority )
				{
					// replicate this update.
					UpdateReplicatedCarriedAmmo();
				}
            }
            
            // Reload is done, see what to do next.
            TimeAfterReload = ReloadTime * (1.f - m_fPctTimeBeforeReload);
            if( TimeAfterReload > 0.f )
            {
                SetTimer(TimeAfterReload, false, 'OnReloadComplete');
            }
            else
            {
                OnReloadComplete();
            }
        }
    }

    simulated function bool IsReloading()
    {
        return true;
    }

	simulated function bool CanViewZoom()
	{
		return !m_bEndZoomOnReload;
	}
}

/** Client has finished a reload. */
simulated function ClientFinishedReload();

simulated function ResumeZoomOnReloadEnd()
{
	local TrPlayerController PC;

	if (WorldInfo.NetMode != NM_DedicatedServer && m_bEndZoomOnReload && m_bResumeZoomOnReloadEnd)
	{
		PC = TrPlayerController(Instigator.Controller);
		if( PC != none )
		{
			PC.CheckZoomButton();
		}
	}
}

simulated function PlayReloadAnim()
{
	local float ReloadTime;

	;

	ReloadTime = GetReloadTime(Instigator.PlayerReplicationInfo, r_eEquipAt);

	// Try playing on the 1p first. If there is no anim node then try on 3p.
    if( m_DeviceAnimNode != None )
    {
        m_DeviceAnimNode.PlayReload(ReloadTime, GetMaxAmmoCount() == 1 ? m_nCarriedAmmo : GetNumRoundsCurrentlyInClip());
    }

	SetTimer(ReloadTime, false, 'ClientFinishedReload');

	if( TrPlayerPawn(Instigator) != none && TrDeviceAttachment(TrPlayerPawn(Instigator).CurrentWeaponAttachment) != None)
	{
		TrDeviceAttachment(TrPlayerPawn(Instigator).CurrentWeaponAttachment).PlayReload();
	}
}

/** Authority only! Open the ability to fire back up. */
singular function EnableWeaponReadyToFire()
{
	if( ROLE == ROLE_Authority )
	{
		if( m_RemainingAmmoInClip > 0 )
		{
			r_bReadyToFire = true;
		}
		
		if( WorldInfo.NetMode == NM_Standalone )
		{
			// Simulate a replicated event on standalone environments.
			ReplicatedEvent('r_bReadyToFire');
		}
	}
}

/** Authority has completed a reload. */
function OnReloadComplete()
{
	// Open the ability to fire back up.
	EnableWeaponReadyToFire();

	// Reload is complete.
	if( GetNumRoundsCurrentlyInClip() >= GetMaxAmmoCount() || m_nCarriedAmmo==0 )
	{
		GotoState('Active');
	}
	else
	{
		// We still have rounds to reload (such as a shotgun). Keep on reloading.
		BeginAReload();
	}
}

simulated function BeginAReload();

// ######## END AMMO_RELOAD

function int AddCarriedAmmo(int Amount)
{
	local bool bAutoReload;

	if (m_bAllowReloads)
	{
		bAutoReload = m_nCarriedAmmo == 0;
		m_nCarriedAmmo = Clamp(m_nCarriedAmmo + Amount, 0, m_nMaxCarriedAmmo);

		if( bAutoReload )
		{
			RequestReload();
		}
	}
	else
	{
		m_RemainingAmmoInClip = Clamp(m_nCarriedAmmo + Amount, 0, m_nMaxCarriedAmmo);
	}

    UpdateReplicatedCarriedAmmo();
    return m_nCarriedAmmo;
}

function UpdateReplicatedCarriedAmmo()
{
    if (Role==ROLE_Authority)
    {
        r_AmmoCount.CarriedAmmoCount = m_nCarriedAmmo;
		r_AmmoCount.ClipAmmoCount = m_RemainingAmmoInClip;
        bNetDirty = true;
    }
}

simulated function GoInactiveDueToOffhand()
{
    GotoState('InactiveDueToOffhand');
    //DON'T USE TIMER to automatically resume inhand weapon firing
    //We will resume inhand weapon firing explicitly when offhand fire is done (continuous fire etc)
    //SetTimer(InactiveTime, false);
}

simulated function StopFire(byte FireModeNum)
{
    m_bWantsToFire = FALSE;
    Super.StopFire(FireModeNum);
}

simulated function BeginFire(Byte FireModeNum)
{
	;
    m_bWantsToFire = TRUE;

	// Check a replicated var rather than relying on states because the client could be in active
	// when the server is still in reloading state.
	
    /*if( (Role == ROLE_Authority && (!r_bIsReloading || (m_bCanEarlyAbortReload && r_bIsReloading)))
		|| (Role < ROLE_Authority && r_bReadyToFire) )
*/
	if( r_bReadyToFire )
	{
		Super.BeginFire(FireModeNum);
	}
}

simulated function float GetEquipTime()
{
	local TrPawn TrP;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local TrDevice_AutoFire PreviousAutoFireDevice;
	local float NonQuickRetrieveEquipTime;

	if (InvManager != none)
	{
		PreviousAutoFireDevice = TrDevice_AutoFire(TrInventoryManager(InvManager).PreviousWeapon);
	}

	NonQuickRetrieveEquipTime = EquipTime;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				// Weapon switch skill/perk.
				NonQuickRetrieveEquipTime *= 1.0 - VM.m_fWeaponSwitchPctBuff;
			}
		}
	}

	return PreviousAutoFireDevice != none ? m_fQuickRetrieveEquipTime : NonQuickRetrieveEquipTime;
}

simulated function TimeWeaponPutDown()
{
	local float TimeToPutDown;

	if( Instigator.IsFirstPerson() )
	{
		PlayWeaponPutDown();
	}

	TimeToPutDown = GetPutDownTime();
    ;
	SetTimer( TimeToPutDown>0 ? TimeToPutDown : 0.01, false, nameof(WeaponIsDown) );
}


simulated function float GetPutDownTime()
{
	local TrPawn TrP;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float TimeToPutDown;

	TimeToPutDown = PutDownTime;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				// Weapon switch skill/perk.
				TimeToPutDown *= 1.0 - VM.m_fWeaponSwitchPctBuff;
			}
		}
	}

	return TimeToPutDown;
}

simulated function bool CanFireOffhandNow()
{
    return FALSE;
}

reliable server function ServerOnClientDeniedFire();

simulated state InactiveDueToOffhand
{
ignores Activate;

	simulated function bool CanClientRequestReloadNow()
	{
		return false;
	}

	function RequestReload()
	{
		// Don't allow for a reload to be requested if the client is still reloading.
		// But if a server is asked to reload by the client, set another pending reload.
		if( WorldInfo.NetMode == NM_DedicatedServer && m_bAllowReloads )
		{
			m_bPendingReload = true;
		}
	}

	reliable server function ServerStartFire(byte FireModeNum)
	{
		//Global.ServerStartFire(FireModeNum);

		;

		// We haven't received the activate yet so pass it along
		if( Instigator != None && Instigator.Weapon == Self)
		{
			;
			GotoState('Active');
		}
		else if( InvManager != None && InvManager.PendingWeapon == Self )
		{
			// If our weapon is being put down, then let's just trigger the transition now.
			if( Instigator.Weapon.IsInState('WeaponPuttingDown') )
			{
				;
				Instigator.Weapon.WeaponIsDown();
				GotoState('Active');
				Global.ServerStartFire(FireModeNum);
			}
			else
			{
				;
				InvManager.SetCurrentWeapon(Self);
				InvManager.ServerSetCurrentWeapon(Self);
				if( Instigator.Weapon != Self && InvManager.PendingWeapon == Self && Instigator.Weapon.IsInState('WeaponPuttingDown') )
				{
					Instigator.Weapon.WeaponIsDown();
				}
				GotoState('Active');
				Global.ServerStartFire(FireModeNum);
			}
		}
		else if( Instigator != None )
		{
			// Have the client switch to the current weapon
			;
			InvManager.SetCurrentWeapon(Self);
			InvManager.ServerSetCurrentWeapon(Self);
			if( Instigator.Weapon != Self && InvManager.PendingWeapon == Self && Instigator.Weapon.IsInState('WeaponPuttingDown') )
			{
				Instigator.Weapon.WeaponIsDown();
			}
			GotoState('Active');
			Global.ServerStartFire(FireModeNum);
		}
	}

	reliable server function ServerOnClientDeniedFire()
	{
		;

		// We haven't received the activate yet so pass it along
		if( Instigator != None && Instigator.Weapon == Self)
		{
			;
			GotoState('Active');
		}
		else if( InvManager != None && InvManager.PendingWeapon == Self )
		{
			// If our weapon is being put down, then let's just trigger the transition now.
			if( Instigator.Weapon.IsInState('WeaponPuttingDown') )
			{
				;
				Instigator.Weapon.WeaponIsDown();
			}
			else
			{
				;
				InvManager.SetCurrentWeapon(Self);
				InvManager.ServerSetCurrentWeapon(Self);
				if( Instigator.Weapon != Self && InvManager.PendingWeapon == Self && Instigator.Weapon.IsInState('WeaponPuttingDown') )
				{
					Instigator.Weapon.WeaponIsDown();
				}
			}
		}
		else if( Instigator != None )
		{
			// Have the client switch to the current weapon
			;
			InvManager.SetCurrentWeapon(Self);
			InvManager.ServerSetCurrentWeapon(Self);
			if( Instigator.Weapon != Self && InvManager.PendingWeapon == Self && Instigator.Weapon.IsInState('WeaponPuttingDown') )
			{
				Instigator.Weapon.WeaponIsDown();
			}
		}
	}
}

simulated state Inactive
{
	simulated function bool CanClientRequestReloadNow()
	{
		return false;
	}

	function RequestReload()
	{
		// Don't allow for a reload to be requested if the client is still reloading.
		// But if a server is asked to reload by the client, set another pending reload.
		if( WorldInfo.NetMode == NM_DedicatedServer )
		{
			m_bPendingReload = true;
		}
	}

	simulated event BeginState( Name PreviousStateName )
	{
		m_fLastActiveTime = WorldInfo.TimeSeconds;

		super.BeginState(PreviousStateName);
	}

	reliable server function ServerStartFire(byte FireModeNum)
	{
		//Global.ServerStartFire(FireModeNum);

		;

		// We haven't received the activate yet so pass it along
		if( Instigator != None && Instigator.Weapon == Self)
		{
			;
			GotoState('Active');
		}
		else if( InvManager != None && InvManager.PendingWeapon == Self )
		{
			// If our weapon is being put down, then let's just trigger the transition now.
			if( Instigator.Weapon.IsInState('WeaponPuttingDown') )
			{
				;
				Instigator.Weapon.WeaponIsDown();
				GotoState('Active');
				Global.ServerStartFire(FireModeNum);
			}
			else
			{
				;
				InvManager.SetCurrentWeapon(Self);
				InvManager.ServerSetCurrentWeapon(Self);
				if( Instigator.Weapon != Self && InvManager.PendingWeapon == Self && Instigator.Weapon.IsInState('WeaponPuttingDown') )
				{
					Instigator.Weapon.WeaponIsDown();
				}
				GotoState('Active');
				Global.ServerStartFire(FireModeNum);
			}
		}
		else if( Instigator != None )
		{
			// Have the client switch to the current weapon
			;
			InvManager.SetCurrentWeapon(Self);
			InvManager.ServerSetCurrentWeapon(Self);
			if( Instigator.Weapon != Self && InvManager.PendingWeapon == Self && Instigator.Weapon.IsInState('WeaponPuttingDown') )
			{
				Instigator.Weapon.WeaponIsDown();
			}
			GotoState('Active');
			Global.ServerStartFire(FireModeNum);
		}
	}

	reliable server function ServerOnClientDeniedFire()
	{
		;

		// We haven't received the activate yet so pass it along
		if( Instigator != None && Instigator.Weapon == Self)
		{
			;
			GotoState('Active');
		}
		else if( InvManager != None && InvManager.PendingWeapon == Self )
		{
			// If our weapon is being put down, then let's just trigger the transition now.
			if( Instigator.Weapon.IsInState('WeaponPuttingDown') )
			{
				;
				Instigator.Weapon.WeaponIsDown();
			}
			else
			{
				;
				InvManager.SetCurrentWeapon(Self);
				InvManager.ServerSetCurrentWeapon(Self);
				if( Instigator.Weapon != Self && InvManager.PendingWeapon == Self && Instigator.Weapon.IsInState('WeaponPuttingDown') )
				{
					Instigator.Weapon.WeaponIsDown();
				}
			}
		}
		else if( Instigator != None )
		{
			// Have the client switch to the current weapon
			;
			InvManager.SetCurrentWeapon(Self);
			InvManager.ServerSetCurrentWeapon(Self);
			if( Instigator.Weapon != Self && InvManager.PendingWeapon == Self && Instigator.Weapon.IsInState('WeaponPuttingDown') )
			{
				Instigator.Weapon.WeaponIsDown();
			}
		}
	}
}

simulated function ApplyEquipEffect()
{
    if (!m_bEquipEffectsApplied)
    {
        ProcessEffect(Instigator, 0, ET_Equip);
       
        m_bEquipEffectsApplied = true;
        
    }
}

simulated function RemoveEquipEffect()
{
    if (m_bEquipEffectsApplied)
    {
        ProcessEffect(Instigator, 0, ET_Equip);

        m_bEquipEffectsApplied = false;
    }
}

/**
 * This function aligns the gun model in the world
 */
//$$ML: Added DeltaSeconds
simulated event SetPosition(UDKPawn Holder, float DeltaSeconds)
{
	local vector DrawOffset, ViewOffset, FinalSmallWeaponsOffset, FinalLocation, X, Y, Z;
	local EWeaponHand CurrentHand;
	local rotator NewRotation, FinalRotation, HeadOffsRot;
	local TrPlayerController TrPC;
	local TrHUD TrH;
	local vector2D ViewportSize;
	local bool bIsWideScreen, bRidingInVehicle;
	local vector HeadOffset;
	local TrPawn TrP;

	TrP = TrPawn(Holder);
	if ( !Holder.IsFirstPerson() || TrP == none )
		return;

	foreach LocalPlayerControllers(class'TrPlayerController', TrPC)
	{
		LocalPlayer(TrPC.Player).ViewportClient.GetViewportSize(ViewportSize);
		break;
	}

	if( TrPC != none )
	{
		TrH = TrHUD(TrPC.myHUD);
		if( TrH != none )
		{
			if( TrH.bIsMainMenuOpen )
			{
				if( Mesh != none )
				{
					Mesh.SetOwnerNoSee(true);
				}
			}
			else
			{
				Mesh.SetOwnerNoSee(false);
			}
		}
	}


	// Hide the weapon if hidden
	CurrentHand = GetHand();
	if ( bForceHidden || CurrentHand == HAND_Hidden)
	{
		Mesh.SetHidden(True);
		Holder.ArmsMesh[0].SetHidden(true);
		Holder.ArmsMesh[1].SetHidden(true);
		NewRotation = Holder.GetViewRotation();
		SetLocation(Instigator.GetPawnViewLocation() + (HiddenWeaponsOffset >> NewRotation));
		SetRotation(NewRotation);
		SetBase(Instigator);
		return;
	}

	if(bPendingShow)
	{
		SetHidden(False);
		bPendingShow = FALSE;
	}

	Mesh.SetHidden(False);

	bIsWideScreen = (ViewportSize.Y > 0.f) && (ViewportSize.X/ViewportSize.Y >= 1.6);

	if (TrP.DrivenWeaponPawn.BaseVehicle != none && 
		TrP.DrivenWeaponPawn.BaseVehicle.Seats[TrP.DrivenWeaponPawn.SeatIndex].m_bAttachPawnDirectly)
	{
		bRidingInVehicle = true;
	}

	// Adjust for the current hand
	ViewOffset = PlayerViewOffset;
	FinalSmallWeaponsOffset = SmallWeaponsOffset;

	if( m_bTinyWeaponsEnabled )
	{
		ViewOffset += m_TinyWeaponsOffset;
	}

	switch ( CurrentHand )
	{
		case HAND_Left:
			Mesh.SetScale3D(default.Mesh.Scale3D * vect(1,-1,1));
			Mesh.SetRotation(rot(0,0,0) - default.Mesh.Rotation);
			if (ArmsAnimSet != None)
			{
				Holder.ArmsMesh[0].SetScale3D(Holder.default.ArmsMesh[0].Scale3D * vect(1,-1,1));
				Holder.ArmsMesh[1].SetScale3D(Holder.default.ArmsMesh[1].Scale3D * vect(1,-1,1));
			}
			ViewOffset.Y *= -1.0;
			FinalSmallWeaponsOffset.Y *= -1.0;
			break;

		case HAND_Centered:
			ViewOffset.Y = 0.0;
			FinalSmallWeaponsOffset.Y = 0.0;
			break;

		case HAND_Right:
			Mesh.SetScale3D(default.Mesh.Scale3D);
			Mesh.SetRotation(default.Mesh.Rotation);
			if (ArmsAnimSet != None)
			{
				Holder.ArmsMesh[0].SetScale3D(Holder.default.ArmsMesh[0].Scale3D);
				Holder.ArmsMesh[1].SetScale3D(Holder.default.ArmsMesh[1].Scale3D);
			}
			break;
		default:
			break;
	}

	if ( bIsWideScreen )
	{
		ViewOffset += WideScreenOffsetScaling * FinalSmallWeaponsOffset;
		if ( bSmallWeapons )
		{
			ViewOffset += 0.7 * FinalSmallWeaponsOffset;
		}
	}
	else if ( bSmallWeapons )
	{
		ViewOffset += FinalSmallWeaponsOffset;
	}

	// Calculate the draw offset
	if ( Holder.Controller == None )
	{
		DrawOffset = (ViewOffset >> Holder.GetBaseAimRotation()) + UTPawn(Holder).GetEyeHeight() * vect(0,0,1);
	}
	else
	{
		// We want to extract each rotation axis and offset based on the axes instead of putting everything into controller space
		// like UTWeapon does. Positioning in controller space causes the weapon to not line up with the camera when pitching.
		GetAxes(Holder.Controller.Rotation,X,Y,Z);

		// Bring it up to eye height.
		DrawOffset.Z = TrP.GetEyeHeight();

		// Weapon bob.
		DrawOffset += TrP.WeaponBob(BobDamping, JumpDamping);

		HeadOffsRot = Holder.Rotation;

		// If we are a passenger and we attach directly, use the controller's rotation for the head offset.
		// This fixes the issue with wonky rotation offsets as gravcycle passenger.
		if (bRidingInVehicle)
		{
			HeadOffsRot = Holder.Controller.Rotation;
		}

		// Forward offset (position the 'head' of the pawn forward)
		HeadOffset.X = TrP.m_fPawnViewForwardAmount;
		DrawOffset = DrawOffset + ((HeadOffset + m_vPositionPivotOffset) >> HeadOffsRot);

		// Zoom.
		if( m_bUseMeshZoomOffset && GetZoomedState() != ZST_NotZoomed )
		{
			if( TrPC != none )
			{
				//`log(TrPlayerController(PC).GetFOVAngle()@"    "@TrPlayerController(PC).DesiredFOV);
				ViewOffset += m_vZoomMeshOffset * (1 - ((TrPC.GetFOVAngle() - TrPC.DesiredFOV)/(TrPC.DefaultFOV - TrPC.DesiredFOV)));
			}
		}

		// View offset.
		ViewOffset +=  UTPlayerController(Holder.Controller).ShakeOffset;
		DrawOffset = DrawOffset + (X * ViewOffset.X);
		DrawOffset = DrawOffset + (Y * ViewOffset.Y);
		DrawOffset = DrawOffset + (Z * ViewOffset.Z);
	}

	// Adjust it in the world
	FinalLocation = Holder.Location + DrawOffset;
	SetLocation(FinalLocation);
	SetBase(Holder);

	if (ArmsAnimSet != None)
	{
		Holder.ArmsMesh[0].SetTranslation(DrawOffset);
		Holder.ArmsMesh[1].SetTranslation(DrawOffset);
	}

	NewRotation = (Holder.Controller == None) ? Holder.GetBaseAimRotation() : Holder.Controller.Rotation;

	// Add some rotation leading
	if (Holder.Controller != None)
	{
		FinalRotation.Yaw = LagRot(NewRotation.Yaw & 65535, LastRotation.Yaw & 65535, MaxYawLag, 0, DeltaSeconds);
		FinalRotation.Pitch = LagRot(NewRotation.Pitch & 65535, LastRotation.Pitch & 65535, MaxPitchLag, 1, DeltaSeconds);
		FinalRotation.Roll = NewRotation.Roll;
	}
	else
	{
		FinalRotation = NewRotation;
	}
	LastRotUpdate = WorldInfo.TimeSeconds;
	LastRotation = NewRotation;

	if ( bIsWideScreen )
	{
		FinalRotation += WidescreenRotationOffset;
	}

	// Add current kickback amount to rotation.
    if( TrPC != None )
    {
        FinalRotation += TrPC.m_rCurrentKickbackDirection;
    }

	SetRotation(FinalRotation);
	if (ArmsAnimSet != None)
	{
		Holder.ArmsMesh[0].SetRotation(FinalRotation);
		Holder.ArmsMesh[1].SetRotation(FinalRotation);
	}
}

simulated function int LagRot(int NewValue, int LastValue, float MaxDiff, int Index, float DeltaSeconds)
{
    local float TargetAimOffset, Delta;

    // Call super just to get the rotational difference.
    Super.LagRot(NewValue, LastValue, MaxDiff, Index, DeltaSeconds);
    
    // Update m_v2WeaponLagAimOffset so that the animation tree can blend the amount to lead the weapon as it rotates.
    if( Index == 0 )
    {
        // Yaw
        TargetAimOffset = FClamp((float(OldRotDiff[Index]) / float(m_nMaxWeaponLagYaw)), -1.0, 1.0);
        Delta = abs(TargetAimOffset - m_v2WeaponLagAimOffset.X);
        
        if( Delta > m_v2WeaponLagSmoothingFactor.X || TargetAimOffset == 0.f )
        {
            m_v2WeaponLagAimOffset.X = FInterpTo(m_v2WeaponLagAimOffset.X, TargetAimOffset, DeltaSeconds, m_v2WeaponLagInterpSpeed.X);
        }

    }
    else
    {
        //Pitch
        TargetAimOffset = FClamp((float(OldRotDiff[Index]) / float(m_nMaxWeaponLagPitch)), -1.0, 1.0);
        Delta = abs(TargetAimOffset - m_v2WeaponLagAimOffset.Y);
        
        if( Delta > m_v2WeaponLagSmoothingFactor.Y || TargetAimOffset == 0.f )
        {
            m_v2WeaponLagAimOffset.Y = FInterpTo(m_v2WeaponLagAimOffset.Y, TargetAimOffset, DeltaSeconds, m_v2WeaponLagInterpSpeed.Y);
        }
    }

    // Return value with no lead (the animation will take care of the lead).
    return NewValue;
}

simulated function bool ShouldRefire()
{
	if( r_bIsReloading )
	{
		return false;
	}
	return super.ShouldRefire();
}

simulated function StartFire(byte FireModeNum)
{
	// Make sure the authority isn't doing a reload. 
	// TODO: Should we more gracefully handle cases where the client 
	// is ready to shoot (reload is done) but the server is still finishing a reload?
    //if( FireModeNum == 0 && !m_bIsPassive && (!r_bIsReloading || (m_bCanEarlyAbortReload && r_bIsReloading)) )
	if( r_bReadyToFire )
    {
        // Only fire the device if it is not flagged as passive.
        Super.StartFire(FireModeNum);
    }
	else
	{
		if( Role < ROLE_Authority || WorldInfo.NetMode == NM_Standalone )
		{
			m_bWantsToFire = true;

			// Let the server know that we tried to fire this weapon. This is so that if we are inactive
			// we can at least activate ourselves.
			ServerOnClientDeniedFire();
		}
	}
}

simulated function Activate()
{
    if( !m_bIsPassive )
    {
        // Only activate the device if it is not flagged as passive.
        Super.Activate();
    }
}

/** Anounces that this weapon may not be picked up by Other. */
function AnnounceInvalidPickup(TrPawn Other)
{
    //`log("INVALID PICKUP");
}

function bool DenyPickupQuery(class<Inventory> ItemClass, Actor Pickup)
{
    return FALSE;
}

simulated function PutDownFast()
{
    GotoState('WeaponPuttingDownFast');
}

simulated function ForceEndFire()
{
	m_bWantsToFire = false;
	super.ForceEndFire();
}

simulated state WeaponPuttingDown
{
	simulated function BeginState( Name PreviousStateName )
	{
		super.BeginState(PreviousStateName);

		// Make sure all pending fires are cleared.
		ForceEndFire();
	}

	simulated function StartFire(byte FireModeNum)
	{
		// Only fire while equipping if the client has been mismatched and the server needs to fire to prevent a dry fire.
		if( Role == ROLE_Authority )
		{
			;
			Global.StartFire(FireModeNum);
		}
	}

	simulated function bool CanClientRequestReloadNow()
	{
		return false;
	}
}

simulated state WeaponPuttingDownFast extends WeaponPuttingDown
{
	simulated event BeginState(Name PreviousStateName)
	{
		bWeaponPutDown = TRUE;

		// Make sure all pending fires are cleared.
		ForceEndFire();
        
        WeaponIsDown();
	}

    simulated function WeaponIsDown()
	{
		// This weapon is down, remove it from the mesh
		DetachComponent( Mesh );
		if (OverlayMesh != None)
		{
			DetachComponent(OverlayMesh);
		}

		SetSkin(None);

		SetBase(None);
		SetHidden(True);
		DetachMuzzleFlash();
		Mesh.SetLightEnvironment(None);

		// Put weapon to sleep
		GotoState('Inactive');
	}

	simulated function bool CanClientRequestReloadNow()
	{
		return false;
	}
}

simulated function bool CanAutoDeviceFireNow()
{
    return false;
}

simulated function float CalcHUDAimChargePercent()
{
	return 0.0;
}

simulated function CustomFire()
{
	local int PowerCost, FireMode;
	local TrPawn POwner;

	FireMode = int(GetFireModeNum());

	// Consume powerpool.
    if( FireMode < m_PowerPoolCost.Length )
    {
        PowerCost = m_PowerPoolCost[FireMode];

        if( PowerCost > 0 )
        {
			POwner = TrPawn(Instigator);

            if( POwner != None)
            {
                POwner.ConsumePowerPool(PowerCost);
            }
        }
    }
}

simulated function AttachMuzzleFlash()
{
	super.AttachMuzzleFlash();

	if( MuzzleFlashPSC != none )
	{
		// Because artists want to use bUseLocalSpace on some emitters, make sure the component
		// gets ticked after the transforms (or else the emitter may spawn at an incorrect location).
		MuzzleFlashPSC.SetTickGroup(TG_PostUpdateWork);
	}
}

/** Just like WeaponPlaySound(), only it does not replicate. */
simulated function WeaponPlaySoundLocal(SoundCue Sound, optional float NoiseLoudness)
{
	if( WorldInfo.NetMode != NM_DedicatedServer && Sound != None && Instigator != None && !bSuppressSounds  )
	{
		Instigator.PlaySound(Sound, true);
	}
}

/** Called when the weapon is taken away (thrown away, taken out of inventory, etc.). */
reliable client function ClientWeaponThrown()
{
	local TrPawn POwner;

	super.ClientWeaponThrown();

	POwner = TrPawn(Instigator);
	if( POwner != none )
	{
		// Stop any ambient sound.
		POwner.SetWeaponAmbientSound(None);
	}
}

event UpdateShotsFired(optional bool Reset)
{
	if (Role == ROLE_Authority)
	{
		if (Reset)
			m_ShotsFired = 0;
		else
			m_ShotsFired++;
	}
}

/** Called when zooming starts
 * @param PC - cast of Instigator.Controller for convenience
 */
simulated function StartZoom(UTPlayerController PC)
{
	local TrPlayerController TrPC;
	local vector2D ViewportSize;

	// If we don't offset the mesh while zoomed, hide it.
	if (!m_bUseMeshZoomOffset)
		SetHidden(true);

	TrPC = TrPlayerController(PC);
	if( TrPC != none )
	{
		if( TrPC.m_ZoomedEffect == none && m_nmZoomMaterialEffectName != '' )
		{
			if( TrPC.Player != none )
			{
				TrPC.m_ZoomedEffect = MaterialEffect(LocalPlayer(TrPC.Player).PlayerPostProcess.FindPostProcessEffect(m_nmZoomMaterialEffectName));
			}
		}
	}

	if( TrPC.m_ZoomedEffect != none )
	{
		TrPC.m_ZoomedEffect.Material = m_ZoomOverlayMaterial;

		if( m_ZoomOverlayMaterial != none )
		{
			LocalPlayer(PC.Player).ViewportClient.GetViewportSize(ViewportSize);	
			m_ZoomOverlayMaterial.SetScalarParameterValue('AspectOffset',ViewportSize.X/ViewportSize.Y);
		}

		TrPC.m_ZoomedEffect.bShowInGame = true;
	}
}

/** Called when zooming ends
 * @param PC - cast of Instigator.Controller for convenience
 */
simulated function EndZoom(UTPlayerController PC, optional bool bReturningTo3P)
{
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(PC);

	// Calling this on the server was causing the offhand weapons to become invisible on clients.
	// It may be because bHidden is replicated and was being incorrectly set and sent to client (BZ: 8701)
	if( TrPC != none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( !bReturningTo3P )
		{
			if (m_FirstPersonHandsMesh != none)
			{
				m_FirstPersonHandsMesh.SetHidden(false);
			}
			if (m_FirstPersonHandsOverlayMesh != none)
			{
				m_FirstPersonHandsOverlayMesh.SetHidden(false);
			}
			SetHidden(false);
		}

		if( TrPC.m_ZoomedEffect != none )
		{
			TrPC.m_ZoomedEffect.bShowInGame = false;
		}
	}
}

simulated function bool CanViewZoom()
{
	return false;
}

simulated function SetAltReticule()
{
	local TrHUD TrH;
	local TrPawn TrP;
	local GfxTrHud HudMovie;
	local GFxTrReticules Reticules;

	if (m_nAltReticuleIndex < 0)
		return;

    m_nReticuleIndex = m_nAltReticuleIndex;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrH = TrPawn(Instigator).GetTrHUD();
		if( TrH != none )
		{
			HudMovie = GfxTrHud(TrH.HudMovie);
			if( HudMovie != none )
			{
				Reticules = HudMovie.Reticules;
				if( Reticules != none )
				{
					Reticules.UpdateReticule(Instigator, true);
				}
			}
		}
	}
}

simulated function ResetAltReticule()
{
	local TrHUD TrH;
	local TrPawn TrP;
	local GfxTrHud HudMovie;
	local GFxTrReticules Reticules;

	if (m_nAltReticuleIndex < 0)
		return;

    m_nReticuleIndex = default.m_nReticuleIndex;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrH = TrPawn(Instigator).GetTrHUD();
		if( TrH != none )
		{
			HudMovie = GfxTrHud(TrH.HudMovie);
			if( HudMovie != none )
			{
				Reticules = HudMovie.Reticules;
				if( Reticules != none )
				{
					Reticules.UpdateReticule(Instigator, true);
				}
			}
		}
	}
}

/**
 * CalcWeaponFire: Simulate an instant hit shot.
 * This doesn't deal any damage nor trigger any effect. It just simulates a shot and returns
 * the hit information, to be post-processed later.
 *
 * ImpactList returns a list of ImpactInfo containing all listed impacts during the simulation.
 * CalcWeaponFire however returns one impact (return variable) being the first geometry impact
 * straight, with no direction change. If you were to do refraction, reflection, bullet penetration
 * or something like that, this would return exactly when the crosshair sees:
 * The first 'real geometry' impact, skipping invisible triggers and volumes.
 *
 * @param	StartTrace	world location to start trace from
 * @param	EndTrace	world location to end trace at
 * @param	Extent		extent of trace performed
 * @output	ImpactList	list of all impacts that occured during simulation
 * @return	first 'real geometry' impact that occured.
 *
 * @note if an impact didn't occur, and impact is still returned, with its HitLocation being the EndTrace value.
 */
simulated function ImpactInfo CalcWeaponFire(vector StartTrace, vector EndTrace, optional out array<ImpactInfo> ImpactList, optional vector Extent)
{
	local vector			HitLocation, HitNormal, Dir, ImprovedStartTrace, ImprovedEndTrace;
	local Actor				HitActor;
	local TraceHitInfo		HitInfo;
	local ImpactInfo		CurrentImpact, AccurateImpact;
	local PortalTeleporter	Portal;
	local float				HitDist;
	local bool				bOldBlockActors, bOldCollideActors;
	local float             ShotDist;
	local int               i;
	local Array<ImpactInfo>	ImprovedAccuracyImpactList;

	ShotDist = VSize(EndTrace - StartTrace);

	// Perform trace to retrieve hit info
	HitActor = GetTraceOwner().Trace(HitLocation, HitNormal, EndTrace, StartTrace, true, Extent, HitInfo, TRACEFLAG_Bullet);

	// If we didn't hit anything, then set the HitLocation as being the EndTrace location
	if( HitActor == None )
	{
		HitLocation	= EndTrace;
	}

	// Convert Trace Information to ImpactInfo type.
	CurrentImpact.HitActor		= HitActor;
	CurrentImpact.HitLocation	= HitLocation;
	CurrentImpact.HitNormal		= HitNormal;
	CurrentImpact.RayDir		= Normal(EndTrace-StartTrace);
	CurrentImpact.StartTrace	= StartTrace;
	CurrentImpact.HitInfo		= HitInfo;

	// Add this hit to the ImpactList
	ImpactList.AddItem(CurrentImpact);

	// check to see if we've hit a trigger.
	// In this case, we want to add this actor to the list so we can give it damage, and then continue tracing through.
	if( HitActor != None )
	{
		bOldCollideActors = HitActor.bCollideActors;
		bOldBlockActors = HitActor.bBlockActors;

		if (PassThroughDamage(HitActor))
		{
			// disable collision temporarily for the actor we can pass-through
			HitActor.bProjTarget = false;
			bOldCollideActors = HitActor.bCollideActors;
			bOldBlockActors = HitActor.bBlockActors;
			if (HitActor.IsA('Pawn'))
			{
				// For pawns, we need to disable bCollideActors as well
				HitActor.SetCollision(false, false);

				// recurse another trace
				CalcWeaponFire(HitLocation, EndTrace, ImpactList, Extent);
			}
			else
			{
				if( bOldBlockActors )
				{
					HitActor.SetCollision(bOldCollideActors, false);
				}
				// recurse another trace and override CurrentImpact
				CurrentImpact = CalcWeaponFire(HitLocation, EndTrace, ImpactList, Extent);
			}

			// and reenable collision for the trigger
			HitActor.bProjTarget = true;
			HitActor.SetCollision(bOldCollideActors, bOldBlockActors);
		}
		else
		{
			// if we hit a PortalTeleporter, recurse through
			Portal = PortalTeleporter(HitActor);
			if( Portal != None && Portal.SisterPortal != None )
			{
				Dir = EndTrace - StartTrace;
				HitDist = VSize(HitLocation - StartTrace);
				// calculate new start and end points on the other side of the portal
				StartTrace = Portal.TransformHitLocation(HitLocation);
				EndTrace = StartTrace + Portal.TransformVectorDir(Normal(Dir) * (VSize(Dir) - HitDist));
				//@note: intentionally ignoring return value so our hit of the portal is used for effects
				//@todo: need to figure out how to replicate that there should be effects on the other side as well
				CalcWeaponFire(StartTrace, EndTrace, ImpactList, Extent);
			}
		}
	}

	// For long shots, do an additional test and get a more accurate shot.
	if (ShotDist > 40000)
	{
		// Calculate the direciton of the shot and a closer distance.
		Dir = Normal(EndTrace - StartTrace);

		// If the 'HitLocation' is too close, use the HitActor's location... otherwise use the HitLocation.
		if (HitActor == none || HitActor.IsA('WorldInfo') || VSizeSq(HitLocation - StartTrace) < 256 || VSizeSq(HitActor.Location - StartTrace) < VSizeSq(HitLocation - StartTrace))
		{
			ImprovedStartTrace = StartTrace;
			ImprovedEndTrace = StartTrace + Dir * 10000;
		}
		else
		{
			HitDist = VSize(HitLocation - StartTrace);
			ImprovedStartTrace = StartTrace + Dir * (HitDist - Min(HitDist/2,500));
			ImprovedEndTrace = StartTrace + Dir * HitDist + Dir * Min(HitDist * 0.5f, 1000);
		}

		// Restore the old collision.
		if (HitActor != none)
		{
			HitActor.SetCollision(bOldCollideActors, bOldBlockActors);
		}

		// Calculate the closer shot.
		AccurateImpact = CalcWeaponFire(ImprovedStartTrace, ImprovedEndTrace, ImprovedAccuracyImpactList, Extent);

		// If we hit someone again, use it!
		if (AccurateImpact.HitActor != none)
		{
			CurrentImpact = AccurateImpact;
			CurrentImpact.StartTrace = StartTrace;

			// Update the existing hit record with the improved data.
			for (i = 0; i < ImpactList.Length; i++)
			{
				if (ImpactList[i].HitActor == AccurateImpact.HitActor)
				{
					ImpactList[i] = AccurateImpact;
					ImpactList[i].StartTrace = StartTrace;
				}
			}
		}
	}

	return CurrentImpact;
}

simulated function PlayDryFireZoom()
{
	WeaponPlaySound(m_DryFireSoundCue);
	WeaponPlaySoundLocal( m_DryFireSoundCue );
}

simulated function BuffMaxCarriedAmmo(int Amount)
{
	m_nMaxCarriedAmmo += Amount;
	UpdateReplicatedCarriedAmmo();
}

simulated function float GetMaxAmmoCount()
{
	local TrPawn TrP;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float Count;
	local TR_EQUIP_POINT EquipPoint;

	Count = MaxAmmoCount;

	TrP = TrPawn(Instigator);
	if( TrP != none )
	{
		TrPRI = TrP.GetTribesReplicationInfo();
		if( TrPRI != none )
		{
			EquipPoint = TrPRI.GetEquipPointByWeaponId(DBWeaponId);
			VM = TrPRI.GetCurrentValueModifier();
			if( VM != none )
			{
				if( EquipPoint == EQP_Primary )
				{
					Count += VM.m_nPrimaryWeaponIncreasedClipSizeBuff;
				}
				else if( EquipPoint == EQP_Secondary )
				{
					Count += VM.m_nSecondaryWeaponIncreasedClipSizeBuff;
				}
			}
		}
	}

	return Count;
}

/** Returns the ammount of ammo to base the amount to refill when picking up an ammo nugget. */
simulated function int GetBasePickupAmmoAmount()
{
	return default.m_nCarriedAmmo;
}

reliable server function ServerStartFire(byte FireModeNum)
{
	local PlayerController PC;

	if( Instigator != none && Instigator.Controller != none )
	{
		PC = PlayerController(Instigator.Controller);
		if( PC != none )
		{
			PC.LastActiveTime = WorldInfo.TimeSeconds;
		}
	}
	Super.ServerStartFire(FireModeNum);
}

simulated event UpdateWeaponMICs();

defaultproperties
{
   DBWeaponId=102000
   m_eTargetType(0)=TRDTT_None
   m_eTargetType(1)=TRDTT_None
   m_eAttackType(0)=TRTT_ATTCK_NA
   m_eAttackType(1)=TRTT_ATTCK_NA
   m_PowerPoolCost(0)=0
   m_PowerPoolCost(1)=0
   m_bHighlightEnemies=True
   m_bAllowReloads=True
   r_bReadyToFire=True
   m_bAllowHoldDownFire=True
   m_bCanZoom=True
   m_bEndZoomOnReload=True
   m_bResumeZoomOnReloadEnd=True
   m_bTinyWeaponsEnabled=True
   m_fDefaultAccuracy=1.000000
   m_fAccuracyLossOnJump=0.300000
   m_fAccuracyLossOnWeaponSwitch=0.100000
   m_fAccuracyLossOnShot=0.100000
   m_fAccuracyLossMax=0.300000
   m_fAccuracyCorrectionRate=0.050000
   m_fQuickRetrieveEquipTime=0.330000
   m_nAltReticuleIndex=-1
   m_fReloadTime=1.800000
   m_fPctTimeBeforeReload=0.580000
   m_WeaponDeployables(0)=None
   m_WeaponDeployables(1)=None
   m_nTracerInterval=1
   m_fShowTracerDistance=512.000000
   m_nIconIndex=1
   m_nMaxWeaponLagYaw=483
   m_nMaxWeaponLagPitch=262
   m_v2WeaponLagInterpSpeed=(X=6.000000,Y=4.000000)
   m_v2WeaponLagSmoothingFactor=(X=0.200000,Y=0.200000)
   m_FireCameraShake=CameraShake'TribesGame.Default__TrDevice:FireCameraShake'
   m_vPositionPivotOffset=(X=-0.500000,Y=0.000000,Z=2.000000)
   m_nmZoomMaterialEffectName="ZoomOverlay"
   m_fClientSideHitLeeway=1.400000
   m_fFireIntervalForLastShotInClip=-1.000000
   m_fTimeBeforeInactiveReload=3.000000
   m_MainMenuPaperDollInfo=(Translation=(X=10.000000,Y=5.000000,Z=58.000000),Rotation=(Pitch=4004,Yaw=28000,Roll=0),Scale=1.000000,CharacterLightingContrastFactor=2.000000)
   m_InGamePaperDollInfo=(Translation=(X=120.000000,Y=-50.000000,Z=50.000000),Rotation=(Pitch=4004,Yaw=16384,Roll=0),Scale=2.600000,CharacterLightingContrastFactor=1.500000)
   m_vClientSideFireOffset=(X=180.000000,Y=0.000000,Z=0.000000)
   ShotCost(0)=0
   ShotCost(1)=0
   WeaponFireWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrDevice:ForceFeedbackWaveformShooting1'
   EffectSockets(0)="WSO_Emit_01"
   EffectSockets(1)="WSO_Emit_01"
   InventoryGroup=50
   MuzzleFlashLightClass=Class'TribesGame.TrNeutralMuzzleFlashLight'
   EquipTime=0.850000
   WeaponRange=2000.000000
   Begin Object Class=UDKSkeletalMeshComponent Name=FirstPersonMesh Archetype=UDKSkeletalMeshComponent'UTGame.Default__UTWeapon:FirstPersonMesh'
      bOverrideAttachmentOwnerVisibility=True
      ReplacementPrimitive=None
      DepthPriorityGroup=SDPG_Foreground
      bOnlyOwnerSee=True
      bSelfShadowOnly=True
      bAllowAmbientOcclusion=False
      Name="FirstPersonMesh"
      ObjectArchetype=UDKSkeletalMeshComponent'UTGame.Default__UTWeapon:FirstPersonMesh'
   End Object
   Mesh=FirstPersonMesh
   DroppedPickupClass=Class'TribesGame.TrDroppedPickup'
   Begin Object Class=SkeletalMeshComponent Name=PickupMesh Archetype=SkeletalMeshComponent'UTGame.Default__UTWeapon:PickupMesh'
      bForceRefpose=1
      bUpdateSkelWhenNotRendered=False
      bIgnoreControllersWhenNotRendered=True
      ReplacementPrimitive=None
      MaxDrawDistance=6000.000000
      CachedMaxDrawDistance=6000.000000
      MotionBlurScale=0.000000
      CastShadow=False
      bForceDirectLightMap=True
      bCastDynamicShadow=False
      bAllowAmbientOcclusion=False
      Scale=1.250000
      Name="PickupMesh"
      ObjectArchetype=SkeletalMeshComponent'UTGame.Default__UTWeapon:PickupMesh'
   End Object
   DroppedPickupMesh=PickupMesh
   PickupFactoryMesh=PickupMesh
   TickGroup=TG_PostAsyncWork
   s_bThrottleNetRelevancy=True
   bIgnoreBaseRotation=True
   Name="Default__TrDevice"
   ObjectArchetype=UTWeapon'UTGame.Default__UTWeapon'
}
