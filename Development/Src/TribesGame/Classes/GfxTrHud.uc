class GfxTrHud extends GFxMinimapHud
    dependson(TrObject)
	dependson(TrVGSNode);



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
#linenumber 6;




const MAX_CLASS_SLOTS                                  = 10;


const TR_QUERY_CTF								       = 0;
const TR_QUERY_TDM								       = 1;
const TR_QUERY_RABBIT  							       = 2;
const TR_QUERY_TEAMRABBIT                              = 3;
const TR_QUERY_ARENA                                   = 4;
const TR_QUERY_DEFENDANDDESTROY	                       = 5;
const TR_QUERY_CTFBLITZ     	                       = 6;


const CONTEXT_GAME_MODE_TRCTF                          = 0;
const CONTEXT_GAME_MODE_TRTDM                          = 1;
const CONTEXT_GAME_MODE_TRRABBIT                       = 2;
const CONTEXT_GAME_MODE_TRSIEGE                        = 3;
const CONTEXT_GAME_MODE_TRTRAINING                     = 4;
const CONTEXT_GAME_MODE_TRSTORM                        = 5;
const CONTEXT_GAME_MODE_TRTEAMRABBIT                   = 6;
const CONTEXT_GAME_MODE_TRARENA                        = 7;
const CONTEXT_GAME_MODE_TRDEFENDANDDESTROY             = 8;
const CONTEXT_GAME_MODE_TRCAPTUREANDHOLD	           = 9;
const CONTEXT_GAME_MODE_TRCTFBLITZ      	           = 10;

const STAT_VIEW_BASE_PLAYER                            = 1;
const STAT_VIEW_BASE_GAME                              = 101;
const STAT_VIEW_BASE_WEAPON_TYPE                       = 1000;

const GAME_SESSION_NAME                                = 'Game';


const PROPERTY_CUSTOM_MAPNAME                          = 0x40000001;
const PROPERTY_CUSTOM_GAMEMODE                         = 0x40000002;
const PROPERTY_SERVER_DESCRIPTION                      = 0x40000003;
const PROPERTY_CUSTOM_MUTATORS                         = 0x40000004;


const CLASS_TYPE_UNKNOWN                               = 1668;
const CLASS_TYPE_LIGHT_INFILTRATOR                     = 1682;
const CLASS_TYPE_LIGHT_JUMPER                          = 1696;
const CLASS_TYPE_LIGHT_ARCHITECT                       = 1697;
const CLASS_TYPE_LIGHT_PATHFINDER                      = 1683;
const CLASS_TYPE_LIGHT_NAKEDPATHFINDER                 = 1701;
const CLASS_TYPE_LIGHT_WRAITH                          = 1685;
const CLASS_TYPE_LIGHT_SENTINEL                        = 1686;
const CLASS_TYPE_MEDIUM_ENGINEER                       = 1698;
const CLASS_TYPE_MEDIUM_RANGER                         = 1687;
const CLASS_TYPE_MEDIUM_SCRAMBLER                      = 1688;
const CLASS_TYPE_MEDIUM_SOLDIER                        = 1693;
const CLASS_TYPE_MEDIUM_RAIDER                         = 1699;
const CLASS_TYPE_MEDIUM_TECHNICIAN                     = 1694;
const CLASS_TYPE_MEDIUM_WARDER                         = 1700;
const CLASS_TYPE_HEAVY_BRUTE                           = 1689;
const CLASS_TYPE_HEAVY_ROOK                            = 1690;
const CLASS_TYPE_HEAVY_DOOMBRINGER                     = 1691;
const CLASS_TYPE_HEAVY_JUGGERNAUGHT                    = 1692;
const CLASS_TYPE_HEAVY_MARAUDER                        = 1695;


const CLASS_PURCHASE_LIGHT_INFILTRATOR                 = 7476;
const CLASS_PURCHASE_LIGHT_PATHFINDER                  = 7466;
const CLASS_PURCHASE_LIGHT_SENTINEL                    = 7478;
const CLASS_PURCHASE_MEDIUM_SOLDIER                    = 7470;
const CLASS_PURCHASE_MEDIUM_RAIDER                     = 7494;
const CLASS_PURCHASE_MEDIUM_TECHNICIAN                 = 7472;
const CLASS_PURCHASE_HEAVY_BRUTE                       = 7486;
const CLASS_PURCHASE_HEAVY_DOOMBRINGER                 = 7488;
const CLASS_PURCHASE_HEAVY_JUGGERNAUGHT                = 7474;


const CLASS_INFO_BIT_NONE                              = 0x00000000;
const CLASS_INFO_BIT_INFILTRATOR                       = 0x00000001;
const CLASS_INFO_BIT_JUMPER                            = 0x00000002;
const CLASS_INFO_BIT_ARCHITECT                         = 0x00000004;
const CLASS_INFO_BIT_PATHFINDER                        = 0x00000008;
const CLASS_INFO_BIT_WRAITH                            = 0x00000010;
const CLASS_INFO_BIT_SENTINEL                          = 0x00000020;
const CLASS_INFO_BIT_ENGINEER                          = 0x00000040;
const CLASS_INFO_BIT_RANGER                            = 0x00000080;
const CLASS_INFO_BIT_SCRAMBLER                         = 0x00000100;
const CLASS_INFO_BIT_SOLDIER                           = 0x00000200;
const CLASS_INFO_BIT_RAIDER                            = 0x00000400;
const CLASS_INFO_BIT_TECHNICIAN                        = 0x00000800;
const CLASS_INFO_BIT_WARDER                            = 0x00001000;
const CLASS_INFO_BIT_BRUTE                             = 0x00002000;
const CLASS_INFO_BIT_ROOK                              = 0x00004000;
const CLASS_INFO_BIT_DOOMBRINGER                       = 0x00008000;
const CLASS_INFO_BIT_JUGGERNAUT                        = 0x00010000;
const CLASS_INFO_BIT_MARAUDER                          = 0x00020000;
const CLASS_INFO_BIT_NAKEDPATHFINDER                   = 0x00040000;


const WEAPON_ID_UNKNOWN                                = 102000;
const WEAPON_ID_AVMINE                                 = 102003;
const WEAPON_ID_DUALRHINO                              = 102024;
const WEAPON_ID_LACERATOR                              = 102016;

const WEAPON_ID_ARX_BUSTER                             = 7384;
const WEAPON_ID_CHAINGUN                               = 7386;
const WEAPON_ID_DROPJAMMER                             = 7456;
const WEAPON_ID_FORCEFIELD                             = 7411;
const WEAPON_ID_FORCEFIELD_PERSONAL                    = 7460;
const WEAPON_ID_GRENADE                                = 7390;
const WEAPON_ID_GRENADE_AP                             = 7434;
const WEAPON_ID_GRENADE_AP_HEAVY                       = 7447;
const WEAPON_ID_GRENADE_EMP                            = 7444;
const WEAPON_ID_GRENADE_FLARE                          = 7389;
const WEAPON_ID_GRENADE_NITRON                         = 7387;
const WEAPON_ID_GRENADE_NITRON_HEAVY                   = 7450;
const WEAPON_ID_GRENADE_SPIKE                          = 7428;
const WEAPON_ID_GRENADE_ST                             = 7437;
const WEAPON_ID_GRENADE_STICKY                         = 7402;
const WEAPON_ID_GRENADE_STICKY_LIGHT                   = 7455;
const WEAPON_ID_GRENADE_WHITEOUT                       = 7432;
const WEAPON_ID_GRENADE_XL                             = 7430;
const WEAPON_ID_GUNNER_BEOWULF                         = 7405;
const WEAPON_ID_GUNNER_HERC                            = 7404;
const WEAPON_ID_LAUNCHER_BOLT                          = 7425;
const WEAPON_ID_LAUNCHER_BOLT_HEAVY                    = 7452;
const WEAPON_ID_LAUNCHER_GRENADE                       = 7416;
const WEAPON_ID_LAUNCHER_MIRV                          = 7457;
const WEAPON_ID_LAUNCHER_MORTAR                        = 7393;
const WEAPON_ID_LAUNCHER_SABER                         = 7398;
const WEAPON_ID_MELEE                                  = 7391;
const WEAPON_ID_MINE                                   = 7392;
const WEAPON_ID_MINE_CLAYMORE                          = 7421;
const WEAPON_ID_MINE_PRISM                             = 7440;
const WEAPON_ID_MOTIONALARM                            = 7426;
const WEAPON_ID_PILOT_BEOWULF                          = 7406;
const WEAPON_ID_PILOT_GRAVCYCLE                        = 7410;
const WEAPON_ID_PILOT_HAVOC                            = 7409;
const WEAPON_ID_PILOT_HERC                             = 7403;
const WEAPON_ID_PILOT_SHRIKE                           = 7407;
const WEAPON_ID_PISTOL_EAGLE                           = 7388;
const WEAPON_ID_PISTOL_EAGLE_CUSTOM                    = 7439;
const WEAPON_ID_PISTOL_NOVA_COLT                       = 7394;
const WEAPON_ID_PISTOL_NOVA_SLUG                       = 7431;
const WEAPON_ID_PISTOL_FALCON                          = 7419;
const WEAPON_ID_PISTOL_H1                              = 7435;
const WEAPON_ID_PISTOL_SN7                             = 7418;
const WEAPON_ID_PISTOL_SPARROW                         = 7433;
const WEAPON_ID_TURRET_EXR                             = 7417;
const WEAPON_ID_TURRET_BASE                            = 7412;
const WEAPON_ID_TURRET_LIGHT                           = 7413;
const WEAPON_ID_TURRET_WALL                            = 7445;
const WEAPON_ID_REPAIR_TOOL                            = 7396;
const WEAPON_ID_REPAIR_TOOL_SD                         = 7436;
const WEAPON_ID_RIFLE_ASSAULT                          = 7385;
const WEAPON_ID_RIFLE_ASSAULT_LIGHT                    = 7438;
const WEAPON_ID_RIFLE_ASSAULT_S22                      = 7424;
const WEAPON_ID_RIFLE_ASSAULT_X1                       = 7458;
const WEAPON_ID_RIFLE_PHASE                            = 7395;
const WEAPON_ID_RIFLE_SNIPER                           = 7400;
const WEAPON_ID_SMG_NJ4                                = 7441;
const WEAPON_ID_SMG_RHINO                              = 7397;
const WEAPON_ID_SMG_TCN4                               = 7443;
const WEAPON_ID_SHOTGUN                                = 7399;
const WEAPON_ID_SHOTGUN_ARX                            = 7454;
const WEAPON_ID_SHOTGUN_AUTO                           = 7449;
const WEAPON_ID_SHOTGUN_SAWED_OFF                      = 7427;
const WEAPON_ID_SPINFUSOR                              = 7401;
const WEAPON_ID_SPINFUSOR_D                            = 7446;
const WEAPON_ID_SPINFUSOR_HEAVY                        = 7448;
const WEAPON_ID_SPINFUSOR_LIGHT                        = 7422;
const WEAPON_ID_SPINFUSOR_TOSS                         = 7459;
const WEAPON_ID_CALLIN_TACTICALSTRIKE                  = 7609;
const WEAPON_ID_CALLIN_INVENTORYDROP                   = 7610;
const WEAPON_ID_CALLIN_ORBITALSTRIKE                   = 7611;
const WEAPON_ID_TCNG                                   = 7736;
const WEAPON_ID_FALLING                                = 7815;
const WEAPON_ID_HITWALL                                = 7816;
const WEAPON_ID_RANOVER                                = 7817;
const WEAPON_ID_THUMPER                                = 7461;
const WEAPON_ID_THUMPER_D                              = 7462;
const WEAPON_ID_STEALTHLIGHTSPINFUSOR                  = 7902;
const WEAPON_ID_GRENADE_T5                             = 7914;
const WEAPON_ID_PROXIMITY_GRENADE                      = 8222;
const WEAPON_ID_INFILTRATORBLANK                       = 8230;
const WEAPON_ID_ACCURIZEDSHOTGUN                       = 8239;
const WEAPON_ID_MINE_ARMOREDCLAYMORE                   = 8240;
const WEAPON_ID_BUCKLER                                = 8242;
const WEAPON_ID_IMPACTBOMBLETS                         = 8244;
const WEAPON_ID_LIGHTTWINFUSOR                         = 8245;
const WEAPON_ID_LR1MORTAR                              = 8246;
const WEAPON_ID_MIRV_GRENADE                           = 8247;
const WEAPON_ID_GRENADE_NINJASMOKE                     = 8248;
const WEAPON_ID_NJ5SMG                                 = 8249;
const WEAPON_ID_PLASMA_CANNON                          = 8250;
const WEAPON_ID_PLASMA_GUN                             = 8251;
const WEAPON_ID_REMOTE_ARX_BUSTER                      = 8252;
const WEAPON_ID_ROCKETLAUNCHER                         = 8253;
const WEAPON_ID_SAP20                                  = 8254;
const WEAPON_ID_THROWINGKNIVES                         = 8256;
const WEAPON_ID_TWINFUSOR                              = 8257;
const WEAPON_ID_HEAVYTWINFUSOR                         = 8656;
const WEAPON_ID_SPIKELAUNCHER                          = 8357;
const WEAPON_ID_TARGETINGBEACON                        = 8358;

const ITEM_PACK_AMMO                                   = 7821;
const ITEM_PACK_BLINK                                  = 7822;
const ITEM_PACK_DAMAGE                                 = 7823;
const ITEM_PACK_ENERGY_SOLDIER                         = 7824;
const ITEM_PACK_ENERGY_JUGGERNAUT                      = 7901;
const ITEM_PACK_ENERGY_BRUTE                           = 7830;
const ITEM_PACK_RECHARGE_PATHFINDER                    = 7825;
const ITEM_PACK_RECHARGE_SENTINEL                      = 7900;
const ITEM_PACK_HEAVYSHIELD                            = 7826;
const ITEM_PACK_JAMMER                                 = 7827;
const ITEM_PACK_LIGHTREGEN                             = 7828;
const ITEM_PACK_POWERPOOL                              = 7829;
const ITEM_PACK_MINORENERGY                            = 7830;
const ITEM_PACK_REGEN                                  = 7831;
const ITEM_PACK_SHIELD                                 = 7832;
const ITEM_PACK_STEALTH                                = 7833;
const ITEM_PACK_UTILITY_SOLDIER                        = 8223;
const ITEM_PACK_HIGHSPEEDSTEALTH                       = 8243;
const ITEM_PACK_SURVIVAL                               = 8255;

const WEAPON_BASE_UNKNOWN                              = 0;
const WEAPON_BASE_SPINFUSOR                            = 1;
const WEAPON_BASE_PISTOL                               = 2;
const WEAPON_BASE_SNIPERRIFLE                          = 3;
const WEAPON_BASE_ASSAULTRIFLE                         = 4;
const WEAPON_BASE_GRENADE                              = 5;
const WEAPON_BASE_REPAIRTOOL                           = 6;
const WEAPON_BASE_CALLIN                               = 7;
const WEAPON_BASE_SMG                                  = 8;
const WEAPON_BASE_SHOTGUN                              = 9;
const WEAPON_BASE_VEHICLE                              = 10;

const WEAPON_TYPE_UNKNOWN                              = 0;
const WEAPON_TYPE_PROJECTILE                           = 1;
const WEAPON_TYPE_INSTANTFIRE                          = 2;


const ITEM_PERK_BOUNTYHUNTER                            = 8153;
const ITEM_PERK_CLOSECOMBAT                             = 8156;
const ITEM_PERK_DETERMINATION                           = 8157;
const ITEM_PERK_EGOCENTRIC                              = 7917;
const ITEM_PERK_LOOTER                                  = 8158;
const ITEM_PERK_MECHANIC                                = 8170;
const ITEM_PERK_PILOT                                   = 8159;
const ITEM_PERK_POTENTIALENERGY                         = 8160;
const ITEM_PERK_QUICKDRAW                               = 8161;
const ITEM_PERK_REACH                                   = 7916;
const ITEM_PERK_SAFEFALL                                = 8162;
const ITEM_PERK_SAFETYTHIRD                             = 8163;
const ITEM_PERK_STEALTHY                                = 8164;
const ITEM_PERK_SUPERCAPACITOR                          = 8165;
const ITEM_PERK_SUPERHEAVY                              = 8166;
const ITEM_PERK_SURVIVALIST                             = 8167;
const ITEM_PERK_ULTRACAPACITOR                          = 8168;
const ITEM_PERK_WHEELDEAL                               = 8169;
const ITEM_PERK_RAGE                                    = 8232;
const ITEM_PERK_SONICPUNCH                              = 8231;
const ITEM_PERK_LIGHTWEIGHT                             = 8646;



const ITEM_SKILL_PATHFINDER_PRIMARY_AMMO_I              = 7508;
const ITEM_SKILL_PATHFINDER_PRIMARY_AMMO_II             = 7637;
const ITEM_SKILL_PATHFINDER_PRIMARY_ANTIARMOR           = 7509;
const ITEM_SKILL_PATHFINDER_SECONDARY_AMMO_I            = 7638;
const ITEM_SKILL_PATHFINDER_SECONDARY_AMMO_II           = 7640;
const ITEM_SKILL_PATHFINDER_SECONDARY_CLIP              = 7639;
const ITEM_SKILL_PATHFINDER_SECONDARY_FALLOFF           = 7641;
const ITEM_SKILL_PATHFINDER_GRENADE_AMMO                = 7504;
const ITEM_SKILL_PATHFINDER_GRENADE_RADIUS              = 7505;
const ITEM_SKILL_PATHFINDER_HEALTH_POOL                 = 7636;
const ITEM_SKILL_PATHFINDER_HEALTH_REGEN_RATE           = 7507;
const ITEM_SKILL_PATHFINDER_HEALTH_REGEN_DELAY          = 7506;
const ITEM_SKILL_PATHFINDER_ENERGY_REGEN_I              = 7501;
const ITEM_SKILL_PATHFINDER_ENERGY_REGEN_II             = 7635;
const ITEM_SKILL_PATHFINDER_SPEED_I                     = 7502; 
const ITEM_SKILL_PATHFINDER_SPEED_II                    = 7503; 
const ITEM_SKILL_PATHFINDER_GROUND_SPEED                = 7754;
const ITEM_SKILL_PATHFINDER_STOP_DISTANCE               = 7755;


const ITEM_SKILL_JUMPER_PRIMARY_AMMO_I                  = 7564;
const ITEM_SKILL_JUMPER_PRIMARY_AMMO_II                 = 7646;
const ITEM_SKILL_JUMPER_PRIMARY_ANTIARMOR               = 7645;
const ITEM_SKILL_JUMPER_SECONDARY_AMMO                  = 7647;
const ITEM_SKILL_JUMPER_SECONDARY_RELOAD                = 7565;
const ITEM_SKILL_JUMPER_SECONDARY_FALLOFF               = 7648;
const ITEM_SKILL_JUMPER_GRENADE_AMMO                    = 7563;
const ITEM_SKILL_JUMPER_PACK_COST_I                     = 7558;
const ITEM_SKILL_JUMPER_PACK_COST_II                    = 7643;
const ITEM_SKILL_JUMPER_PACK_POTENCY                    = 7560;
const ITEM_SKILL_JUMPER_HEALTH_POOL                     = 7562;
const ITEM_SKILL_JUMPER_HEALTH_REGEN_RATE               = 7644;
const ITEM_SKILL_JUMPER_HEALTH_REGEN_DELAY              = 7561;
const ITEM_SKILL_JUMPER_ENERGY_POOL                     = 7642;
const ITEM_SKILL_JUMPER_CONTROL                         = 7557; 
const ITEM_SKILL_JUMPER_SPEED                           = 7559; 
const ITEM_SKILL_JUMPER_GROUND_SPEED                    = 7756;
const ITEM_SKILL_JUMPER_STOP_DISTANCE                   = 7757;


const ITEM_SKILL_SOLDIER_PRIMARY_AMMO_I                 = 7551;
const ITEM_SKILL_SOLDIER_PRIMARY_AMMO_II                = 7667;
const ITEM_SKILL_SOLDIER_PRIMARY_ANTIARMOR              = 7552;
const ITEM_SKILL_SOLDIER_SECONDARY_AMMO                 = 7670;
const ITEM_SKILL_SOLDIER_SECONDARY_CLIP                 = 7671;
const ITEM_SKILL_SOLDIER_SECONDARY_RELOAD               = 7556;
const ITEM_SKILL_SOLDIER_GRENADE_AMMO                   = 7540;
const ITEM_SKILL_SOLDIER_HEALTH_POOL_I                  = 7555;
const ITEM_SKILL_SOLDIER_HEALTH_POOL_II                 = 7668;
const ITEM_SKILL_SOLDIER_HEALTH_REGEN_RATE              = 7669;
const ITEM_SKILL_SOLDIER_HEALTH_REGEN_DELAY             = 7554;
const ITEM_SKILL_SOLDIER_ENERGY_POOL_I                  = 7541;
const ITEM_SKILL_SOLDIER_ENERGY_POOL_II                 = 7665;
const ITEM_SKILL_SOLDIER_CONTROL                        = 7664; 
const ITEM_SKILL_SOLDIER_SPEED_I                        = 7548; 
const ITEM_SKILL_SOLDIER_SPEED_II                       = 7666; 
const ITEM_SKILL_SOLDIER_GROUND_SPEED                   = 7759;
const ITEM_SKILL_SOLDIER_STOP_DISTANCE                  = 7760;
const ITEM_SKILL_SOLDIER_WEAPON_SWITCH                  = 7761;


const ITEM_SKILL_JUGGERNAUGHT_PRIMARY_AMMO_I            = 7568;
const ITEM_SKILL_JUGGERNAUGHT_PRIMARY_AMMO_II           = 7658;
const ITEM_SKILL_JUGGERNAUGHT_PRIMARY_ANTIARMOR         = 7569;
const ITEM_SKILL_JUGGERNAUGHT_SECONDARY_AMMO_I          = 7573;
const ITEM_SKILL_JUGGERNAUGHT_SECONDARY_AMMO_II         = 7660;
const ITEM_SKILL_JUGGERNAUGHT_SECONDARY_ANTIARMOR       = 7574;
const ITEM_SKILL_JUGGERNAUGHT_GRENADE_AMMO_I            = 7566;
const ITEM_SKILL_JUGGERNAUGHT_GRENADE_AMMO_II           = 7663;
const ITEM_SKILL_JUGGERNAUGHT_GRENADE_RADIUS            = 7662;
const ITEM_SKILL_JUGGERNAUGHT_HEALTH_POOL_I             = 7576;
const ITEM_SKILL_JUGGERNAUGHT_HEALTH_POOL_II            = 7661;
const ITEM_SKILL_JUGGERNAUGHT_ENERGY_POOL_I             = 7572;
const ITEM_SKILL_JUGGERNAUGHT_ENERGY_POOL_II            = 7659;
const ITEM_SKILL_JUGGERNAUGHT_HEALTH_REGEN_DELAY        = 7575;
const ITEM_SKILL_JUGGERNAUGHT_CONTROL                   = 7657; 
const ITEM_SKILL_JUGGERNAUGHT_SPEED                     = 7570; 
const ITEM_SKILL_JUGGERNAUGHT_GROUND_SPEED              = 7770;
const ITEM_SKILL_JUGGERNAUGHT_WEAPON_SWITCH             = 7771;


const ITEM_SKILL_TECHNICIAN_PRIMARY_AMMO                = 7685;
const ITEM_SKILL_TECHNICIAN_PRIMARY_RELOAD              = 7686;
const ITEM_SKILL_TECHNICIAN_REPAIR_RATE_I               = 7519;
const ITEM_SKILL_TECHNICIAN_REPAIR_RATE_II              = 7681;
const ITEM_SKILL_TECHNICIAN_GRENADE_AMMO_I	            = 7518;
const ITEM_SKILL_TECHNICIAN_GRENADE_AMMO_II             = 7687;
const ITEM_SKILL_TECHNICIAN_DEPLOY_ACQUIRE	            = 7512;
const ITEM_SKILL_TECHNICIAN_DEPLOY_LIMIT	            = 7513;
const ITEM_SKILL_TECHNICIAN_DEPLOY_ANTIARMOR            = 7514;
const ITEM_SKILL_TECHNICIAN_HEALTH_POOL_I               = 7520;
const ITEM_SKILL_TECHNICIAN_HEALTH_POOL_II              = 7684;
const ITEM_SKILL_TECHNICIAN_HEALTH_REGEN_DELAY          = 7516;
const ITEM_SKILL_TECHNICIAN_ENERGY_POOL	                = 7515;
const ITEM_SKILL_TECHNICIAN_CONTROL                     = 7517; 
const ITEM_SKILL_TECHNICIAN_SPEED_I                     = 7682; 
const ITEM_SKILL_TECHNICIAN_SPEED_II                    = 7683; 
const ITEM_SKILL_TECHNICIAN_GROUND_SPEED                = 7765;
const ITEM_SKILL_TECHNICIAN_STOP_DISTANCE               = 7766;
const ITEM_SKILL_TECHNICIAN_WEAPON_SWITCH               = 7767;


const ITEM_SKILL_SENTINEL_PRIMARY_AMMO_I                = 7528;
const ITEM_SKILL_SENTINEL_PRIMARY_AMMO_II               = 7655;
const ITEM_SKILL_SENTINEL_PRIMARY_CLIP                  = 7654;
const ITEM_SKILL_SENTINEL_PRIMARY_FALLOFF               = 7529;
const ITEM_SKILL_SENTINEL_SECONDARY_AMMO                = 7651;
const ITEM_SKILL_SENTINEL_SECONDARY_CLIP                = 7652;
const ITEM_SKILL_SENTINEL_GRENADE_AMMO                  = 7527;
const ITEM_SKILL_SENTINEL_GRENADE_RADIUS                = 7656;
const ITEM_SKILL_SENTINEL_DEPLOY_HEALTH                 = 7649;
const ITEM_SKILL_SENTINEL_DEPLOY_RADIUS_I               = 7521;
const ITEM_SKILL_SENTINEL_DEPLOY_RADIUS_II              = 7650;
const ITEM_SKILL_SENTINEL_HEALTH_REGEN_RATE             = 7526;
const ITEM_SKILL_SENTINEL_HEALTH_REGEN_DELAY            = 7525;
const ITEM_SKILL_SENTINEL_ENERGY_POOL_I                 = 7523;
const ITEM_SKILL_SENTINEL_ENERGY_POOL_II                = 7653;
const ITEM_SKILL_SENTINEL_SPEED                         = 7524; 
const ITEM_SKILL_SENTINEL_WEAPON_SWITCH                 = 7758;


const ITEM_SKILL_RANGER_PRIMARY_AMMO                    = 7679;
const ITEM_SKILL_RANGER_PRIMARY_CLIP                    = 7680;
const ITEM_SKILL_RANGER_PRIMARY_RELOAD                  = 7582;
const ITEM_SKILL_RANGER_SECONDARY_AMMO_I                = 7581;
const ITEM_SKILL_RANGER_SECONDARY_AMMO_II               = 7675;
const ITEM_SKILL_RANGER_SECONDARY_ANTIARMOR             = 7674;
const ITEM_SKILL_RANGER_GRENADE_AMMO_I                  = 7580;
const ITEM_SKILL_RANGER_GRENADE_AMMO_II                 = 7677;
const ITEM_SKILL_RANGER_PACK_COST                       = 7583;
const ITEM_SKILL_RANGER_HEALTH_POOL_I                   = 7585;
const ITEM_SKILL_RANGER_HEALTH_POOL_II                  = 7676;
const ITEM_SKILL_RANGER_HEALTH_REGEN_DELAY              = 7584;
const ITEM_SKILL_RANGER_ENERGY_POOL_I                   = 7577;
const ITEM_SKILL_RANGER_ENERGY_POOL_II                  = 7678;
const ITEM_SKILL_RANGER_CONTROL                         = 7672; 
const ITEM_SKILL_RANGER_SPEED_I                         = 7578; 
const ITEM_SKILL_RANGER_SPEED_II                        = 7673; 
const ITEM_SKILL_RANGER_GROUND_SPEED                    = 7762;
const ITEM_SKILL_RANGER_STOP_DISTANCE                   = 7763;
const ITEM_SKILL_RANGER_WEAPON_SWITCH                   = 7764;


