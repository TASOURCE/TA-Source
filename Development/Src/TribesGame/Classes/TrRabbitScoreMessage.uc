//	0 - you score flag touch
//	1 - other score flag touch
//	2 - score hold
//	3 - score kill
//	4 - you new lead
//	5 - other new lead
//	6 - you dropped the flag
//	7 - other dropped flag
//  8 - Kill the rabbit
//  9 - Get to the flag
//  10 - Flag returned to stand
class TrRabbitScoreMessage extends UTLocalMessage;



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
#linenumber 14;

var localized string YouScoreFlagTouch;
var localized string OtherScoreFlagTouch;
var localized string YouAreNewLeader;
var localized string OtherIsNewLeader;
var localized string YouDroppedFlag;
var localized string OtherDroppedFlag;
var localized string KillTheRabbit;
var localized string GetToTheFlag;

var SoundCue m_sYouAreNewLeadeCue;
var SoundCue m_sOtherIsNewLeadeCue;
var SoundCue m_sYouPickedUpFlag;
var SoundCue m_sFlagReturnedToStand;

//
//
static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local string playerName;

	playerName="";
	if (RelatedPRI_1!=None)
	{
		playerName = RelatedPRI_1.PlayerName;
	}

	switch (Switch)
	{
		case 0: return Default.YouScoreFlagTouch;
		case 1: return playerName$Default.OtherScoreFlagTouch;

		case 4: return Default.YouAreNewLeader;
		case 5:	return playerName$Default.OtherIsNewLeader;

		case 6: return Default.YouDroppedFlag;
		case 7:	return playerName$Default.OtherDroppedFlag;

		case 8: return Default.KillTheRabbit;
		case 9: return Default.GetToTheFlag;
	}
	return "";
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local bool bLocalPlayer;
	local int clientReceiveSwitch;

	bLocalPlayer = (P.PlayerReplicationInfo==RelatedPRI_1);
	clientReceiveSwitch = Switch;

	switch( Switch )
    {
        case 0:
		    if (bLocalPlayer) 
			{
				P.PlaySound(default.m_sYouPickedUpFlag, true);
				TrPlayerController(P).TrClientMusicEvent(16);
			}
			else
			{
				// increment the switch value to use the "enemy" message
				clientReceiveSwitch++;
			}
			break;

        case 2:
		    if (bLocalPlayer) 
			{
				TrPlayerController(P).TrClientMusicEvent(16);
			}
			break;

        case 4:
		    if (bLocalPlayer) 
			{
				P.PlaySound(Default.m_sYouAreNewLeadeCue,true);
				TrPlayerController(P).TrClientMusicEvent(16);
			}
			else
			{
				// increment the switch value to use the "enemy" message
				P.PlaySound(Default.m_sOtherIsNewLeadeCue,true);
				clientReceiveSwitch++;
			}
			break;

		case 6:
			if (bLocalPlayer)
			{
			}
			else
			{
				// increment the switch value to use the "enemy" message
				clientReceiveSwitch++;
			}
			break;

		case 10:
			P.PlaySound(default.m_sFlagReturnedToStand, true);
			break;
    }

	Super.ClientReceive(P, clientReceiveSwitch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

static function byte AnnouncementLevel(byte MessageIndex)
{
	return 1;
}

defaultproperties
{
   YouScoreFlagTouch="You are the rabbit"
   OtherScoreFlagTouch=" is the new Rabbit"
   YouAreNewLeader="You are the new leader"
   OtherIsNewLeader=" has taken the lead"
   YouDroppedFlag="You have dropped the flag"
   OtherDroppedFlag=" no longer has the flag"
   KillTheRabbit="Kill the Rabbit"
   GetToTheFlag="Get to the flag"
   MessageArea=4
   AnnouncementPriority=11
   FontSize=2
   Name="Default__TrRabbitScoreMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