const ITEM_SKILL_DOOMBRINGER_PRIMARY_AMMO_I             = 7598;
const ITEM_SKILL_DOOMBRINGER_PRIMARY_AMMO_II            = 7632;
const ITEM_SKILL_DOOMBRINGER_PRIMARY_SPINUP             = 7597;
const ITEM_SKILL_DOOMBRINGER_GRENADE_AMMO_I             = 7590;
const ITEM_SKILL_DOOMBRINGER_GRENADE_AMMO_II            = 7634;
const ITEM_SKILL_DOOMBRINGER_DEPLOY_AMMO	            = 7591;
const ITEM_SKILL_DOOMBRINGER_GRENADE_ANTIARMOR          = 7633;
const ITEM_SKILL_DOOMBRINGER_DEPLOY_HEALTH_I            = 7592;
const ITEM_SKILL_DOOMBRINGER_DEPLOY_HEALTH_II           = 7629;
const ITEM_SKILL_DOOMBRINGER_HEALTH_POOL_I              = 7596;
const ITEM_SKILL_DOOMBRINGER_HEALTH_POOL_II             = 7631;
const ITEM_SKILL_DOOMBRINGER_HEALTH_REGEN_DELAY         = 7595;
const ITEM_SKILL_DOOMBRINGER_ENERGY_POOL                = 7628;
const ITEM_SKILL_DOOMBRINGER_CONTROL                    = 7594; 
const ITEM_SKILL_DOOMBRINGER_SPEED_I                    = 7593; 
const ITEM_SKILL_DOOMBRINGER_SPEED_II                   = 7630; 
const ITEM_SKILL_DOOMBRINGER_GROUND_SPEED               = 7772;
const ITEM_SKILL_DOOMBRINGER_STOP_DISTANCE              = 7773;
const ITEM_SKILL_DOOMBRINGER_WEAPON_SWITCH              = 7774;


const ITEM_SKILL_INFILTRATOR_PRIMARY_AMMO_I             = 7612;
const ITEM_SKILL_INFILTRATOR_PRIMARY_AMMO_II            = 7818;
const ITEM_SKILL_INFILTRATOR_PRIMARY_RELOAD             = 7614;
const ITEM_SKILL_INFILTRATOR_PRIMARY_FALLOFF            = 7613; 
const ITEM_SKILL_INFILTRATOR_SECONDARY_AMMO             = 7623;
const ITEM_SKILL_INFILTRATOR_SECONDARY_CLIP             = 7625;
const ITEM_SKILL_INFILTRATOR_SECONDARY_RELOAD           = 7624;
const ITEM_SKILL_INFILTRATOR_GRENADE_AMMO_I             = 7615;
const ITEM_SKILL_INFILTRATOR_GRENADE_AMMO_II            = 7618;
const ITEM_SKILL_INFILTRATOR_GRENADE_RADIUS             = 7617;
const ITEM_SKILL_INFILTRATOR_GRENADE_ANTIARMOR          = 7616;
const ITEM_SKILL_INFILTRATOR_PACK_COST_I                = 7620;
const ITEM_SKILL_INFILTRATOR_PACK_COST_II               = 7622;
const ITEM_SKILL_INFILTRATOR_PACK_POTENCY               = 7621;
const ITEM_SKILL_INFILTRATOR_HEALTH_REGEN_RATE          = 7627;
const ITEM_SKILL_INFILTRATOR_HEALTH_REGEN_DELAY         = 7626;
const ITEM_SKILL_INFILTRATOR_ENERGY_POOL                = 7619;


const ITEM_SKILL_RAIDER_PRIMARY_AMMO                    = 7688;
const ITEM_SKILL_RAIDER_PRIMARY_RELOAD                  = 7690;
const ITEM_SKILL_RAIDER_PRIMARY_FALLOFF                 = 7689;
const ITEM_SKILL_RAIDER_SECONDARY_AMMO                  = 7691;
const ITEM_SKILL_RAIDER_SECONDARY_CLIP                  = 7693;
const ITEM_SKILL_RAIDER_SECONDARY_ANTIARMOR             = 7692;
const ITEM_SKILL_RAIDER_GRENADE_AMMO                    = 7694;
const ITEM_SKILL_RAIDER_GRENADE_EFFECT                  = 7695;
const ITEM_SKILL_RAIDER_GRENADE_RADIUS                  = 7696;
const ITEM_SKILL_RAIDER_PACK_COST_I                     = 7700;
const ITEM_SKILL_RAIDER_PACK_COST_II                    = 7703;
const ITEM_SKILL_RAIDER_PACK_POTENCY                    = 7701;
const ITEM_SKILL_RAIDER_HEALTH_POOL_I                   = 7698;
const ITEM_SKILL_RAIDER_HEALTH_POOL_II                  = 7699;
const ITEM_SKILL_RAIDER_HEALTH_REGEN_DELAY              = 7697;
const ITEM_SKILL_RAIDER_ENERGY_POOL                     = 7702;


const ITEM_SKILL_BRUTE_ENERGY_POOL                      = 7723;
const ITEM_SKILL_BRUTE_GRENADE_AMMO                     = 7720;
const ITEM_SKILL_BRUTE_GRENADE_DURATION                 = 7721;
const ITEM_SKILL_BRUTE_GRENADE_RADIUS                   = 7722;
const ITEM_SKILL_BRUTE_HEALTH_POOL_I                    = 7729;
const ITEM_SKILL_BRUTE_HEALTH_POOL_II                   = 7732;
const ITEM_SKILL_BRUTE_HEALTH_REGEN_DELAY               = 7730;
const ITEM_SKILL_BRUTE_HEALTH_REGEN_RATE                = 7731;
const ITEM_SKILL_BRUTE_PRIMARY_AMMO_I                   = 7726;
const ITEM_SKILL_BRUTE_PRIMARY_AMMO_II                  = 7728;
const ITEM_SKILL_BRUTE_PRIMARY_ANTIARMOR                = 7727;
const ITEM_SKILL_BRUTE_SECONARY_AMMO                    = 7733;
const ITEM_SKILL_BRUTE_SECONDARY_CLIP                   = 7735;
const ITEM_SKILL_BRUTE_SECONDARY_RELOAD                 = 7734;
const ITEM_SKILL_BRUTE_CONTROL                          = 7725; 
const ITEM_SKILL_BRUTE_SPEED                            = 7724; 
const ITEM_SKILL_BRUTE_GROUND_SPEED                     = 7775;
const ITEM_SKILL_BRUTE_WEAPON_SWITCH                    = 7776;


const ITEM_SKILL_SCRAMBLER_ENERGY_POOL                  = 7707;
const ITEM_SKILL_SCRAMBLER_GRENADE_AMMO                 = 7704;
const ITEM_SKILL_SCRAMBLER_GRENADE_DURATION             = 7706;
const ITEM_SKILL_SCRAMBLER_GRENADE_RADIUS               = 7705;
const ITEM_SKILL_SCRAMBLER_HEALTH_POOL_I                = 7714;
const ITEM_SKILL_SCRAMBLER_HEALTH_POOL_II               = 7715;
const ITEM_SKILL_SCRAMBLER_HEALTH_REGEN_DELAY           = 7713;
const ITEM_SKILL_SCRAMBLER_PACK_COST_I                  = 7716;
const ITEM_SKILL_SCRAMBLER_PACK_COST_II                 = 7718;
const ITEM_SKILL_SCRAMBLER_PACK_EFFECTIVENESS_I         = 7717;
const ITEM_SKILL_SCRAMBLER_PACK_EFFECTIVENESS_II        = 7719;
const ITEM_SKILL_SCRAMBLER_PRIMARY_AMMO_I               = 7710;
const ITEM_SKILL_SCRAMBLER_PRIMARY_AMMO_II              = 7712;
const ITEM_SKILL_SCRAMBLER_PRIMARY_ANTIARMOR            = 7711;
const ITEM_SKILL_SCRAMBLER_CONTROL                      = 7709; 
const ITEM_SKILL_SCRAMBLER_SPEED                        = 7708; 
const ITEM_SKILL_SCRAMBLER_GROUND_SPEED                 = 7768;
const ITEM_SKILL_SCRAMBLER_WEAPON_SWITCH                = 7769;


const ITEM_SKILL_WRAITH_ENERGY_POOL                     = 7790;
const ITEM_SKILL_WRAITH_ENERGY_REGEN_I                  = 7781;
const ITEM_SKILL_WRAITH_ENERGY_REGEN_II                 = 7783;
const ITEM_SKILL_WRAITH_GRENADE_AMMO                    = 7788;
const ITEM_SKILL_WRAITH_GRENADE_RADIUS                  = 7789;
const ITEM_SKILL_WRAITH_GROUND_SPEED                    = 7782;
const ITEM_SKILL_WRAITH_HEALTH_REGEN_DELAY              = 7791;
const ITEM_SKILL_WRAITH_HEALTH_REGEN_RATE               = 7792;
const ITEM_SKILL_WRAITH_PRIMARY_AMMO_I                  = 7793;
const ITEM_SKILL_WRAITH_PRIMARY_AMMO_II                 = 7796;
const ITEM_SKILL_WRAITH_PRIMARY_CLIP                    = 7795;
const ITEM_SKILL_WRAITH_PRIMARY_ENERGY_COST             = 7794;
const ITEM_SKILL_WRAITH_SECONDARY_AMMO                  = 7784;
const ITEM_SKILL_WRAITH_SECONDARY_CLIP_I                = 7785;
const ITEM_SKILL_WRAITH_SECONDARY_CLIP_II               = 7786;
const ITEM_SKILL_WRAITH_WEAPON_SWITCH                   = 7787;


 
const TR_MAX_CALLINS = 3;


const PROPERTY_CALLIN_ORBITALSTRIKE                     = 10241;
const PROPERTY_CALLIN_TACTICALSTRIKE                    = 10201;
const PROPERTY_CALLIN_SUPPORTINVENTORY                  = 10234;


const ITEM_SKIN_PATHFINDER                              = 7834;
const ITEM_SKIN_PATHFINDER_MERC                         = 8326;
const ITEM_SKIN_INFILTRATOR                             = 7835;
const ITEM_SKIN_INFILTRATOR_ASSASSIN                    = 8337;
const ITEM_SKIN_INFILTRATOR_MERC                        = 8336;
const ITEM_SKIN_SENTINEL                                = 8327;
const ITEM_SKIN_SENTINEL_MERC                           = 8665;
const ITEM_SKIN_SOLDIER                                 = 8328;
const ITEM_SKIN_TECHNICIAN                              = 8329;
const ITEM_SKIN_TECHNICIAN_MERC                         = 8731;
const ITEM_SKIN_RAIDER                                  = 8330;
const ITEM_SKIN_RAIDER_GRIEVER                          = 8351;
const ITEM_SKIN_RAIDER_MERC                             = 8352;
const ITEM_SKIN_JUGGERNAUT                              = 8331;
const ITEM_SKIN_DOOMBRINGER                             = 8332;
const ITEM_SKIN_BRUTE                                   = 8333;
const ITEM_SKIN_BRUTE_MERC                              = 8663;


const ITEM_VOICE_LIGHT_STANDARD                         = 7903;
const ITEM_VOICE_MEDIUM_STANDARD                        = 7904;
const ITEM_VOICE_HEAVY_STANDARD                         = 7905;


const ITEM_ARMOR_MOD_PATHFINDER_1                       = 7836; 
const ITEM_ARMOR_MOD_SENTINEL_1                         = 7837; 
const ITEM_ARMOR_MOD_INFILTRATOR_1                      = 7838; 
const ITEM_ARMOR_MOD_SOLDIER_1                          = 7839; 
const ITEM_ARMOR_MOD_TECHNICIAN_1                       = 7840; 
const ITEM_ARMOR_MOD_RAIDER_1                           = 7841; 
const ITEM_ARMOR_MOD_JUGGERNAUT_1                       = 7842; 
const ITEM_ARMOR_MOD_DOOMBRINGER_1                      = 7843; 
const ITEM_ARMOR_MOD_BRUTE_1                            = 7844; 



const WEAPON_ID_ARX_BUSTER_MKD                             = 8391;
const WEAPON_ID_CHAINGUN_MKD                               = 8392;
const WEAPON_ID_GRENADE_MKD                                = 8393;
const WEAPON_ID_GRENADE_AP_HEAVY_MKD                      = 8394;
const WEAPON_ID_GRENADE_EMP_MKD                            = 8395;
const WEAPON_ID_GRENADE_NITRON_MKD                         = 8396;
const WEAPON_ID_GRENADE_SPIKE_MKD                          = 8397;
const WEAPON_ID_GRENADE_STICKY_MKD                      = 8398;
const WEAPON_ID_GRENADE_XL_MKD                            = 8399;
const WEAPON_ID_LAUNCHER_MORTAR_MKD                        = 8400;
const WEAPON_ID_LAUNCHER_SABER_MKD                         = 8401;
const WEAPON_ID_MINE_CLAYMORE_MKD                          = 8402;
const WEAPON_ID_PISTOL_NOVA_COLT_MKD                      = 8403;
const WEAPON_ID_PISTOL_SN7_MKD                             = 8404;
const WEAPON_ID_REPAIR_TOOL_SD_MKD                         = 8405;
const WEAPON_ID_RIFLE_ASSAULT_MKD                          = 8406;
const WEAPON_ID_RIFLE_SNIPER_MKD                           = 8407;
const WEAPON_ID_SMG_NJ4_MKD                                = 8408;
const WEAPON_ID_SMG_RHINO_MKD                              = 8409;
const WEAPON_ID_SMG_TCN4_MKD                               = 8410;
const WEAPON_ID_SHOTGUN_MKD                               = 8411;
const WEAPON_ID_SHOTGUN_AUTO_MKD                         = 8412;
const WEAPON_ID_SPINFUSOR_D_MKD                           = 8413;
const WEAPON_ID_SPINFUSOR_HEAVY_MKD                      = 8414;
const WEAPON_ID_SPINFUSOR_LIGHT_MKD                      = 8415;
const WEAPON_ID_TCNG_MKD                                  = 8416;
const WEAPON_ID_THUMPERD_MKD                             = 8417;


const WEAPON_ID_REPAIR_DEPLOYABLE                        = 8698;
const WEAPON_ID_SPINFUSOR_LIGHT_100X                     = 8696;
const WEAPON_ID_SPINFUSOR_100X                           = 8697;
const WEAPON_ID_TC24                                     = 8699;


const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_100X_1      = 8700;
const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_100X_2      = 8701;
const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_100X_3      = 8702;
const ITEM_UPGRADE_SOLDIER_SPINFUSOR_100X_1              = 8703;
const ITEM_UPGRADE_SOLDIER_SPINFUSOR_100X_2              = 8704;
const ITEM_UPGRADE_SOLDIER_SPINFUSOR_100X_3              = 8705;
const ITEM_UPGRADE_TECHNICIAN_REPAIR_DEPLOYABLE_1        = 8706;
const ITEM_UPGRADE_TECHNICIAN_REPAIR_DEPLOYABLE_2        = 8707;
const ITEM_UPGRADE_TECHNICIAN_REPAIR_DEPLOYABLE_3        = 8708;
const ITEM_UPGRADE_TECHNICIAN_TC24_1                     = 8709;
const ITEM_UPGRADE_TECHNICIAN_TC24_2                     = 8710;
const ITEM_UPGRADE_TECHNICIAN_TC24_3                     = 8711;


const ACTIVITY_PATHFINDER_PRIMARY_LIGHTSPINFUSOR_100X   = 265;
const ACTIVITY_TECHNICIAN_BELT_REPAIR_DEPLOYABLE        = 266;
const ACTIVITY_SOLDIER_PRIMARY_SPINFUSOR_100X           = 264;
const ACTIVITY_TECHNICIAN_PRIMARY_TC24                  = 267;
const ACTIVITY_SENTINEL_PRIMARY_SAP20                   = 268;
const ACTIVITY_SENTINEL_SECONDARY_ACCURIZEDSHOTGUN      = 269;


const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_MKD_1         = 8418;
const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_MKD_2         = 8419;
const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_MKD_3        = 8420;
const ITEM_UPGRADE_SENTINEL_BXT1SNIPERRIFLE_MKD_1          = 8421;
const ITEM_UPGRADE_SENTINEL_BXT1SNIPERRIFLE_MKD_2           = 8422;
const ITEM_UPGRADE_SENTINEL_BXT1SNIPERRIFLE_MKD_3          = 8423;
const ITEM_UPGRADE_SENTINEL_BXT1SNIPERRIFLE_MKD_4          = 8424;
const ITEM_UPGRADE_INFILTRATOR_RHINOSMG_MKD_1              = 8425;
const ITEM_UPGRADE_INFILTRATOR_RHINOSMG_MKD_2               = 8426;
const ITEM_UPGRADE_INFILTRATOR_RHINOSMG_MKD_3              = 8427;
const ITEM_UPGRADE_INFILTRATOR_RHINOSMG_MKD_4               = 8428;
const ITEM_UPGRADE_SOLDIER_ASSAULTRIFLE_MKD_1               = 8429;
const ITEM_UPGRADE_SOLDIER_ASSAULTRIFLE_MKD_2               = 8430;
const ITEM_UPGRADE_SOLDIER_ASSAULTRIFLE_MKD_3               = 8431;
const ITEM_UPGRADE_SOLDIER_ASSAULTRIFLE_MKD_4             = 8432;
const ITEM_UPGRADE_TECHNICIAN_TCN4SMG_MKD_1                = 8433;
const ITEM_UPGRADE_TECHNICIAN_TCN4SMG_MKD_2                 = 8434;
const ITEM_UPGRADE_TECHNICIAN_TCN4SMG_MKD_3                = 8435;
const ITEM_UPGRADE_TECHNICIAN_TCN4SMG_MKD_4                = 8436;
const ITEM_UPGRADE_RAIDER_ARXBUSTER_MKD_1                  = 8437;
const ITEM_UPGRADE_RAIDER_ARXBUSTER_MKD_2                 = 8438;
const ITEM_UPGRADE_RAIDER_ARXBUSTER_MKD_3                  = 8439;
const ITEM_UPGRADE_JUGGERNAUT_FUSIONMORTAR_MKD_1           = 8440;
const ITEM_UPGRADE_JUGGERNAUT_FUSIONMORTAR_MKD_2            = 8441;
const ITEM_UPGRADE_JUGGERNAUT_FUSIONMORTAR_MKD_3            = 8442;
const ITEM_UPGRADE_DOOMBRINGER_CHAINGUN_MKD_1               = 8443;
const ITEM_UPGRADE_DOOMBRINGER_CHAINGUN_MKD_2              = 8444;
const ITEM_UPGRADE_DOOMBRINGER_CHAINGUN_MKD_3              = 8445;
const ITEM_UPGRADE_DOOMBRINGER_CHAINGUN_MKD_4             = 8446;
const ITEM_UPGRADE_BRUTE_HEAVYSPINFUSOR_MKD_1               = 8447;
const ITEM_UPGRADE_BRUTE_HEAVYSPINFUSOR_MKD_2               = 8448;
const ITEM_UPGRADE_BRUTE_HEAVYSPINFUSOR_MKD_3               = 8449;
const ITEM_UPGRADE_JUGGERNAUT_HEAVYTWINFUSOR_1              = 8657;
const ITEM_UPGRADE_JUGGERNAUT_HEAVYTWINFUSOR_2              = 8658;
const ITEM_UPGRADE_JUGGERNAUT_HEAVYTWINFUSOR_3              = 8659;



const ITEM_UPGRADE_PATHFINDER_SHOTGUN_MKD_1                 = 8450;
const ITEM_UPGRADE_PATHFINDER_SHOTGUN_MKD_2                = 8451;
const ITEM_UPGRADE_PATHFINDER_SHOTGUN_MKD_3                = 8452;
const ITEM_UPGRADE_SENTINEL_NOVABLASTER_MKD_1             = 8453;
const ITEM_UPGRADE_SENTINEL_NOVABLASTER_MKD_2               = 8454;
const ITEM_UPGRADE_SENTINEL_NOVABLASTER_MKD_3               = 8455;
const ITEM_UPGRADE_INFILTRATOR_SN7PISTOL_MKD_1             = 8456;
const ITEM_UPGRADE_INFILTRATOR_SN7PISTOL_MKD_2              = 8457;
const ITEM_UPGRADE_INFILTRATOR_SN7PISTOL_MKD_3              = 8458;
const ITEM_UPGRADE_SOLDIER_THUMPERD_MKD_1                   = 8459;
const ITEM_UPGRADE_SOLDIER_THUMPERD_MKD_2                  = 8460;
const ITEM_UPGRADE_SOLDIER_THUMPERD_MKD_3                   = 8461;
const ITEM_UPGRADE_TECHNICIAN_REPAIRTOOLSD_MKD_1           = 8462;
const ITEM_UPGRADE_TECHNICIAN_REPAIRTOOLSD_MKD_2            = 8463;
const ITEM_UPGRADE_TECHNICIAN_REPAIRTOOLSD_MKD_3           = 8464;
const ITEM_UPGRADE_RAIDER_NJ4SMG_MKD_1                     = 8465;
const ITEM_UPGRADE_RAIDER_NJ4SMG_MKD_2                      = 8466;
const ITEM_UPGRADE_RAIDER_NJ4SMG_MKD_3                      = 8467;
const ITEM_UPGRADE_RAIDER_NJ4SMG_MKD_4                      = 8468;
const ITEM_UPGRADE_JUGGERNAUT_SPINFUSORD_MKD_1              = 8469;
const ITEM_UPGRADE_JUGGERNAUT_SPINFUSORD_MKD_2              = 8470;
const ITEM_UPGRADE_JUGGERNAUT_SPINFUSORD_MKD_3              = 8471;
const ITEM_UPGRADE_DOOMBRINGER_SABERLAUNCHER_MKD_1          = 8472;
const ITEM_UPGRADE_DOOMBRINGER_SABERLAUNCHER_MKD_2          = 8473;
const ITEM_UPGRADE_DOOMBRINGER_SABERLAUNCHER_MKD_3          = 8474;
const ITEM_UPGRADE_BRUTE_AUTOSHOTGUN_MKD_1                 = 8475;
const ITEM_UPGRADE_BRUTE_AUTOSHOTGUN_MKD_2                 = 8476;
const ITEM_UPGRADE_BRUTE_AUTOSHOTGUN_MKD_3                 = 8477;
const ITEM_UPGRADE_BRUTE_AUTOSHOTGUN_MKD_4                = 8478;



const ITEM_UPGRADE_PATHFINDER_IMPACTNITRON_MKD_1            = 8479;
const ITEM_UPGRADE_PATHFINDER_IMPACTNITRON_MKD_2           = 8480;
const ITEM_UPGRADE_PATHFINDER_IMPACTNITRON_MKD_3           = 8481;
const ITEM_UPGRADE_SENTINEL_CLAYMORE_MKD_1                = 8482;
const ITEM_UPGRADE_SENTINEL_CLAYMORE_MKD_2                 = 8483;
const ITEM_UPGRADE_SENTINEL_CLAYMORE_MKD_3                = 8484;
const ITEM_UPGRADE_INFILTRATOR_STICKYGRENADE_MKD_1         = 8486;
const ITEM_UPGRADE_INFILTRATOR_STICKYGRENADE_MKD_2          = 8487;
const ITEM_UPGRADE_INFILTRATOR_STICKYGRENADE_MKD_3          = 8488;
const ITEM_UPGRADE_INFILTRATOR_STICKYGRENADE_MKD_4         = 8489;
const ITEM_UPGRADE_SOLDIER_FRAGGRENADEXL_MKD_1              = 8490;
const ITEM_UPGRADE_SOLDIER_FRAGGRENADEXL_MKD_2             = 8491;
const ITEM_UPGRADE_SOLDIER_FRAGGRENADEXL_MKD_3              = 8492;
const ITEM_UPGRADE_TECHNICIAN_TCNGGRENADE_MKD_1             = 8493;
const ITEM_UPGRADE_TECHNICIAN_TCNGGRENADE_MKD_2             = 8494;
const ITEM_UPGRADE_TECHNICIAN_TCNGGRENADE_MKD_3            = 8495;
const ITEM_UPGRADE_RAIDER_EMPGRENADE_MKD_1                  = 8496;
const ITEM_UPGRADE_RAIDER_EMPGRENADE_MKD_2                 = 8497;
const ITEM_UPGRADE_RAIDER_EMPGRENADE_MKD_3                  = 8498;
const ITEM_UPGRADE_JUGGERNAUT_HEAVYAPGRENADE_MKD_1         = 8499;
const ITEM_UPGRADE_JUGGERNAUT_HEAVYAPGRENADE_MKD_2          = 8500;
const ITEM_UPGRADE_JUGGERNAUT_HEAVYAPGRENADE_MKD_3         = 8501;
const ITEM_UPGRADE_DOOMBRINGER_GRENADE_MKD_1                = 8502;
const ITEM_UPGRADE_DOOMBRINGER_GRENADE_MKD_2               = 8503;
const ITEM_UPGRADE_DOOMBRINGER_GRENADE_MKD_3                = 8504;
const ITEM_UPGRADE_BRUTE_FRACTALGRENADE_MKD_1              = 8505;
const ITEM_UPGRADE_BRUTE_FRACTALGRENADE_MKD_2              = 8506;
const ITEM_UPGRADE_BRUTE_FRACTALGRENADE_MKD_3               = 8507;




const ITEM_UPGRADE_PATHFINDER_BOLTLAUNCHER_1            = 7850; 
const ITEM_UPGRADE_PATHFINDER_BOLTLAUNCHER_2            = 7851;
const ITEM_UPGRADE_PATHFINDER_BOLTLAUNCHER_3            = 7852;
const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_1          = 7855; 
const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_2          = 7860;
const ITEM_UPGRADE_PATHFINDER_LIGHTSPINFUSOR_3          = 7857;
const ITEM_UPGRADE_PATHFINDER_LIGHTTWINFUSOR_1          = 8277; 
const ITEM_UPGRADE_PATHFINDER_LIGHTTWINFUSOR_2          = 8278;
const ITEM_UPGRADE_PATHFINDER_LIGHTTWINFUSOR_3          = 8279;
const ITEM_UPGRADE_SENTINEL_BXT1SNIPERRIFLE_1           = 7927; 
const ITEM_UPGRADE_SENTINEL_BXT1SNIPERRIFLE_2           = 7929;
const ITEM_UPGRADE_SENTINEL_BXT1SNIPERRIFLE_3           = 7930;
const ITEM_UPGRADE_SENTINEL_BXT1SNIPERRIFLE_4           = 7931;
const ITEM_UPGRADE_SENTINEL_PHASERIFLE_1                = 7932; 
const ITEM_UPGRADE_SENTINEL_PHASERIFLE_2                = 7933;
const ITEM_UPGRADE_SENTINEL_PHASERIFLE_3                = 7934;
const ITEM_UPGRADE_SENTINEL_PHASERIFLE_4                = 7935;
const ITEM_UPGRADE_SENTINEL_SAP20_1                     = 8305; 
const ITEM_UPGRADE_SENTINEL_SAP20_2                     = 8306;
const ITEM_UPGRADE_SENTINEL_SAP20_3                     = 8307;
const ITEM_UPGRADE_SENTINEL_SAP20_4                     = 8308;
const ITEM_UPGRADE_INFILTRATOR_RHINOSMG_1               = 7960; 
const ITEM_UPGRADE_INFILTRATOR_RHINOSMG_2               = 7961;
const ITEM_UPGRADE_INFILTRATOR_RHINOSMG_3               = 7962;
const ITEM_UPGRADE_INFILTRATOR_RHINOSMG_4               = 7963;
const ITEM_UPGRADE_INFILTRATOR_STEALTHLIGHTSPINFUSOR_1  = 7964; 
const ITEM_UPGRADE_INFILTRATOR_STEALTHLIGHTSPINFUSOR_2  = 7965;
const ITEM_UPGRADE_INFILTRATOR_STEALTHLIGHTSPINFUSOR_3  = 7966;
const ITEM_UPGRADE_INFILTRATOR_REMOTEARXBUSTER_1        = 8298; 
const ITEM_UPGRADE_INFILTRATOR_REMOTEARXBUSTER_2        = 8299;
const ITEM_UPGRADE_INFILTRATOR_REMOTEARXBUSTER_3        = 8300;
const ITEM_UPGRADE_SOLDIER_ASSAULTRIFLE_1               = 7985; 
const ITEM_UPGRADE_SOLDIER_ASSAULTRIFLE_2               = 7986;
const ITEM_UPGRADE_SOLDIER_ASSAULTRIFLE_3               = 7987;
const ITEM_UPGRADE_SOLDIER_ASSAULTRIFLE_4               = 7988;
const ITEM_UPGRADE_SOLDIER_SPINFUSOR_1                  = 7992; 
const ITEM_UPGRADE_SOLDIER_SPINFUSOR_2                  = 7993;
const ITEM_UPGRADE_SOLDIER_SPINFUSOR_3                  = 7994;
const ITEM_UPGRADE_SOLDIER_TWINFUSOR_1                  = 8316; 
const ITEM_UPGRADE_SOLDIER_TWINFUSOR_2                  = 8317;
const ITEM_UPGRADE_SOLDIER_TWINFUSOR_3                  = 8318;
const ITEM_UPGRADE_TECHNICIAN_TCN4SMG_1                 = 8012; 
const ITEM_UPGRADE_TECHNICIAN_TCN4SMG_2                 = 8013;
const ITEM_UPGRADE_TECHNICIAN_TCN4SMG_3                 = 8014;
const ITEM_UPGRADE_TECHNICIAN_TCN4SMG_4                 = 8015;
const ITEM_UPGRADE_TECHNICIAN_THUMPER_1                 = 8016; 
const ITEM_UPGRADE_TECHNICIAN_THUMPER_2                 = 8017;
const ITEM_UPGRADE_TECHNICIAN_THUMPER_3                 = 8018;
const ITEM_UPGRADE_RAIDER_GRENADELAUNCHER_1             = 8045; 
const ITEM_UPGRADE_RAIDER_GRENADELAUNCHER_2             = 8046;
const ITEM_UPGRADE_RAIDER_GRENADELAUNCHER_3             = 8047;
const ITEM_UPGRADE_RAIDER_ARXBUSTER_1                   = 8042; 
const ITEM_UPGRADE_RAIDER_ARXBUSTER_2                   = 8043;
const ITEM_UPGRADE_RAIDER_ARXBUSTER_3                   = 8044;
const ITEM_UPGRADE_JUGGERNAUT_FUSIONMORTAR_1            = 8070; 
const ITEM_UPGRADE_JUGGERNAUT_FUSIONMORTAR_2            = 8071;
const ITEM_UPGRADE_JUGGERNAUT_FUSIONMORTAR_3            = 8072;
const ITEM_UPGRADE_JUGGERNAUT_MIRVLAUNCHER_1            = 8073; 
const ITEM_UPGRADE_JUGGERNAUT_MIRVLAUNCHER_2            = 8074;
const ITEM_UPGRADE_JUGGERNAUT_MIRVLAUNCHER_3            = 8075;
const ITEM_UPGRADE_JUGGERNAUT_LR1MORTAR_1               = 8280; 
const ITEM_UPGRADE_JUGGERNAUT_LR1MORTAR_2               = 8281;
const ITEM_UPGRADE_JUGGERNAUT_LR1MORTAR_3               = 8282;
const ITEM_UPGRADE_DOOMBRINGER_CHAINGUN_1               = 8100; 
const ITEM_UPGRADE_DOOMBRINGER_CHAINGUN_2               = 8101;
const ITEM_UPGRADE_DOOMBRINGER_CHAINGUN_3               = 8102;
const ITEM_UPGRADE_DOOMBRINGER_CHAINGUN_4               = 8103;
const ITEM_UPGRADE_DOOMBRINGER_HEAVYBOLTLAUNCHER_1      = 8104; 
const ITEM_UPGRADE_DOOMBRINGER_HEAVYBOLTLAUNCHER_2      = 8105;
const ITEM_UPGRADE_DOOMBRINGER_HEAVYBOLTLAUNCHER_3      = 8106;
const ITEM_UPGRADE_BRUTE_HEAVYSPINFUSOR_1               = 8124; 
const ITEM_UPGRADE_BRUTE_HEAVYSPINFUSOR_2               = 8125;
const ITEM_UPGRADE_BRUTE_HEAVYSPINFUSOR_3               = 8126;
const ITEM_UPGRADE_BRUTE_PLASMACANNON_1                 = 8292; 
const ITEM_UPGRADE_BRUTE_PLASMACANNON_2                 = 8293;
const ITEM_UPGRADE_BRUTE_PLASMACANNON_3                 = 8294;
const ITEM_UPGRADE_BRUTE_SPIKELAUNCHER_1                = 8386; 
const ITEM_UPGRADE_BRUTE_SPIKELAUNCHER_2                = 8387;
const ITEM_UPGRADE_BRUTE_SPIKELAUNCHER_3                = 8388;


const ITEM_UPGRADE_PATHFINDER_SHOTGUN_1                 = 7861; 
const ITEM_UPGRADE_PATHFINDER_SHOTGUN_2                 = 7862;
const ITEM_UPGRADE_PATHFINDER_SHOTGUN_3                 = 7863;
const ITEM_UPGRADE_PATHFINDER_LIGHTASSAULTRIFLE_1       = 7866; 
const ITEM_UPGRADE_PATHFINDER_LIGHTASSAULTRIFLE_2       = 7867;
const ITEM_UPGRADE_PATHFINDER_LIGHTASSAULTRIFLE_3       = 7868;
const ITEM_UPGRADE_PATHFINDER_LIGHTASSAULTRIFLE_4       = 7869;
const ITEM_UPGRADE_PATHFINDER_BUCKLER_1                 = 8265; 
const ITEM_UPGRADE_PATHFINDER_BUCKLER_2                 = 8266;
const ITEM_UPGRADE_PATHFINDER_BUCKLER_3                 = 8267;
const ITEM_UPGRADE_SENTINEL_NOVABLASTER_1               = 7936; 
const ITEM_UPGRADE_SENTINEL_NOVABLASTER_2               = 7937;
const ITEM_UPGRADE_SENTINEL_NOVABLASTER_3               = 7938;
const ITEM_UPGRADE_SENTINEL_FALCONAUTOPISTOL_1          = 7939; 
const ITEM_UPGRADE_SENTINEL_FALCONAUTOPISTOL_2          = 7940;
const ITEM_UPGRADE_SENTINEL_FALCONAUTOPISTOL_3          = 7941;
const ITEM_UPGRADE_SENTINEL_FALCONAUTOPISTOL_4          = 7942;
const ITEM_UPGRADE_SENTINEL_ACCURIZEDSHOTGUN_1          = 8258; 
const ITEM_UPGRADE_SENTINEL_ACCURIZEDSHOTGUN_2          = 8259;
const ITEM_UPGRADE_SENTINEL_ACCURIZEDSHOTGUN_3          = 8260;
const ITEM_UPGRADE_SENTINEL_ACCURIZEDSHOTGUN_4          = 8261;
const ITEM_UPGRADE_INFILTRATOR_SN7PISTOL_1              = 7967;
const ITEM_UPGRADE_INFILTRATOR_SN7PISTOL_2              = 7968;
const ITEM_UPGRADE_INFILTRATOR_SN7PISTOL_3              = 7969;
const ITEM_UPGRADE_INFILTRATOR_THROWINGKNIVES_1         = 8312;
const ITEM_UPGRADE_INFILTRATOR_THROWINGKNIVES_2         = 8313;
const ITEM_UPGRADE_INFILTRATOR_THROWINGKNIVES_3         = 8314;
const ITEM_UPGRADE_INFILTRATOR_THROWINGKNIVES_4         = 8315;
const ITEM_UPGRADE_SOLDIER_EAGLEPISTOL_1                = 7995; 
const ITEM_UPGRADE_SOLDIER_EAGLEPISTOL_2                = 7996;
const ITEM_UPGRADE_SOLDIER_EAGLEPISTOL_3                = 7997;
const ITEM_UPGRADE_SOLDIER_THUMPERD_1                   = 7989; 
const ITEM_UPGRADE_SOLDIER_THUMPERD_2                   = 7990;
const ITEM_UPGRADE_SOLDIER_THUMPERD_3                   = 7991;
const ITEM_UPGRADE_SOLDIER_PLASMAGUN_1                  = 8295; 
const ITEM_UPGRADE_SOLDIER_PLASMAGUN_2                  = 8296;
const ITEM_UPGRADE_SOLDIER_PLASMAGUN_3                  = 8297;
const ITEM_UPGRADE_TECHNICIAN_REPAIRTOOLSD_1            = 8019; 
const ITEM_UPGRADE_TECHNICIAN_REPAIRTOOLSD_2            = 8020;
const ITEM_UPGRADE_TECHNICIAN_REPAIRTOOLSD_3            = 8021;
const ITEM_UPGRADE_TECHNICIAN_SAWEDOFFSHOTGUN_1         = 8022; 
const ITEM_UPGRADE_TECHNICIAN_SAWEDOFFSHOTGUN_2         = 8023;
const ITEM_UPGRADE_TECHNICIAN_SAWEDOFFSHOTGUN_3         = 8024;
const ITEM_UPGRADE_TECHNICIAN_SPARROWPISTOL_1           = 8025; 
const ITEM_UPGRADE_TECHNICIAN_SPARROWPISTOL_2           = 8026;
const ITEM_UPGRADE_TECHNICIAN_SPARROWPISTOL_3           = 8027;
const ITEM_UPGRADE_RAIDER_NJ4SMG_1                      = 8048; 
const ITEM_UPGRADE_RAIDER_NJ4SMG_2                      = 8049;
const ITEM_UPGRADE_RAIDER_NJ4SMG_3                      = 8050;
const ITEM_UPGRADE_RAIDER_NJ4SMG_4                      = 8051;
const ITEM_UPGRADE_RAIDER_NJ5SMG_1                      = 8289; 
const ITEM_UPGRADE_RAIDER_NJ5SMG_2                      = 8290;
const ITEM_UPGRADE_RAIDER_NJ5SMG_3                      = 8291;
const ITEM_UPGRADE_RAIDER_NJ5SMG_4                      = 8304;
const ITEM_UPGRADE_JUGGERNAUT_SPINFUSORD_1              = 8076; 
const ITEM_UPGRADE_JUGGERNAUT_SPINFUSORD_2              = 8077;
const ITEM_UPGRADE_JUGGERNAUT_SPINFUSORD_3              = 8078;
const ITEM_UPGRADE_JUGGERNAUT_LMG_1                     = 8079; 
const ITEM_UPGRADE_JUGGERNAUT_LMG_2                     = 8080;
const ITEM_UPGRADE_JUGGERNAUT_LMG_3                     = 8081;
const ITEM_UPGRADE_JUGGERNAUT_LMG_4                     = 8082;
const ITEM_UPGRADE_DOOMBRINGER_SABERLAUNCHER_1          = 8107; 
const ITEM_UPGRADE_DOOMBRINGER_SABERLAUNCHER_2          = 8108;
const ITEM_UPGRADE_DOOMBRINGER_SABERLAUNCHER_3          = 8109;
const ITEM_UPGRADE_DOOMBRINGER_ROCKETLAUNCHER_1         = 8301; 
const ITEM_UPGRADE_DOOMBRINGER_ROCKETLAUNCHER_2         = 8302;
const ITEM_UPGRADE_DOOMBRINGER_ROCKETLAUNCHER_3         = 8303;
const ITEM_UPGRADE_BRUTE_AUTOSHOTGUN_1                  = 8127; 
const ITEM_UPGRADE_BRUTE_AUTOSHOTGUN_2                  = 8128;
const ITEM_UPGRADE_BRUTE_AUTOSHOTGUN_3                  = 8129;
const ITEM_UPGRADE_BRUTE_AUTOSHOTGUN_4                  = 8130;
const ITEM_UPGRADE_BRUTE_NOVACOLT_1                     = 8131; 
const ITEM_UPGRADE_BRUTE_NOVACOLT_2                     = 8132;
const ITEM_UPGRADE_BRUTE_NOVACOLT_3                     = 8133;
const ITEM_UPGRADE_BRUTE_NOVACOLT_4                     = 8134;


const ITEM_UPGRADE_PATHFINDER_IMPACTNITRON_1            = 7881; 
const ITEM_UPGRADE_PATHFINDER_IMPACTNITRON_2            = 7882;
const ITEM_UPGRADE_PATHFINDER_IMPACTNITRON_3            = 7883;
const ITEM_UPGRADE_PATHFINDER_GRENADE_ST_1              = 7888; 
const ITEM_UPGRADE_PATHFINDER_GRENADE_ST_2              = 7889;
const ITEM_UPGRADE_PATHFINDER_GRENADE_ST_3              = 7890;
const ITEM_UPGRADE_PATHFINDER_IMPACTBOMBLETS_1          = 8274; 
const ITEM_UPGRADE_PATHFINDER_IMPACTBOMBLETS_2          = 8275;
const ITEM_UPGRADE_PATHFINDER_IMPACTBOMBLETS_3          = 8276;
const ITEM_UPGRADE_SENTINEL_CLAYMORE_1                  = 7943; 
const ITEM_UPGRADE_SENTINEL_CLAYMORE_2                  = 7944;
const ITEM_UPGRADE_SENTINEL_CLAYMORE_3                  = 7945;
const ITEM_UPGRADE_SENTINEL_GRENADEXL_1                 = 7946; 
const ITEM_UPGRADE_SENTINEL_GRENADEXL_2                 = 7947;
const ITEM_UPGRADE_SENTINEL_GRENADEXL_3                 = 7948;
const ITEM_UPGRADE_SENTINEL_ARMOREDCLAYMORE_1           = 8262; 
const ITEM_UPGRADE_SENTINEL_ARMOREDCLAYMORE_2           = 8263;
const ITEM_UPGRADE_SENTINEL_ARMOREDCLAYMORE_3           = 8264;
const ITEM_UPGRADE_INFILTRATOR_STICKYGRENADE_1          = 7970; 
const ITEM_UPGRADE_INFILTRATOR_STICKYGRENADE_2          = 7971;
const ITEM_UPGRADE_INFILTRATOR_STICKYGRENADE_3          = 7972;
const ITEM_UPGRADE_INFILTRATOR_STICKYGRENADE_4          = 7973;
const ITEM_UPGRADE_INFILTRATOR_PRISMMINES_1             = 7974; 
const ITEM_UPGRADE_INFILTRATOR_PRISMMINES_2             = 7975;
const ITEM_UPGRADE_INFILTRATOR_PRISMMINES_3             = 7976;
const ITEM_UPGRADE_INFILTRATOR_NINJASMOKE_1             = 8286; 
const ITEM_UPGRADE_INFILTRATOR_NINJASMOKE_2             = 8287;
const ITEM_UPGRADE_INFILTRATOR_NINJASMOKE_3             = 8288;
const ITEM_UPGRADE_SOLDIER_FRAGGRENADEXL_1              = 7998; 
const ITEM_UPGRADE_SOLDIER_FRAGGRENADEXL_2              = 7999;
const ITEM_UPGRADE_SOLDIER_FRAGGRENADEXL_3              = 8000;
const ITEM_UPGRADE_SOLDIER_APGRENADE_1                  = 8001; 
const ITEM_UPGRADE_SOLDIER_APGRENADE_2                  = 8002;
const ITEM_UPGRADE_SOLDIER_APGRENADE_3                  = 8003;
const ITEM_UPGRADE_SOLDIER_PROXIMITYGRENADE_1           = 8227; 
const ITEM_UPGRADE_SOLDIER_PROXIMITYGRENADE_2           = 8228;
const ITEM_UPGRADE_SOLDIER_PROXIMITYGRENADE_3           = 8229;
const ITEM_UPGRADE_TECHNICIAN_TCNGGRENADE_1             = 8028; 
const ITEM_UPGRADE_TECHNICIAN_TCNGGRENADE_2             = 8029;
const ITEM_UPGRADE_TECHNICIAN_TCNGGRENADE_3             = 8030;
const ITEM_UPGRADE_TECHNICIAN_MOTIONALARM_1             = 8031; 
const ITEM_UPGRADE_TECHNICIAN_MOTIONALARM_2             = 8032;
const ITEM_UPGRADE_TECHNICIAN_MOTIONALARM_3             = 8033;
const ITEM_UPGRADE_RAIDER_EMPGRENADE_1                  = 8052; 
const ITEM_UPGRADE_RAIDER_EMPGRENADE_2                  = 8053;
const ITEM_UPGRADE_RAIDER_EMPGRENADE_3                  = 8054;
const ITEM_UPGRADE_RAIDER_WHITEOUTGRENADE_1             = 8055; 
const ITEM_UPGRADE_RAIDER_WHITEOUTGRENADE_2             = 8056;
const ITEM_UPGRADE_RAIDER_WHITEOUTGRENADE_3             = 8057;
const ITEM_UPGRADE_RAIDER_MIRVGRENADE_1                 = 8283; 
const ITEM_UPGRADE_RAIDER_MIRVGRENADE_2                 = 8284;
const ITEM_UPGRADE_RAIDER_MIRVGRENADE_3                 = 8285;
const ITEM_UPGRADE_JUGGERNAUT_HEAVYAPGRENADE_1          = 8083; 
const ITEM_UPGRADE_JUGGERNAUT_HEAVYAPGRENADE_2          = 8084;
const ITEM_UPGRADE_JUGGERNAUT_HEAVYAPGRENADE_3          = 8085;
const ITEM_UPGRADE_JUGGERNAUT_DISKTOSS_1                = 8086; 
const ITEM_UPGRADE_JUGGERNAUT_DISKTOSS_2                = 8087;
const ITEM_UPGRADE_JUGGERNAUT_DISKTOSS_3                = 8088;
const ITEM_UPGRADE_DOOMBRINGER_GRENADE_1                = 8110; 
const ITEM_UPGRADE_DOOMBRINGER_GRENADE_2                = 8111;
const ITEM_UPGRADE_DOOMBRINGER_GRENADE_3                = 8112;
const ITEM_UPGRADE_DOOMBRINGER_MINES_1                  = 8113; 
const ITEM_UPGRADE_DOOMBRINGER_MINES_2                  = 8114;
const ITEM_UPGRADE_DOOMBRINGER_MINES_3                  = 8115;
const ITEM_UPGRADE_BRUTE_FRACTALGRENADE_1               = 8135; 
const ITEM_UPGRADE_BRUTE_FRACTALGRENADE_2               = 8136;
const ITEM_UPGRADE_BRUTE_FRACTALGRENADE_3               = 8137;
const ITEM_UPGRADE_BRUTE_STICKYGRENADE_1                = 8138; 
const ITEM_UPGRADE_BRUTE_STICKYGRENADE_2                = 8139;
const ITEM_UPGRADE_BRUTE_STICKYGRENADE_3                = 8140;


const ITEM_UPGRADE_PATHFINDER_ENERGYRECHARGEPACK_1      = 7871; 
const ITEM_UPGRADE_PATHFINDER_ENERGYRECHARGEPACK_2      = 7872;
const ITEM_UPGRADE_PATHFINDER_ENERGYRECHARGEPACK_3      = 7873;
const ITEM_UPGRADE_PATHFINDER_JUMPPACK_1                = 7876; 
const ITEM_UPGRADE_PATHFINDER_JUMPPACK_2                = 7877;
const ITEM_UPGRADE_PATHFINDER_JUMPPACK_3                = 7878;
const ITEM_UPGRADE_SENTINEL_DROPJAMMER_1                = 7949; 
const ITEM_UPGRADE_SENTINEL_DROPJAMMER_2                = 7950;
const ITEM_UPGRADE_SENTINEL_DROPJAMMER_3                = 7951;
const ITEM_UPGRADE_SENTINEL_ENERGYRECHARGEPACK_1        = 7952; 
const ITEM_UPGRADE_SENTINEL_ENERGYRECHARGEPACK_2        = 7953;
const ITEM_UPGRADE_SENTINEL_ENERGYRECHARGEPACK_3        = 7954;
const ITEM_UPGRADE_INFILTRATOR_STEALTHPACK_1            = 7977; 
const ITEM_UPGRADE_INFILTRATOR_STEALTHPACK_2            = 7978;
const ITEM_UPGRADE_INFILTRATOR_STEALTHPACK_3            = 7979;
const ITEM_UPGRADE_INFILTRATOR_HIGHSPEEDSTEALTH_1       = 8271; 
const ITEM_UPGRADE_INFILTRATOR_HIGHSPEEDSTEALTH_2       = 8272;
const ITEM_UPGRADE_INFILTRATOR_HIGHSPEEDSTEALTH_3       = 8273;
const ITEM_UPGRADE_SOLDIER_ENERGYPACK_1                 = 8004; 
const ITEM_UPGRADE_SOLDIER_ENERGYPACK_2                 = 8005;
const ITEM_UPGRADE_SOLDIER_ENERGYPACK_3                 = 8006;
const ITEM_UPGRADE_SOLDIER_UTILITYPACK_1                = 8224; 
const ITEM_UPGRADE_SOLDIER_UTILITYPACK_2                = 8225;
const ITEM_UPGRADE_SOLDIER_UTILITYPACK_3                = 8226;
const ITEM_UPGRADE_TECHNICIAN_LIGHTTURRET_1             = 8034; 
const ITEM_UPGRADE_TECHNICIAN_LIGHTTURRET_2             = 8035;
const ITEM_UPGRADE_TECHNICIAN_LIGHTTURRET_3             = 8036;
const ITEM_UPGRADE_TECHNICIAN_EXRTURRET_1               = 8268; 
const ITEM_UPGRADE_TECHNICIAN_EXRTURRET_2               = 8269;
const ITEM_UPGRADE_TECHNICIAN_EXRTURRET_3               = 8270;
const ITEM_UPGRADE_RAIDER_SHIELDPACK_1                  = 8058; 
const ITEM_UPGRADE_RAIDER_SHIELDPACK_2                  = 8059;
const ITEM_UPGRADE_RAIDER_SHIELDPACK_3                  = 8060;
const ITEM_UPGRADE_RAIDER_JAMMERPACK_1                  = 8061; 
const ITEM_UPGRADE_RAIDER_JAMMERPACK_2                  = 8062;
const ITEM_UPGRADE_RAIDER_JAMMERPACK_3                  = 8063;
const ITEM_UPGRADE_RAIDER_JAMMERPACK_4                  = 8064;
const ITEM_UPGRADE_JUGGERNAUT_HEALTHREGENPACK_1         = 8089; 
const ITEM_UPGRADE_JUGGERNAUT_HEALTHREGENPACK_2         = 8090;
const ITEM_UPGRADE_JUGGERNAUT_HEALTHREGENPACK_3         = 8091;
const ITEM_UPGRADE_JUGGERNAUT_ENERGYPACK_1              = 8092; 
const ITEM_UPGRADE_JUGGERNAUT_ENERGYPACK_2              = 8093;
const ITEM_UPGRADE_JUGGERNAUT_ENERGYPACK_3              = 8094;
const ITEM_UPGRADE_JUGGERNAUT_SURVIVALPACK_1            = 8309; 
const ITEM_UPGRADE_JUGGERNAUT_SURVIVALPACK_2            = 8310;
const ITEM_UPGRADE_JUGGERNAUT_SURVIVALPACK_3            = 8311;
const ITEM_UPGRADE_DOOMBRINGER_FORCEFIELD_1             = 8116; 
const ITEM_UPGRADE_DOOMBRINGER_FORCEFIELD_2             = 8117;
const ITEM_UPGRADE_DOOMBRINGER_FORCEFIELD_3             = 8118;
const ITEM_UPGRADE_BRUTE_ENERGYPACK_1                   = 8141; 
const ITEM_UPGRADE_BRUTE_ENERGYPACK_2                   = 8142;
const ITEM_UPGRADE_BRUTE_ENERGYPACK_3                   = 8143;
const ITEM_UPGRADE_BRUTE_SHIELDPACK_1                   = 8144; 
const ITEM_UPGRADE_BRUTE_SHIELDPACK_2                   = 8145;
const ITEM_UPGRADE_BRUTE_SHIELDPACK_3                   = 8146;


const ITEM_UPGRADE_PATHFINDER_ARMOR_1                   = 7893; 
const ITEM_UPGRADE_PATHFINDER_ARMOR_2                   = 7894;
const ITEM_UPGRADE_PATHFINDER_ARMOR_3                   = 7895;
const ITEM_UPGRADE_PATHFINDER_ARMOR_4                   = 7896;
const ITEM_UPGRADE_PATHFINDER_ARMOR_5                   = 7897;
const ITEM_UPGRADE_SENTINEL_ARMOR_1                     = 7955; 
const ITEM_UPGRADE_SENTINEL_ARMOR_2                     = 7956;
const ITEM_UPGRADE_SENTINEL_ARMOR_3                     = 7957;
const ITEM_UPGRADE_SENTINEL_ARMOR_4                     = 7958;
const ITEM_UPGRADE_SENTINEL_ARMOR_5                     = 7959;
const ITEM_UPGRADE_INFILTRATOR_ARMOR_1                  = 7980; 
const ITEM_UPGRADE_INFILTRATOR_ARMOR_2                  = 7981;
const ITEM_UPGRADE_INFILTRATOR_ARMOR_3                  = 7982;
const ITEM_UPGRADE_INFILTRATOR_ARMOR_4                  = 7983;
const ITEM_UPGRADE_INFILTRATOR_ARMOR_5                  = 7984;
const ITEM_UPGRADE_SOLDIER_ARMOR_1                      = 8007; 
const ITEM_UPGRADE_SOLDIER_ARMOR_2                      = 8008;
const ITEM_UPGRADE_SOLDIER_ARMOR_3                      = 8009;
const ITEM_UPGRADE_SOLDIER_ARMOR_4                      = 8010;
const ITEM_UPGRADE_SOLDIER_ARMOR_5                      = 8011;
const ITEM_UPGRADE_TECHNICIAN_ARMOR_1                   = 8037; 
const ITEM_UPGRADE_TECHNICIAN_ARMOR_2                   = 8038;
const ITEM_UPGRADE_TECHNICIAN_ARMOR_3                   = 8039;
const ITEM_UPGRADE_TECHNICIAN_ARMOR_4                   = 8040;
const ITEM_UPGRADE_TECHNICIAN_ARMOR_5                   = 8041;
const ITEM_UPGRADE_RAIDER_ARMOR_1                       = 8065; 
const ITEM_UPGRADE_RAIDER_ARMOR_2                       = 8066;
const ITEM_UPGRADE_RAIDER_ARMOR_3                       = 8067;
const ITEM_UPGRADE_RAIDER_ARMOR_4                       = 8068;
const ITEM_UPGRADE_RAIDER_ARMOR_5                       = 8069;
const ITEM_UPGRADE_JUGGERNAUT_ARMOR_1                   = 8095; 
const ITEM_UPGRADE_JUGGERNAUT_ARMOR_2                   = 8096;
const ITEM_UPGRADE_JUGGERNAUT_ARMOR_3                   = 8097;
const ITEM_UPGRADE_JUGGERNAUT_ARMOR_4                   = 8098;
const ITEM_UPGRADE_JUGGERNAUT_ARMOR_5                   = 8099;
const ITEM_UPGRADE_DOOMBRINGER_ARMOR_1                  = 8119; 
const ITEM_UPGRADE_DOOMBRINGER_ARMOR_2                  = 8120;
const ITEM_UPGRADE_DOOMBRINGER_ARMOR_3                  = 8121;
const ITEM_UPGRADE_DOOMBRINGER_ARMOR_4                  = 8122;
const ITEM_UPGRADE_DOOMBRINGER_ARMOR_5                  = 8123;
const ITEM_UPGRADE_BRUTE_ARMOR_1                        = 8147; 
const ITEM_UPGRADE_BRUTE_ARMOR_2                        = 8148;
const ITEM_UPGRADE_BRUTE_ARMOR_3                        = 8149;
const ITEM_UPGRADE_BRUTE_ARMOR_4                        = 8150;
const ITEM_UPGRADE_BRUTE_ARMOR_5                        = 8151;


const ITEM_PERK_UPGRADE_BOUNTYHUNTER_1                  = 8188;
const ITEM_PERK_UPGRADE_BOUNTYHUNTER_2                  = 8189;
const ITEM_PERK_UPGRADE_BOUNTYHUNTER_3                  = 8190;
const ITEM_PERK_UPGRADE_CLOSECOMBAT_1                   = 8194;
const ITEM_PERK_UPGRADE_CLOSECOMBAT_2                   = 8195;
const ITEM_PERK_UPGRADE_CLOSECOMBAT_3                   = 8196;
const ITEM_PERK_UPGRADE_EGOCENTRIC_1                    = 8173;
const ITEM_PERK_UPGRADE_EGOCENTRIC_2                    = 8174;
const ITEM_PERK_UPGRADE_EGOCENTRIC_3                    = 8175;
const ITEM_PERK_UPGRADE_LOOTER_1                        = 8185;
const ITEM_PERK_UPGRADE_LOOTER_2                        = 8186;
const ITEM_PERK_UPGRADE_LOOTER_3                        = 8187;
const ITEM_PERK_UPGRADE_MECHANIC_1                      = 8215;
const ITEM_PERK_UPGRADE_MECHANIC_2                      = 8216;
const ITEM_PERK_UPGRADE_MECHANIC_3                      = 8217;
const ITEM_PERK_UPGRADE_PILOT_1                         = 8179;
const ITEM_PERK_UPGRADE_PILOT_2                         = 8180;
const ITEM_PERK_UPGRADE_PILOT_3                         = 8181;
const ITEM_PERK_UPGRADE_POTENTIALENERGY_1               = 8200;
const ITEM_PERK_UPGRADE_POTENTIALENERGY_2               = 8201;
const ITEM_PERK_UPGRADE_POTENTIALENERGY_3               = 8202;
const ITEM_PERK_UPGRADE_QUICKDRAW_1                     = 8209;
const ITEM_PERK_UPGRADE_QUICKDRAW_2                     = 8210;
const ITEM_PERK_UPGRADE_QUICKDRAW_3                     = 8211;
const ITEM_PERK_UPGRADE_REACH_1                         = 8152;
const ITEM_PERK_UPGRADE_REACH_2                         = 8171;
const ITEM_PERK_UPGRADE_REACH_3                         = 8172;
const ITEM_PERK_UPGRADE_SAFEFALL_1                      = 8176;
const ITEM_PERK_UPGRADE_SAFEFALL_2                      = 8177;
const ITEM_PERK_UPGRADE_SAFEFALL_3                      = 8178;
const ITEM_PERK_UPGRADE_SAFETYTHIRD_1                   = 8212;
const ITEM_PERK_UPGRADE_SAFETYTHIRD_2                   = 8213;
const ITEM_PERK_UPGRADE_SAFETYTHIRD_3                   = 8214;
const ITEM_PERK_UPGRADE_STEALTHY_1                      = 8206;
const ITEM_PERK_UPGRADE_STEALTHY_2                      = 8207;
const ITEM_PERK_UPGRADE_STEALTHY_3                      = 8208;
const ITEM_PERK_UPGRADE_SUPERHEAVY_1                    = 8197;
const ITEM_PERK_UPGRADE_SUPERHEAVY_2                    = 8198;
const ITEM_PERK_UPGRADE_SUPERHEAVY_3                    = 8199;
const ITEM_PERK_UPGRADE_SURVIVALIST_1                   = 8191;
const ITEM_PERK_UPGRADE_SURVIVALIST_2                   = 8192;
const ITEM_PERK_UPGRADE_SURVIVALIST_3                   = 8193;
const ITEM_PERK_UPGRADE_ULTRACAPACITOR_1                = 8203;
const ITEM_PERK_UPGRADE_ULTRACAPACITOR_2                = 8204;
const ITEM_PERK_UPGRADE_ULTRACAPACITOR_3                = 8205;
const ITEM_PERK_UPGRADE_WHEELDEAL_1                     = 8182;
const ITEM_PERK_UPGRADE_WHEELDEAL_2                     = 8183;
const ITEM_PERK_UPGRADE_WHEELDEAL_3                     = 8184;
const ITEM_PERK_UPGRADE_RAGE_1                          = 8236;
const ITEM_PERK_UPGRADE_RAGE_2                          = 8237;
const ITEM_PERK_UPGRADE_RAGE_3                          = 8238;
const ITEM_PERK_UPGRADE_SONICPUNCH_1                    = 8233;
const ITEM_PERK_UPGRADE_SONICPUNCH_2                    = 8234;
const ITEM_PERK_UPGRADE_SONICPUNCH_3                    = 8235;


const ITEM_UPGRADE_TEMP                                 = 99999;


const SHOP_VENDOR_GOLD									= 507;
const SHOP_VENDOR_BUNDLES								= 518;
const SHOP_VENDOR_BOOSTERS								= 508;
const SHOP_VENDOR_NAMECHANGE							= 512;
const SHOP_VENDOR_CLANTAG                               = 545;


const SKIN_INFILTRATOR_BE                               = 6;
const SKIN_INFILTRATOR_DS                               = 7;
const SKIN_SENTINEL_BE	                                = 8;
const SKIN_SENTINEL_DS	                                = 9;
const SKIN_RAIDER_BE	                                = 10;
const SKIN_RAIDER_DS	                                = 11;
const SKIN_TECHNICIAN_BE                                = 12;
const SKIN_TECHNICIAN_DS                                = 13;
const SKIN_DOOMBRINGER_BE                               = 14;
const SKIN_DOOMBRINGER_DS                               = 15;
const SKIN_JUGGERNAUT_BE                                = 16;
const SKIN_JUGGERNAUT_DS                                = 17;
const SKIN_BRUTE_BE                                     = 18;
const SKIN_BRUTE_DS                                     = 19;
const SKIN_SOLDIER_BE                                   = 20;
const SKIN_SOLDIER_DS                                   = 21;
const SKIN_PATHFINDER_BE                                = 22;
const SKIN_PATHFINDER_DS                                = 23;
const SKIN_PATHFINDER_MC                                = 24;
const SKIN_INFILTRATOR_AS                               = 25;
const SKIN_INFILTRATOR_MC                               = 26;
const SKIN_RAIDER_GV                                    = 25;
const SKIN_RAIDER_MC                                    = 26;
const SKIN_SENTINEL_MC	                                = 27;
const SKIN_BRUTE_MC                                     = 28;
const SKIN_TECHNICIAN_MC                                = 29;

const QUEUE_CONFIG_SERVERNAME                           = 1243;
const QUEUE_CONFIG_ADMINPASSWORD                        = 1245;
const QUEUE_CONFIG_GENPASSWORD                          = 1246;
const QUEUE_CONFIG_SLOTS                                = 1247;
const QUEUE_CONFIG_MATCHQUEUEID                         = 1253;
const QUEUE_CONFIG_SERVERDESCRIPTION                    = 1255;
const QUEUE_CONFIG_MAPROTATIONTYPE                      = 1256;
const QUEUE_CONFIG_MAPSLOT1                             = 1257;
const QUEUE_CONFIG_MAPSLOT2                             = 1258;
const QUEUE_CONFIG_MAPSLOT3                             = 1259;
const QUEUE_CONFIG_MAPSLOT4                             = 1260;
const QUEUE_CONFIG_MAPSLOT5                             = 1261;
const QUEUE_CONFIG_MAPSLOT6                             = 1262;
const QUEUE_CONFIG_MAPSLOT7                             = 1263;
const QUEUE_CONFIG_MAPSLOT8                             = 1264;
const QUEUE_CONFIG_SITEID                               = 1272;
const QUEUE_CONFIG_MINLEVEL                             = 1296;
const QUEUE_CONFIG_MAXLEVEL                             = 1297;

const GAME_CONFIG_TIMELIMIT                             = 1059;
const GAME_CONFIG_MAXPLAYERS                            = 1060;
const GAME_CONFIG_AUTOBALANCE                           = 1062;
const GAME_CONFIG_OVERTIMELIMIT                         = 1063;
const GAME_CONFIG_RESPAWNTIME                           = 1064;
const GAME_CONFIG_FRIENDLYFIRE                          = 1065;
const GAME_CONFIG_GENAUTOREGEN                          = 1066;
const GAME_CONFIG_UPGRADES                              = 1067;
const GAME_CONFIG_SPAWNNAKED                            = 1068;
const GAME_CONFIG_BASEASSETS                            = 1070;
const GAME_CONFIG_POWERDEPLOYS                          = 1072;
const GAME_CONFIG_VEHICLELIMITS                         = 1075;
const GAME_CONFIG_VGRAVCYCLELIMIT                       = 1268;
const GAME_CONFIG_VBEOWULFLIMIT                         = 1269;
const GAME_CONFIG_VSHRIKELIMIT                          = 1270;
const GAME_CONFIG_VBEOWULFPRICE                         = 1076;
const GAME_CONFIG_VGRAVPRICE                            = 1077;
const GAME_CONFIG_VSHRIKEPRICE                          = 1080;
const GAME_CONFIG_TEAMJOINTYPE                          = 1081;
const GAME_CONFIG_FFMULTIPLIER                          = 1123;
const GAME_CONFIG_CALLINSDENIED                         = 1233;
const GAME_CONFIG_CALLINPRICETAC                        = 1234;
const GAME_CONFIG_CALLINPRICESUP                        = 1235;
const GAME_CONFIG_CALLINPRICEORB                        = 1236;
const GAME_CONFIG_CALLINCLDWNTAC                        = 1237;
const GAME_CONFIG_CALLINCLDWNSUP                        = 1238;
const GAME_CONFIG_CALLINCLDWNORB                        = 1239;
const GAME_CONFIG_CALLINBLDUPTAC                        = 1249;
const GAME_CONFIG_CALLINBLDUPSUP                        = 1250;
const GAME_CONFIG_CALLINBLDUPORB                        = 1251;
const GAME_CONFIG_BASEDESTLIMIT                         = 1241;
const GAME_CONFIG_WARMUPTIME                            = 1248;
const GAME_CONFIG_TEAMDISPARITY                         = 1252;
const GAME_CONFIG_CONFIGCASEID                          = 1254;
const GAME_CONFIG_ARENAROUNDS                           = 1265;
const GAME_CONFIG_SCORELIMIT_CTF                        = 1061;
const GAME_CONFIG_SCORELIMIT_RAB                        = 1278;
const GAME_CONFIG_SCORELIMIT_TDM                        = 1276;
const GAME_CONFIG_SCORELIMIT_ARN                        = 1277;
const GAME_CONFIG_SCORELIMIT_CAH                        = 1279;
const GAME_CONFIG_GAMETYPE                              = 1244;
const GAME_CONFIG_GENDESTROYABLE                        = 1280;
const GAME_CONFIG_INVDESTROYABLE                        = 1281;
const GAME_CONFIG_FFDEPLOYABLES                         = 1282;
const GAME_CONFIG_FFBASEASSETS                          = 1283;
const GAME_CONFIG_FFDMGLIMIT                            = 1284;
const GAME_CONFIG_FFKILLLIMIT                           = 1285;
const GAME_CONFIG_SUPPLYDROPAMMOONLY                    = 1286;
const GAME_CONFIG_CLASSCOUNT_PTH                        = 1287;
const GAME_CONFIG_CLASSCOUNT_SEN                        = 1289;
const GAME_CONFIG_CLASSCOUNT_INF                        = 1288;
const GAME_CONFIG_CLASSCOUNT_SLD                        = 1290;
const GAME_CONFIG_CLASSCOUNT_TCN                        = 1291;
const GAME_CONFIG_CLASSCOUNT_RDR                        = 1292;
const GAME_CONFIG_CLASSCOUNT_JUG                        = 1293;
const GAME_CONFIG_CLASSCOUNT_DMB                        = 1294;
const GAME_CONFIG_CLASSCOUNT_BRT                        = 1295;
const GAME_CONFIG_POWEREDCALLINS                        = 1298;
const GAME_CONFIG_TEAMCREDITS                           = 1299;
const GAME_CONFIG_VEHICLEHEALTHMULT                     = 1327;
const GAME_CONFIG_SKIENABLED                            = 1373;
const GAME_CONFIG_ENERGYMULTIPLIER                      = 1374;
const GAME_CONFIG_AOESIZEMULTIPLIER                     = 1375;
const GAME_CONFIG_AOEDAMAGEMULTIPLIER                   = 1376;
const GAME_CONFIG_CTFBLITZALLFLAGSMOVE                  = 1377;
const GAME_CONFIG_MAXSPEEDWITHFLAGLIGHT	                = 1391;
const GAME_CONFIG_DECELERATIONRATEWITHFLAG 	            = 1392;
const GAME_CONFIG_MAXSPEEDWITHFLAGMEDIUM	            = 1395;
const GAME_CONFIG_MAXSPEEDWITHFLAGHEAVY                 = 1396;

const SERVER_RT_METHOD_RANDOM                           = 10070;
const SERVER_RT_METHOD_LINEAR                           = 10071;
const SERVER_RT_METHOD_LINEAR2                          = 10072;
const SERVER_RT_METHOD_LINEAR4                          = 10073;

const TR_MAX_GAMETYPES                                  = 5;

const SERVER_GAMECLASSID_CTF                            = 197;
const SERVER_GAMECLASSID_RAB                            = 8012;
const SERVER_GAMECLASSID_TDM                            = 8036;
const SERVER_GAMECLASSID_ARN                            = 8086;
const SERVER_GAMECLASSID_CAH                            = 8094;
const SERVER_GAMECLASSID_BTZ                            = 8118;

const SERVER_DEFAULT_MAP_CTF                            = 1462;
const SERVER_DEFAULT_MAP_RAB                            = 1465;
const SERVER_DEFAULT_MAP_TDM                            = 1488;
const SERVER_DEFAULT_MAP_ARN                            = 1495;
const SERVER_DEFAULT_MAP_CAH                            = 1519;
const SERVER_DEFAULT_MAP_BTZ                            = 1539;

const PTH_LOADOUT_ONE                                   = 8359;
const PTH_LOADOUT_TWO                                   = 8360;
const PTH_LOADOUT_THREE                                 = 8361;
const PTH_LOADOUT_FOUR                                  = 8674;
const PTH_LOADOUT_FIVE                                  = 8675;
const INF_LOADOUT_ONE                                   = 8362;
const INF_LOADOUT_TWO                                   = 8363;
const INF_LOADOUT_THREE                                 = 8364;
const INF_LOADOUT_FOUR                                  = 8676;
const INF_LOADOUT_FIVE                                  = 8677;
const SEN_LOADOUT_ONE                                   = 8365;
const SEN_LOADOUT_TWO                                   = 8366;
const SEN_LOADOUT_THREE                                 = 8367;
const SEN_LOADOUT_FOUR                                  = 8678;
const SEN_LOADOUT_FIVE                                  = 8679;
const SLD_LOADOUT_ONE                                   = 8368;
const SLD_LOADOUT_TWO                                   = 8369;
const SLD_LOADOUT_THREE                                 = 8370;
const SLD_LOADOUT_FOUR                                  = 8680;
const SLD_LOADOUT_FIVE                                  = 8681;
const TCN_LOADOUT_ONE                                   = 8371;
const TCN_LOADOUT_TWO                                   = 8372;
const TCN_LOADOUT_THREE                                 = 8373;
const TCN_LOADOUT_FOUR                                  = 8682;
const TCN_LOADOUT_FIVE                                  = 8683;
const RDR_LOADOUT_ONE                                   = 8374;
const RDR_LOADOUT_TWO                                   = 8375;
const RDR_LOADOUT_THREE                                 = 8376;
const RDR_LOADOUT_FOUR                                  = 8684;
const RDR_LOADOUT_FIVE                                  = 8685;
const JUG_LOADOUT_ONE                                   = 8377;
const JUG_LOADOUT_TWO                                   = 8378;
const JUG_LOADOUT_THREE                                 = 8379;
const JUG_LOADOUT_FOUR                                  = 8686;
const JUG_LOADOUT_FIVE                                  = 8687;
const DMB_LOADOUT_ONE                                   = 8380;
const DMB_LOADOUT_TWO                                   = 8381;
const DMB_LOADOUT_THREE                                 = 8382;
const DMB_LOADOUT_FOUR                                  = 8688;
const DMB_LOADOUT_FIVE                                  = 8689;
const BRT_LOADOUT_ONE                                   = 8383;
const BRT_LOADOUT_TWO                                   = 8384;
const BRT_LOADOUT_THREE                                 = 8385;
const BRT_LOADOUT_FOUR                                  = 8690;
const BRT_LOADOUT_FIVE                                  = 8691;

const ACTIVITY_DEVICE_NONE                              = 0;
const ACTIVITY_SENTINEL_PRIMARY_BXT1                    = 124;
const ACTIVITY_SENTINEL_BELT_MINE_CLAYMORE_MKD          = 125;
const ACTIVITY_SENTINEL_PRIMARY_SNIPERRIFLE_MKD         = 126;
const ACTIVITY_BRUTE_PRIMARY_HEAVYSPINFUSOR             = 127;
const ACTIVITY_BRUTE_PRIMARY_HEAVYSPINFUSOR_MKD         = 128;
const ACTIVITY_BRUTE_PRIMARY_SPIKELAUNCHER              = 129;
const ACTIVITY_DOOMBRINGER_PRIMARY_CHAINGUN             = 131;
const ACTIVITY_DOOMBRINGER_PRIMARY_CHAINGUN_MKD         = 132;
const ACTIVITY_DOOMBRINGER_PRIMARY_HEAVYBOLTLAUNCHER    = 133;
const ACTIVITY_INFILTRATOR_PRIMARY_REMOTEARXBUSTER      = 134;
const ACTIVITY_INFILTRATOR_PRIMARY_RHINOSMG             = 135;
const ACTIVITY_INFILTRATOR_PRIMARY_RHINOSMG_MKD         = 136;
const ACTIVITY_INFILTRATOR_PRIMARY_STEALTHLIGHTSPINFUSOR = 137;
const ACTIVITY_JUGGERNAUT_PRIMARY_FUSIONMORTAR          = 138;
const ACTIVITY_JUGGERNAUT_PRIMARY_FUSIONMORTAR_MKD      = 139;
const ACTIVITY_JUGGERNAUT_PRIMARY_MIRVLAUNCHER          = 140;
const ACTIVITY_PATHFINDER_PRIMARY_BOLTLAUNCHER          = 141;
const ACTIVITY_PATHFINDER_PRIMARY_LIGHTSPINFUSOR        = 142;
const ACTIVITY_PATHFINDER_PRIMARY_LIGHTSPINFUSOR_MKD    = 143;
const ACTIVITY_RAIDER_PRIMARY_ARXBUSTER                 = 144;
const ACTIVITY_RAIDER_PRIMARY_ARXBUSTER_MKD             = 145;
const ACTIVITY_RAIDER_PRIMARY_GRENADELAUNCHER           = 146;
const ACTIVITY_RAIDER_PRIMARY_PLASMAGUN                 = 147;
const ACTIVITY_SENTINEL_PRIMARY_PHASERIFLE              = 148;
const ACTIVITY_SOLDIER_PRIMARY_ASSAULTRIFLE             = 149;
const ACTIVITY_SOLDIER_PRIMARY_ASSAULTRIFLE_MKD         = 150;
const ACTIVITY_SOLDIER_PRIMARY_SPINFUSOR                = 151;
const ACTIVITY_TECHNICIAN_PRIMARY_TCN4                  = 152;
const ACTIVITY_TECHNICIAN_PRIMARY_TCN4_MKD              = 153;
const ACTIVITY_TECHNICIAN_PRIMARY_THUMPER               = 154;
const ACTIVITY_BRUTE_SECONDARY_AUTOSHOTGUN              = 155;
const ACTIVITY_BRUTE_SECONDARY_AUTOSHOTGUN_MKD          = 156;
const ACTIVITY_BRUTE_SECONDARY_NOVACOLT                 = 157;
const ACTIVITY_BRUTE_SECONDARY_PLASMACANNON             = 158;
const ACTIVITY_DOOMBRINGER_SECONDARY_SABERLAUNCHER      = 159;
const ACTIVITY_DOOMBRINGER_SECONDARY_SABERLAUNCHER_MKD  = 160;
const ACTIVITY_INFILTRATOR_SECONDARY_SN7                = 161;
const ACTIVITY_INFILTRATOR_SECONDARY_SN7_MKD            = 162;
const ACTIVITY_INFILTRATOR_SECONDARY_THROWINGKNIVES     = 163;
const ACTIVITY_JUGGERNAUT_SECONDARY_SPINFUSORD          = 164;
const ACTIVITY_JUGGERNAUT_SECONDARY_SPINFUSORD_MKD      = 165;
const ACTIVITY_JUGGERNAUT_SECONDARY_X1LMG               = 166;
const ACTIVITY_PATHFINDER_SECONDARY_LIGHTASSAULTRIFLE   = 167;
const ACTIVITY_PATHFINDER_SECONDARY_SHOTGUN             = 168;
const ACTIVITY_PATHFINDER_SECONDARY_SHOTGUN_MKD         = 169;
const ACTIVITY_RAIDER_SECONDARY_NJ4SMG                  = 170;
const ACTIVITY_RAIDER_SECONDARY_NJ4SMG_MKD              = 171;
const ACTIVITY_RAIDER_SECONDARY_NJ5SMG                  = 172;
const ACTIVITY_SENTINEL_SECONDARY_FALCON                = 173;
const ACTIVITY_SENTINEL_SECONDARY_NOVABLASTER           = 174;
const ACTIVITY_SENTINEL_SECONDARY_NOVABLASTER_MKD       = 175;
const ACTIVITY_SOLDIER_SECONDARY_EAGLE                  = 176;
const ACTIVITY_SOLDIER_SECONDARY_THUMPERD               = 177;
const ACTIVITY_SOLDIER_SECONDARY_THUMPERD_MKD           = 178;
const ACTIVITY_TECHNICIAN_SECONDARY_REPAIRTOOLSD        = 179;
const ACTIVITY_TECHNICIAN_SECONDARY_REPAIRTOOLSD_MKD    = 180;
const ACTIVITY_TECHNICIAN_SECONDARY_SAWEDOFF            = 181;
const ACTIVITY_TECHNICIAN_SECONDARY_SPARROW             = 182;
const ACTIVITY_ARMOR_MOD_BRUTE_1                        = 183;
const ACTIVITY_ARMOR_MOD_DOOMBRINGER_1                  = 184;
const ACTIVITY_ARMOR_MOD_INFILTRATOR_1                  = 185;
const ACTIVITY_ARMOR_MOD_JUGGERNAUT_1                   = 186;
const ACTIVITY_ARMOR_MOD_PATHFINDER_1                   = 187;
const ACTIVITY_ARMOR_MOD_RAIDER_1                       = 188;
const ACTIVITY_ARMOR_MOD_SENTINEL_1                     = 189;
const ACTIVITY_ARMOR_MOD_TECHNICIAN_1                   = 190;
const ACTIVITY_ARMOR_MOD_SOLDIER_1                      = 191;
const ACTIVITY_BRUTE_BELT_FRACTALGRENADE                = 192;
const ACTIVITY_BRUTE_BELT_FRACTALGRENADE_MKD            = 193;
const ACTIVITY_BRUTE_BELT_LIGHTSTICKYGRENADE            = 194;
const ACTIVITY_DOOMBRINGER_BELT_MINE                    = 195;
const ACTIVITY_DOOMBRINGER_BELT_STANDARDGRENADE         = 196;
const ACTIVITY_DOOMBRINGER_BELT_STANDARDGRENADE_MKD     = 197;
const ACTIVITY_INFILTRATOR_BELT_NINJASMOKE              = 198;
const ACTIVITY_INFILTRATOR_BELT_PRISMMINES              = 199;
const ACTIVITY_INFILTRATOR_BELT_STICKYGRENADE           = 200;
const ACTIVITY_INFILTRATOR_BELT_STICKYGRENADE_MKD       = 201;
const ACTIVITY_JUGGERNAUT_BELT_DISKTOSS                 = 202;
const ACTIVITY_JUGGERNAUT_BELT_HEAVYAPGRENADE           = 203;
const ACTIVITY_JUGGERNAUT_BELT_HEAVYAPGRENADE_MKD       = 204;
const ACTIVITY_PATHFINDER_BELT_IMPACTNITRON             = 205;
const ACTIVITY_PATHFINDER_BELT_IMPACTNITRON_MKD         = 206;
const ACTIVITY_PATHFINDER_BELT_STGRENADE                = 207;
const ACTIVITY_RAIDER_BELT_EMPGRENADE                   = 208;
const ACTIVITY_RAIDER_BELT_EMPGRENADE_MKD               = 209;
const ACTIVITY_RAIDER_BELT_MIRVGRENADE                  = 210;
const ACTIVITY_RAIDER_BELT_WHITEOUT                     = 211;
const ACTIVITY_SENTINEL_BELT_ARMOREDCLAYMORE            = 212;
const ACTIVITY_SENTINEL_BELT_CLAYMORE                   = 213;
const ACTIVITY_SENTINEL_BELT_CLAYMORE_MKD               = 214;
const ACTIVITY_SENTINEL_BELT_GRENADET5                  = 215;
const ACTIVITY_SOLDIER_BELT_APGRENADE                   = 216;
const ACTIVITY_SOLDIER_BELT_FRAGGRENADEXL               = 217;
const ACTIVITY_SOLDIER_BELT_FRAGGRENADEXL_MKD           = 218;
const ACTIVITY_SOLDIER_BELT_PROXIMITYGRENADE            = 219;
const ACTIVITY_TECHNICIAN_BELT_MOTIONALARM              = 220;
const ACTIVITY_TECHNICIAN_BELT_TCNG                     = 221;
const ACTIVITY_TECHNICIAN_BELT_TCNG_MKD                 = 222;
const ACTIVITY_BRUTE_PACK_HEAVYSHIELD                   = 223;
const ACTIVITY_BRUTE_PACK_MINORENERGY                   = 224;
const ACTIVITY_BRUTE_PACK_SURVIVALPACK                  = 225;
const ACTIVITY_DOOMBRINGER_PACK_FORCEFIELD              = 226;
const ACTIVITY_INFILTRATOR_PACK_STEALTH                 = 227;
const ACTIVITY_JUGGERNAUT_PACK_HEALTHREGEN              = 228;
const ACTIVITY_PATHFINDER_PACK_ENERGYRECHARGE           = 229;
const ACTIVITY_PATHFINDER_PACK_JUMPPACK                 = 230;
const ACTIVITY_RAIDER_PACK_JAMMER                       = 231;
const ACTIVITY_RAIDER_PACK_SHIELD                       = 232;
const ACTIVITY_SENTINEL_PACK_DROPJAMMER                 = 233;
const ACTIVITY_SENTINEL_PACK_ENERGYRECHARGE             = 234;
const ACTIVITY_SOLDIER_PACK_ENERGYPOOL                  = 235;
const ACTIVITY_SOLDIER_PACK_UTILITY                     = 236;
const ACTIVITY_TECHNICIAN_PACK_EXRTURRET                = 237;
const ACTIVITY_TECHNICIAN_PACK_LIGHTTURRET              = 238;
const ACTIVITY_PERK_BOUNTY_HUNTER                       = 239;
const ACTIVITY_PERK_CLOSE_COMBAT                        = 240;
const ACTIVITY_PERK_LOOTER                              = 241;
const ACTIVITY_PERK_RAGE                                = 242;
const ACTIVITY_PERK_REACH                               = 243;
const ACTIVITY_PERK_SAFE_FALL                           = 244;
const ACTIVITY_PERK_SAFETY_THIRD                        = 245;
const ACTIVITY_PERK_STEALTHY                            = 246;
const ACTIVITY_PERK_SUPER_CAPACITOR                     = 247;
const ACTIVITY_PERK_WHEEL_DEAL                          = 248;
const ACTIVITY_PERK_DETERMINATION                       = 249;
const ACTIVITY_PERK_EGOCENTRIC                          = 250;
const ACTIVITY_PERK_MECHANIC                            = 253;
const ACTIVITY_PERK_PILOT                               = 254;
const ACTIVITY_PERK_POTENTIAL_ENERGY                    = 255;
const ACTIVITY_PERK_QUICKDRAW                           = 256;
const ACTIVITY_PERK_SONIC_PUNCH                         = 257;
const ACTIVITY_PERK_SUPER_HEAVY                         = 258;
const ACTIVITY_PERK_SURVIVALIST                         = 259;
const ACTIVITY_PERK_ULTRA_CAPACITOR                     = 260;
const ACTIVITY_PATHFINDER_PRIMARY_LIGHTTWINFUSOR        = 261;
const ACTIVITY_SOLDIER_PRIMARY_TWINFUSOR                = 262;
const ACTIVITY_JUGGERNAUT_SECONDARY_HEAVYTWINFUSOR      = 263;


const BUNDLE_LOOT_ID_CAD_ASSASSIN                       = 8918;
const BUNDLE_LOOT_ID_CAD_MERCENARY                      = 8919;
const BUNDLE_LOOT_ID_CAD_PREMIUM                        = 8912;
const BUNDLE_LOOT_ID_CAD_WEAPONS                        = 8920;
const BUNDLE_LOOT_ID_RAP_GRIEVER                        = 8982;
const BUNDLE_LOOT_ID_RAP_MERCENARY                      = 8983;
const BUNDLE_LOOT_ID_RAP_PREMIUM                        = 8981;
const BUNDLE_LOOT_ID_RAP_WEAPONS                        = 8984;
const BUNDLE_LOOT_ID_NEWPLAYER                          = 9214;
const BUNDLE_LOOT_ID_SHAZBUNDLE                         = 9213;
const BUNDLE_LOOT_ID_STAYINALIVE                        = 9035;
const BUNDLE_LOOT_ID_TWINFUSOR                          = 9449;
const BUNDLE_LOOT_ID_SKINPACK                           = 9457;
const BUNDLE_LOOT_ID_SPECIALIST                         = 9496;
const BUNDLE_LOOT_ID_SENTINEL                           = 9510;


const ITEM_VOICE_LIGHT                                  = 8666;
const ITEM_VOICE_MEDIUM                                 = 8667;
const ITEM_VOICE_HEAVY                                  = 8668;
const ITEM_VOICE_DARK                                   = 8669;
const ITEM_VOICE_FEM1                                   = 8670;
const ITEM_VOICE_FEM2                                   = 8671;
const ITEM_VOICE_AUS                                    = 8695;
const ITEM_VOICE_T2FEM01                                = 8712;
const ITEM_VOICE_T2FEM02                                = 8714;
const ITEM_VOICE_T2FEM03                                = 8715;
const ITEM_VOICE_T2FEM04                                = 8716;
const ITEM_VOICE_T2FEM05                                = 8717;
const ITEM_VOICE_T2MALE01                               = 8719;
const ITEM_VOICE_T2MALE02                               = 8720;
const ITEM_VOICE_T2MALE03                               = 8721;
const ITEM_VOICE_T2MALE04                               = 8722;
const ITEM_VOICE_T2MALE05                               = 8723;
const ITEM_VOICE_T2BDERM01                              = 8724;
const ITEM_VOICE_T2BDERM02                              = 8725;
const ITEM_VOICE_T2BDERM03                              = 8726;#linenumber 7

/** Pointers to owners and type */
var TrHUD               m_TrHUD;
var TrPlayerController  m_TrPC;

/** Stage size */
var int                 m_HUDStageOriginX;
var int                 m_HUDStageOriginY;
var int                 m_HUDStageWidth;
var int                 m_HUDStageHeight;

/** Cached values used for ticking updates */
var int					m_nLastPercent;
var int			        m_nLastCredits;
var int                 m_nLastAmmoPool;
var int                 m_nCrossHairMode;
var int                 m_nStreakEvent[5];
var int                 m_nLastSkiSpeedStep;
var int					m_nLastPercentLaser;
var int					m_nLastPercentReload;
var int                 m_nLastOffhandCount[3];
var int                 m_nLastEnemyGeneratorTime;
var int                 m_nLastFriendlyGeneratorTime;
var float               m_fCrosshairDepth;

var bool                m_bLastSkiing;
var bool                m_bLastHasFlag;
var bool                m_bShowPlayerStats;

var bool                m_bGameOver;

var float               m_fLastRotation;
var float               m_fLastMaxHealth;
var float               m_fLastActualHealth;
var float               m_fCurrentGhostHealth;
var float               m_fLastSpeedometerUpdateTime;

/** Config vars*/
var int                 m_VGSMenuListCount;
var int                 m_SkiSpeedSteps[12];
var float               m_fSpeedometerUpdateInterval;

/** Vehicle State */
var int                 m_nLastSeatMask;
var int                 m_nLastVehicleHealth;
var float               m_fLastVehicleEnergy;
var int                 m_nLastVehicleAmmoPool;
var bool                m_bLastInVehicle;
var bool                m_bShowingAmmoClip;
var bool                m_bLastIn3P;

var bool                bShowingBadge;

var TeamInfo            m_LastTeam;
var TrDevice            m_LastOffhand[3];

/** Reticule Objects */
var GFxObject			sniperPowerUp;
var GFxTrReticules      Reticules;
var GFxDeviceAmmoCount  deviceAmmoCountMP;
var GFxDeviceAmmoCount  deviceAmmoPoolMP;

/** Player Objs */

var GFxObject Visor[4];
var GFxObject PlayerStats;
var GFxObject HeroStatus_outputTF;
var GFxObject PromptPanel;
var GFxObject KillCamInfo;
var GFxObject KillMessageArea;
var GFxObject CombatLog;
var GFxObject SkiIndicator[2];
var GFxObject SkiIndicatorTF[2];
var GFxObject SkiIndicatorFillBar[2];
var GFxObject CreditsAndStreaks;
var GFxObject CreditsAndStreaks_Streak[3];
var GFxObject SpawnCounter_StatusMessage;
var GFxObject SpawnCounter_TimeLabel;
var GFxObject PlayerStats_HealthFillBar;
var GFxObject PlayerStats_GhostHealthBar;
var GFxObject PlayerStats_EnergyFillBar;
var GFxObject TeamScoreboard_Red_PlayerNameTF[16];
var GFxObject TeamScoreboard_Red_ScoreTF[16];
var GFxObject TeamScoreboard_Red_KillsTF[16];
var GFxObject TeamScoreboard_Red_AssistsTF[16];
var GFxObject TeamScoreboard_Red_PingTF[16];
var GFxObject TeamScoreboard_Red_ClassTF[16];
var GFxObject TeamScoreboard_Red_RankIcon[16];
var GFxObject TeamScoreboard_Red_RankTF[16];
var GFxObject TeamScoreboard_Blue_PlayerNameTF[16];
var GFxObject TeamScoreboard_Blue_ScoreTF[16];
var GFxObject TeamScoreboard_Blue_KillsTF[16];
var GFxObject TeamScoreboard_Blue_AssistsTF[16];
var GFxObject TeamScoreboard_Blue_PingTF[16];
var GFxObject TeamScoreboard_Blue_ClassTF[16];
var GFxObject TeamScoreboard_Blue_RankIcon[16];
var GFxObject TeamScoreboard_Blue_RankTF[16];
var GFxObject RabbitScoreboard_PlayerTF[8];
var GFxObject RabbitScoreboard_ScoreT[8];
var GFxObject RabbitScoreboard_KillsTF[8];
var GFxObject RabbitScoreboard_AssistsTF[8];
var GFxObject RabbitScoreboard_PingTF[8];
var GFxObject RabbitScoreboard_ClassTF[8];
var GFxObject RabbitScoreboard_RankTF[8];
var GFxObject RabbitScoreboard_RankIcon[8];
var GFxObject RabbitScoreboard_PlayerHighlight[8];
var GFxObject RabbitStats;
var GFxObject RabbitStats_LeaderText[3];
var GFxObject RabbitStats_LeaderScore[3];
var GFxObject RabbitStats_Timer;
var GFxObject CTFStats_LeftGenStatus;
var GFxObject CTFStats_RightGenStatus;
var GFxObject CTFStats_LeftGenTimer;
var GFxObject CTFStats_RightGenTimer;
var GFxObject CTFStats_LeftFlagStatus;
var GFxObject CTFStats_RightFlagStatus;
var GFxObject CTFStats_LeftFlagTimer;
var GFxObject CTFStats_RightFlagTimer;
var GFxObject CTFStats_LeftScore;
var GFxObject CTFStats_RightScore;
var GFxObject CTFStats_Timer;
var GFxObject CTFStats;
var GFxObject TdmStats_leftFlagStatus;
var GFxObject TdmStats_rightFlagStatus;
var GFxObject TdmStats_gameTimer;
var GFxObject TdmStats;
var GFxObject DaDStats;
var GFxObject CaHStats;
var GFxObject CaHControlPointA;
var GFxObject CaHControlPointB;
var GFxObject CaHControlPointC;
var GFxObject CaHControlPointD;
var GFxObject CaHControlPointE;
var GFxObject ArenaStats_FriendlyManGraphic01;
var GFxObject ArenaStats_FriendlyManGraphic02;
var GFxObject ArenaStats_FriendlyManGraphic03;
var GFxObject ArenaStats_FriendlyManGraphic04;
var GFxObject ArenaStats_FriendlyManGraphic05;
var GFxObject ArenaStats_FriendlyManGraphic06;
var GFxObject ArenaStats_FriendlyManGraphic07;
var GFxObject ArenaStats_FriendlyManGraphic08;
var GFxObject ArenaStats_EnemyManGraphic01;
var GFxObject ArenaStats_EnemyManGraphic02;
var GFxObject ArenaStats_EnemyManGraphic03;
var GFxObject ArenaStats_EnemyManGraphic04;
var GFxObject ArenaStats_EnemyManGraphic05;
var GFxObject ArenaStats_EnemyManGraphic06;
var GFxObject ArenaStats_EnemyManGraphic07;
var GFxObject ArenaStats_EnemyManGraphic08;
var GFxObject ArenaStats_arenaGameTimerTF;
var GFxObject ArenaStats_roundCountTF;
var GFxObject ArenaStats_FriendlyScoreTF;
var GFxObject ArenaStats_EnemyScoreTF;
var GFxObject ArenaStats;
var GFxObject TeamScoreboard;
var GFxObject RabbitScoreboard;
var GFxObject Credits_And_Streaks_CreditsGroup_CreditsMC_CreditsN;
var GFxObject Offhands_And_Flag_FlagInHand;
var GFxObject TeamStats;
var GFxObject VehicleStats;
var GFxObject VehicleStats_HealthTF_TextField;
var GFxObject VehicleStats_VehicleHealthFill;
var GFxObject VehicleStats_EnergyTF_TextField;
var GFxObject VehicleStats_VehicleEnergyFill;
var GFxObject VehicleStats_VehicleSlot[6];
var GFxObject playerStats_Offhand1;
var GFxObject PlayerStats_Pack;
var GFxObject PlayerStats_PackMC;
var GFxObject PlayerStats_PackCount;
var GFxObject PlayerStats_Offhand1_Icon;
var GFxObject PlayerStats_Offhand1_Count;
var GFxObject Credits_And_Streaks_CallItem[3];
var GFxObject GlobalAlertTF;
var GFxObject DeployStatus[6];
var GFxObject NotificationPopup;
var GFxObject VGS;

/** Spectator Objs */
var GFxObject SpecHelp;
var GFxObject SpecFloat;
var GFxObject SpecPlayer;
var GFxObject SpecVehicle;
var GFxObject SpawnCounter;
var GFxObject SpecBookmark;
var GFxObject SpecObjective;
var GFxObject SpecPlayer_FlagCarried;
var GFxObject SpecPlayer_PlayerNameTF;
var GFxObject SpecPlayer_ClassNameTF;
var GFxObject SpecPlayer_RegenTF;
var GFxObject SpecPlayer_HealthFillBar;
var GFxObject SpecPlayer_HealthTF;
var GFxObject SpecPlayer_EnergyFillBar;
var GFxObject SpecPlayer_EnergyTF;
var GFxObject SpecPlayer_PrimaryNameTF;
var GFxObject SpecPlayer_PrimaryAmmoTF;
var GFxObject SpecPlayer_SecondaryNameTF;
var GFxObject SpecPlayer_SecondaryAmmoTF;
var GFxObject SpecPlayer_OffhandIcons_icon;
var GFxObject SpecPlayer_OffhandIcons_count;
var GFxObject SpecPlayer_OffhandNameTF;
var GFxObject SpecPlayer_PackIcons_icon;
var GFxObject SpecPlayer_PackIcons_count;
var GFxObject SpecPlayer_PackNameTF;
var GFxObject SpecPlayer_PerkItem1;
var GFxObject SpecPlayer_Perk1TF;
var GFxObject SpecPlayer_PerkItem2;
var GFxObject SpecPlayer_Perk2TF;
var GFxObject SpecPlayer_SkiIndicator_fillBar;
var GFxObject SpecPlayer_SkiIndicator_fillBar_speedoTF;
var GFxObject SpecVehicle_FlagCarried;
var GFxObject SpecVehicle_VehicleNameTF;
var GFxObject SpecVehicle_DriverNameTF;
var GFxObject SpecVehicle_PassengerNameTF;
var GFxObject SpecVehicle_HealthFillBar;
var GFxObject SpecVehicle_HealthTF;
var GFxObject SpecVehicle_EnergyFillBar;
var GFxObject SpecVehicle_EnergyTF;
var GFxObject SpecVehicle_PrimaryNameTF;
var GFxObject SpecVehicle_VehicleGroup_primaryReady;
var GFxObject SpecVehicle_SecondaryNameTF;
var GFxObject SpecVehicle_VehicleGroup_secondaryReady;
var GFxObject SpecVehicle_SkiIndicator_fillBar;
var GFxObject SpecVehicle_SkiIndicator_fillBar_speedoTF;
var GFxObject SpecBookmark_BookmarkNameTF;
var GFxObject SpecBookmark_DescriptionTF;
var GFxObject SpecObjective_ObjectiveNameTF;
var GFxObject SpecObjective_DescriptionTF;
var GFxObject SpecObjective_HealthFillBar;
var GFxObject SpecObjective_HealthTF;
var GFxObject SpecFloat_FloatCameraNameTF;
var GFxObject SpecFloat_DescriptionTF;
var GFxObject SpecHelp_HelpTF;
var GFxObject SpecHelp_TeamSelectTF;
var GFxObject SpecHelp_ScoreboardTF;
var GFxObject SpecHelp_MainmenuTF;
var GFxObject SpecHelp_SpecHudTF;
var GFxObject SpecHelp_ObjKaratsTF;
var GFxObject SpecHelp_MoveUpTF;
var GFxObject SpecHelp_MoveDownTF;
var GFxObject SpecHelp_MoveForwardTF;
var GFxObject SpecHelp_MoveBackTF;
var GFxObject SpecHelp_StrafeLeftTF;
var GFxObject SpecHelp_StrafeRightTF;
var GFxObject SpecHelp_IncreaseSpeedTF;
var GFxObject SpecHelp_DecreaseSpeedTF;
var GFxObject SpecHelp_ChangePlayersTF;
var GFxObject SpecHelp_ChangeGeneratorsTF;
var GFxObject SpecHelp_ChangeFlagsTF;
var GFxObject SpecHelp_ChangeFlagstandsTF;
var GFxObject SpecHelp_ChangeBookmarksTF;
var GFxObject SpecHelp_ChangeVehiclesTF;
var GFxObject SpecHelp_FastestPlayerTF;
var GFxObject SpecHelp_FreeCameraTF;
var GFxObject SpecHelp_ZoomInTF;
var GFxObject SpecHelp_ZoomOutTF;
var GFxObject SpecHelp_LockViewTF;

const MAX_VGS_ENTRIES = 16;
var GFxObject VGSMenuEntry[MAX_VGS_ENTRIES];
var GFxObject KillCamInfoObject;

/** Damage Objects */
var bool				m_bNearDeathOn;
var() int				m_nNearDeathHealthMax;
var() float				m_fDirectionalDamageFadeTime;
var array<name>			m_aDamageEffectNames;
var MaterialEffect		m_DirectionalDamageEffect;

var transient MaterialInstanceConstant m_DirDamageMaterialInstance;

/** Global Object */
var GFxObject           _global;

var GFxObject           VGSMenuList;

/** Structure for saving currently displayed message */
struct native TrTempMessage
{
    var bool   bInUse;
    var float  TakeDownTime;
    var string Message;
    var GC_ALERT_PRIORITY Priority;
};

var localized string m_sRound;

var	TrTempMessage m_PromptPanelTempMessage;
var	TrTempMessage m_HeroStatusTempMessage;

var bool bVGSLoadouts;

/** Delegate declarations */
delegate DelegateLoadVGSMenu(GFxObject List);
delegate DelegateSoundAccolade();

/** 
 *  Movie player start
 */
function bool Start(optional bool StartPaused = false)
{
    return super.Start(StartPaused);
}

function registerReticules(GFxTrReticules mc)
{
    Reticules = mc;
    Reticules.Init(self);
    Reticules.SetVisible(false);
	Reticules.DisableVehicleAmmoClip();
}

function Init(optional LocalPlayer player)
{
    local int i;

    Super.Init(player);

    SetOwnership();

    SetLoadVGSMenuDelegate(LoadVGSMenu);
    SetSoundAccoladeDelegate(SoundAccolade);

    // Device hud ammo count texture update.
    deviceAmmoCountMP = new class'GFxDeviceAmmoCount';
    deviceAmmoCountMP.SetTimingMode(TM_Real);
    deviceAmmoCountMP.Init(player);

    // Device hud ammo pool texture update.
    deviceAmmoPoolMP = new class'GFxDeviceAmmoCount';
    deviceAmmoPoolMP.RenderTexture = TextureRenderTarget2D'TribesHud.T_r2t_device_pool_count';
    deviceAmmoPoolMP.SetTimingMode(TM_Real);
    deviceAmmoPoolMP.Init(player);

    // setup split screen portion for this HUD
    m_HUDStageOriginX = player.Origin.X;
    m_HUDStageOriginY = player.Origin.Y;
    m_HUDStageWidth   = player.Size.X;
    m_HUDStageHeight  = player.Size.Y;
    
    // setup directional damage effect
	m_aDamageEffectNames.AddItem(name("Hit_F"));
	m_aDamageEffectNames.AddItem(name("Hit_FR"));
	m_aDamageEffectNames.AddItem(name("Hit_R"));
	m_aDamageEffectNames.AddItem(name("Hit_BR"));
	m_aDamageEffectNames.AddItem(name("Hit_B"));
	m_aDamageEffectNames.AddItem(name("Hit_BL"));
	m_aDamageEffectNames.AddItem(name("Hit_L"));
	m_aDamageEffectNames.AddItem(name("Hit_FL"));

    m_DirectionalDamageEffect = MaterialEffect(player.PlayerPostProcess.FindPostProcessEffect('HitEffect'));
    if (m_DirectionalDamageEffect != None)
	{
		if (MaterialInstanceConstant(m_DirectionalDamageEffect.Material) != None && m_DirectionalDamageEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_DirDamageMaterialInstance = MaterialInstanceConstant(m_DirectionalDamageEffect.Material);
		}
		else
		{
			m_DirDamageMaterialInstance = new(m_DirectionalDamageEffect) class'MaterialInstanceConstant';
			m_DirDamageMaterialInstance.SetParent(m_DirectionalDamageEffect.Material);
			m_DirectionalDamageEffect.Material = m_DirDamageMaterialInstance;
		}

		m_DirectionalDamageEffect.bShowInGame = m_TrPC.m_bShowHUDCracks;
		// set all directional damage to zero
		TickDirectionalDamageEffect(m_fDirectionalDamageFadeTime);
	}

    for(i=0;i<TR_MAX_CALLINS;++i)
    {
        UpdateCallIn(i, true, false);
        //UpdateCallIn(0, true, false);
        //UpdateCallIn(1, true, false);
        //UpdateCallIn(2, true, false);
        //UpdateCallIn(3, true, false);
    }
    
    UpdateOffhand(0, false);
    UpdateOffhand(1, false);
    UpdateOffhand(2, false);

    RetrieveGFxObject(PlayerStats_Pack, "playerStats.pack").SetVisible(false);

    UpdateSkiing(false);
    UpdateFlagInHand(false);
    UpdateCreditsAndStreaks(false);

    SetPlayerClassObjects("", 0, 0);

    TeamCTFStatsUpdateGeneratorStatus(0, true);
    TeamCTFStatsUpdateGeneratorStatus(1, true);
    TeamCTFStatsUpdateGeneratorTimer(0, "");
    TeamCTFStatsUpdateGeneratorTimer(1, "");
    TeamCTFStatsUpdateFlagStatus(0, true);
    TeamCTFStatsUpdateFlagStatus(1, true);
    TeamCTFStatsUpdateTeamScore(0, 0);
    TeamCTFStatsUpdateTeamScore(1, 0);

    TeamRabbitStatsUpdateFlagStatus(-1);
    TeamRabbitStatsUpdateTeamScore(0, 0);
    TeamRabbitStatsUpdateTeamScore(1, 0);
    
    for (i = 0; i < 3; i++)
    {
        RabbitLeaderboardUpdateSlot(i, "", "");
    }
    
    RabbitLeaderboardUpdateTime("");

    SetFontIndex(m_TrPC.GetLanguageFontIndex());
}

function ClearPromptPanel()
{
    if (m_PromptPanelTempMessage.bInUse)
    {
        //`log(self@"Clear Prompt"@m_PromptPanelTempMessage.Message);
        RemoveFromPromptPanel(m_PromptPanelTempMessage.Message);
        m_PromptPanelTempMessage.bInUse = false;
    }
}

function ClearPromptPanelMessage(string Message)
{
    if (m_PromptPanelTempMessage.bInUse && m_PromptPanelTempMessage.Message==Message)
    {
        ClearPromptPanel();
    }
}

function LoadVGSMenu(GFxObject List)
{
    local int i;
    local int classId;
    local string loadoutName;
    local TrPlayerInput TrPI;
	local class<TrFamilyInfo> FamilyInfo;
    local class<TrFamilyInfoList> InfoList;
	local array<VGSCommandType> GametypeSpecificCommands;
	local array<class<TrVGSNode> > VGSNodeChildrenClasses;

	TrPI = TrPlayerInput(m_TrPC.PlayerInput);

    if (m_TrPC == none || TrPI == none)
    {
        return;
    }

    if (TrPI.InVGSClassMode())
    {
        VGSMenuList = List;
        m_VGSMenuListCount = 1;

        if (RetrieveGFxObject(VGS, "vgs_mc.tfVgsTitle") != none)
        {
            VGS.SetText("PICK CLASS (USE NUMKEYS)");
        }

        InfoList = class<TrFamilyInfoList>(DynamicLoadObject("TribesGame.TrFamilyInfoList", class'Class'));

        if (InfoList != none)
        {
            for (i = 0; i < InfoList.default.ClassList.Length; i++)
            {
                FamilyInfo = class<TrFamilyInfo>(DynamicLoadObject("TribesGame."$InfoList.default.ClassList[i], class'Class'));

                if (m_TrPC.InTraining() || m_TrPC.m_TrEquipInterface.IsClassOwned(FamilyInfo.default.ClassId))
                {
                    AddVGSEntry((i+1)$":"@Caps(FamilyInfo.default.FriendlyName), true);
                }
            }
        }
    }
    else if (TrPI.InVGSLoadoutMode())
    {
        classId = TrPI.GetVGSClassId();
        VGSMenuList = List;
        m_VGSMenuListCount = 1;

        FamilyInfo = m_TrPC.GetFamilyInfoFromId(classId);

        if (RetrieveGFxObject(VGS, "vgs_mc.tfVgsTitle") != none)
        {
            VGS.SetText(Caps(FamilyInfo.default.FriendlyName)@"(NUMKEYS)");
        }

        for (i = 0; i < LST_MAX; i++)
        {
            if (m_TrPC.m_TrEquipInterface.IsLoadoutOwned(classId, i) || (m_TrPC.InTraining() && i == 0))
            {
                loadoutName = m_TrPC.m_TrEquipInterface.GetLoadoutName(classId, i);

                AddVGSEntry((i+1)$":"@loadoutName, true);
            }
        }
    }
    else
    {
        VGSMenuList = List;
        m_VGSMenuListCount = 1;

        if (RetrieveGFxObject(VGS, "vgs_mc.tfVgsTitle") != none)
        {
            VGS.SetText("VGS");
        }
        
        // Add menu title.
	    if( TrPI.m_CurrentVGSNode.default.m_bDrawHeader )
	    {
		    AddVGSEntry(TrPI.m_CurrentVGSNode.default.m_MenuString,true);
	    }

        // Add children.
	    TrPI.m_CurrentVGSNode.static.GetGametypeSpecificChildrenNodes(VGSNodeChildrenClasses, m_TrPC.WorldInfo.GRI.GameClass);
        for( i=0; i < VGSNodeChildrenClasses.Length; i++ )
        {
            AddVGSEntry(VGSNodeChildrenClasses[i].default.m_KeyBind$": "$VGSNodeChildrenClasses[i].default.m_MenuString, true);
        }
        
        // Add commands.
	    TrPI.m_CurrentVGSNode.static.GetGametypeSpecificCommands(GametypeSpecificCommands, m_TrPC.WorldInfo.GRI.GameClass);
        for( i=0; i < GametypeSpecificCommands.Length; i++ )
        {
		    AddVGSEntry(TrPI.m_VGSCommandList.m_CommandList[GametypeSpecificCommands[i]].KeyBind$": "$TrPI.m_VGSCommandList.m_CommandList[GametypeSpecificCommands[i]].MenuString, false);
        }
    }
}

function AddVGSEntry(String Command, bool bBold)
{
	if( VGSMenuEntry[m_VGSMenuListCount] == none )
	{
		VGSMenuEntry[m_VGSMenuListCount] = CreateObject("Object");
	}
	if( VGSMenuEntry[m_VGSMenuListCount] != none )
	{
		VGSMenuEntry[m_VGSMenuListCount].SetString("label", Command);
		VGSMenuEntry[m_VGSMenuListCount].SetBool("bold",bBold); 
		VGSMenuList.SetElementObject(m_VGSMenuListCount, VGSMenuEntry[m_VGSMenuListCount]);
		m_VGSMenuListCount++;
	}
}

function AddToPromptPanelTime(string Message, float EndTime, GC_ALERT_PRIORITY messagePriority)
{
    //`log("New NAG "@Message@EndTime@messagePriority);
    if (m_PromptPanelTempMessage.bInUse)
    {
        if (messagePriority < m_PromptPanelTempMessage.Priority) 
        {
            return;
        }

        ClearPromptPanel();
    }

    m_PromptPanelTempMessage.Message = Message;
    m_PromptPanelTempMessage.TakeDownTime = EndTime;
    m_PromptPanelTempMessage.Priority = messagePriority;
    m_PromptPanelTempMessage.bInUse = true;

    AddtoPromptPanelAS(Message);
}

final function UpdateHeroStatus(string Message, float ShowTime)
{
    m_HeroStatusTempMessage.Message = Message;
    m_HeroStatusTempMessage.TakeDownTime = ShowTime;
    m_HeroStatusTempMessage.bInUse = true;

    ActionScriptVoid("updateHeroStatus");
}

final function ClearHeroStatus()
{
    m_HeroStatusTempMessage.bInUse = false;

    ActionScriptVoid("hideHeroStatus");
}

function SetSpeedometer(int Speed)
{
    RetrieveGFxObject(SkiIndicatorTF[0], "skiIndicatorLeft.fillBar.speedoTF").SetText(string(Speed));
    RetrieveGFxObject(SkiIndicatorTF[1], "skiIndicatorRight.fillBar.speedoTF").SetText(string(Speed));
}

function SetPlayerRankIcon(int IconIndex)
{
    // Not implemented at the moment
    //RetrieveGFxObject(TEMPTEMP, "rankIcon").GotoAndStopI(IconIndex);
}

function SetPlayerTeamIcon(int Team)
{
    // Not implemented at the moment
    //RetrieveGFxObject(TEMPTEMP, "classIcon").GotoAndStopI(Team);
}

function SetPlayerClassObjects(string ClassName, int PerkIcon1, int PerkIcon2)
{
    //Deprecated for now

    /*RetrieveGFxObject(TEMPTEMP, "playerClassName.classTF").SetText(Caps(ClassName));
    RetrieveGFxObject(TEMPTEMP, "playerClassName.perkItem1").GotoAndStop(string(PerkIcon1));
    RetrieveGFxObject(TEMPTEMP, "playerClassName.perkItem2").GotoAndStop(string(PerkIcon2));
    RetrieveGFxObject(TEMPTEMP, "playerClassName.perkItem1.borderHighlight")t.GotoAndStop("5");
    RetrieveGFxObject(TEMPTEMP, "playerClassName.perkItem2.borderHighlight").GotoAndStop("5");
    }*/
}

function bool ShouldShowSpectatorReticule()
{
	if( m_TrPC != none )
	{
		if( m_TrPC.ViewTarget == m_TrPC || m_TrPC.ViewTarget == none )
		{
			return m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls;
		}
	}
	return false;
}

final function SystemEnableNotifies(bool bEnable)
{
    RetrieveGFxObject(NotificationPopup, "notificationHud").SetVisible(bEnable);        
}

final function ConfigureSpectatorHUD(bool bIsNeutral)
{
	if( m_TrPC == none )
	{
		return;
	}

    if (Reticules != none)
    {
		// Make sure the reticule is set to spectator.
		Reticules.ChangeReticule(THR_FREE_SPECTATOR);

        Reticules.SetVisible(ShouldShowSpectatorReticule());
    }

    RetrieveGFxObject(Visor[0], "visorNW").SetVisible(m_TrPC.m_bShowHUDVisor && false);
    RetrieveGFxObject(Visor[1], "visorNE").SetVisible(m_TrPC.m_bShowHUDVisor && false);
    RetrieveGFxObject(Visor[2], "visorSE").SetVisible(m_TrPC.m_bShowHUDVisor && false);
    RetrieveGFxObject(Visor[3], "visorSW").SetVisible(m_TrPC.m_bShowHUDVisor && false);
    RetrieveGFxObject(PlayerStats, "playerStats").SetVisible(m_TrPC.m_bShowHUDHealthBar && !bIsNeutral);
    RetrieveGFxObject(HeroStatus_outputTF, "heroStatus.outputTF").SetVisible(m_TrPC.m_bShowHUDHeroText && m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);
    RetrieveGFxObject(PromptPanel, "promptPanel").SetVisible(m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);       
    RetrieveGFxObject(KillMessageArea, "killMessageArea").SetVisible(m_TrPC.m_bShowHUDKillbox && m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);
    RetrieveGFxObject(CombatLog, "combatLog").SetVisible(m_TrPC.m_bShowHUDCombatLog && m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);
    RetrieveGFxObject(SkiIndicator[0], "skiIndicatorLeft").SetVisible(m_TrPC.m_bShowHUDSkiBars && false);        
    RetrieveGFxObject(SkiIndicator[1], "skiIndicatorRight").SetVisible(m_TrPC.m_bShowHUDSkiBars && false);        
    RetrieveGFxObject(CreditsAndStreaks, "credits_and_streaks").SetVisible(m_TrPC.m_bShowHUDCredits && false);        
    RetrieveGFxObject(SpawnCounter, "spawnCounter").SetVisible(false);
	RetrieveGFxObject(SpecPlayer, "spectatorPlayerPanel").SetVisible(m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);
	RetrieveGFxObject(SpecVehicle, "spectatorVehiclePanel").SetVisible(m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);
	RetrieveGFxObject(SpecBookmark, "spectatorBookmarkPanel").SetVisible(m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);
	RetrieveGFxObject(SpecObjective, "spectatorObjectivePanel").SetVisible(m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);
	RetrieveGFxObject(SpecFloat, "spectatorFloatCameraPanel").SetVisible(m_TrPC.m_bShowSpectatorHUD && !m_TrPC.m_bShowSpectatorControls);
}

final function ConfigureHUDState(bool bAlive, optional bool bReady = true, optional bool bForceCredits = false)
{
    local bool bVisible;

    if (bReady)
    {
        bVisible = true;
    }
    else
    {
        bAlive = false;
        bVisible = false;
    }
        
    if (Reticules != none)
    {
        Reticules.SetVisible(m_TrPC.m_bShowHUDReticule && bAlive);
    }
    
    (bVisible && m_TrPC.m_bShowHUDChat) ? ShowChatLog() : HideChatLog();

    RetrieveGFxObject(HeroStatus_outputTF, "heroStatus.outputTF").SetVisible(m_TrPC.m_bShowHUDHeroText && bVisible);
    RetrieveGFxObject(Visor[0], "visorNW").SetVisible(m_TrPC.m_bShowHUDVisor && bAlive);
    RetrieveGFxObject(Visor[1], "visorNE").SetVisible(m_TrPC.m_bShowHUDVisor && bAlive);
    RetrieveGFxObject(Visor[2], "visorSE").SetVisible(m_TrPC.m_bShowHUDVisor && bAlive);
    RetrieveGFxObject(Visor[3], "visorSW").SetVisible(m_TrPC.m_bShowHUDVisor && bAlive);
    RetrieveGFxObject(PlayerStats, "playerStats").SetVisible(m_TrPC.m_bShowHUDHealthBar && bVisible);
    RetrieveGFxObject(PromptPanel, "promptPanel").SetVisible(m_TrPC.m_bShowHUDPromptPanel && bVisible);
    RetrieveGFxObject(KillMessageArea, "killMessageArea").SetVisible(m_TrPC.m_bShowHUDKillbox && bVisible);
    RetrieveGFxObject(CombatLog, "combatLog").SetVisible(m_TrPC.m_bShowHUDCombatLog && bVisible);
    RetrieveGFxObject(SkiIndicator[0], "skiIndicatorLeft").SetVisible(m_TrPC.m_bShowHUDSkiBars && bAlive);
    RetrieveGFxObject(SkiIndicator[1], "skiIndicatorRight").SetVisible(m_TrPC.m_bShowHUDSkiBars && bAlive);
    RetrieveGFxObject(KillCamInfo, "killCamInfo").SetVisible(bVisible);

    if (bForceCredits) RetrieveGFxObject(CreditsAndStreaks, "credits_and_streaks").SetVisible(m_TrPC.m_bShowHUDCredits && true);
    else RetrieveGFxObject(CreditsAndStreaks, "credits_and_streaks").SetVisible(m_TrPC.m_bShowHUDCredits && bVisible);
    
    if (bReady)
    {
        RetrieveGFxObject(SpawnCounter, "spawnCounter").SetVisible(!bAlive);
    }
    else
    {
        RetrieveGFxObject(SpawnCounter, "spawnCounter").SetVisible(bVisible);
    }

	if (bReady && bAlive)
	{
		m_bLastIn3P = !m_bLastIn3P;
	}
}

/** If false, while showing the scoreboard, hide centered elements so they don't conflict. Reenable if true. */
function ShowCenterHUDElements(bool bVisible)
{
    if (Reticules != none)
    {
        Reticules.SetVisible(m_TrPC.m_bShowHUDReticule && bVisible);
    }

    RetrieveGFxObject(HeroStatus_outputTF, "heroStatus.outputTF").SetVisible(m_TrPC.m_bShowHUDHeroText && bVisible);        
    RetrieveGFxObject(PromptPanel, "promptPanel").SetVisible(m_TrPC.m_bShowHUDPromptPanel && bVisible);
    RetrieveGFxObject(KillCamInfo, "killCamInfo").SetVisible(m_TrPC.m_bShowHUDDeathcam && bVisible);
    RetrieveGFxObject(CreditsAndStreaks, "credits_and_streaks").SetVisible(m_TrPC.m_bShowHUDCredits && bVisible);        
    RetrieveGFxObject(CombatLog, "combatLog").SetVisible(m_TrPC.m_bShowHUDCombatLog && bVisible);

    (bVisible && m_TrPC.m_bShowHUDChat) ? ShowChatLog() : HideChatLog();
}
        
function UpdateCreditsAndStreaks(bool bVisible)
{
    RetrieveGFxObject(CreditsAndStreaks, "credits_and_streaks").SetVisible(m_TrPC.m_bShowHUDCredits && bVisible);
}

final function SetScoreboardTitle(string sValue)
{
    ActionScriptVoid("setScoreboardTitle");
}

function UpdateRespawnText(string text)
{
    if (m_TrPC.m_bShowHUDRespawnTimer && m_TrPC.r_fRespawnTime > 0)
    {
        SetRespawnText(text);
    }
    else
    {
        SetRespawnText("");
    }
}

final function SetRespawnText(string Text)
{
    ActionScriptVoid("setSpawnText");
}

final function UpdateRespawnTimer(int timeRemaining)
{
    if (m_TrPC.m_bShowHUDRespawnTimer && m_TrPC.r_fRespawnTime > 0 && timeRemaining > 0)
    {
        RetrieveGFxObject(SpawnCounter_TimeLabel, "spawnCounter.timeLabel").SetText(timeRemaining);
    }
    else
    {
        RetrieveGFxObject(SpawnCounter_TimeLabel, "spawnCounter.timeLabel").SetText("");
    }
}

final function UpdateHUDCredits(int changeAmount, int newTotal)
{
    ActionScriptVoid("updateCredits");
}

function registerHUDView(GFxObject MovieClip, bool secondPass)
{
    if (!secondPass)
    {
        SetHUDStageSize(m_HUDStageOriginX,m_HUDStageOriginY,m_HUDStageWidth,m_HUDStageHeight);
    }
}

function SetAmmoCountTF(Weapon Wep, String Ammo)
{
    local TrDevice dev;

    super.SetAmmoCountTF(Wep, Ammo);
    deviceAmmoCountMP.AmmoCountTF.SetText(Ammo);

	// If we are showing the ammo clip and not in a vehicle, update the ammo count.
	if (m_bShowingAmmoClip && Ammo != "")
	{
		Reticules.SetVehicleAmmoClip(Ammo);
	}

    dev = TrDevice(Wep);

    if (dev != None)
    {
        dev.UpdateLowAmmoWarning();
    }
}

function ClearStats(optional bool clearScores)
{
    local GFxObject.ASDisplayInfo DI;

    super.ClearStats(clearScores);

    if (PlayerHE.LastEnergy != -10)
    {
        if( PlayerHE.EnergyTF != none )
        {
            PlayerHE.EnergyTF.SetString("text", "");		
        }

        if( PlayerHE.EnergyBarMC != none )
        {
            PlayerHE.EnergyBarMC.SetDisplayInfo(DI);
        }
        PlayerHE.LastEnergy = -10;
    }
}

function ForceHealthUpdate(int NewHealth, int NewMaxHealth)
{
    UpdateHealth(PlayerHE, NewHealth, NewMaxHealth);
}

function int GetSkiSpeedStep(float speed)
{
    local int i;

    for (i = 11; i > 0; i--)
    {
        if (m_SkiSpeedSteps[i] < speed)
        {
            return i+1;
        }
    }

    return 1;
}

function ConfigureSkiSpeedSteps(float SoftCap)
{
    local int i;
    local int stepAmount;

    // JCR - Going back to standard (non-class specific) steps
    return;

    stepAmount = int(SoftCap * 0.083333f);

    for (i = 11; i >= 0; i--)
    {
        m_SkiSpeedSteps[i] = SoftCap;
        SoftCap -= stepAmount;
    }
}

function int GetFrameNumberForVehicle(TrVehicle v)
{
	if (v.IsA('TrVehicle_Havoc')) return 4;
    if (v.IsA('TrVehicle_Shrike')) return 3;
    if (v.IsA('TrVehicle_GravCycle')) return 2;
    if (v.IsA('TrVehicle_Beowulf')) return 1;

    return 2;
}

function TickHud(float DeltaTime)
{
    local int s,i;
    local int ammo;
    //local int currentCredits;
    local float rotation;
    local TrPawn TRP, SpectateViewingPawn;
    local TrVehicle TRV, SpectateViewingVehicle;
    local TrDevice trDev;
    local TrDevice device[3];
    local TrDevice_LaserTargeter TrDevLaser;
    local TrVehicleWeapon TRVW;
	local TrWeaponPawn TRWP;
    local TrPlayerReplicationInfo PRI;
    local int currentPercent;
    local int currentPercentReload;
    local int skiSpeedStep;
	local TrCamera_SpectatorBookmark SpectateViewingBookmark;
	local Actor SpectateObjectiveActor;

    super.TickHud(DeltaTime);

    if (m_TrPC == None)
    {
        return;
    }
    
    PRI = TrPlayerReplicationInfo(m_TrPC.PlayerReplicationInfo);
    TRP = TrPawn(m_TrPC.Pawn);
    TRV = TrVehicle(m_TrPC.Pawn);
	TRWP = TrWeaponPawn(m_TrPC.Pawn);

    // Update the compass heading
    rotation = ((m_TrPC.Rotation.Yaw) & 65535) * (360.0/65536.0);

    if (rotation != m_fLastRotation)
    {
        m_fLastRotation = rotation;
        ASSetHeading(m_fLastRotation);
    }

    // Power (energy) pool display.
    if (TRP != None)
    {
        if (TRP.GetCurrentPowerPool() != PlayerHE.LastEnergy)
        {
            UpdateEnergy(PlayerHE, TRP.GetCurrentPowerPool(), TRP.GetMaxPowerPool());
        }

        /*// set the credits
        currentCredits = m_TrPC.GetCurrentCredits();

        if (currentCredits != m_nLastCredits)
        {
            m_nLastCredits = currentCredits;
            UpdateCredits(currentCredits);
        }*/

        // Get the device to check ammo pool
        trDev = TrDevice(TRP.Weapon);

        if (trDev != None)
        {
            if (m_nLastAmmoPool != trDev.m_nCarriedAmmo)
            {
                m_nLastAmmoPool = trDev.m_nCarriedAmmo;

                if (m_nLastAmmoPool < 0)
                {
                    m_nLastAmmoPool = 0;
                }

                deviceAmmoPoolMP.AmmoCountTF.SetText(m_nLastAmmoPool);
            }
        }
    }
    
    if (TRV == none)
    {
        // Check if we are a rider in this vehicle, otherwise see if our pawn is the weapon
        if (TrP != none)
        {
            TRV = TrP.m_RidingVehicle;
        }
        else if (TRWP != none)
        {
            TRV = TrVehicle(TRWP.MyVehicle);
        }
    }

    if (TRV != none)
    {
        if (!m_bLastInVehicle)
        {
            UpdateVehicleStats(true, GetFrameNumberForVehicle(TRV));

            m_bLastInVehicle=true;
        }

        if (m_nLastSeatMask != TRV.SeatMask)
        {
            m_nLastSeatMask = TRV.SeatMask;
			m_nLastVehicleAmmoPool = -1;

            for (i = 0; i < TRV.Seats.Length; i++)
            {
                if ((m_nLastSeatMask & (1<<i)) != 0)
                {
                    if (TRV.GetControllerForSeatIndex(i) == m_TrPC || (TRP != none && TRP.DrivenWeaponPawn.SeatIndex == i))
                    {
                        UpdateVehicleSeat(i, 1); // me
                    }
                    else
                    {
                        UpdateVehicleSeat(i, 2); // another player
                    }
                }
                else
                {
                    UpdateVehicleSeat(i, 3);     // empty
                }
            }
        }

        if (m_nLastVehicleHealth!=TRV.Health)
        {
            m_nLastVehicleHealth = TRV.Health;
            UpdateVehicleHealth(m_nLastVehicleHealth, 11.0 - (10.0 * m_nLastVehicleHealth / TRV.HealthMax));
        }

		if (m_fLastVehicleEnergy != TRV.m_fCurrentPowerPool)
		{
			m_fLastVehicleEnergy = TRV.m_fCurrentPowerPool;

			if (TRV.r_fMaxPowerPool > 0)
			{
				UpdateVehicleEnergy(m_fLastVehicleEnergy, 11.0 - (10.0 * m_fLastVehicleEnergy / TRV.r_fMaxPowerPool));
			}
			else
			{
				UpdateVehicleEnergy(m_fLastVehicleEnergy, 12);
			}
		}

		if (TRWP != none)
		{
			TRVW = TrVehicleWeapon(TRWP.Weapon);
		}
		else if (TRWP == none && TRP == none)
		{
			TRVW = TrVehicleWeapon(TRV.Weapon);
		}

        if (TRVW != none)
        {
            //JCR - Implementing the vehicle reload animation
            if (TRVW.HasReticuleCharge())
            {
                currentPercentReload = TRVW.CalculateReloadPercentRemaining()*100;

                if (currentPercentReload != m_nLastPercentReload)
                {
                    if (TRVW.m_nReticuleIndex == THR_SPINFUSOR)
                        Reticules.SetGenericPowerupPercentage(currentPercentReload);
                    else
                        Reticules.SetVehiclePowerupPercentage(currentPercentReload);

                    m_nLastPercentReload = currentPercentReload;
                }
            }
            else
            {
                if (m_nLastPercentReload != 0)
                {
                    m_nLastPercentReload = 0;
                    Reticules.SetVehiclePowerupPercentage(100);
                }
            }

			// Show the ammo clip depending.
			if (TRVW.m_bShowAmmoIndicator && !m_bShowingAmmoClip)
			{
				Reticules.EnableVehicleAmmoClip();

				m_bShowingAmmoClip = true;
			}
			else if (!TRVW.m_bShowAmmoIndicator && m_bShowingAmmoClip)
			{
				Reticules.DisableVehicleAmmoClip();

				m_bShowingAmmoClip = false;
			}

			// Update the vehicle ammo pool if we want to show the indicator.
			if (TRVW.m_bShowAmmoIndicator && 
				m_nLastVehicleAmmoPool != TRVW.AmmoCount && 
				TRVW.m_fReloadTimeRemaining <= TRVW.WorldInfo.TimeSeconds)
			{
				m_nLastVehicleAmmoPool = TRVW.AmmoCount;

				Reticules.SetVehicleAmmoClip(m_nLastVehicleAmmoPool$"/"$TRVW.MaxAmmoCount);
			}
        }
		else if (!m_bLastIn3P && m_bShowingAmmoClip)
		{
			Reticules.DisableVehicleAmmoClip();

			m_bShowingAmmoClip = false;
		}
    }
    else if (m_bLastInVehicle)
    {
		Reticules.DisableVehicleAmmoClip();
        UpdateVehicleStats(false);
        m_bLastInVehicle=false;
		m_nLastVehicleAmmoPool=-1;
		m_bShowingAmmoClip = false;
		m_bLastIn3P = false;
    }

	if (m_bLastIn3P != m_TrPC.bBehindView || m_TrPC.m_bIsRovingSpectating || m_TrPC.m_bViewThroughDeathCamera || m_TrPC.IsDead())
	{
		m_bLastIn3P = m_TrPC.bBehindView && !m_TrPC.m_bIsRovingSpectating && !m_TrPC.m_bViewThroughDeathCamera && !m_TrPC.IsDead();
		m_bShowingAmmoClip = m_bLastIn3P;

		if (m_bLastIn3P)
		{
			if (TRVW == none)
			{
				Reticules.EnableVehicleAmmoClip();
				Reticules.SetVehicleAmmoClip(LastAmmoCount$"");
			}
		}
		else
		{
			Reticules.DisableVehicleAmmoClip();
		}
	}

    if (TrP != none)
    {
        Reticules.UpdateReticule(TrP);
    }
	else if( TRWP != none)
	{
		Reticules.UpdateReticule(TRWP);
	}
	else if( TrV != none )
	{
		Reticules.UpdateReticule(TrV);
	}

    // Team pointer display.
    /* JCR - Not implementing at this time
    if (PRI.Team != m_LastTeam)
    {
        m_LastTeam = PRI.Team;
        UpdateTeamStats(m_LastTeam.TeamIndex+1);
    }*/

    // Get our offhand devices.
    device[0] = m_TrPC.GetDeviceByEquipPoint(EQP_Belt);
    device[1] = m_TrPC.GetDeviceByEquipPoint(EQP_Deployable);
    device[2] = m_TrPC.GetDeviceByEquipPoint(EQP_Pack);

    for (s = 0; s < 3; s++)
    {
        if (device[s] != m_LastOffhand[s])
        {
            if (device[s] != None)
            {
                UpdateOffhand(s, TrDevice_Pack(device[s]) == none, device[s].m_nIconIndex);
            }
            else
            {
                UpdateOffhand(s, false);
            }
            
            m_LastOffhand[s] = device[s];
        }

        if (m_LastOffhand[s] != None)
        {
            if (TrDevice_Deployable(m_LastOffhand[s]) != none)
            {
                ammo = m_LastOffhand[s].AmmoCount;
            }
            else
            {
                ammo = m_LastOffhand[s].m_nCarriedAmmo;
            }

            if (ammo != m_nLastOffhandCount[s])
            {
                m_nLastOffhandCount[s] = ammo;
                UpdateOffhand(s, TrDevice_Pack(m_LastOffhand[s]) == none, -1, ammo);
            }
        }
    }

    // Check for flag carry state change.
    if (PRI != none && m_bLastHasFlag != PRI.bHasFlag)
    {
        m_bLastHasFlag = PRI.bHasFlag;
        UpdateFlagInHand(m_bLastHasFlag);
    }

    if (m_bLastSkiing != m_TrHUD.m_bIsControllerSkiing)
    {
        m_bLastSkiing = m_TrHUD.m_bIsControllerSkiing;
        UpdateSkiing(m_bLastSkiing);
    }

    if (m_bLastSkiing && m_TrPC.Pawn != none)
    {
        skiSpeedStep = GetSkiSpeedStep( VSize(m_TrPC.Pawn.Velocity) );

        if (skiSpeedStep != m_nLastSkiSpeedStep)
        {
            m_nLastSkiSpeedStep = skiSpeedStep;
            UpdateSkiLevel(m_nLastSkiSpeedStep);
        } 
    }
    
    if (TrP != none && m_TrPC.GetZoomedState() != ZST_NotZoomed)
    {
        currentPercent = TrDevice(TrP.Weapon).CalcHUDAimChargePercent()*100;

        if (currentPercent != m_nLastPercent)
        {
            m_nLastPercent = currentPercent;
            Reticules.SetPowerupPercentage(m_nLastPercent);
        }
    }

    if (m_TrPC != none && TrP != none)
    {
        TrDevLaser = TrDevice_LaserTargeter(m_TrPC.Pawn.Weapon);

        if (TrDevLaser != none)
        {
            currentPercent = TrDevLaser.CalcHUDAimChargePercent() * 100;

            if (currentPercent != m_nLastPercentLaser)
            {
                Reticules.SetLaserPowerupPercentage(currentPercent);
                m_nLastPercentLaser = currentPercent;
            }
        }
    }

    // show nag messages as needed
    if (m_PromptPanelTempMessage.bInUse && m_PromptPanelTempMessage.TakeDownTime != -1)
    {
        m_PromptPanelTempMessage.TakeDownTime -= m_TrHUD.RenderDelta;

        if (m_PromptPanelTempMessage.TakeDownTime <= 0)
        {
            ClearPromptPanel();
        }
    }

    if( m_HeroStatusTempMessage.bInUse )
    {
        m_HeroStatusTempMessage.TakeDownTime -= m_TrHUD.RenderDelta;

        if( m_HeroStatusTempMessage.TakeDownTime <= 0)
        {
            ClearHeroStatus();
        }
    }
   
    if (PRI != none && PRI.WorldInfo.TimeSeconds - m_fLastSpeedometerUpdateTime > m_fSpeedometerUpdateInterval)
    {
        m_fLastSpeedometerUpdateTime = PRI.WorldInfo.TimeSeconds;

        if (TRP == none)
        {
            SetSpeedometer(0);
        }
        else
        {
            SetSpeedometer(TRP.CalculatePawnSpeed());
        }
    }

	if( m_TrPC != none && !m_TrPC.InRovingSpectate() )
	{	
		TickDirectionalDamageEffect(0.015);
	}

    TickGhostHealth(0.08);

	if( m_TrHUD != none && m_TrPC != none && (m_bGameOver || m_TrPC.InRovingSpectate()) )
	{
		m_TrPC.GetViewTargetList(SpectateViewingPawn, SpectateViewingVehicle, SpectateViewingBookmark, SpectateObjectiveActor);

		// Handle showing/hiding the player panel.
		if( !m_bGameOver && SpectateViewingPawn != none )
		{
			m_TrHUD.ShowSpectatorPlayer();
			m_TrHUD.UpdateSpectatorPlayerPanel(SpectateViewingPawn);
		}
		else
		{
			m_TrHUD.HideSpectatorPlayer();
		}

		// Handle showing/hiding the vehicle panel.
		if( !m_bGameOver && SpectateViewingVehicle != none )
		{
			m_TrHUD.ShowSpectatorVehicle();
			m_TrHUD.UpdateSpectatorVehiclePanel(SpectateViewingVehicle);
		}
		else
		{
			m_TrHUD.HideSpectatorVehicle();
		}

		// Handle showing/hiding the bookmark panel. 
		// The actual update happens when the view target is set in the PlayerController.
		if( !m_bGameOver && SpectateViewingBookmark != none )
		{
			m_TrHUD.ShowSpectatorBookmark();
		}
		else
		{
			m_TrHUD.HideSpectatorBookmark();
		}

		// Handle showing/hiding the objective panel.
		if( !m_bGameOver && SpectateObjectiveActor != none )
		{
			m_TrHUD.ShowSpectatorObjectivePanel();
			m_TrHUD.UpdateSpectatorObjectivePanel(SpectateObjectiveActor);
		}
		else
		{
			m_TrHUD.HideSpectatorObjectivePanel();
		}

		// Handle showing/hiding the free cam panel
		if( !m_bGameOver && (m_TrPC.ViewTarget == m_TrPC || m_TrPC.ViewTarget == none ))
		{
			m_TrHUD.ShowSpectatorFloatCameraPanel();
			m_TrHUD.UpdateSpectatorFloatCameraPanel();
		}
		else
		{
			m_TrHUD.HideSpectatorFloatCameraPanel();
		}
	}
}

//
//	fade the directional damage effect
//
function TickDirectionalDamageEffect(float DeltaTime)
{
	local float tickDecrement;
	local name paramName;
	local bool bFoundNonZero;

	tickDecrement = -DeltaTime / m_fDirectionalDamageFadeTime;

	foreach m_aDamageEffectNames(paramName)
	{
		if (ChangeDamageEffectParameter(paramName,tickDecrement))
			bFoundNonZero=true;
    }
	
	if (ChangeDamageEffectParameter('Hit_Ramp',tickDecrement))
		bFoundNonZero=true;

	if (!bFoundNonZero && !m_bNearDeathOn) m_DirectionalDamageEffect.bShowInGame = false;
}

//
//	change a parameter by name.  return true if the new value of the parameter is non-zero
//
function bool ChangeDamageEffectParameter(name paramName, float changeValue)
{
	local float value;
    m_DirDamageMaterialInstance.GetScalarParameterValue(paramName,value);

	if (changeValue>=0 || value!=0)
	{
		value += changeValue;
		if (value>1) value = 1;
		else if (value<0) value = 0;
	    m_DirDamageMaterialInstance.SetScalarParameterValue(paramName,value);
	}

	return value!=0;
}

/** 
 *  Plays the damage effect but does not show the directional indicator. Useful for 
 *  nondirectional damage or generic pain, such as death.
 *  */
function PlayDamageEffectWithNoDirectionalIndicator(float Amount)
{
    if (m_TrPC.m_bShowHUDCracks)
    {
        ChangeDamageEffectParameter('Hit_Ramp',Amount);
        m_DirectionalDamageEffect.bShowInGame = true;
    }
}

//
//
function ApplyDirectionalDamageEffect(int effectIndex, float addValue)
{
    if (addValue<=0) return;
    
    if (m_TrPC.AlienFX != none)
    {
		m_TrPC.AlienFX.DamageConvert(string(m_aDamageEffectNames[effectIndex]));
    }
    
    if (m_TrPC.m_bShowHUDCracks)
    {
        // change the directional paramter
        ChangeDamageEffectParameter(m_aDamageEffectNames[effectIndex],addValue);

        // and the overall effect
        ChangeDamageEffectParameter('Hit_Ramp',addValue);

        m_DirectionalDamageEffect.bShowInGame = true;
    }
}

function ApplyNearDeathEffect(float value)
{
    if (m_TrPC.m_bShowHUDCracks)
    {
        m_DirDamageMaterialInstance.SetScalarParameterValue('Hit_NearDeath',value);

        m_bNearDeathOn=(value>0);

        if (m_bNearDeathOn)
            m_DirectionalDamageEffect.bShowInGame = true;
    }
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
    local int HitDirIndex;

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
            DirOfHit = 180 - AngularDist.X;
    }
    else
        DirOfHit = 180;

    HitDirIndex = int(DirOfHit/45.f);
    HitLocMC[HitDirIndex].GotoAndPlay("on");

    //`log("Damage value"@Damage@"------------------------------------");
    ApplyDirectionalDamageEffect(HitDirIndex,Damage/300.0);
}

function UpdateHealth(out HeEnDisplay info, float NewHealth, float HealthMax)
{
    local float nearDeath;
		
	if (m_TrPC != none && m_TrPC.AlienFX != none && m_TrPC.EnableAlienFX)
	{
		m_TrPC.AlienFX.SetHealth((NewHealth * 100) / HealthMax);
	}
    
    if (info.LastHealth != NewHealth || m_fLastMaxHealth != HealthMax)
    {
        // handle post process effect chain updates
        nearDeath = NewHealth / HealthMax;

        ApplyNearDeathEffect(nearDeath);

        // handle tribes-specific HUD updates
        m_fLastActualHealth = 10.0 * (NewHealth/HealthMax);
        m_fLastMaxHealth = HealthMax;

        RetrieveGFxObject(PlayerStats_HealthFillBar, "playerStats.healthFillBar").GotoAndStopI( 11.0 - m_fLastActualHealth );
    }

    // call super to handle generic HUD updates
    super.UpdateHealth(info,NewHealth,HealthMax);
}

function TickGhostHealth(float DeltaTime)
{
    local int healthFrame;

    healthFrame = int(m_fCurrentGhostHealth);

    if (m_fLastActualHealth > m_fCurrentGhostHealth)
    {
        m_fCurrentGhostHealth = m_fLastActualHealth;
    }
    else if (m_fLastActualHealth < m_fCurrentGhostHealth)
    {
        m_fCurrentGhostHealth -= DeltaTime;
    }

    if (int(m_fCurrentGhostHealth) != healthFrame)
    {
        RetrieveGFxObject(PlayerStats_GhostHealthBar, "playerStats.ghostHealthBar").GotoAndStopI( 11.0 - int(m_fCurrentGhostHealth) );
    }
}

function UpdateEnergy(out HeEnDisplay info, float NewEnergy, float EnergyMax)
{
    if( info.LastEnergy != NewEnergy && EnergyMax != 0.0)
    {
        RetrieveGFxObject(PlayerStats_EnergyFillBar, "playerStats.energyFillBar").GotoAndStopI( 11.0 - (10.0 * (NewEnergy/EnergyMax)) );
    }

    super.UpdateEnergy(info,NewEnergy,EnergyMax);
}

function SetOwnership()
{
    m_TrPC = TrPlayerController(GetPC());

    if (m_TrPC != none && m_TrPC.myHUD != none)
    {
        m_TrHUD = TrHUD(m_TrPC.myHUD);
    }
}

final function TeamScoreboardUpdateSlot(int Index, string PlayerName, string Score, string Kills, string Assists, string Ping, string ClassAbb, int Rank, int RankIcon)
{
    if (Index < 16)
    {
        RetrieveGFxObject(TeamScoreboard_Red_PlayerNameTF[Index], "teamScoreboard_mc.redRow"$Index+1$".playerNameTF").SetText(PlayerName);
        RetrieveGFxObject(TeamScoreboard_Red_ScoreTF[Index], "teamScoreboard_mc.redRow"$Index+1$".scoreTF").SetText(Score);
        RetrieveGFxObject(TeamScoreboard_Red_KillsTF[Index], "teamScoreboard_mc.redRow"$Index+1$".killsTF").SetText(Kills);
        RetrieveGFxObject(TeamScoreboard_Red_AssistsTF[Index], "teamScoreboard_mc.redRow"$Index+1$".assistsTF").SetText(Assists);
        RetrieveGFxObject(TeamScoreboard_Red_PingTF[Index], "teamScoreboard_mc.redRow"$Index+1$".pingTF").SetText(Ping);
        RetrieveGFxObject(TeamScoreboard_Red_ClassTF[Index], "teamScoreboard_mc.redRow"$Index+1$".classTF").SetText(ClassAbb);
        RetrieveGFxObject(TeamScoreboard_Red_RankIcon[Index], "teamScoreboard_mc.redRow"$Index+1$".rankIcon").SetText(Rank);

        if (Rank == -1) RetrieveGFxObject(TeamScoreboard_Red_RankTF[Index], "teamScoreboard_mc.redRow"$Index+1$".rankTF").SetText("");
        else RetrieveGFxObject(TeamScoreboard_Red_RankTF[Index], "teamScoreboard_mc.redRow"$Index+1$".rankTF").SetText(Rank);

        if (RankIcon == -1)
        {
            RetrieveGFxObject(TeamScoreboard_Red_RankIcon[Index], "teamScoreboard_mc.redRow"$Index+1$".rankIcon").SetVisible(false);
        }
        else
        {
            RetrieveGFxObject(TeamScoreboard_Red_RankIcon[Index], "teamScoreboard_mc.redRow"$Index+1$".rankIcon").GotoAndStopI(RankIcon);
            RetrieveGFxObject(TeamScoreboard_Red_RankIcon[Index], "teamScoreboard_mc.redRow"$Index+1$".rankIcon").SetVisible(true);
        }
    }
    else
    {
        Index -= 16;

        RetrieveGFxObject(TeamScoreboard_Blue_PlayerNameTF[Index], "teamScoreboard_mc.blueRow"$Index+1$".playerNameTF").SetText(PlayerName);
        RetrieveGFxObject(TeamScoreboard_Blue_ScoreTF[Index], "teamScoreboard_mc.blueRow"$Index+1$".scoreTF").SetText(Score);
        RetrieveGFxObject(TeamScoreboard_Blue_KillsTF[Index], "teamScoreboard_mc.blueRow"$Index+1$".killsTF").SetText(Kills);
        RetrieveGFxObject(TeamScoreboard_Blue_AssistsTF[Index], "teamScoreboard_mc.blueRow"$Index+1$".assistsTF").SetText(Assists);
        RetrieveGFxObject(TeamScoreboard_Blue_PingTF[Index], "teamScoreboard_mc.blueRow"$Index+1$".pingTF").SetText(Ping);
        RetrieveGFxObject(TeamScoreboard_Blue_ClassTF[Index], "teamScoreboard_mc.blueRow"$Index+1$".classTF").SetText(ClassAbb);
        RetrieveGFxObject(TeamScoreboard_Blue_RankIcon[Index], "teamScoreboard_mc.blueRow"$Index+1$".rankIcon").SetText(Rank);

        if (Rank == -1) RetrieveGFxObject(TeamScoreboard_Blue_RankTF[Index], "teamScoreboard_mc.blueRow"$Index+1$".rankTF").SetText("");
        else RetrieveGFxObject(TeamScoreboard_Blue_RankTF[Index], "teamScoreboard_mc.blueRow"$Index+1$".rankTF").SetText(Rank);

        if (RankIcon == -1)
        {
            RetrieveGFxObject(TeamScoreboard_Blue_RankIcon[Index], "teamScoreboard_mc.blueRow"$Index+1$".rankIcon").SetVisible(false);
        }
        else
        {
            RetrieveGFxObject(TeamScoreboard_Blue_RankIcon[Index], "teamScoreboard_mc.blueRow"$Index+1$".rankIcon").GotoAndStopI(RankIcon);
            RetrieveGFxObject(TeamScoreboard_Blue_RankIcon[Index], "teamScoreboard_mc.blueRow"$Index+1$".rankIcon").SetVisible(true);
        }
    }

}

final function RabbitScoreboardUpdateSlot(int Index, string PlayerName, string Score, string Kills, string Assists, string Ping, string ClassAbb, int Rank, int RankIcon)
{
    RetrieveGFxObject(RabbitScoreboard_PlayerTF[Index], "rabbitScoreboard_mc.playerTF"$Index+1).SetText(PlayerName);    
    RetrieveGFxObject(RabbitScoreboard_ScoreT[Index], "rabbitScoreboard_mc.scoreTF"$Index+1).SetText(Score);    
    RetrieveGFxObject(RabbitScoreboard_KillsTF[Index], "rabbitScoreboard_mc.killsTF"$Index+1).SetText(Kills);
    RetrieveGFxObject(RabbitScoreboard_AssistsTF[Index], "rabbitScoreboard_mc.assistsTF"$Index+1).SetText(Assists);
    RetrieveGFxObject(RabbitScoreboard_PingTF[Index], "rabbitScoreboard_mc.pingTF"$Index+1).SetText(Ping);
    RetrieveGFxObject(RabbitScoreboard_ClassTF[Index], "rabbitScoreboard_mc.classTF"$Index+1).SetText(ClassAbb);

    if (Rank == -1)
    {
        RetrieveGFxObject(RabbitScoreboard_RankTF[Index], "rabbitScoreboard_mc.rankTF"$Index+1).SetVisible(false);
    }
    else
    {
        RetrieveGFxObject(RabbitScoreboard_RankTF[Index], "rabbitScoreboard_mc.rankTF"$Index+1).GotoAndStopI(Rank);
        RetrieveGFxObject(RabbitScoreboard_RankTF[Index], "rabbitScoreboard_mc.rankTF"$Index+1).SetVisible(true);
    }
        
    if (RankIcon == -1)
    {
        RetrieveGFxObject(RabbitScoreboard_RankIcon[Index], "rabbitScoreboard_mc.rankIcon"$Index+1).SetVisible(false);
    }
    else
    {
        RetrieveGFxObject(RabbitScoreboard_RankIcon[Index], "rabbitScoreboard_mc.rankIcon"$Index+1).GotoAndStopI(RankIcon);
        RetrieveGFxObject(RabbitScoreboard_RankIcon[Index], "rabbitScoreboard_mc.rankIcon"$Index+1).SetVisible(true);
    }
}

function RabbitScoreboardActivePlayer(int Index, bool bVisible)
{
    RetrieveGFxObject(RabbitScoreboard_PlayerHighlight[Index], "rabbitScoreboard_mc.playerHighlight"$Index+1).SetVisible(bVisible);
}

final function RabbitLeaderboardShow(bool bVisible)
{
    RetrieveGFxObject(RabbitStats, "rabbitTeamStats").SetVisible(bVisible);
}

final function RabbitLeaderboardUpdateSlot(int Index, string PlayerName, string Score)
{
    RetrieveGFxObject(RabbitStats_LeaderText[Index], "rabbitTeamStats.rabbitLeader"$Index+1$".rabbitText").SetVisible(true);
    RetrieveGFxObject(RabbitStats_LeaderText[Index], "rabbitTeamStats.rabbitLeader"$Index+1$".rabbitText").SetText(PlayerName);
    RetrieveGFxObject(RabbitStats_LeaderScore[Index], "rabbitTeamStats.rabbitLeader"$Index+1$".rabbitScore").SetVisible(true);
    RetrieveGFxObject(RabbitStats_LeaderScore[Index], "rabbitTeamStats.rabbitLeader"$Index+1$".rabbitScore").SetText(Score);
}

final function RabbitLeaderboardUpdateTime(string Time)
{
    RetrieveGFxObject(RabbitStats_Timer, "rabbitTeamStats.rabbitTimer").SetText(Time);
}

function TeamCTFStatsUpdateGeneratorStatus(int Team, bool bPowered)
{
    if (bPowered)
    {
        if (Team == 0) RetrieveGFxObject(CTFStats_LeftGenStatus, "ctfTeamStats.leftGeneratorStatus").GotoAndStopI(1);
        else RetrieveGFxObject(CTFStats_RightGenStatus, "ctfTeamStats.rightGeneratorStatus").GotoAndStopI(1);
    }
    else
    {
        if (Team == 0) RetrieveGFxObject(CTFStats_LeftGenStatus, "ctfTeamStats.leftGeneratorStatus").GotoAndStopI(2);
        else RetrieveGFxObject(CTFStats_RightGenStatus, "ctfTeamStats.rightGeneratorStatus").GotoAndStopI(2);
    }
}
    
function TeamCTFStatsUpdateGeneratorTimer(int Team, string Time)
{
    if (Team == 0) RetrieveGFxObject(CTFStats_LeftGenTimer, "ctfTeamStats.leftGeneratorStatus.generatorTimer").SetText(Time);
    else RetrieveGFxObject(CTFStats_RightGenTimer, "ctfTeamStats.rightGeneratorStatus.generatorTimer").SetText(Time);
}

function TeamCTFStatsUpdateFlagReturnTime(int Team, string Time)
{
	if (Team == 0) RetrieveGFxObject(CTFStats_LeftFlagTimer, "ctfTeamStats.blueTeamFlagLabel").SetText(Time);
	else RetrieveGFxObject(CTFStats_RightFlagTimer, "ctfTeamStats.redTeamFlagLabel").SetText(Time);
}

function TeamCTFStatsUpdateFlagStatus(int Team, bool bAtBase)
{
    if (bAtBase)
    {
        if (Team == 0) RetrieveGFxObject(CTFStats_LeftFlagStatus, "ctfTeamStats.leftFlagStatus").GotoAndStopI(1);
        else RetrieveGFxObject(CTFStats_RightFlagStatus, "ctfTeamStats.rightFlagStatus").GotoAndStopI(1);
    }
    else
    {
        if (Team == 0) RetrieveGFxObject(CTFStats_LeftFlagStatus, "ctfTeamStats.leftFlagStatus").GotoAndStopI(2);
        else RetrieveGFxObject(CTFStats_RightFlagStatus, "ctfTeamStats.rightFlagStatus").GotoAndStopI(2);
    }
}

function TeamCTFStatsUpdateTeamScore(int Team, int Score)
{
    if (Team == 0)
    {
        if (Score < 0) RetrieveGFxObject(CTFStats_LeftScore, "ctfTeamStats.leftTeamScore").SetText("");
        else RetrieveGFxObject(CTFStats_LeftScore, "ctfTeamStats.leftTeamScore").SetText(Score);
    }
    else
    {
        if (Score < 0) RetrieveGFxObject(CTFStats_RightScore, "ctfTeamStats.rightTeamScore").SetText("");
        else RetrieveGFxObject(CTFStats_RightScore, "ctfTeamStats.rightTeamScore").SetText(Score);
    }
}

function TeamCTFStatsUpdateTime(string Time)
{
    RetrieveGFxObject(CTFStats_Timer, "ctfTeamStats.gameTimer").SetText(Time);
}

function TeamCTFStatsShow(bool bVisible)
{
    RetrieveGFxObject(CTFStats, "ctfTeamStats").SetVisible(m_TrPC.m_bShowHUDScores && bVisible);
}

function TeamRabbitStatsUpdateFlagStatus(int Team)
{ 
    if (Team == 0)
    {
        RetrieveGFxObject(TdmStats_leftFlagStatus, "tdmStats.leftFlagStatus").SetVisible(true);
        RetrieveGFxObject(TdmStats_rightFlagStatus, "tdmStats.rightFlagStatus").SetVisible(false);
    }
    else if (Team == 1)
    {
        RetrieveGFxObject(TdmStats_leftFlagStatus, "tdmStats.leftFlagStatus").SetVisible(false);
        RetrieveGFxObject(TdmStats_rightFlagStatus, "tdmStats.rightFlagStatus").SetVisible(true);
    }
    else
    {
        RetrieveGFxObject(TdmStats_leftFlagStatus, "tdmStats.leftFlagStatus").SetVisible(false);
        RetrieveGFxObject(TdmStats_rightFlagStatus, "tdmStats.rightFlagStatus").SetVisible(false);
    }
}

function TeamRabbitStatsUpdateTeamScore(int Team, int Score)
{
    if (Team == 0)
    {
        ASC_FriendlyTDMScoreUpdate(Score);
    }
    else
    {
        ASC_EnemyTDMScoreUpdate(Score);
    }
}

function ASC_FriendlyTDMScoreUpdate(int Val)
{
    ActionScriptVoid("friendlyTDMScoreUpdate");
}

function ASC_EnemyTDMScoreUpdate(int Val)
{
    ActionScriptVoid("enemyTDMScoreUpdate");
}

function TeamRabbitStatsPointBreak(int Team, string Val)
{
    if (Team == 0)
    {
        ASC_FriendlyTDMPointBreak(Val);
    }
    else
    {
        ASC_EnemyTDMPointBreak(Val);
    }
}

function ASC_FriendlyTDMPointBreak(string Val)
{
    ActionScriptVoid("friendlyTDMPointBreak");
}

function ASC_EnemyTDMPointBreak(string Val)
{
    ActionScriptVoid("enemyTDMPointBreak");
}

function ShowNotification(string Val, string Val2)
{
    ;
    actionScriptVoid("showHUDNotification");
}

function HideNotification()
{
    actionScriptVoid("hideHUDNotification");
}

function TeamRabbitStatsUpdateTime(string Time)
{
    RetrieveGFxObject(TdmStats_gameTimer, "tdmStats.gameTimer").SetText(Time);
}

function TeamRabbitStatsShow(bool bVisible)
{
    RetrieveGFxObject(TdmStats, "tdmStats").SetVisible(m_TrPC.m_bShowHUDScores && bVisible);
}

function ArenaUpdateManGraphic(GFxObject Obj, string Path, int Index)
{
	RetrieveGFxObject(Obj, Path);
	if( Index == 0 )
	{
		Obj.SetVisible(false);
	}
	else
	{
		Obj.SetVisible(true);
		Obj.GotoAndStopI(Index);
	}
}

function ArenaStatsUpdateTime(string Time)
{
	RetrieveGFxObject(ArenaStats_arenaGameTimerTF, "arenaStats.arenaGameTimerTF").SetText(Time);
}

function ArenaStatsUpdateRoundCount(int RoundNum)
{
	RetrieveGFxObject(ArenaStats_roundCountTF, "arenaStats.roundCountTF").SetText(m_sRound$string(RoundNum));
}

function ArenaStatsUpdateFriendlyRoundScore(int Score)
{
	RetrieveGFxObject(ArenaStats_FriendlyScoreTF, "arenaStats.roundFriendlyScoreTF").SetText(string(Score));
}

function ArenaStatsUpdateEnemyRoundScore(int Score)
{
	RetrieveGFxObject(ArenaStats_EnemyScoreTF, "arenaStats.roundEnemyScoreTF").SetText(string(Score));
}

function ArenaStatsShow(bool bVisible)
{
    RetrieveGFxObject(ArenaStats, "arenaStats").SetVisible(m_TrPC.m_bShowHUDScores && bVisible);
}

function ArenaStatsPointBreak(int Team, string Val)
{
    if (Team == 0)
    {
        ASC_FriendlyArenaPointBreak(Val);
    }
    else
    {
        ASC_EnemyArenaPointBreak(Val);
    }
}

function ASC_FriendlyArenaPointBreak(string Val)
{
    ActionScriptVoid("friendlyArenaPointBreak");
}

function ASC_EnemyArenaPointBreak(string Val)
{
    ActionScriptVoid("enemyArenaPointBreak");
}

function ArenaStatsUpdateTeamScore(int Team, int Score)
{
    if (Team == 0)
    {
        ASC_FriendlyArenaLivesUpdate(Score);
    }
    else
    {
        ASC_EnemyArenaLivesUpdate(Score);
    }
}

function ASC_FriendlyArenaLivesUpdate(int Val)
{
    ActionScriptVoid("friendlyArenaLivesUpdate");
}

function ASC_EnemyArenaLivesUpdate(int Val)
{
    ActionScriptVoid("enemyArenaLivesUpdate");
}

/** Defend and Destroy */
function DaDStatsShow(bool bVisible)
{
    RetrieveGFxObject(DaDStats, "siegeStats").SetVisible(m_TrPC.m_bShowHUDScores && bVisible);
}

function DaDUpdateFriendlyStats(int bGenOnline, string RemainingGenTime, int CapAOnline, int CapBOnline, int CapCOnline, int CoreHealth)
{
	ActionScriptVoid("friendlyDestroyUpdate");
}

function DaDUpdateEnemyStats(int bGenOnline, string RemainingGenTime, int CapAOnline, int CapBOnline, int CapCOnline, int CoreHealth)
{
	ActionScriptVoid("enemyDestroyUpdate");
}

/** Capture and Hold */
function CaHStatsShow(bool bVisible)
{
    RetrieveGFxObject(CaHStats, "dndStats").SetVisible(m_TrPC.m_bShowHUDScores && bVisible);
}

function CaHControlPointAShow(bool bVisible)
{
	RetrieveGFxObject(CaHControlPointA, "dndStats.CaHpointA").SetVisible(bVisible);
}

function CaHControlPointBShow(bool bVisible)
{
	RetrieveGFxObject(CaHControlPointB, "dndStats.CaHpointB").SetVisible(bVisible);
}

function CaHControlPointCShow(bool bVisible)
{
	RetrieveGFxObject(CaHControlPointC, "dndStats.CaHpointC").SetVisible(bVisible);
}

function CaHControlPointDShow(bool bVisible)
{
	RetrieveGFxObject(CaHControlPointD, "dndStats.CaHpointD").SetVisible(bVisible);
}

function CaHControlPointEShow(bool bVisible)
{
	RetrieveGFxObject(CaHControlPointE, "dndStats.CaHpointE").SetVisible(bVisible);
}

function CaHUpdate(int FriendlyHeld, int FriendlyPoints, int FriendlyPct, int EnemyHeld, int EnemyPoints, int EnemyPct, string GenTime)
{
	ActionScriptVoid("dndUpdate");
}

function CaHPointUpdate(string PointName, int PointType, int PctHeld)
{
	ActionScriptVoid("cahPointUpdate");
}

function CaHFriendlyPointBreak(string Value)
{
	ActionScriptVoid("dndFriendlyPointBreak");
}

function CaHEnemyPointBreak(string Value)
{
	ActionScriptVoid("dndEnemyPointBreak");
}

function TeamScoreboardShow(bool bVisible)
{
    RetrieveGFxObject(TeamScoreboard, "teamScoreboard_mc").SetVisible(bVisible);
}

function RabbitScoreboardShow(bool bVisible)
{
    RetrieveGFxObject(RabbitScoreboard, "rabbitScoreboard_mc").SetVisible(bVisible);
}

function UpdateCredits(int Credits)
{
    RetrieveGFxObject(Credits_And_Streaks_CreditsGroup_CreditsMC_CreditsN, "credits_and_streaks.creditsGroup.creditsMC.creditsN").SetText(Credits);
}

function UpdateFlagInHand(bool bVisible)
{
    RetrieveGFxObject(Offhands_And_Flag_FlagInHand, "offhands_and_flag.flagInhand").SetVisible(bVisible);
}

function UpdateSkiing(bool bSkiing)
{
    if (bSkiing)
    {
        RetrieveGFxObject(SkiIndicator[0], "skiIndicatorLeft").GotoAndPlayI(1);
        RetrieveGFxObject(SkiIndicator[1], "skiIndicatorRight").GotoAndPlayI(1);
    }
    else
    {
        RetrieveGFxObject(SkiIndicator[0], "skiIndicatorLeft").GotoAndPlayI(6);
        RetrieveGFxObject(SkiIndicator[1], "skiIndicatorRight").GotoAndPlayI(6);
    }
}

function UpdateSkiLevel(int Level)
{
    RetrieveGFxObject(SkiIndicatorFillBar[0], "skiIndicatorLeft.fillBar").GotoAndStopI(Level);
    RetrieveGFxObject(SkiIndicatorFillBar[1], "skiIndicatorRight.fillBar").GotoAndStopI(Level);
}

function UpdateTeamStats(int Team)
{
    RetrieveGFxObject(TeamStats, "teamStats").GotoAndStopI(Team);
}

function UpdateVehicleStats(bool bVisible, optional int FrameId)
{
    RetrieveGFxObject(VehicleStats, "vehicleStats").SetVisible(bVisible);

    if (bVisible)
    {
        RetrieveGFxObject(VehicleStats, "vehicleStats").GotoAndStopI(FrameId);
    }
}

function UpdateVehicleHealth(int Health, int FrameId)
{
    RetrieveGFxObject(VehicleStats_HealthTF_TextField, "vehicleStats.healthTF.textField").SetText(Health);
    RetrieveGFxObject(VehicleStats_VehicleHealthFill, "vehicleStats.vehicleHealthFill").GotoAndStopI(FrameId);
}

function UpdateVehicleEnergy(float Energy, int FrameId)
{
    RetrieveGFxObject(VehicleStats_EnergyTF_TextField, "vehicleStats.energyTF.textField").SetText(int(Energy));
    RetrieveGFxObject(VehicleStats_VehicleEnergyFill, "vehicleStats.vehicleEnergyFill").GotoAndStopI(FrameId);
}

function UpdateVehicleSeat(int Index, int FrameId)
{
    RetrieveGFxObject(VehicleStats_VehicleSlot[Index], "vehicleStats.vehicleSlot"$Index+1).GotoAndStopI(FrameId);
}

function UpdateOffhand(int Index, bool bVisible, optional int FrameId = -1, optional int Count = -1)
{
    if (Index == 1)
    {
        return;
    }
    
    if (Index == 0)
    {
        RetrieveGFxObject(playerStats_Offhand1, "playerStats.offhand1").SetVisible(true);
        RetrieveGFxObject(PlayerStats_Offhand1_Icon, "playerStats.offhand1.icon").SetVisible(true);
        
        if (FrameId >= 0)
        {
            RetrieveGFxObject(PlayerStats_Offhand1_Icon, "playerStats.offhand1.icon").GotoAndStopI(FrameId);
        }

        if (Count >= 0)
        {
            RetrieveGFxObject(PlayerStats_Offhand1_Count, "playerStats.offhand1.count").SetText(Count);
        }
    }
    else 
    {
        RetrieveGFxObject(PlayerStats_Pack, "playerStats.pack").SetVisible(true);
        RetrieveGFxObject(PlayerStats_PackMC, "playerStats.pack_mc").SetVisible(bVisible);

        if (FrameId >= 0)
        {
            RetrieveGFxObject(PlayerStats_Pack, "playerStats.pack").GotoAndStopI(FrameId);
        }

        if (Count >= 0)
        {
            RetrieveGFxObject(PlayerStats_PackCount, "playerStats.pack_mc.packCount").SetText(Count);
        }
    }
}

function UpdateOwnedItem(int Index, bool bVisible, optional int FrameId = -1)
{
	RetrieveGFxObject(DeployStatus[Index], "playerStats.deployableList.deployIcon"$(Index+1));

	if (DeployStatus[Index] != none)
	{
		DeployStatus[Index].SetVisible(bVisible);
		DeployStatus[Index].GotoAndStopI(FrameId);
	}
}

function SoundAccolade()
{
    if (m_TrPC != none)
    {
        if (bShowingBadge)
        {
            m_TrPC.PlaySound(SoundCue'AUD_UI_Player.Badge_Gained.A_CUE_UI_BadgeGained');
        }
        else
        {
            m_TrPC.PlaySound(SoundCue'AUD_UI_Player.Accolade_Gained.A_CUE_UI_AccoladeGained');
        }
    }
}

function UpdateCallIn(int Index, bool bEnable, bool bAvailable)
{
    if (bEnable)
    {
        if (bAvailable) // CallIn is now available for use
        {
            RetrieveGFxObject(Credits_And_Streaks_CallItem[Index], "credits_and_streaks.callItem"$Index+1).GotoAndPlay("2");
        }
        else // CallIn was used or you player doesn't have enough credits anymore
        {
            RetrieveGFxObject(Credits_And_Streaks_CallItem[Index], "credits_and_streaks.callItem"$Index+1).GotoAndPlay("21"); 
        }
    }
    else // Don't have a perk for this slot
    {
        RetrieveGFxObject(Credits_And_Streaks_CallItem[Index], "credits_and_streaks.callItem"$Index+1).GotoAndPlay("41");
    }
}

function GFxObject RetrieveGFxObject(out GFxObject Obj, string ObjName)
{
    if (Obj == none)
    {
        Obj = GetVariableObject("_root."$ObjName);
    }

    return Obj;
}

function SetGlobalAlert(string Message)
{
    RetrieveGFxObject(globalAlertTF, "globalAlertTF").SetText(Message);
    RetrieveGFxObject(globalAlertTF, "globalAlertTF").SetVisible(true);
}

function HideGlobalAlert()
{
    RetrieveGFxObject(globalAlertTF, "globalAlertTF").SetVisible(false);
}

function CreateKillCamInfo(TrPlayerReplicationInfo KillerPRI, TrPlayerReplicationInfo VictimPRI, class<TrDmgType_Base> KillDamageType)
{
    local int rankIcon;
    local int stateType;
    local int classIcon;
    local int perk1Icon;
    local int perk2Icon;
    local string health;
    local string rankName;
    local string className;
    local string perk1Name;
    local string perk2Name;
    local string playerName;
    local string weaponName;
    local string infoString;
    local class<TrRank> RankInfo;
    local class<TrDevice> perkAClass;
    local class<TrDevice> perkBClass;
    local class<TrFamilyInfo> FamilyInfo;

    if (!m_TrPC.m_bShowHUDDeathcam) return;

    if (KillerPRI == none)
    {
        if (KillDamageType == class'TrDmgType_BaseTurret') // Base Turret
        {
            if (m_TrPC.m_nLastDamagerUpgradeLevel > 1)
            {
                playerName = "Base Turret Mk. "$m_TrPC.m_nLastDamagerUpgradeLevel-1;
                infoString = "Max Health++ , Repair Rate++\nFire Rate++";
            }
            else
            {
                playerName = "Base Turret";
                infoString = "";
            }

            health = "("$string(m_TrPC.m_nLastDamagerHealthPercent)$"%)";
            stateType = 2;

        }
        else // Suicde
        {
            playerName = "Suicide";
            health = "(0%)";
            stateType = 1;
        }
    }
    else // Player Kill
    {
        RankInfo = KillerPRI.GetPlayerRank();
        FamilyInfo = KillerPRI.GetCurrentClass();

        perkAClass = KillerPRI.GetEquipDevice(FamilyInfo, EQP_PerkA);
        perkBClass = KillerPRI.GetEquipDevice(FamilyInfo, EQP_PerkB);

        playerName = KillerPRI.PlayerName;
        health     = "("$string(m_TrPC.m_nLastDamagerHealthPercent)$"%)";
        classIcon  = FamilyInfo.default.m_IconId;
        className  = FamilyInfo.default.FriendlyName;
        rankIcon   = RankInfo.default.IconIndex;
        rankName   = RankInfo.default.FriendlyName;
        weaponName = Caps(GetWeaponNameFromDamageType(KillerPRI, FamilyInfo, KillDamageType));
        perk1Icon  = 0; //KillerPRI.r_ActivePerksAndSkills.Perk1Class.default.IconId;
        perk2Icon  = 0; //KillerPRI.r_ActivePerksAndSkills.Perk2Class.default.IconId;
        stateType  = 0;
        infoString = "";

        if (perkAClass == none) perk1Name = "PERK 1";
        else perk1Name = perkAClass.default.ItemName;

        if (perkBClass == none) perk2Name = "PERK 2";
        else perk2Name = perkBClass.default.ItemName;
    }

	if( KillCamInfoObject == none )
	{
		KillCamInfoObject = CreateObject("Object");
	}

    KillCamInfoObject.SetString("playerName", playerName);
    KillCamInfoObject.SetString("health",     health);
    KillCamInfoObject.SetFloat ("classIndex", classIcon);
    KillCamInfoObject.SetString("className",  className);
    KillCamInfoObject.SetFloat ("rankIndex",  rankIcon);
    KillCamInfoObject.SetString("rankName",   rankName);
    KillCamInfoObject.SetString("weaponName", weaponName);
    KillCamInfoObject.SetFloat ("perk1Index", perk1Icon);
    KillCamInfoObject.SetString("perk1Name",  perk1Name);
    KillCamInfoObject.SetFloat ("perk2Index", perk2Icon);
    KillCamInfoObject.SetString("perk2Name",  perk2Name);
    KillCamInfoObject.SetFloat ("state",      stateType);
    KillCamInfoObject.SetString("info",       infoString);
    
    KillCamInfoObject.SetString("killedTitle", m_TrPC.Strings.KilledBy);
    KillCamInfoObject.SetString("weaponTitle", m_TrPC.Strings.UsingWeapon);
    KillCamInfoObject.SetString("perkTitle",   m_TrPC.Strings.UsingPerks);
    
    ShowKillCamInfo(KillCamInfoObject);
}

function string GetWeaponNameFromDamageType(TrPlayerReplicationInfo PRI, class<TrFamilyInfo> FamilyInfo, class<TrDmgType_Base> KillDamageType)
{
    local class<TrDevice> device;

    // Special Cases
    if (KillDamageType == none)
    {
        return "Impact";
    }
    else if (class<TrDmgType_Melee>(KillDamageType) != none)
    {
        return "Melee";
    }
    else if (class<TrDmgType_BeowulfPilot>(KillDamageType) != none)
    {
        return "Beowulf Cannon";
    }
    else if (class<TrDmgType_BeowulfGunner>(KillDamageType) != none)
    {
        return "Beowulf Gunner";
    }
    else if (class<TrDmgType_GravCyclePilot>(KillDamageType) != none)
    {
        return "Grav Cycle";
    }
    else if (class<TrDmgType_ShrikePilot>(KillDamageType) != none)
    {
        return "Shrike";
    }
    else if (class<TrDmgType_DeliveryPod>(KillDamageType) != none)
    {
        if (m_TrPC != none)
        {
            m_TrPC.ShowNotification("  O___________________O  FrogFace","");
        }
        return "Delivery Pod";
    }
    else if (class<TrDmgType_TacticalStrike>(KillDamageType) != none)
    {
        return "Tactical Strike";
    }
    else if (class<TrDmgType_OrbitalStrike>(KillDamageType) != none)
    {
        return "Orbital Strike";
    }

    device = m_TrPC.m_TrInventoryHelper.GetEquipClass(KillDamageType.default.DBWeaponId);

    if (device == none) return "Weapon";

    return device.default.ItemName;
}

/** Spectator: Player Panel */
function SetSpectatorPlayerPanel_FlagCarried(bool bCarried)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelFlagCarried != bCarried )
	{
		RetrieveGFxObject(SpecPlayer_FlagCarried, "spectatorPlayerPanel.flagCarried").SetVisible(bCarried);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelFlagCarried = bCarried;
	}
}

function SetSpectatorPlayerPanel_PlayerName(string PlayerName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPlayerName != PlayerName )
	{
		RetrieveGFxObject(SpecPlayer_PlayerNameTF, "spectatorPlayerPanel.playerNameTF").SetText(PlayerName);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPlayerName = PlayerName;
	}
}

function SetSpectatorPlayerPanel_ClassName(string ClassName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelClassName != ClassName )
	{
		RetrieveGFxObject(SpecPlayer_ClassNameTF, "spectatorPlayerPanel.classNameTF").SetText(ClassName);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelClassName = ClassName;
	}
}

function SetSpectatorPlayerPanel_NextRegen(string NextRegen)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelNextRegen != NextRegen )
	{
		RetrieveGFxObject(SpecPlayer_RegenTF, "spectatorPlayerPanel.regenTF").SetText(NextRegen);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelNextRegen = NextRegen;
	}
}

function SetSpectatorPlayerPanel_HealthFillBar(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelHealthBarFill != FrameIndex )
	{
		RetrieveGFxObject(SpecPlayer_HealthFillBar, "spectatorPlayerPanel.healthFillBar").GotoAndStop(string(FrameIndex));
	}
}

function SetSpectatorPlayerPanel_Health(string Health)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelHealth != Health )
	{
		RetrieveGFxObject(SpecPlayer_HealthTF, "spectatorPlayerPanel.healthTF").SetText(Health);
	}
}

function SetSpectatorPlayerPanel_EnergyFillBar(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelEnergyFillBar != FrameIndex )
	{
		RetrieveGFxObject(SpecPlayer_EnergyFillBar, "spectatorPlayerPanel.energyFillBar").GotoAndStop(string(FrameIndex));
	}
}

function SetSpectatorPlayerPanel_Energy(string Energy)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelEnergy != Energy )
	{
		RetrieveGFxObject(SpecPlayer_EnergyTF, "spectatorPlayerPanel.energyTF").SetText(Energy);
	}
}

function SetSpectatorPlayerPanel_PrimaryWeaponName(string PrimaryWeaponName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPrimaryWeaponName != PrimaryWeaponName )
	{
		RetrieveGFxObject(SpecPlayer_PrimaryNameTF, "spectatorPlayerPanel.primaryNameTF").SetText(PrimaryWeaponName);
	}
}

function SetSpectatorPlayerPanel_PrimaryAmmoCount(string PrimaryAmmoCount)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPrimaryAmmoCount != PrimaryAmmoCount )
	{
		RetrieveGFxObject(SpecPlayer_PrimaryAmmoTF, "spectatorPlayerPanel.primaryAmmoTF").SetText(PrimaryAmmoCount);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPrimaryAmmoCount = PrimaryAmmoCount;
	}
}

function SetSpectatorPlayerPanel_SecondaryWeaponName(string SecondaryWeaponName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSecondaryWeaponName != SecondaryWeaponName )
	{
		RetrieveGFxObject(SpecPlayer_SecondaryNameTF, "spectatorPlayerPanel.secondaryNameTF").SetText(SecondaryWeaponName);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSecondaryWeaponName = SecondaryWeaponName;
	}
}

function SetSpectatorPlayerPanel_SecondaryAmmoCount(string SecondaryAmmoCount)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSecondaryAmmoCount != SecondaryAmmoCount )
	{
		RetrieveGFxObject(SpecPlayer_SecondaryAmmoTF, "spectatorPlayerPanel.secondaryAmmoTF").SetText(SecondaryAmmoCount);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSecondaryAmmoCount = SecondaryAmmoCount;
	}
}

function SetSpectatorPlayerPanel_OffhandIcon(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelOffhandIcon != FrameIndex )
	{
		RetrieveGFxObject(SpecPlayer_OffhandIcons_icon, "spectatorPlayerPanel.offhandIcons.icon").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelOffhandIcon = FrameIndex;
	}
}

function SetSpectatorPlayerPanel_OffhandAmmo(string OffhandAmmo)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelOffhandAmmo != OffhandAmmo )
	{
		RetrieveGFxObject(SpecPlayer_OffhandIcons_count, "spectatorPlayerPanel.offhandIcons.count").SetText(OffhandAmmo);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelOffhandAmmo = OffhandAmmo;
	}
}

function SetSpectatorPlayerPanel_OffhandName(string OffhandName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelOffhandName != OffhandName )
	{
		RetrieveGFxObject(SpecPlayer_OffhandNameTF, "spectatorPlayerPanel.offhandNameTF").SetText(OffhandName);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelOffhandName = OffhandName;
	}
}

function SetSpectatorPlayerPanel_PackIcon(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPackIcon != FrameIndex )
	{
		RetrieveGFxObject(SpecPlayer_PackIcons_icon, "spectatorPlayerPanel.packIcons.icon").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPackIcon = FrameIndex;
	}
}

function SetSpectatorPlayerPanel_PackAmmo(string PackAmmo)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPackAmmo != PackAmmo )
	{
		RetrieveGFxObject(SpecPlayer_PackIcons_count, "spectatorPlayerPanel.packIcons.count").SetText(PackAmmo);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPackAmmo = PackAmmo;
	}
}

function SetSpectatorPlayerPanel_PackName(string PackName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPackName != PackName )
	{
		RetrieveGFxObject(SpecPlayer_PackNameTF, "spectatorPlayerPanel.packNameTF").SetText(PackName);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPackName = PackName;
	}
}

function SetSpectatorPlayerPanel_Perk1Icon(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPerk1Icon != FrameIndex )
	{
		RetrieveGFxObject(SpecPlayer_PerkItem1, "spectatorPlayerPanel.perkItem1").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPerk1Icon = FrameIndex;
	}
}

function SetSpectatorPlayerPanel_Perk1Name(string PerkName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPerk1Name != PerkName )
	{
		RetrieveGFxObject(SpecPlayer_Perk1TF, "spectatorPlayerPanel.perk1TF").SetText(PerkName);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPerk1Name = PerkName;
	}
}

function SetSpectatorPlayerPanel_Perk2Icon(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPerk2Icon != FrameIndex )
	{
		RetrieveGFxObject(SpecPlayer_PerkItem2, "spectatorPlayerPanel.perkItem2").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPerk2Icon = FrameIndex;
	}
}

function SetSpectatorPlayerPanel_Perk2Name(string PerkName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPerk2Name != PerkName )
	{
		RetrieveGFxObject(SpecPlayer_Perk2TF, "spectatorPlayerPanel.perk2TF").SetText(PerkName);   
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelPerk2Name = PerkName;
	}
}

function SetSpectatorPlayerPanel_SkiIndicatorFillBar(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSkiFillBar != FrameIndex )
	{
		RetrieveGFxObject(SpecPlayer_SkiIndicator_fillBar, "spectatorPlayerPanel.skiIndicator.fillBar").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSkiFillBar = FrameIndex;
	}
}

function SetSpectatorPlayerPanel_SkiIndicatorSpeed(string Speed)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSkiSpeed != Speed )
	{
		RetrieveGFxObject(SpecPlayer_SkiIndicator_fillBar_speedoTF, "spectatorPlayerPanel.skiIndicator.fillBar.speedoTF").SetText(Speed);
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSkiSpeed = Speed;
	}
}

function SetSpectatorPlayerPanel_Selected(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSelected != FrameIndex )
	{
		RetrieveGFxObject(SpecPlayer, "spectatorPlayerPanel").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedPlayerPanelSelected = FrameIndex;
	}
}

/** Spectator: Vehicle Panel */
function SetSpectatorVehiclePanel_FlagCarried(bool bCarried)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelFlagCarried != bCarried )
	{
		RetrieveGFxObject(SpecVehicle_FlagCarried, "spectatorVehiclePanel.flagCarried").SetVisible(bCarried);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelFlagCarried = bCarried;
	}
}

function SetSpectatorVehiclePanel_VehicleName(string VehicleName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelVehicleName != VehicleName )
	{
		RetrieveGFxObject(SpecVehicle_VehicleNameTF, "spectatorVehiclePanel.vehicleNameTF").SetText(VehicleName);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelVehicleName = VehicleName;
	}
}

function SetSpectatorVehiclePanel_DriverName(string DriverName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelDriverName != DriverName )
	{
		RetrieveGFxObject(SpecVehicle_DriverNameTF, "spectatorVehiclePanel.driverNameTF").SetText(DriverName);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelDriverName = DriverName;
	}
}

function SetSpectatorVehiclePanel_PassengerName(string PassengerName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelPassengerName != PassengerName )
	{
		RetrieveGFxObject(SpecVehicle_PassengerNameTF, "spectatorVehiclePanel.passengerNameTF").SetText(PassengerName);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelPassengerName = PassengerName;
	}
}

function SetSpectatorVehiclePanel_HealthFillBar(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelHealthFillBar != FrameIndex )
	{
		RetrieveGFxObject(SpecVehicle_HealthFillBar, "spectatorVehiclePanel.healthFillBar").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelHealthFillBar = FrameIndex;
	}
}

function SetSpectatorVehiclePanel_Health(string Health)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelHealth != Health )
	{
		RetrieveGFxObject(SpecVehicle_HealthTF, "spectatorVehiclePanel.healthTF").SetText(Health);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelHealth = Health;
	}
}

function SetSpectatorVehiclePanel_EnergyFillBar(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelEnergyFillBar != FrameIndex )
	{
		RetrieveGFxObject(SpecVehicle_EnergyFillBar, "spectatorVehiclePanel.energyFillBar").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelEnergyFillBar = FrameIndex;
	}
}

function SetSpectatorVehiclePanel_Energy(string Energy)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelEnergy != Energy )
	{
		RetrieveGFxObject(SpecVehicle_EnergyTF, "spectatorVehiclePanel.energyTF").SetText(Energy);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelEnergy = Energy;
	}
}

function SetSpectatorVehiclePanel_PrimaryWeaponName(string PrimaryWeaponName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelPrimaryWeaponName != PrimaryWeaponName )
	{
		RetrieveGFxObject(SpecVehicle_PrimaryNameTF, "spectatorVehiclePanel.primaryNameTF").SetText(PrimaryWeaponName);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelPrimaryWeaponName = PrimaryWeaponName;
	}
}

function SetSpectatorVehiclePanel_PrimaryWeaponReady(int Ready)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelPrimaryWeaponReady != Ready )
	{
		RetrieveGFxObject(SpecVehicle_VehicleGroup_primaryReady, "spectatorVehiclePanel.vehicleGroup.primaryReady").GotoAndStop(string(Ready));
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelPrimaryWeaponReady = Ready;
	}
}

function SetSpectatorVehiclePanel_PrimaryWeaponVisible(bool bVisible)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelPrimaryWeaponVisible != bVisible )
	{
		RetrieveGFxObject(SpecVehicle_VehicleGroup_primaryReady, "spectatorVehiclePanel.vehicleGroup.primaryReady").SetVisible(bVisible);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelPrimaryWeaponVisible = bVisible;
	}
}

function SetSpectatorVehiclePanel_SecondaryWeaponName(string SecondaryWeaponName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSecondaryWeaponName != SecondaryWeaponName )
	{
		RetrieveGFxObject(SpecVehicle_SecondaryNameTF, "spectatorVehiclePanel.secondaryNameTF").SetText(SecondaryWeaponName);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSecondaryWeaponName = SecondaryWeaponName;
	}
}

function SetSpectatorVehiclePanel_SecondaryWeaponReady(int Ready)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSecondaryWeaponReady != Ready )
	{
		RetrieveGFxObject(SpecVehicle_VehicleGroup_secondaryReady, "spectatorVehiclePanel.vehicleGroup.secondaryReady").GotoAndStop(string(Ready));
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSecondaryWeaponReady = Ready;
	}
}

function SetSpectatorVehiclePanel_SecondaryWeaponVisible(bool bVisible)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSecondaryWeaponVisible != bVisible )
	{
		RetrieveGFxObject(SpecVehicle_VehicleGroup_secondaryReady, "spectatorVehiclePanel.vehicleGroup.secondaryReady").SetVisible(bVisible);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSecondaryWeaponVisible = bVisible;
	}
}

function SetSpectatorVehiclePanel_SkiIndicatorFillBar(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSkiFillBar != FrameIndex )
	{
		RetrieveGFxObject(SpecVehicle_SkiIndicator_fillBar, "spectatorVehiclePanel.skiIndicator.fillBar").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSkiFillBar = FrameIndex;
	}
}

function SetSpectatorVehiclePanel_SkiIndicatorSpeed(string Speed)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSkiSpeed != Speed )
	{
		RetrieveGFxObject(SpecVehicle_SkiIndicator_fillBar_speedoTF, "spectatorVehiclePanel.skiIndicator.fillBar.speedoTF").SetText(Speed);
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSkiSpeed = Speed;
	}
}

function SetSpectatorVehiclePanel_Selected(int FrameIndex)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSelected != FrameIndex )
	{
		RetrieveGFxObject(SpecVehicle, "spectatorVehiclePanel").GotoAndStop(string(FrameIndex));
		m_TrHUD.m_SpectatorHUDCache.CachedVehiclePanelSelected = FrameIndex;
	}
}

/** Spectator: Bookmark Panel */
function SetSpectatorBookmarkPanel_BookmarkName(string BookmarkName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedBookmarkPanelTitle != "Viewing Bookmark" )
	{
		RetrieveGFxObject(SpecBookmark_BookmarkNameTF, "spectatorBookmarkPanel.BookmarkNameTF").SetText("Viewing Bookmark");
		m_TrHUD.m_SpectatorHUDCache.CachedBookmarkPanelTitle = "Viewing Bookmark";
	}

	if( m_TrHUD.m_SpectatorHUDCache.CachedBookmarkPanelName != BookmarkName )
	{
		RetrieveGFxObject(SpecBookmark_DescriptionTF, "spectatorBookmarkPanel.descriptionTF").SetText(BookmarkName);
		m_TrHUD.m_SpectatorHUDCache.CachedBookmarkPanelName = BookmarkName;
	}
}

/** Spectator: Objective Panel */
function SetSpectatorObjectivePanel_ObjectiveName(string ObjectiveName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedObjectivePanelObjectiveName != ObjectiveName )
	{
		RetrieveGFxObject(SpecObjective_ObjectiveNameTF, "spectatorObjectivePanel.objectiveNameTF").SetText(ObjectiveName);
		m_TrHUD.m_SpectatorHUDCache.CachedObjectivePanelObjectiveName = ObjectiveName;
	}
}

function SetSpectatorObjectivePanel_ObjectiveDescription(string ObjectiveDescription)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedObjectivePanelObjectiveDescription != ObjectiveDescription )
	{
		RetrieveGFxObject(SpecObjective_DescriptionTF, "spectatorObjectivePanel.descriptionTF").SetText(ObjectiveDescription);
		m_TrHUD.m_SpectatorHUDCache.CachedObjectivePanelObjectiveDescription = ObjectiveDescription;
	}
}

function SetSpectatorObjectivePanel_HealthFillBar(int FrameIndex, int Health)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedObjectivePanelHealth != Health )
	{
		if( Health == -1 )
		{
			ActionScriptVoid("hideSpectatorObjectiveStats");
		}
		else
		{
			ActionScriptVoid("showSpectatorObjectiveStats");

			RetrieveGFxObject(SpecObjective_HealthFillBar, "spectatorObjectivePanel.healthFillBar").GotoAndStop(string(FrameIndex));
			RetrieveGFxObject(SpecObjective_HealthTF, "spectatorObjectivePanel.healthTF").SetText(string(Health));
		}
	}
}

/** Spectator: Float Camera Panel */
function SetSpectatorFloatCameraPanel_Name(string FloatCameraName)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedFloatCameraPanelName != FloatCameraName )
	{
		RetrieveGFxObject(SpecFloat_FloatCameraNameTF, "spectatorFloatCameraPanel.FloatCameraNameTF").SetText(FloatCameraName);
		m_TrHUD.m_SpectatorHUDCache.CachedFloatCameraPanelName = FloatCameraName;
	}
}

function SetSpectatorFloatCameraPanel_Description(string Description)
{
	if( m_TrHUD.m_SpectatorHUDCache.CachedFloatCameraPanelDescription != Description )
	{
		RetrieveGFxObject(SpecFloat_DescriptionTF, "spectatorFloatCameraPanel.descriptionTF").SetText(Description);
		m_TrHUD.m_SpectatorHUDCache.CachedFloatCameraPanelDescription = Description;
	}
}

/** Specator: Controls */
function ShowSpectatorControls(bool bShowControls)
{
	RetrieveGFxObject(SpecHelp, "spectatorHelp").SetVisible(bShowControls);

	if( m_TrPC != none && m_TrPC.PlayerInput != none )
	{
		// TODO -- Populate with real bindings.
		RetrieveGFxObject(SpecHelp_HelpTF, "spectatorHelp.helpTF").SetText("Z");
		RetrieveGFxObject(SpecHelp_TeamSelectTF, "spectatorHelp.teamSelectTF").SetText("P");
		RetrieveGFxObject(SpecHelp_ScoreboardTF, "spectatorHelp.scoreboardTF").SetText("TAB");
		RetrieveGFxObject(SpecHelp_MainmenuTF, "spectatorHelp.mainmenuTF").SetText("ESC");
		RetrieveGFxObject(SpecHelp_SpecHudTF, "spectatorHelp.specHudTF").SetText("X");
		RetrieveGFxObject(SpecHelp_ObjKaratsTF, "spectatorHelp.objKaratsTF").SetText("O");
		// free camera
		RetrieveGFxObject(SpecHelp_MoveUpTF, "spectatorHelp.moveUpTF").SetText("Q");
		RetrieveGFxObject(SpecHelp_MoveDownTF, "spectatorHelp.moveDownTF").SetText("E");
		RetrieveGFxObject(SpecHelp_MoveForwardTF, "spectatorHelp.moveForwardTF").SetText("W");
		RetrieveGFxObject(SpecHelp_MoveBackTF, "spectatorHelp.moveBackTF").SetText("S");
		RetrieveGFxObject(SpecHelp_StrafeLeftTF, "spectatorHelp.strafeLeftTF").SetText("A");
		RetrieveGFxObject(SpecHelp_StrafeRightTF, "spectatorHelp.strafeRightTF").SetText("D");
		RetrieveGFxObject(SpecHelp_IncreaseSpeedTF, "spectatorHelp.increaseSpeedTF").SetText("Mouse Wheel Up");
		RetrieveGFxObject(SpecHelp_DecreaseSpeedTF, "spectatorHelp.decreaseSpeedTF").SetText("Mouse Wheel Down");
		// target camera
		RetrieveGFxObject(SpecHelp_ChangePlayersTF, "spectatorHelp.changePlayersTF").SetText("Left/Right Mouse Button");
		RetrieveGFxObject(SpecHelp_ChangeGeneratorsTF, "spectatorHelp.changeGeneratorsTF").SetText("G + Left/Right Mouse Button");
		RetrieveGFxObject(SpecHelp_ChangeFlagsTF, "spectatorHelp.changeFlagsTF").SetText("F + Left/Right Mouse Button");
		RetrieveGFxObject(SpecHelp_ChangeFlagstandsTF, "spectatorHelp.changeFlagstandsTF").SetText("B + Left/Right Mouse Button");
		RetrieveGFxObject(SpecHelp_ChangeBookmarksTF, "spectatorHelp.changeBookmarksTF").SetText("C + Left/Right Mouse Button");
		RetrieveGFxObject(SpecHelp_ChangeVehiclesTF, "spectatorHelp.changeVehiclesTF").SetText("V + Left/Right Mouse Button");
		RetrieveGFxObject(SpecHelp_FastestPlayerTF, "spectatorHelp.fastestPlayerTF").SetText("R + Left/Right Mouse Button");
		RetrieveGFxObject(SpecHelp_FreeCameraTF, "spectatorHelp.freeCameraTF").SetText("Middle Mouse Button");
		RetrieveGFxObject(SpecHelp_ZoomInTF, "spectatorHelp.zoomInTF").SetText("Mouse Wheel Up");
		RetrieveGFxObject(SpecHelp_ZoomOutTF, "spectatorHelp.zoomOutTF").SetText("Mouse Wheel Down");
		RetrieveGFxObject(SpecHelp_LockViewTF, "spectatorHelp.LockViewTF").SetText("L");
	}
}

/** Actionscript Calls */

final function ShowChatLog()                                                                           { ActionScriptVoid("showLog"); }
final function HideChatLog()                                                                           { ActionScriptVoid("hideLog"); }
final function HideVGSMenu()                                                                           { ActionScriptVoid("hideVGS"); }
final function HideTutorial()                                                                          { ActionScriptVoid("hideTutorial"); }
final function ShowFlagCarried()                                                                       { ActionScriptVoid("showFlagCarried"); }
final function HideFlagCarried()                                                                       { ActionScriptVoid("hideFlagCarried"); }
final function HideKillCamInfo()                                                                       { ActionScriptVoid("hideKillCamInfo"); }
final function UpdateVGSMenuList()                                                                     { ActionScriptVoid("showVGS"); ActionScriptVoid("updateVGS"); }
final function ShowEnding(int Winner)                                                                  { ActionScriptVoid("showEnding"); }
final function ASSetHeading(int heading)                                                               { ActionScriptVoid("setHeading"); }
final function UpdateChatLog(string Message, int ChannelColor, bool bPublic)                           { ActionScriptVoid("updateLog"); }
final function SetPowerOscillation(bool bEnable)                                                       { ActionScriptVoid("SetPowerOscillation"); }
final function UpdateChatLogInput(string Message)                                                      { ActionScriptVoid("updateLogInput"); }
final function AddtoPromptPanelAS(string Message)                                                      { ActionScriptVoid("AddToPromptPanel"); }
final function RemoveFromPromptPanel(string Message)                                                   { ActionScriptVoid("RemoveFromPromptPanel"); }
final function TeamScoreboardActivePlayer(int Index)                                                   { ActionScriptVoid("scoreboardActivePlayer"); }
final function TeamScoreboardUpdateTime(string Time)                                                   { ActionScriptVoid("scoreboardUpdateTime"); }
final function RabbitScoreboardUpdateTime(string Time)                                                 { ActionScriptVoid("scoreboardUpdateTime"); }
final function TeamScoreboardUpdateTeamScore(int Index, int Score)                                     { ActionScriptVoid("scoreboardUpdateTeamScore"); }
final function SetHUDStageSize(int HUDOriginX, int HUDOriginY, int Width, int Height)                  { ActionScriptVoid("SetHUDStageSize"); }
final function UpdateTutorial(string Title, string Body, float Icon, string Footer, string Suppress)   { ActionScriptVoid("showTutorial"); ActionScriptVoid("updateTutorial"); }
final function AddUpdateToCombatLog(int CombatType, string Aggressor, int WeaponIcon, string Victim)   { ActionScriptVoid("AddUpdateToCombatLog"); }
final function AddUpdateToKillMessage(int rankIcon, int playerIcon, string playerName, string Message) { ActionScriptVoid("AddUpdateToKillMessage"); }
final function ShowKillCamInfo(GFxObject Data) /*string PlayerName, string Health, int ClassIcon, string ClassName, int RankIcon, string RankName, string WeaponName, int Perk1Icon, string Perk1Name, int Perk2Icon, string Perk2Name, int StateType, string InfoString)*/ { ActionScriptVoid("showKillCamInfo"); }
final function ShowSpectatorPlayer()                                                                   { ActionScriptVoid("showSpectatorPlayer"); }
final function HideSpectatorPlayer()                                                                   { ActionScriptVoid("hideSpectatorPlayer"); }
final function ShowSpectatorVehicle()                                                                  { ActionScriptVoid("showSpectatorVehicle"); }
final function HideSpectatorVehicle()                                                                  { ActionScriptVoid("hideSpectatorVehicle"); }
final function ShowSpectatorBookmark()                                                                 { ActionScriptVoid("showSpectatorBookmark"); }
final function HideSpectatorBookmark()                                                                 { ActionScriptVoid("hideSpectatorBookmark"); }
final function ShowSpectatorObjectivePanel()                                                           { ActionScriptVoid("showSpectatorObjective"); }
final function HideSpectatorObjectivePanel()                                                           { ActionScriptVoid("hideSpectatorObjective"); }
final function ShowSpectatorFloatCameraPanel()                                                         { ActionScriptVoid("showSpectatorFloatCamera"); }
final function HideSpectatorFloatCameraPanel()                                                         { ActionScriptVoid("hideSpectatorFloatCamera"); }
final function SetFontIndex(int FontIdx)                                                               { ActionScriptVoid("setLanguage"); }

final function AddFlyingIcon(int iconNumber, string Description, string Points, int bIsBadge)
{
    if (bIsBadge > 0) bShowingBadge = true;
    else bShowingBadge = false;

    if (bIsBadge > 0 && !m_TrPC.m_bShowHUDBadges) return;

    if (bIsBadge == 0 && !m_TrPC.m_bShowHUDAccolades) return;

    ActionScriptVoid("createKillStreak");
}

/** Delegate set functions */
final function SetLoadVGSMenuDelegate(delegate<DelegateLoadVGSMenu> InDelegate)     
{
    _global = RetrieveGFxObject(_global, "_global");
    ActionScriptSetFunction(_global, "LoadVGSMenu");
}

final function SetSoundAccoladeDelegate(delegate<DelegateSoundAccolade> InDelegate)
{
    _global = RetrieveGFxObject(_global, "_global");
    ActionScriptSetFunction(_global, "USC_SoundAccolade");
}

defaultproperties
{
   m_nLastOffhandCount(0)=-1
   m_nLastOffhandCount(1)=-1
   m_nLastOffhandCount(2)=-1
   m_bLastIn3P=True
   m_SkiSpeedSteps(0)=100
   m_SkiSpeedSteps(1)=400
   m_SkiSpeedSteps(2)=600
   m_SkiSpeedSteps(3)=800
   m_SkiSpeedSteps(4)=1000
   m_SkiSpeedSteps(5)=1200
   m_SkiSpeedSteps(6)=1400
   m_SkiSpeedSteps(7)=1600
   m_SkiSpeedSteps(8)=1800
   m_SkiSpeedSteps(9)=2000
   m_SkiSpeedSteps(10)=2200
   m_SkiSpeedSteps(11)=2500
   m_fSpeedometerUpdateInterval=0.100000
   m_fLastVehicleEnergy=-1.000000
   m_nNearDeathHealthMax=200
   m_fDirectionalDamageFadeTime=1.500000
   m_sRound="ROUND:"
   bForceSmoothAnimation=True
   Name="Default__GfxTrHud"
   ObjectArchetype=GFxMinimapHud'UTGame.Default__GFxMinimapHud'
}
