class TrHUD extends UTGFxHUDWrapper;



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
#linenumber 3;

var int    m_nWinningTeam;
var int    m_nLastPerk1Icon;
var int    m_nLastPerk2Icon;

var bool   m_bGameOver;

var string m_sWinningPlayer;
var string m_sLastClassName;

var const float TeamPlayerInfoMaxDist;
var const float ObjectiveInfoMaxDist;

var const Color ColorFriend;
var const Color ColorEnemy;
var const Color LaserTargetTracePossible;
var const Color LaserTargetTraceImprobable;

/** Owned Objects in World */
var array<TrDeployable> m_OwnedDeployables;
var array<TrProj_Mine> m_OwnedMines;

var int m_LastMineCount;
var int m_LastDeployableCount;

/** HUD marker MIC */
var const MaterialInstanceConstant MarkerBaseMIC;
var transient LinearColor MarkerColorEnemy;
var transient LinearColor MarkerColorEnemy_IsFriend;
var transient LinearColor MarkerColorFriendly;
var transient LinearColor MarkerColorFriendly_IsFriend;
var transient LinearColor MarkerColorNone;

/** Player marker */
var const Texture2D MarkerLight;
var const Texture2D MarkerMedium;
var const Texture2D MarkerHeavy;

/** Vehicle marker */
var const Texture2D VehicleMarker;

var const Texture2D VehicleMarkerLight;
var const Texture2D VehicleMarkerMedium;
var const Texture2D VehicleMarkerHeavy;
var const Texture2D VehicleMarkerNoDriver;

/** Flag is in the stand */
var const Texture2D FlagAtBase;

/** Flag is in the field - nobody holding */
var const Texture2D FlagDropped;

/** Flag is being held/carried by a player */
var const Texture2D FlagHeldLight;
var const Texture2D FlagHeldMedium;
var const Texture2D FlagHeldHeavy;

/** Flag is being held/carried by a vehicle */
var const Texture2D FlagHeldVehicle;

/** Flag stand */
var const Texture2D FlagEmptyBase;

/** Missiles */
var const Texture2D HUDMarkerMissileIncoming;
var const Texture2D HUDMarkerMissileLocking;
var const Texture2D HUDMarkerMissileLocked;
var const Texture2D HUDMarkerMissileTarget;
var const Texture2D HUDMarkerMissileTargetLocked;

/** Laser targeter */
var const Texture2D HUDMarkerLaserTarget;
var const Texture2D HUDMarkerLaserTargetAimPoint;

/** Generic Objectives */
var const Texture2D BaseInventoryStation;
var const Texture2D BaseRepairStation;
var const Texture2D BaseVehicleStation;
var const Texture2D BaseNoPower;

/** Base objectives */
var const Texture2D BaseDeployableLevel1;
var const Texture2D BaseDeployableLevel2;
var const Texture2D BaseDeployableLevel3;
var const Texture2D BaseDeployableLevel4;
var const Texture2D BaseDeployableLevel5;

/** Generator */
var const Texture2D BaseGeneratorLevel1;
var const Texture2D BaseGeneratorLevel2;
var const Texture2D BaseGeneratorLevel3;
var const Texture2D BaseGeneratorLevel4;
var const Texture2D BaseGeneratorLevel5;
var const Texture2D BaseGeneratorLevel1_Down;
var const Texture2D BaseGeneratorLevel2_Down;
var const Texture2D BaseGeneratorLevel3_Down;
var const Texture2D BaseGeneratorLevel4_Down;
var const Texture2D BaseGeneratorLevel5_Down;

/** Base sensor */
var const Texture2D BaseSensorLevel1;
var const Texture2D BaseSensorLevel2;
var const Texture2D BaseSensorLevel3;
var const Texture2D BaseSensorLevel4;
var const Texture2D BaseSensorLevel5;
var const Texture2D BaseSensorLevel1_Down;
var const Texture2D BaseSensorLevel2_Down;
var const Texture2D BaseSensorLevel3_Down;
var const Texture2D BaseSensorLevel4_Down;
var const Texture2D BaseSensorLevel5_Down;

/** Base turret */
var const Texture2D BaseTurretLevel1;
var const Texture2D BaseTurretLevel2;
var const Texture2D BaseTurretLevel3;
var const Texture2D BaseTurretLevel4;
var const Texture2D BaseTurretLevel5;
var const Texture2D BaseTurretLevel1_Down;
var const Texture2D BaseTurretLevel2_Down;
var const Texture2D BaseTurretLevel3_Down;
var const Texture2D BaseTurretLevel4_Down;
var const Texture2D BaseTurretLevel5_Down;

/** Deployables */
var const Texture2D DeployableClaymore;
var const Texture2D DeployableJammer;
var const Texture2D DeployableMine;
var const Texture2D DeployableSensor;
var const Texture2D DeployableShield;
var const Texture2D DeployableTurret;

/** Miscelaneous */
var const Texture2D AmmoDropPickup;
var const Texture2D SpottedTarget;
var const Texture2D SpottedTarget_MotionMine;

/** Chat colors */
var const int       InfoChatColorIdx;
var const int       EnemyChatColorIdx;
var const int       FriendlyChatColorIdx;
var const int       SelfChatColorIdx;
var const int       WhisperChatColorIdx;

var const color     FriendlyChatColor;
var const color     EnemyChatColor;
var const color     TeamChatColor;
var const color     WhisperChatColor;

var transient MaterialInstanceConstant LowAmmoMic;
var Material MapMaterialReference;

var	GFxTrUI_VehicleMenu		  VehicleMenuMovie;
var GFxTrUI_TeamSelectionMenu TeamSelectionMenuMovie;

var TrScoreboard            Scoreboard;
var TrRabbitLeaderboard     RabbitLeaderboard;
var TrHUDTeamCTFStats       HUDTeamCTFStats;
var TrTeamRabbitStats       TeamRabbitStats;
var TrArenaStats            ArenaStats;
var TrDaDStats              DaDStats;
var TrCaHStats              CaHStats;

var GfxTrHud m_GFxHud;

var bool                    HasGlobalChatAsAlert;

/** If >0.0, the friendly generator is offline and will come back online when this time stamp is tripped. */
var transient float     m_fFriendlyGeneratorRestoreTime;
var transient float     m_fEnemyGeneratorRestoreTime;

var bool                bShowObjectives;

/** class of dynamic music manager used with this hud/gametype */
var class<TrMusicManager> m_MusicManagerClass;

var class<GameInfo> m_GameClass;

/** Cached a typed Player controller.  Unlike PawnOwner we only set this once in PostBeginPlay */
var TrPlayerController TrPlayerOwner;

/** Reference to the ski effect */
var MaterialEffect m_SkiEffect;

/** Material instance for the ski effect */
var transient MaterialInstanceConstant m_SkiEffectMaterialInstance;

/** Is the controller's pawn skiing? */
var transient bool m_bIsControllerSkiing;
var transient float m_fControllerSkiSpeed;

/** Skiing HUD effect values.*/
var() float m_fSkiEffectMaxIntensity;
var() float m_fSkiEffectMinIntensity;
var bool m_bStrobeIn;
var bool m_bEffectFadingIn;
var() float m_fSkiEffectFadeInTime;
var() float m_fSkiEffectFadeOutTime;
var() float m_fSkiEffectStrobeTime;

/** Reference to the pickup material effect. */
var MaterialEffect m_PickupFlashMaterialEffect;
var transient MaterialInstanceConstant m_PickupFlashMaterialInstance;
var() float m_PickupFlashFadeOutSpeed;

/** Reference to the invulnerable material effect. */
var MaterialEffect m_InvulnerableMaterialEffect;
var transient MaterialInstanceConstant m_InvulnerableMaterialInstance;
var() float m_InvulnerableFadeOutSpeed;

/** Reference to the shield material effect. */
var MaterialEffect m_ShieldMaterialEffect;
var transient MaterialInstanceConstant m_ShieldMaterialInstance;
var() float m_ShieldFadeOutSpeed;
var() float m_ShieldHitFadeInSpeed;
var() float m_ShieldHitFadeOutSpeed;

/** Reference to the jammer pack material effect. */
var MaterialEffect m_JammerPackMaterialEffect;
var transient MaterialInstanceConstant m_JammerPackMaterialInstance;
var() float m_JammerPackFadeOutSpeed;

var	int	 LastCreditTotal;
var int  LastChangeResTime;
var int  LastChangeResCheckTime;
var bool bRestoreHUDState;

var bool bLoadSequenceComplete;

var MaterialEffect m_VignetteMaterialEffect;
var transient MaterialInstanceConstant m_VignetteMaterialInstance;
var() float m_VignetteFadeSpeed;
var() float m_VignetteFadeTarget;
var() float m_VignetteValueMultiplier;

var MaterialEffect m_WhiteoutMaterialEffect;
var transient MaterialInstanceConstant m_WhiteoutMaterialInstance;
var transient float m_WhiteoutFadeOutSpeed;
var transient bool m_bUpdateWhiteoutEffect;
var transient float m_fCurrentWhiteoutValue;

var MaterialEffect m_FumbledFlagMaterialEffect;
var transient MaterialInstanceConstant m_FumbledFlagMaterialInstance;
var transient float m_FumbledFlagFadeOutSpeed;
var transient bool m_bUpdateFumbledFlagEffect;
var transient float m_fCurrentFumbledFlagValue;

var bool  bPlayAward;
var float AwardBaseSize;
var float AwardBaseHeight;
var float AwardTimelineLength;
var float AwardFadeInScale;
var float AwardTimelineLoc;
var MaterialInstanceConstant AwardMIC;

// Missile seeking targets.
var() int m_nPotentialSeekingTargetHUDRotationRate;
var() float m_fPotentialSeekingTargetHUDZoomTime;
var() float m_fPotentialSeekingTargetHUDZoomStart;
var() float m_fPotentialSeekingTargetHUDZoomEnd;
var() float m_fPotentialSeekingTargetHUDZoomOpacityStart;
var() float m_fPotentialSeekingTargetHUDZoomOpacityEnd;
var() float m_fSeekingTargetHUDZoomTime;
var() float m_fSeekingTargetHUDZoomStart;
var() float m_fSeekingTargetHUDZoomEnd;
var() float m_fSeekingTargetHUDZoomOpacityStart;
var() float m_fSeekingTargetHUDZoomOpacityEnd;
var() float m_fInitialSeekingTargetYaw;

var(OverheadIndicator) float m_fHealthBarPlacementX;
var(OverheadIndicator) float m_fHealthBarPlacementY;
var(OverheadIndicator) float m_fHealthBarWidth;
var(OverheadIndicator) float m_fHealthBarHeight;
var(OverheadIndicator) float m_fNamePlacementX;
var(OverheadIndicator) float m_fNamePlacementY;
var(OverheadIndicator) float m_fCaratPlacementX;
var(OverheadIndicator) float m_fCaratPlacementY;
var(OverheadIndicator) float m_fVehicleNamePlacementX;
var(OverheadIndicator) float m_fVehicleNamePlacementY;
var(OverHeadIndicator) float m_fMineNamePlacementX;
var(OverHeadIndicator) float m_fMineNamePlacementY;
var(OverHeadIndicator) float m_fMineDeployerNamePlacementX;
var(OverHeadIndicator) float m_fMineDeployerNamePlacementY;
var(OverheadIndicator) editinline FontRenderInfo m_nNameFontRenderInfo;

var bool bVotePending;
var bool bIsMainMenuOpen;

var UberPostProcessEffect m_UperPPEffect;

/** Spectator panels. */
var bool m_bIsSpectatorPlayerPanelVisible;
var bool m_bIsSpectatorVehiclePanelVisible;
var bool m_bIsSpectatorBookmarkPanelVisible;
var bool m_bIsSpectatorObjectivePanelVisible;
var bool m_bIsSpectatorFloatCameraPanelVisible;

/** Spectator HUD cache. */
var transient TrSpectatorHUDCache m_SpectatorHUDCache;

struct OverheadNumber
{
	/** The value for the number. */
	var int NumberValue;
	
	/** Remaining time to see the number. */
	var float RemainingTime;

	/** Original location in world space. */
	var Vector4 WorldSpaceLocation;

	/** Current color of the number (also includes alpha for fading). */
	var Color CurrentColor;

	/** Current scaling on the number. */
	var float CurrentScale;
};

var bool bAccoladePlaying;

struct QueuedAccolade
{
    var int    Icon;
    var bool   bIsBadge;
    var string Title;
    var string Subtitle;
};

var array<QueuedAccolade> QueuedAccolades;

var array<OverheadNumber> m_OverheadNumbers;
var(OverheadNumbers) float m_fOverheadNumberZSpeed;
var(OverheadNumbers) Color m_OverheadNumberColorMin;
var(OverheadNumbers) Color m_OverheadNumberColorMax;
var(OverheadNumbers) float m_fOverheadNumberTotalTime;
var(OverheadNumbers) float m_fOverheadNumberFadeTime;
var(OverheadNumbers) float m_fOverheadNumberScaleTime;
var(OverheadNumbers) float m_fOverheadNumberMaxScaleAmount;
var(OverheadNumbers) float m_fOverheadNumberColorizeTimeMin;
var(OverheadNumbers) float m_fOverheadNumberColorizeTimeMax;

var() float m_fMarker2DDistance;

function ShowDebugInfo(out float out_YL, out float out_YPos)
{
	local TrGameReplicationInfo TrGRI;
	local int i;

	if (ShouldDisplayDebug('flag'))
	{
		TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
		if (TrGRI != none)
		{
			for (i = 0; i < 2; i++)
			{
				if (TrGRI.m_Flags[i] != none)
				{
					TrGRI.m_Flags[i].DisplayDebug(self, out_YL, out_YPos);
				}
			}
		}
	}

	super.ShowDebugInfo(out_YL, out_YPos);
}

//
//  Override CreateHudMovie so we can be sure to set game type on it
//
function CreateHUDMovie()
{
	super.CreateHUDMovie();

    m_GFxHud = GfxTrHud(HudMovie);
    
    if (HUDTeamCTFStats != none)
    {
        HUDTeamCTFStats.m_MoviePlayer = m_GFxHud;
    }

    if (RabbitLeaderboard != none)
    {
        RabbitLeaderboard.m_MoviePlayer = m_GFxHud;
    }

    if (TeamRabbitStats != none)
    {
        TeamRabbitStats.m_MoviePlayer = m_GFxHud;
    }

	if (ArenaStats != none)
    {
        ArenaStats.m_MoviePlayer = m_GFxHud;
    }

	if (DaDStats != none)
    {
        DaDStats.m_MoviePlayer = m_GFxHud;
    }

	if (CaHStats != none)
    {
        CaHStats.m_MoviePlayer = m_GFxHud;
    }

    if (Scoreboard != none)
    {
        Scoreboard.m_MoviePlayer = m_GFxHud;
    }
    
    SetPlayerClassObjects(m_sLastClassName, m_nLastPerk1Icon, m_nLastPerk2Icon);

	if (AwardMIC == none )
	{
		AwardMIC = new(self) class'MaterialInstanceConstant';
		AwardMIC.SetParent(MaterialInstanceConstant'Hud_Rewards.Material.MIC_Rewards');

        AwardMIC.SetTextureParameterValue('Accolade_Texture', Texture2D'Hud_Rewards.Accolades.T_Test_Accolade2');
	}
}

exec function ShowSpectatorControls(optional bool bForceEnabled)
{
	if( TrPlayerOwner != none )
	{
		if( TrPlayerOwner.GetTeamNum() == 255 )
		{
			if( bForceEnabled )
			{
				TrPlayerOwner.m_bShowSpectatorControls = true;
			}
			else
			{
				TrPlayerOwner.m_bShowSpectatorControls = !TrPlayerOwner.m_bShowSpectatorControls;
			}
		}

		m_GFxHud.ConfigureSpectatorHUD(GetTeamNum() == 255);

		m_GFxHud.ShowSpectatorControls(TrPlayerOwner.m_bShowSpectatorControls);
	}
}

/*
 * override so we can fix a bug that causes the hud to disappear when the scoreboard is toggled off and on quickly
 */
exec function SetShowScores(bool bEnableShowScores)
{
    local bool bTeamGame;
    
    if (Scoreboard == None)
    {
        Scoreboard = new (self) class'TrScoreboard';
        Scoreboard.Initialize(TrPlayerOwner, m_GFxHud);
	}

    if (m_bGameOver)
    {
        Scoreboard.Hide();
        return;
    }

    if (bEnableShowScores)
    {
        if (m_GameClass != class'TrGame_TRRabbit') bTeamGame = true;

        if (!Scoreboard.bIsActive)
        {
            ShowCenterHUDElements(false);
            Scoreboard.Show(bTeamGame);
        }

		if( TrPlayerOwner.m_bIsRovingSpectating )
		{
			// Roving spectating, force to hide the spectator panels.
			m_GFxHud.RetrieveGFxObject(m_GFxHud.SpecPlayer, "spectatorPlayerPanel").SetVisible(false);
			m_GFxHud.RetrieveGFxObject(m_GFxHud.SpecVehicle, "spectatorVehiclePanel").SetVisible(false);
			m_GFxHud.RetrieveGFxObject(m_GFxHud.SpecBookmark, "spectatorBookmarkPanel").SetVisible(false);
			m_GFxHud.RetrieveGFxObject(m_GFxHud.SpecObjective, "spectatorObjectivePanel").SetVisible(false);
		}
    }
    else
    {
        ShowCenterHUDElements(true);
        Scoreboard.Hide();

		if( TrPlayerOwner.m_bIsRovingSpectating )
		{
			// Restore any spectating panels.
			m_GFxHud.ConfigureSpectatorHUD(TrPlayerOwner.GetTeamNum() == 255);
		}
    }
}

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();
}

function InitializeGameHUD()
{
	local int i;
	local TrGameObjective TrGO;
	local TrGameReplicationInfo TrGRI;
	local OnlineSubSystem OnlineSystem;
	local OnlineChatInterface ChatInterface;
	local TrCTFBase CTFBase;

    m_GameClass = WorldInfo.GRI.GameClass;
	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
    TrPlayerOwner = TrPlayerController(PlayerOwner);

    if (TrPlayerOwner != none)
    {
        TrPlayerOwner.ServerRequestAutoAssignTeam();
    }

    SetVisible(false);

	// Fade in from black.
    if (TrPlayerOwner.HaveMenu())
    {
	    SetTimer(6.0,false,'FadeInTimer');
    }
    else
    {
        FadeInTimer();
    }

    AddPostRenderedActor(self);

	// Force all game objectives to be post rendered.
	ForEach DynamicActors(class'TrGameObjective', TrGO)
	{
		AddPostRenderedActor(TrGO);
	}

	// Force all game objectives to be post rendered.
	ForEach DynamicActors(class'TrCTFBase', CTFBase)
	{
		AddPostRenderedActor(CTFBase);
	}

	// Add flags for post render.
	if (TrGRI != none)
	{
		for (i = 0; i < 2; i++)
		{
			if (TrGRI.m_Flags[i] != none)
			{
				AddPostRenderedActor(TrGRI.m_Flags[i]);
			}
		}
	}

    if (HUDTeamCTFStats == none)
    {
        HUDTeamCTFStats = new (self) class'TrHUDTeamCTFStats';
        HUDTeamCTFStats.Initialize(TrPlayerOwner, m_GFxHud);
    }
    
    if (RabbitLeaderboard == none)
    {
        RabbitLeaderboard = new (self) class'TrRabbitLeaderboard';
        RabbitLeaderboard.Initialize(TrPlayerOwner, m_GFxHud);
    }

    if (TeamRabbitStats == none)
    {
        TeamRabbitStats = new (self) class'TrTeamRabbitStats';
        TeamRabbitStats.Initialize(TrPlayerOwner, m_GFxHud);
    }
	
    if (ArenaStats == none)
    {
        ArenaStats = new (self) class'TrArenaStats';
        ArenaStats.Initialize(TrPlayerOwner, m_GFxHud);
    }

	if (DaDStats == none)
    {
        DaDStats = new (self) class'TrDaDStats';
        DaDStats.Initialize(TrPlayerOwner, m_GFxHud);
    }

	if (CaHStats == none)
    {
        CaHStats = new (self) class'TrCaHStats';
        CaHStats.Initialize(TrPlayerOwner, m_GFxHud);
    }

    EnableGameTypeHUD();

    // Hide HUD elements until we are ready
	if( m_GameClass == class'TrGame_TrTraining' )
	{
		m_GFxHud.ConfigureHUDState(true, true);
	}
	else
	{
		HideHUDElements();
	}

	m_UperPPEffect = UberPostProcessEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('UberPP'));

    // Create material instance for ski post process effect.
    m_SkiEffect = MaterialEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('SkiEffect'));
    if (m_SkiEffect != None)
	{
		if (MaterialInstanceConstant(m_SkiEffect.Material) != None && m_SkiEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_SkiEffectMaterialInstance = MaterialInstanceConstant(m_SkiEffect.Material);
		}
		else
		{
			m_SkiEffectMaterialInstance = new(m_SkiEffect) class'MaterialInstanceConstant';
			m_SkiEffectMaterialInstance.SetParent(m_SkiEffect.Material);
			m_SkiEffect.Material = m_SkiEffectMaterialInstance;
            m_SkiEffectMaterialInstance.SetScalarParameterValue('POW02',0);
		}
		m_SkiEffect.bShowInGame = false;
	}

	// Pickup post process effect.
	m_PickupFlashMaterialEffect = MaterialEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('PickupFlash'));
	if( m_PickupFlashMaterialEffect != none )
	{
		if (MaterialInstanceConstant(m_PickupFlashMaterialEffect.Material) != None && m_PickupFlashMaterialEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_PickupFlashMaterialInstance = MaterialInstanceConstant(m_PickupFlashMaterialEffect.Material);
		}
		else
		{
			m_PickupFlashMaterialInstance = new(m_PickupFlashMaterialEffect) class'MaterialInstanceConstant';
			m_PickupFlashMaterialInstance.SetParent(m_PickupFlashMaterialEffect.Material);
			m_PickupFlashMaterialEffect.Material = m_PickupFlashMaterialInstance;
            m_PickupFlashMaterialInstance.SetScalarParameterValue('Startup',0.0);
		}
		m_PickupFlashMaterialEffect.bShowInGame = false;
	}

	// Invulnerable post process effect.
	m_InvulnerableMaterialEffect = MaterialEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('invulnerable'));
	if( m_InvulnerableMaterialEffect != none )
	{
		if (MaterialInstanceConstant(m_InvulnerableMaterialEffect.Material) != None && m_InvulnerableMaterialEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_InvulnerableMaterialInstance = MaterialInstanceConstant(m_InvulnerableMaterialEffect.Material);
		}
		else
		{
			m_InvulnerableMaterialInstance = new(m_InvulnerableMaterialEffect) class'MaterialInstanceConstant';
			m_InvulnerableMaterialInstance.SetParent(m_InvulnerableMaterialEffect.Material);
			m_InvulnerableMaterialEffect.Material = m_InvulnerableMaterialInstance;
            m_InvulnerableMaterialInstance.SetScalarParameterValue('Startup',0.0);
		}
		m_InvulnerableMaterialEffect.bShowInGame = false;
	}

	// Shield Pack post process effect.
	m_ShieldMaterialEffect = MaterialEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('shieldpack'));
	if( m_ShieldMaterialEffect != none )
	{
		if (MaterialInstanceConstant(m_ShieldMaterialEffect.Material) != None && m_ShieldMaterialEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_ShieldMaterialInstance = MaterialInstanceConstant(m_ShieldMaterialEffect.Material);
		}
		else
		{
			m_ShieldMaterialInstance = new(m_ShieldMaterialEffect) class'MaterialInstanceConstant';
			m_ShieldMaterialInstance.SetParent(m_ShieldMaterialEffect.Material);
			m_ShieldMaterialEffect.Material = m_ShieldMaterialInstance;
            m_ShieldMaterialInstance.SetScalarParameterValue('Startup',0.0);
			m_ShieldMaterialInstance.SetScalarParameterValue('Hit',0.0);
		}
		m_ShieldMaterialEffect.bShowInGame = false;
	}

	// Jammer Pack post process effect.
	m_JammerPackMaterialEffect = MaterialEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('JammerPack'));
	if( m_JammerPackMaterialEffect != none )
	{
		if (MaterialInstanceConstant(m_JammerPackMaterialEffect.Material) != None && m_JammerPackMaterialEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_JammerPackMaterialInstance = MaterialInstanceConstant(m_JammerPackMaterialEffect.Material);
		}
		else
		{
			m_JammerPackMaterialInstance = new(m_JammerPackMaterialEffect) class'MaterialInstanceConstant';
			m_JammerPackMaterialInstance.SetParent(m_JammerPackMaterialEffect.Material);
			m_JammerPackMaterialEffect.Material = m_JammerPackMaterialInstance;
            m_JammerPackMaterialInstance.SetScalarParameterValue('Startup',0.0);
			m_JammerPackMaterialInstance.SetScalarParameterValue('Hit',0.0);
		}
		m_JammerPackMaterialEffect.bShowInGame = false;
	}

	// Vignette post process effect.
	m_VignetteMaterialEffect = MaterialEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('Vignette'));
	if( m_VignetteMaterialEffect != none )
	{
		if (MaterialInstanceConstant(m_VignetteMaterialEffect.Material) != None && m_VignetteMaterialEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_VignetteMaterialInstance = MaterialInstanceConstant(m_VignetteMaterialEffect.Material);
		}
		else
		{
			m_VignetteMaterialInstance = new(m_VignetteMaterialEffect) class'MaterialInstanceConstant';
			m_VignetteMaterialInstance.SetParent(m_VignetteMaterialEffect.Material);
			m_VignetteMaterialEffect.Material = m_VignetteMaterialInstance;
		}
	}

	// Whiteout post process effect.
	m_WhiteoutMaterialEffect = MaterialEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('Whiteout'));
	if( m_WhiteoutMaterialEffect != none )
	{
		if (MaterialInstanceConstant(m_WhiteoutMaterialEffect.Material) != None && m_WhiteoutMaterialEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_WhiteoutMaterialInstance = MaterialInstanceConstant(m_WhiteoutMaterialEffect.Material);
		}
		else
		{
			m_WhiteoutMaterialInstance = new(m_WhiteoutMaterialEffect) class'MaterialInstanceConstant';
			m_WhiteoutMaterialInstance.SetParent(m_WhiteoutMaterialEffect.Material);
			m_WhiteoutMaterialEffect.Material = m_WhiteoutMaterialInstance;
		}
	}

	// Fumbled flag post process effect.
	m_FumbledFlagMaterialEffect = MaterialEffect(LocalPlayer(TrPlayerOwner.Player).PlayerPostProcess.FindPostProcessEffect('ImpactNitron'));
	if( m_FumbledFlagMaterialEffect != none )
	{
		if (MaterialInstanceConstant(m_FumbledFlagMaterialEffect.Material) != None && m_FumbledFlagMaterialEffect.Material.GetPackageName() == 'Transient')
		{
			// the runtime material already exists; grab it
			m_FumbledFlagMaterialInstance = MaterialInstanceConstant(m_FumbledFlagMaterialEffect.Material);
		}
		else
		{
			m_FumbledFlagMaterialInstance = new(m_FumbledFlagMaterialEffect) class'MaterialInstanceConstant';
			m_FumbledFlagMaterialInstance.SetParent(m_FumbledFlagMaterialEffect.Material);
			m_FumbledFlagMaterialEffect.Material = m_FumbledFlagMaterialInstance;
		}
		m_FumbledFlagMaterialEffect.bShowInGame = false;
	}

    // Initialize music manager.
    if (TrPlayerOwner.m_MusicManager == None)
	{
		TrPlayerOwner.m_MusicManager = Spawn(m_MusicManagerClass, TrPlayerOwner);
	}

	// Initialize help text, attaching ourselves to various actors if needed.
	if (TrPlayerOwner.m_HelpTextManager != none)
	{
		TrPlayerOwner.m_HelpTextManager.LevelLoadCompleted();
	}

	// Add subsystem hooks.
	OnlineSystem = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSystem != none)
	{
		// Do we have a valid in-game chat interface?
		ChatInterface = OnlineSystem.ChatInterface;
		if (ChatInterface != none)
		{
			ChatInterface.AddChatMessageDelegate(ChatMessageReceived);
		}
	}
    
    // Register the client's class chosen at the main menu
    // Doing this here since by this point our TrPlayerController,
    // TrPlayerReplicationInfo are both created and running.
    
	// JCR - Test forcing user to select class at start.
	//TrPlayerOwner.RegisterPendingClass(-1);

    m_GFxHud.SetScoreboardTitle(TrPlayerOwner.Strings.TeamScoreBoard);

    UpdateHUDCredits(TrPlayerOwner.r_nCurrentCredits,TrPlayerOwner.r_nCurrentCredits);
}

function FadeInTimer()
{
	Fade(1, 0.3);
    
    // After we've loaded the textures, etc. exit loading screen into the end of
    // our fade from black and team selection screen if needed
    if (TrPlayerOwner != none) TrPlayerOwner.SetMenuInGame();

    SetVisible(true);

    bLoadSequenceComplete = true;

    // Show team selection screen after we fade in, so it looks nice
    if (!TrPlayerOwner.HaveMenu())
    {
        RestoreHUDState();
    }
    else if (m_GameClass == class'TrGame_TRCTF' || 
    		 m_GameClass == class'TrGame_TrStorm' || 
    		 m_GameClass == class'TrGame_TrTeamRabbit' ||
    		 m_GameClass == class'TrGame_TrArena' ||
			 m_GameClass == class'TrGame_TrDaD' ||
			m_GameClass == class'TrGame_TrCaH' )
    {
        // If not already on a team, make them select a team
        if (TrPlayerOwner.r_bNeedTeam)
        {
            ToggleTeamSelectionMenu();
        }
        else
        {
            if (TrPlayerOwner.r_bNeedLoadout)
            {
                TrPlayerOwner.OpenClasses();
            }

            bShowObjectives = TrPlayerOwner.GetHUDObjectivesValue();
        }
    }
    else if (m_GameClass == class'TrGame_TRRabbit')
    {
        bShowObjectives = TrPlayerOwner.GetHUDObjectivesValue();

        TrPlayerOwner.OpenClasses();

        if (PlayerOwner.IsWaiting())
        {
            RestoreHUDState();
        }
        else
        {
            ShowHUDPlayerAlive();
        }
    }
	else if( m_GameClass == class'TrGame_TrTraining')
	{
        bShowObjectives = TrPlayerOwner.GetHUDObjectivesValue();
		CompleteTeamSelectionMenuClose();
		ShowHUDPlayerAlive();
	}

	if( m_GameClass == class'TrGame_TrCaH' && CaHStats != none )
	{
		// Initialize the various HUD elements.
		CaHStats.ReadyToPlay();
	}
}

exec function Fade(float FadeTarget, float FadeSpeed, optional float bForceFadeInStartAlpha=-1.0)
{
	m_VignetteFadeTarget = FadeTarget * m_VignetteValueMultiplier;
	m_VignetteFadeSpeed = FadeSpeed;

    //m_GFxHud.HideKillCamInfo();

	if( bForceFadeInStartAlpha != -1 )
	{
		if( m_VignetteMaterialInstance != none )
		{
			m_VignetteMaterialInstance.SetScalarParameterValue('POW01',bForceFadeInStartAlpha*m_VignetteValueMultiplier);
		}
	}
}

function PlayRoundOver(int WinningTeam)
{
    m_nWinningTeam = WinningTeam;
    TrPlayerOwner.m_bShowSpectatorControls = false;

    SetShowScores(false);
    ClearHeroStatus();
    RestoreHUDState();

    // Don't show the end of match movie if the player hasn't even loaded in properly yet
    if (bLoadSequenceComplete)
    {
        SetTimer(1.0f,false,'ShowRoundEnding');
    }
}

function ShowRoundEnding()
{
    //local int endingType;  "FINAL_RELEASE" Script still throws a warning on endingType in this usage

	if( TrPlayerOwner != none && TrPlayerOwner.GetTeamNum() == 255 )
	{
		// Since we are spectating, say which team won instead of "you win" / "you lose"
		if (m_nWinningTeam == 0) // Stalemate
		{
			//endingType = 0;
			AddToHeroStatus("The round ended in a stalemate", 4.0);
		}
		else if( m_nWinningTeam == 1 )
		{
			// "Diamond Sword Wins"
			//endingType = 5;
			AddToHeroStatus("Diamond Sword wins the round", 4.0);
		}
		else if( m_nWinningTeam == 2 )
		{
			// "Blood Eagle Wins"
			//endingType = 6;
			AddToHeroStatus("Blood Eagle wins the round", 4.0);
		}
	}
	else
	{
		if (m_nWinningTeam == 0) // Stalemate
		{
			//endingType = 0;
			AddToHeroStatus("The round ended in a stalemate", 4.0);
		}
		else if (TrPlayerOwner.GetTeamNum() == 0) // Show Blood Eagle Symbol
		{
			if (m_nWinningTeam == 2) // We Won
			{
				//endingType = 2;
				//AddToHeroStatus("We won the round", 4.0);
				TrPlayerOwner.ReceiveLocalizedMessage(class'TrArenaMessage', 10);
			}
			else
			{
				//endingType = 4;
				//AddToHeroStatus("We lost the round", 4.0);
				TrPlayerOwner.ReceiveLocalizedMessage(class'TrArenaMessage', 11);
			}
		}
		else if (TrPlayerOwner.GetTeamNum() == 1) // Show Diamond Sword Symbol
		{
			if (m_nWinningTeam == 1) // We WOn
			{
				//endingType = 1;
				//AddToHeroStatus("We won the round", 4.0);
				TrPlayerOwner.ReceiveLocalizedMessage(class'TrArenaMessage', 10);
			}
			else
			{
				//endingType = 3;
				//AddToHeroStatus("We lost the round", 4.0);
				TrPlayerOwner.ReceiveLocalizedMessage(class'TrArenaMessage', 11);
			}
		}
	}
	
	
	// TODO: need a custom graphic. using hero text for now.
	//m_GFxHud.ShowEnding(endingType);
	//if( false ) // This stupid statement just makes endingType used so that it doesn't throw a compile warning (in non-final-release-mode)
	//{
		//`log(endingType);
	//}
}

function PlayMatchOver(int Winner, string WinnerName)
{
    m_bGameOver = true;
    m_nWinningTeam = Winner;
    m_sWinningPlayer = WinnerName;
    
    m_GFxHud.m_bGameOver = true;
    TrPlayerOwner.m_bShowSpectatorControls = false;

    SetShowScores(false);
    ClearHeroStatus();
    RestoreHUDState();

    // Don't show the end of match movie if the player hasn't even loaded in properly yet
    if (bLoadSequenceComplete)
    {
        SetTimer(1.0f,false,'ShowEnding');
    }
}

function ShowEnding()
{
    local int endingType;
    local string message;
    
    //Tell UI to fire off victory/defeat animation
    if (m_GameClass == class'TrGame_TRRabbit')
    {
        message = m_sWinningPlayer@"WINS THE ROUND";
        m_GFxHud.UpdateHeroStatus(message, 6.0f);
    }
    else
    {
		if( TrPlayerOwner != none && TrPlayerOwner.GetTeamNum() == 255 )
		{
			// Since we are spectating, say which team won instead of "you win" / "you lose"
			if (m_nWinningTeam == 0) // Stalemate
			{
				endingType = 0;
			}
			else if( m_nWinningTeam == 1 )
			{
				// "Diamond Sword Wins"
				endingType = 5;
			}
			else if( m_nWinningTeam == 2 )
			{
				// "Blood Eagle Wins"
				endingType = 6;
			}
		}
		else
		{
			if (m_nWinningTeam == 0) // Stalemate
			{
				endingType = 0;
			}
			else if (TrPlayerOwner.GetTeamNum() == 0) // Show Blood Eagle Symbol
			{
				if (m_nWinningTeam == 2) // We Won
				{
					endingType = 2;
				}
				else
				{
					endingType = 4;
				}
			}
			else if (TrPlayerOwner.GetTeamNum() == 1) // Show Diamond Sword Symbol
			{
				if (m_nWinningTeam == 1) // We WOn
				{
					endingType = 1;
				}
				else
				{
					endingType = 3;
				}
			}
		}
        
        m_GFxHud.ShowEnding(endingType);
    }
}

function FadeInSummary()
{
    HideHUDElements(false);
    Fade(1, 0.3f);
    TrPlayerOwner.SetViewTargetAsOverwatch(true);
}

function ScaleformJoystickInputEvent(float leftAngle, float rightAngle) { }

function ToggleSkiEffect(bool bEnabled, float fSpeed)
{
    m_bIsControllerSkiing = bEnabled;
	m_fControllerSkiSpeed = fSpeed;
}

function TogglePauseMenu()
{
    if (PauseMenuMovie == None)
	{
        PauseMenuMovie = new class'GFxTrUI_MainMenu';
        PauseMenuMovie.MovieInfo = SwfMovie'TribesHud.tr_mainmenu';
        PauseMenuMovie.bEnableGammaCorrection = FALSE;
		PauseMenuMovie.LocalPlayerOwnerIndex = class'Engine'.static.GetEngine().GamePlayers.Find(LocalPlayer(PlayerOwner.Player));
        PauseMenuMovie.SetTimingMode(TM_Real);
		PauseMenuMovie.FlushPlayerInput(false);
    }

    super.TogglePauseMenu();
}

// Capturing video settings
exec function ToggleMovieHUD()
{
    RestoreHUDState();
}








exec function ToggleVehicleMenu()
{
	local TrPawn MyPawnOwner;

	MyPawnOwner = TrPawn(PlayerOwner.ViewTarget);
	if ( MyPawnOwner == None )
	{
		return;
	}

    if (VehicleMenuMovie == None)
	{
		VehicleMenuMovie = new class'GFxTrUI_VehicleMenu';
		VehicleMenuMovie.MovieInfo = SwfMovie'TribesHud.tr_vehiclemenu';
		VehicleMenuMovie.bEnableGammaCorrection = FALSE;
		VehicleMenuMovie.LocalPlayerOwnerIndex = class'Engine'.static.GetEngine().GamePlayers.Find(LocalPlayer(PlayerOwner.Player));
		VehicleMenuMovie.SetTimingMode(TM_Real);
	}

    if ( VehicleMenuMovie!=None )
    {
		CloseOtherMenus();
		VehicleMenuMovie.FlushPlayerInput(false);
	
        PlayerOwner.SetPause(True);
        SetVisible(false);
        VehicleMenuMovie.Start();
		VehicleMenuMovie.ConfigureOptions(MyPawnOwner.GetCurrCharClassInfo());
    }
}

exec function ToggleTeamSelectionMenu()
{
    // No Team Selection in Rabbit or if the game has ended
    if (m_GameClass == class'TrGame_TRRabbit' || m_GameClass == class'TrGame_TrTraining' || m_bGameOver)
    {
        return;
    }

    if (!TrPlayerOwner.HaveMenu())
    {
        RestoreHUDState();
        return;
    }

    if (TeamSelectionMenuMovie == none)
	{
		TeamSelectionMenuMovie = new class'GFxTrUI_TeamSelectionMenu';
		TeamSelectionMenuMovie.MovieInfo = SwfMovie'TribesHud.tr_ingamemenu';
		TeamSelectionMenuMovie.bEnableGammaCorrection = FALSE;
		TeamSelectionMenuMovie.LocalPlayerOwnerIndex = class'Engine'.static.GetEngine().GamePlayers.Find(LocalPlayer(PlayerOwner.Player));
		TeamSelectionMenuMovie.SetTimingMode(TM_Real);
        
        TeamSelectionMenuMovie.Start();
	}

    if (TeamSelectionMenuMovie != none )
    {
        ShowCenterHUDElements(false);
		CloseOtherMenus();
		TeamSelectionMenuMovie.FlushPlayerInput(false);

        if (TeamSelectionMenuMovie.bCompleted)
        {
            TeamSelectionMenuMovie.Start();
        }
        else
        {
            TeamSelectionMenuMovie.Show();
        }
    }
}

function SetPowerOscillation(bool bEnable)
{
    m_GFxHud.SetPowerOscillation(bEnable);
}

function AddUpdateToCombatLog(int CombatType, string Aggressor, int WeaponIcon, string Victim)
{
    m_GFxHud.AddUpdateToCombatLog(CombatType, Aggressor, WeaponIcon, Victim);
}

function AddToPromptPanel(string Message, GC_ALERT_PRIORITY priority)
{
	AddToPromptPanelTime(Message,5.0,priority);
}

function AddToPromptPanelTime(string Message, float EndTime, GC_ALERT_PRIORITY priority)
{
    m_GFxHud.AddToPromptPanelTime(Message, EndTime, priority);
}

function ClearPromptPanel()
{
    m_GFxHud.ClearPromptPanel();
}

function AddToHeroStatus(string Message, float ShowTime)
{
	if (!m_bGameOver)
	{
		m_GFxHud.UpdateHeroStatus(Message, ShowTime);
	}
}

function ClearHeroStatus()
{
    m_GFxHud.ClearHeroStatus();
}

function ClearPromptPanelMessage(string Message)
{
    m_GFxHud.ClearPromptPanelMessage(Message);
}

function UpdateVGSMenu()
{
    m_GFxHud.UpdateVGSMenuList();
}

function HideVGSMenu()
{
    m_GFxHud.HideVGSMenu();
}

function AddToHelpText(string Title, string Body, float PictureIndex, string Footer, string SuppressString)
{
    m_GFxHud.UpdateTutorial(Title, Body, PictureIndex, Footer, SuppressString);
}

function ClearHelpText()
{
    m_GFxHud.HideTutorial();
}

function AddUpdateToKillMessage(int rankIcon, int playerIcon, string playerName, string Message)
{
    m_GFxHud.AddUpdateToKillMessage(rankIcon,playerIcon,playerName,Message);
}

function AddFlyingIcon(int iconNumber, string Description, string Points, optional int bIsBadge = 0)
{
    //AwardTimelineLoc = 0;
    //bPlayAward = true;

    m_GFxHud.AddFlyingIcon(iconNumber, Caps(Description), Caps(Points), bIsBadge);
}

function OnSpectate(bool bUpdateTeamState)
{
    if( TrPlayerOwner == none )
	{
		return;
	}

	if( bUpdateTeamState )
	{
		// Let the HUD know that we are spectating and we don't need a team assignment.
		RestoreHUDState();
	}

	// Hide stats.
	if (HUDTeamCTFStats != none) TrPlayerOwner.m_bShowSpectatorHUD ? HUDTeamCTFStats.Show() : HUDTeamCTFStats.Hide();
	if (TeamRabbitStats != none) TrPlayerOwner.m_bShowSpectatorHUD ? TeamRabbitStats.Show() : TeamRabbitStats.Hide();
	if (RabbitLeaderboard != none) TrPlayerOwner.m_bShowSpectatorHUD ? RabbitLeaderboard.Show() : RabbitLeaderboard.Hide();
	if (ArenaStats != none) TrPlayerOwner.m_bShowSpectatorHUD ? ArenaStats.Show() : ArenaStats.Hide();
	if (DaDStats != none) TrPlayerOwner.m_bShowSpectatorHUD ? DaDStats.Show() : DaDStats.Hide();
	if (CaHStats != none) TrPlayerOwner.m_bShowSpectatorHUD ? CaHStats.Show() : CaHStats.Hide();
	// Set various things visible and invisible.
	m_GFxHud.ConfigureSpectatorHUD(TrPlayerOwner.GetTeamNum() == 255);
}

function CreateSpectatorHUDCache()
{
	m_SpectatorHUDCache = new (self) class'TrSpectatorHUDCache';
}

function ClearSpectatorHUDCache()
{
	m_SpectatorHUDCache = none;
}

function HideHUDElements(optional bool bShowStats = false, optional bool bForceCredits = false)
{
    if (!bShowStats)
    {
		if (HUDTeamCTFStats != none) HUDTeamCTFStats.Hide();
		if (TeamRabbitStats != none) TeamRabbitStats.Hide();
		if (RabbitLeaderboard != none) RabbitLeaderboard.Hide();
		if (ArenaStats != none) ArenaStats.Hide();
		if (DaDStats != none) DaDStats.Hide();
		if (CaHStats != none) CaHStats.Hide();
    }
    else
    {
		if (HUDTeamCTFStats != none) HUDTeamCTFStats.Show();
		if (TeamRabbitStats != none) TeamRabbitStats.Show();
		if (RabbitLeaderboard != none) RabbitLeaderboard.Show();
		if (ArenaStats != none) ArenaStats.Show();
		if (DaDStats != none) DaDStats.Show();
		if (CaHStats != none) CaHStats.Show();
    }

    m_GFxHud.ConfigureHUDState(false, false, bForceCredits);
}

function ShowHUDPlayerSpawning()
{
	if (HUDTeamCTFStats != none) HUDTeamCTFStats.Show();
    if (TeamRabbitStats != none) TeamRabbitStats.Show();
    if (RabbitLeaderboard != none) RabbitLeaderboard.Show();
	if (ArenaStats != none) ArenaStats.Show();
	if (DaDStats != none) DaDStats.Show();
	if (CaHStats != none) CaHStats.Show();

    m_GFxHud.ConfigureHUDState(false, true);
}

function ShowHUDPlayerAlive()
{
	if (HUDTeamCTFStats != none) HUDTeamCTFStats.Show();
    if (TeamRabbitStats != none) TeamRabbitStats.Show();
    if (RabbitLeaderboard != none) RabbitLeaderboard.Show();
	if (ArenaStats != none) ArenaStats.Show();
	if (DaDStats != none) DaDStats.Show();
	if (CaHStats != none) CaHStats.Show();

    m_GFxHud.HideKillCamInfo();
    m_GFxHud.ConfigureHUDState(true, true);
}

function ShowCenterHUDElements(bool bShow)
{
    m_GFxHud.ShowCenterHUDElements(bShow);
}

function UpdateRespawnText(string text)
{
    m_GFxHud.UpdateRespawnText(text);
}

function UpdateRespawnTimer(int timeRemaining)
{
    m_GFxHud.UpdateRespawnTimer(timeRemaining);
}

function UpdateHUDCredits(int changeAmount, int newTotal)
{
	// -1 in the total signals a replicated update - calculate how much it increased
	if (newTotal==-1)
	{
		newTotal = changeAmount;
		changeAmount = changeAmount - LastCreditTotal;
	}

	m_GFxHud.UpdateHUDCredits(changeAmount,newTotal);
	LastCreditTotal = newTotal;
}

function TeamScoreboardShow(bool bVisible)
{
    m_GFxHud.TeamScoreboardShow(bVisible);
}

function RabbitScoreboardShow(bool bVisible)
{
    m_GFxHud.RabbitScoreboardShow(bVisible);
}

function TeamScoreboardUpdateSlot(int Index, string PlayerName, string Score, string Kills, string Assists, string Ping, string ClassAbb, int Rank, int RankIcon)
{
    if (TrPlayerOwner.GetTeamNum() == 255) Rank = -1;

    m_GFxHud.TeamScoreboardUpdateSlot(Index, PlayerName, Score, Kills, Assists, Ping, ClassAbb, Rank, RankIcon);
}

function RabbitScoreboardUpdateSlot(int Index, string PlayerName, string Score, string Kills, string Assists, string Ping, string ClassAbb, int Rank, int RankIcon)
{
    if (TrPlayerOwner.GetTeamNum() == 255) Rank = -1;

    m_GFxHud.RabbitScoreboardUpdateSlot(Index, PlayerName, Score, Kills, Assists, Ping, ClassAbb, Rank, RankIcon);
}

function TeamScoreboardUpdateTeamScore(int Index, int Score)
{
    m_GFxHud.TeamScoreboardUpdateTeamScore(Index, Score);
}

function TeamScoreboardUpdateTime(string Time)
{
    m_GFxHud.TeamScoreboardUpdateTime(Time);
}

function RabbitScoreboardUpdateTime(string Time)
{
    //m_GFxHud.RabbitScoreboardUpdateTime(Time);
}

function TeamScoreboardActivePlayer(int Index)
{
    m_GFxHud.TeamScoreboardActivePlayer(Index);
}

function RabbitScoreboardActivePlayer(int Index, bool bVisible)
{
    m_GFxHud.RabbitScoreboardActivePlayer(Index, bVisible);
}

function ResolutionChanged()
{
	local bool bNeedScoreboard;
    local bool bNeedTeamSelectionMenu;
    //local bool bNeedClassMenu;

    bNeedTeamSelectionMenu = TeamSelectionMenuMovie != none && TeamSelectionMenuMovie.bMovieIsOpen;
    bNeedScoreboard = Scoreboard != none && Scoreboard.bIsActive;

	Super.ResolutionChanged();

	if (bNeedTeamSelectionMenu) ToggleTeamSelectionMenu();
	
    if (bNeedScoreboard) SetShowScores(true);
    else SetShowScores(false);

    if (Scoreboard != none) Scoreboard.ConfigScoreboard();

    LastChangeResTime = WorldInfo.TimeSeconds;
    LastChangeResCheckTime = 0;
    bRestoreHUDState = true;
}

function RestoreHUDState()
{
    if (bIsMainMenuOpen)
    {
        HideHUDElements();
        return;
    }

    EnableGameTypeHUD();

    // Do not show any HUD elements until we have gracefully faded into the gamescreen
    if (!bLoadSequenceComplete || m_bGameOver)
    {
        HideHUDElements(m_bGameOver, m_bGameOver);
        return;
    }
    
    if (TrPlayerOwner.m_bShowHUDChat) m_GFxHud.ShowChatLog();
    else m_GFxHud.HideChatLog();

    if (TrPlayerOwner.HaveMenu() && (PlayerOwner.GetTeamNum() == 255 || PlayerOwner.IsWaiting()))
    {
        if (m_bGameOver)
        {
            CompleteTeamSelectionMenuClose();
        }
        else if ((TrPlayerOwner.r_bNeedTeam && !TrPlayerOwner.InRovingSpectate()) && !TrPlayerOwner.MainMenuIsOpen())
        {
            ToggleTeamSelectionMenu();
        }
    }
	else if (PlayerOwner.IsDead())
	{
        m_GFxHud.UpdateCredits(LastCreditTotal);

        if (RabbitLeaderboard != none && RabbitLeaderboard.bIsActive)
        {
            RabbitLeaderboard.ForceUpdate();
        }
        else if (TeamRabbitStats != none && TeamRabbitStats.bIsActive)
        {
            TeamRabbitStats.ForceUpdate();
        }
        else if (HUDTeamCTFStats != none && HUDTeamCTFStats.bIsActive)
        {
            HUDTeamCTFStats.ForceUpdate();
        }
		else if (ArenaStats != none && ArenaStats.bIsActive)
        {
            ArenaStats.ForceUpdate();
        }
		else if (DaDStats != none && DaDStats.bIsActive)
        {
            DaDStats.ForceUpdate();
        }
		else if (CaHStats != none && CaHStats.bIsActive)
        {
            CaHStats.ForceUpdate();
        }

		ShowHUDPlayerSpawning();
	}
	else
	{
        m_GFxHud.UpdateCredits(LastCreditTotal);

        if (RabbitLeaderboard != none && RabbitLeaderboard.bIsActive)
        {
            RabbitLeaderboard.ForceUpdate();
        }
        else if (TeamRabbitStats != none && TeamRabbitStats.bIsActive)
        {
            TeamRabbitStats.ForceUpdate();
        }
        else if (HUDTeamCTFStats != none && HUDTeamCTFStats.bIsActive)
        {
            HUDTeamCTFStats.ForceUpdate();
        }
		else if (ArenaStats != none && ArenaStats.bIsActive)
        {
            ArenaStats.ForceUpdate();
        }
		else if (DaDStats != none && DaDStats.bIsActive)
        {
            DaDStats.ForceUpdate();
        }
		else if (CaHStats != none && CaHStats.bIsActive)
        {
            CaHStats.ForceUpdate();
        }

		ShowHUDPlayerAlive();
	}
}

exec function HideMenus()
{
	RemoveMovies();
}

function RemoveMovies()
{
	if ( VehicleMenuMovie != None )
	{
		VehicleMenuMovie.Close(true);
		VehicleMenuMovie = None;
	}
	if ( TeamSelectionMenuMovie != None )
	{
		TeamSelectionMenuMovie.Close(true);
		TeamSelectionMenuMovie = None;
	}

	Super.RemoveMovies();
}

function CompleteVehicleMenuClose()
{
    PlayerOwner.SetPause(False);
    VehicleMenuMovie.Close(false);
    SetVisible(true);
}

function CompleteTeamSelectionMenuClose()
{
    PlayerOwner.SetPause(False);
    ShowCenterHUDElements(true);

    if (TeamSelectionMenuMovie != none)
    {
        TeamSelectionMenuMovie.bCompleted = true;
        TeamSelectionMenuMovie.Close(false);
    }

    SetVisible(true);

    RestoreHUDState();
}

function ClearCrosshairOnFriendly()
{
    m_GFxHud.m_nCrossHairMode = 0;
}

function bool CheckCrosshairOnFriendly()
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace;
	local actor HitActor;
	local UTVehicle V;
	local UTWeapon W;
    local TrDevice TrD;
	local int SeatIndex;
	local Pawn MyPawnOwner, Tracer, HitPawn;
	local rotator tmpRotation;
	local ImpactInfo HitInfo;

	// Reset.
	ClearCrosshairOnFriendly();

	MyPawnOwner = Pawn(PlayerOwner.ViewTarget);

	if ( MyPawnOwner == None )
	{
		return false;
	}

	V = UTVehicle(MyPawnOwner);
	if ( V != None )
	{
		for ( SeatIndex=0; SeatIndex<V.Seats.Length; SeatIndex++ )
		{
			if ( V.Seats[SeatIndex].SeatPawn == MyPawnOwner )
			{
				HitActor = V.Seats[SeatIndex].AimTarget;
				break;
			}
		}

		if (HitActor == none)
			HitActor = V;
	}

	// Make sure the crosshair goes to some depth.
	PlayerOwner.GetActorEyesViewPoint(StartTrace, tmpRotation);
	EndTrace = StartTrace + vector(PlayerOwner.Rotation) * 262143; // Half world max

	if (HitActor == none)
	{
		// Determine who does the actual trace.
		if (MyPawnOwner.Base != none && MyPawnOwner.Base.IsA('TrVehicle'))
			Tracer = Pawn(MyPawnOwner.Base);
		if (Tracer == none)
			Tracer = MyPawnOwner;

		// Try to do an accurate trace.
		W = UTWeapon(MyPawnOwner.Weapon);
		if (W != None)
		{
			HitInfo = W.CalcWeaponFire(StartTrace, EndTrace);
			HitActor = HitInfo.HitActor;
			HitLocation = HitInfo.HitLocation;
			HitNormal = HitInfo.HitNormal;
		}
		else
		{
			HitLocation = EndTrace;
			HitActor = Tracer.Trace(HitLocation, HitNormal, EndTrace, StartTrace, true, vect(0,0,0),, TRACEFLAG_Bullet);
		}

		// Trace out to see if we hit anything.
		if ( Pawn(HitActor) == None && TrGameObjective(HitActor)==None)
		{
			HitActor = (HitActor == None) ? None : Pawn(HitActor.Base);
		}
	}

	// The crosshair goes to the depth of what we're hitting.
	m_GFxHud.m_fCrosshairDepth = FMin(VSize(HitLocation - StartTrace), 262143.0); // Half world max

	// Check to see if the pawn's mesh is hidden in-game, if so ignore the crosshair changing color.
	HitPawn = Pawn(HitActor);
	if (!bCrosshairOnFriendly || ((HitPawn == None || HitPawn.Mesh == none || HitPawn.Mesh.HiddenGame) && TrGameObjective(HitActor)==None && TrVehicle(HitActor)==None))
	{
		return false;
	}

	// If we aren't on the same team and the hit actor actually has a team number, it's an enemy. Otherwise it's friendly.
	if (!Worldinfo.GRI.OnSameTeam(HitActor, MyPawnOwner) && HitActor.GetTeamNum() != 255)
	{
        TrD = TrDevice(MyPawnOwner.Weapon);

        if (TrD != none && TrD.m_bHighlightEnemies)
        {
            m_GFxHud.m_nCrossHairMode = -1;
        }

        return false;
    }

    m_GFxHud.m_nCrossHairMode = 1;

	return true;
}

function vector DrawMarker(Texture2D Marker, vector Placement, Canvas DrawCanvas, optional String markText, optional bool bFriend, optional float Alpha = 1.0f, optional float distScale = 1.0)
{
    local float xl,yl;
	local LinearColor blend;

	blend.R = 1.0f;
	blend.G = 1.0f;
	blend.B = 1.0f;
	blend.A = Alpha;

    xl = (Marker.SizeX * distScale);
    yl = (Marker.SizeY * distScale);
	Placement.X -= (xl / 2);
	Placement.Y -= (yl / 2);

	DrawCanvas.DrawColor = MakeColor(255,255,255,255);
	DrawCanvas.SetPos(Placement.X, Placement.Y, Placement.Z);
    DrawCanvas.DrawTile(Marker, xl, yl, 0, 0, Marker.SizeX, Marker.SizeY, blend);

    Placement.Y -= (Marker.SizeY / 2);

    if (Len(markText) > 0)
    {
        Placement = DrawMarkerText(markText, bFriend, Placement, DrawCanvas);
    }

    return (Placement);
}

function vector DrawRotatedMarker(Texture2D Marker, vector Placement, rotator Rot, Canvas DrawCanvas, optional String markText, optional bool bFriend, optional float Alpha = 1.0f, optional float distScale = 1.0)
{
    local float xl,yl;

    xl = (Marker.SizeX * distScale);
    yl = (Marker.SizeY * distScale);

	DrawCanvas.DrawColor = MakeColor(255,255,255,255 * Alpha);
	DrawCanvas.SetPos(Placement.X - (xl / 2), Placement.Y - (yl / 2), Placement.Z);
    DrawCanvas.DrawRotatedTile(Marker, Rot, xl, yl, 0, 0, Marker.SizeX, Marker.SizeY);//, blend);

    Placement.Y -= (Marker.SizeY / 2);

    if (Len(markText) > 0)
    {
        Placement = DrawMarkerText(markText, bFriend, Placement, DrawCanvas);
    }

    return (Placement);
}

function vector DrawMarkerText(String ShowText, bool bFriend, vector Placement, Canvas DrawCanvas, optional bool bBuddy)
{
	local float xl, yl;

	// Foreground.
	DrawCanvas.Font = Font'Hud_Items.NameForeground';
	DrawCanvas.SetPos(Placement.X, Placement.Y, Placement.Z);
	DrawCanvas.StrLen(ShowText, xl, yl);
	if( bBuddy )
	{
		DrawCanvas.DrawColor = (bFriend ? MakeColor(75,255,80,255) : MakeColor(255,185,23,255));
	}
	else
	{
		DrawCanvas.DrawColor = (bFriend ? class'TrHUD'.default.ColorFriend : class'TrHUD'.default.ColorEnemy);
	}
	DrawCanvas.SetPos(Placement.X - (xl/2), Placement.Y - (yl/2), Placement.Z);
	DrawCanvas.DrawText(ShowText, true, , , m_nNameFontRenderInfo);

    //Placement.Y += (yl / 2);

    return (Placement);
}

function vector DrawColoredMarkerText(String ShowText, Color TextColor, vector Placement, Canvas DrawCanvas, optional float ScaleX=1.0, optional float ScaleY=1.0)
{
	local float xl, yl;

	// Foreground.
	DrawCanvas.Font = Font'Hud_Items.NameForeground';
	DrawCanvas.SetPos(Placement.X, Placement.Y, Placement.Z);
	DrawCanvas.StrLen(ShowText, xl, yl);
    DrawCanvas.DrawColor = TextColor;
	DrawCanvas.SetPos(Placement.X - (xl/2), Placement.Y - (yl/2), Placement.Z);
	DrawCanvas.DrawText(ShowText, true, ScaleX, ScaleY, m_nNameFontRenderInfo);

    return (Placement);
}

static function DrawSmallText(String ShowText, bool bFriend, vector Placement, Canvas DrawCanvas)
{
	local float xl, yl;

    //DrawCanvas.Font = class'UTHUD'.static.GetFontSizeIndex(0);
	DrawCanvas.Font = Font'Hud_Items.FranklinGothicDemi_Medium';
	DrawCanvas.StrLen(ShowText, xl, yl);

    DrawCanvas.DrawColor = (bFriend ? class'TrHUD'.default.ColorFriend : class'TrHUD'.default.ColorEnemy);
	DrawCanvas.SetPos(Placement.X - (xl / 2), Placement.Y - (yl / 2), Placement.Z);
	DrawCanvas.DrawText(ShowText, true, , , class'UTHUD'.default.TextRenderInfo);
}

function DrawHealthBar(MaterialInstanceConstant HealthBarMIC, bool bFriend, vector Placement, Canvas DrawCanvas, float PlacementX, float PlacementY, float Width, float Height)
{	
    Placement.X -= (Width / 2) + PlacementX;
	Placement.Y -= (Height / 2) + PlacementY;

	DrawCanvas.SetPos(Placement.X, Placement.Y, Placement.Z);
	DrawCanvas.DrawMaterialTile(HealthBarMIC, Width, Height, 0.0, 0.0, 1.0, 1.0);
}

function vector DrawMICMarker(MaterialInstanceConstant MarkerMIC, vector Placement, Canvas DrawCanvas, Vector2D MarkerSize, optional String markText, optional bool bFriend, optional float distScale = 1.0)
{
    local float xl,yl;

    xl = (MarkerSize.X * distScale);
    yl = (MarkerSize.Y * distScale);
	Placement.X -= (xl / 2);
	Placement.Y -= (yl / 2);

	DrawCanvas.SetPos(Placement.X, Placement.Y, Placement.Z);
	DrawCanvas.DrawMaterialTile(MarkerMIC, xl, yl);

    Placement.Y -= (MarkerSize.Y / 2);

    if (Len(markText) > 0)
    {
        Placement = DrawMarkerText(markText, bFriend, Placement, DrawCanvas);
    }

    return Placement;
}

static function bool GetEdgeScreenCoordinates(Canvas inCanvas, vector CameraPosition, vector CameraDir, vector ObjectLocation, out vector ScreenLocation)
/*
 *  This function takes the position of the camera, view direction, and an objects location.
 *  It then calculates the edge screen coordinates for that object.
 *  Canvas- The Canvas that will be rendered to.
 *  CameraPosition- Position of the camera.
 *  CameraDir- Direction of the camera.
 *  ObjectLocation- Location of the object being translated to edge screen coordinates (or on the screen if not an edge-case).
 *  ScreenLocation- The output screen coordinates for the marker.
 *  Return Value: Whether the object is along the screen edges, if so don't draw.
*/
{
	local bool bBehindCamera;
	local bool bAlongScreenEdges;
	local int minScrCoordValue;
	local float lineSlope,lineConstant;
	local vector ScreenDir;

	// Translate to screen coordinates and determine if the object is in front of us or behind us.
	ScreenLocation = inCanvas.Project(ObjectLocation);
	bBehindCamera = ((CameraDir dot (ObjectLocation - CameraPosition)) <= 0.f);

	minScrCoordValue=20;

	// if clipped out or behind the camera, determine where to show the icon
	if (ScreenLocation.X < 0 || ScreenLocation.X >= inCanvas.ClipX || ScreenLocation.Y < 0 || ScreenLocation.Y >= inCanvas.ClipY || bBehindCamera)
	{
		bAlongScreenEdges=true;

		// project unit vector from the camera toward ourself
		ScreenDir = inCanvas.Project(CameraPosition + Normal(ObjectLocation - CameraPosition));

		// draw a line connecting the center of the screen and the point we just found... where that line intersects the 
		// edge of the screen is where the HUD contents for this object need to be displayed
		if (inCanvas.ClipX/2.0-ScreenDir.X == 0)
		{
			// deal with div-zero; happens when we are directly behind the camera
			ScreenDir.X-=1;
		}

		lineSlope = (inCanvas.ClipY/2.0-ScreenDir.Y)/(inCanvas.ClipX/2.0-ScreenDir.X);
		lineConstant = ScreenDir.Y - lineSlope*ScreenDir.X;

		// intersect top or bottom of the screen clip area?
		if (ScreenDir.Y > inCanvas.ClipY/2.0)
		{
			// top
			ScreenLocation.Y = inCanvas.ClipY - minScrCoordValue;
		}
		else
		{
			// bottom
			ScreenLocation.Y = minScrCoordValue;
		}

		// find X coord given the Y coord chosen above
		if (lineSlope!=0)
			ScreenLocation.X = (ScreenLocation.Y-lineConstant) / lineSlope;
		else
			ScreenLocation.X = inCanvas.ClipX / 2.0;

		if (ScreenLocation.X > inCanvas.ClipX)
		{
			// too far to the right? recalculate
			ScreenLocation.X = inCanvas.ClipX - minScrCoordValue;
			ScreenLocation.Y = lineSlope*ScreenLocation.X+lineConstant;
		}
		else if (ScreenLocation.X < 0)
		{
			// too far to the left? recalculate
			ScreenLocation.X = minScrCoordValue;
			ScreenLocation.Y = lineSlope*ScreenLocation.X+lineConstant;
		}

		// objects in rear view are inverted
		if (bBehindCamera) 
		{
			ScreenLocation.X = inCanvas.ClipX - ScreenLocation.X;
			ScreenLocation.Y = inCanvas.ClipY - ScreenLocation.Y;
		}
	}

	return bAlongScreenEdges;
}

event PostRender()
{
    if (m_GameClass == none)
    {
        if (WorldInfo.GRI == none || WorldInfo.GRI.GameClass == none)
        {
            return;
        }

        InitializeGameHUD();
    }
    
    Super.PostRender();
    
	if (Scoreboard != none && Scoreboard.bIsActive)
	{
	    Scoreboard.Tick(RenderDelta);
	}

    if (HUDTeamCTFStats != none && HUDTeamCTFStats.bIsActive)
    {
        HUDTeamCTFStats.Tick();
    }

    if (RabbitLeaderboard != none && RabbitLeaderboard.bIsActive)
    {
        RabbitLeaderboard.Tick();
    }

    if (TeamRabbitStats != none && TeamRabbitStats.bIsActive)
    {
        TeamRabbitStats.Tick();
    }

	if (ArenaStats != none && ArenaStats.bIsActive)
    {
        ArenaStats.Tick();
    }

	if (DaDStats != none && DaDStats.bIsActive)
    {
        DaDStats.Tick();
    }

	if (CaHStats != none && CaHStats.bIsActive)
    {
        CaHStats.Tick();
    }

    if (TeamSelectionMenuMovie != none && TeamSelectionMenuMovie.bMovieIsOpen)
    {
        TeamSelectionMenuMovie.Tick(WorldInfo.GRI);
    }

	if( m_UperPPEffect != none )
	{
		if( bIsMainMenuOpen )
		{
			m_UperPPEffect.bUseWorldSettings = false;
		}
		else
		{
			m_UperPPEffect.bUseWorldSettings = true;
		}
	}

	if( bIsMainMenuOpen || (TrPlayerOwner != none && TrPlayerOwner.IsSpectating()) )
	{
		if( m_GFxHud != none && m_GFxHud.m_DirectionalDamageEffect != none )
		{
			m_GFxHud.m_DirectionalDamageEffect.bShowInGame = false;
		}
	}
	else
	{
		if( m_GFxHud != none && m_GFxHud.m_DirectionalDamageEffect != none )
		{
			m_GFxHud.m_DirectionalDamageEffect.bShowInGame = true;
		}
	}

	// Update the crosshair.
	bGreenCrosshair = CheckCrosshairOnFriendly();
	bCrosshairOnFriendly = false;

    // Update the ski effect.
    UpdateSkiEffect();
	UpdatePickupFlashEffect();
	UpdateInvulnerableEfect();
	UpdateShieldEffect();
	UpdateJammerEffect();
	UpdateFadeEffect();
	UpdateWhiteoutEffect();
	UpdateFumbledFlagEffect();

	UpdateOverheadNumbers(RenderDelta);

	UpdateOwnedItems();

    // If we changed resolutions recently attempt to restore the previous HUD state. We have to ping it
    // several times because the Scaleform does not respond directly after initialization. 
    if (bRestoreHUDState)
    {
        if (LastChangeResCheckTime != int(WorldInfo.TimeSeconds)) 
        {
            if (WorldInfo.TimeSeconds - LastChangeResTime < 3)
            {
                RestoreHUDState();
            }
            else
            {
                bRestoreHUDState = false;
            }

            LastChangeResCheckTime = WorldInfo.TimeSeconds;
        }
    }
}

/** 
 * Returns the amount of remaining time for the generator to come back online.
 * If returned 0, the generator is back online.
 */
function float GetRemainingFriendlyGeneratorRestoreTime()
{
    return FMax(m_fFriendlyGeneratorRestoreTime - WorldInfo.TimeSeconds, 0.f);
}
function float GetRemainingEnemyGeneratorRestoreTime()
{
    return FMax(m_fEnemyGeneratorRestoreTime - WorldInfo.TimeSeconds, 0.f);
}

function UpdateSkiEffect()
{
    local float Intensity;

    if (m_SkiEffect == none)
    {
        return;
    }

    if( m_bIsControllerSkiing )
    {
        // Make sure the effect is enabled if we're skiing.
        if( !m_SkiEffect.bShowInGame )
        {
            m_SkiEffect.bShowInGame = TRUE;
        }

        m_SkiEffectMaterialInstance.GetScalarParameterValue('POW02',Intensity);

        if( Intensity <= 0.f )
        {
            m_bStrobeIn = TRUE;
            m_bEffectFadingIn = TRUE;
        }

        if( m_bStrobeIn && m_bEffectFadingIn )
        {
            // Fade in the ski effect.
            Intensity += m_fSkiEffectMaxIntensity * RenderDelta / m_fSkiEffectFadeInTime;

            if( Intensity > m_fSkiEffectMaxIntensity )
            {
                m_bStrobeIn = FALSE;
                m_bEffectFadingIn = FALSE;
            }
        }
        else if( m_bStrobeIn )
        {
            // Strobe in the ski effect.
            Intensity += m_fSkiEffectMaxIntensity * RenderDelta / m_fSkiEffectStrobeTime;

            if( Intensity > m_fSkiEffectMaxIntensity )
            {
                m_bStrobeIn = FALSE;
            }
        }
        else
        {
            // Strobe out the ski effect.
            Intensity -= m_fSkiEffectMaxIntensity * RenderDelta / m_fSkiEffectStrobeTime;

            if( Intensity <= m_fSkiEffectMinIntensity )
            {
                m_bStrobeIn = TRUE;
            }
        }

        m_SkiEffectMaterialInstance.SetScalarParameterValue('POW02',Intensity);
    }
    else
    {
        if( m_SkiEffect.bShowInGame )
        {
            m_SkiEffectMaterialInstance.GetScalarParameterValue('POW02',Intensity);

            Intensity -= m_fSkiEffectMaxIntensity * RenderDelta / m_fSkiEffectFadeOutTime;

            if( Intensity > 0.f )
            {
                // Fade out the ski effect.
                m_SkiEffectMaterialInstance.SetScalarParameterValue('POW02',Intensity);
            }
            else
            {
                // Effect has faded out completely, turn off the effect.
                m_SkiEffectMaterialInstance.SetScalarParameterValue('POW02',0);
            }
        }
    }
}

function UpdatePickupFlashEffect()
{
	local float ParamValue;
    
    if (m_PickupFlashMaterialEffect == none)
    {
        return;
    }

	if( m_PickupFlashMaterialEffect.bShowInGame && m_PickupFlashMaterialInstance != none )
	{
		m_PickupFlashMaterialInstance.GetScalarParameterValue('Startup', ParamValue);
		
		if( ParamValue <= 0.0 )
		{
			// Done with the flash, turn this off.
			m_PickupFlashMaterialEffect.bShowInGame = false;
			return;
		}
		
		ParamValue -= RenderDelta * m_PickupFlashFadeOutSpeed;
		ParamValue = FClamp(ParamValue, 0.0, 1.0);
		m_PickupFlashMaterialInstance.SetScalarParameterValue('Startup', ParamValue);
	}
}

function PulsePickupFlashEffect(float PulseAmount, float PulseSpeed)
{
	if( m_PickupFlashMaterialInstance != none )
	{
		m_PickupFlashMaterialInstance.SetScalarParameterValue('Startup',PulseAmount);
		m_PickupFlashFadeOutSpeed = PulseSpeed;
		m_PickupFlashMaterialEffect.bShowInGame = true;
	}
}

function UpdateInvulnerableEfect()
{
	local TrPawn P;
	local float StartupParamValue, OpacityParamValue;

    if (m_InvulnerableMaterialEffect == none)
    {
        return;
    }

	P = TrPawn(PlayerOwner.ViewTarget);

	if( P != None && P.r_bIsInvulnerable )
	{
		if( !m_InvulnerableMaterialEffect.bShowInGame )
		{
			m_InvulnerableMaterialEffect.bShowInGame = true;
			m_InvulnerableMaterialInstance.SetScalarParameterValue('Startup', 1.0);
			m_InvulnerableMaterialInstance.SetScalarParameterValue('Opacity', 0.0);
			return;
		}

		// Update the startup effect.
		m_InvulnerableMaterialInstance.GetScalarParameterValue('Startup',StartupParamValue);
		if( StartupParamValue > 0.f )
		{
			StartupParamValue -= RenderDelta * m_InvulnerableFadeOutSpeed;
			StartupParamValue = FClamp(StartupParamValue, 0.0, 1.0);
			m_InvulnerableMaterialInstance.SetScalarParameterValue('Startup', StartupParamValue);
		}

		// Update the opacity (bring it in over time).
		m_InvulnerableMaterialInstance.GetScalarParameterValue('Opacity',OpacityParamValue);
		if( OpacityParamValue < 1.f )
		{
			OpacityParamValue = FInterpTo( OpacityParamValue, 1.0, RenderDelta, 10.0 );
			m_InvulnerableMaterialInstance.SetScalarParameterValue('Opacity', OpacityParamValue);
		}
	}
	else
	{
		if( m_InvulnerableMaterialEffect.bShowInGame )
		{
			m_InvulnerableMaterialInstance.GetScalarParameterValue('Opacity',OpacityParamValue);
			if( OpacityParamValue > 0.f )
			{
				OpacityParamValue = FInterpTo( OpacityParamValue, 0.0, RenderDelta, 5.0 );
				m_InvulnerableMaterialInstance.SetScalarParameterValue('Opacity', OpacityParamValue);
			}
			else
			{
				m_InvulnerableMaterialEffect.bShowInGame = false;
			}
		}
	}
}

function UpdateShieldEffect()
{
	local TrPawn P;
	local float StartupParamValue, HitParamValue;

	P = TrPawn(PlayerOwner.ViewTarget);

	if( P == none || m_ShieldMaterialEffect == none) return;

	if( P.r_bIsShielded )
	{
		if( !m_ShieldMaterialEffect.bShowInGame )
		{
			m_ShieldMaterialEffect.bShowInGame = true;
			m_ShieldMaterialInstance.SetScalarParameterValue('Startup', 1.0);
			return;
		}

		// Update the startup effect.
		m_ShieldMaterialInstance.GetScalarParameterValue('Startup',StartupParamValue);
		if( StartupParamValue > 0.f )
		{
			StartupParamValue -= RenderDelta * m_ShieldFadeOutSpeed;
			StartupParamValue = FClamp(StartupParamValue, 0.0, 1.0);
			m_ShieldMaterialInstance.SetScalarParameterValue('Startup', StartupParamValue);
		}

		// Update any hit effect.
		m_ShieldMaterialInstance.GetScalarParameterValue('Hit',HitParamValue);
		if( HitParamValue > 0.f )
		{
			HitParamValue -= RenderDelta * m_ShieldHitFadeOutSpeed;
			HitParamValue = FClamp(HitParamValue, 0.0, 1.0);
			m_ShieldMaterialInstance.SetScalarParameterValue('Hit', HitParamValue);
		}
	}
	else
	{
		if( m_ShieldMaterialEffect.bShowInGame )
		{
			m_ShieldMaterialEffect.bShowInGame = false;
		}
	}
}

function PulseShieldEffect()
{
	if( m_ShieldMaterialInstance != none )
	{
		m_ShieldMaterialInstance.SetScalarParameterValue('Hit', 1.0);
	}
}

function UpdateJammerEffect()
{
	local TrPawn P;
	local float StartupParamValue;

	P = TrPawn(PlayerOwner.ViewTarget);

	if( P == none || m_JammerPackMaterialEffect == none) return;

	if( P.IsJammedByFriendOrSelf() || P.r_bIsJamming )
	{
		if( !m_JammerPackMaterialEffect.bShowInGame )
		{
			m_JammerPackMaterialEffect.bShowInGame = true;
			m_JammerPackMaterialInstance.SetScalarParameterValue('Startup', 1.0);
			return;
		}

		// Update the startup effect.
		m_JammerPackMaterialInstance.GetScalarParameterValue('Startup',StartupParamValue);
		if( StartupParamValue > 0.f )
		{
			StartupParamValue -= RenderDelta * m_JammerPackFadeOutSpeed;
			StartupParamValue = FClamp(StartupParamValue, 0.0, 1.0);
			m_JammerPackMaterialInstance.SetScalarParameterValue('Startup', StartupParamValue);
		}
	}
	else
	{
		if( m_JammerPackMaterialEffect.bShowInGame )
		{
			m_JammerPackMaterialEffect.bShowInGame = false;
		}
	}
}

function UpdateFadeEffect()
{
	local float CurrentParamValue;

	if( m_VignetteMaterialInstance != none )
	{
		m_VignetteMaterialInstance.GetScalarParameterValue('POW01',CurrentParamValue);
		if( CurrentParamValue != m_VignetteFadeTarget )
		{
			CurrentParamValue = FInterpTo(CurrentParamValue, m_VignetteFadeTarget, RenderDelta, m_VignetteFadeSpeed);
			m_VignetteMaterialInstance.SetScalarParameterValue('POW01',CurrentParamValue);
		}
	}
}

/** Plays a fumble flag effect. */
function FumbleFlag(float Speed)
{
	m_bUpdateFumbledFlagEffect = true;
	m_FumbledFlagMaterialEffect.bShowInGame = true;

	if( m_FumbledFlagMaterialInstance != none )
	{
		m_FumbledFlagMaterialInstance.SetScalarParameterValue('Startup', 1.0);
		m_FumbledFlagFadeOutSpeed = Speed;
	}
}

function UpdateFumbledFlagEffect()
{
	if( m_bUpdateFumbledFlagEffect )
	{
		if( m_FumbledFlagMaterialInstance != none )
		{
			m_FumbledFlagMaterialInstance.GetScalarParameterValue('Startup',m_fCurrentFumbledFlagValue);
			if( m_fCurrentFumbledFlagValue > 0 )
			{
				m_fCurrentFumbledFlagValue = FInterpTo(m_fCurrentFumbledFlagValue, 0, RenderDelta, m_FumbledFlagFadeOutSpeed);
				m_FumbledFlagMaterialInstance.SetScalarParameterValue('Startup',m_fCurrentFumbledFlagValue);
			}
			else
			{
				// Done fading out. Make sure the material instance is reset.
				m_FumbledFlagMaterialInstance.SetScalarParameterValue('Startup',0);
				m_bUpdateFumbledFlagEffect = false;
				m_FumbledFlagMaterialEffect.bShowInGame = false;
			}
		}
	}
}

/** White outs the screen (from something like a whiteout grenade blast) */
function Whiteout(float Speed, float Amount)
{
	m_bUpdateWhiteoutEffect = true;

	if( m_WhiteoutMaterialInstance != none && TrPlayerOwner != none && !TrPlayerOwner.IsSpectating() )
	{
		m_WhiteoutMaterialInstance.SetScalarParameterValue('Whiteout', Amount);
		m_WhiteoutFadeOutSpeed = Speed;
	}
}

function ClearWhiteout()
{
	if( m_WhiteoutMaterialInstance != none )
	{
		m_WhiteoutMaterialInstance.SetScalarParameterValue('Whiteout', 0.0);
		m_bUpdateWhiteoutEffect = false;
		m_fCurrentWhiteoutValue = 0.0f;

		if( m_WhiteoutMaterialEffect != none )
		{
			m_WhiteoutMaterialEffect.bShowInGame = false;
		}
	}
}

function UpdateWhiteoutEffect()
{
	if( m_bUpdateWhiteoutEffect )
	{
		if( m_WhiteoutMaterialInstance != none )
		{
			m_WhiteoutMaterialInstance.GetScalarParameterValue('Whiteout',m_fCurrentWhiteoutValue);
			if( m_fCurrentWhiteoutValue > 0 )
			{
				if( m_WhiteoutMaterialEffect != none )
				{
					m_WhiteoutMaterialEffect.bShowInGame = true;
				}
				m_fCurrentWhiteoutValue = FInterpTo(m_fCurrentWhiteoutValue, 0, RenderDelta, m_WhiteoutFadeOutSpeed);
				m_WhiteoutMaterialInstance.SetScalarParameterValue('Whiteout',m_fCurrentWhiteoutValue);
			}
			else
			{
				// Done fading out. Make sure the material instance is reset.
				m_WhiteoutMaterialInstance.SetScalarParameterValue('Whiteout',0);
				m_bUpdateWhiteoutEffect = false;

				if( m_WhiteoutMaterialEffect != none )
				{
					m_WhiteoutMaterialEffect.bShowInGame = false;
				}
			}
		}
	}
}

//
//	override local message handling - route to scaleform
//
function LocalizedMessage
(
	class<LocalMessage>		InMessageClass,
	PlayerReplicationInfo	RelatedPRI_1,
	PlayerReplicationInfo	RelatedPRI_2,
	string					CriticalString,
	int						Switch,
	float					Position,
	float					LifeTime,
	int						FontSize,
	color					DrawColor,
	optional object			OptionalObject
)
{
	local int WeaponIcon;
    local int FriendlyType;
    local string KillerName;
    local string VictimName;
	local TrPlayerReplicationInfo TrPRI;
	local class<TrDmgType_Base> KillDamageType;

    if ( InMessageClass == None || CriticalString == "" ) return;
	
	WeaponIcon = TRICON_KILLTYPE_FALLING;

    //Use the damage type's kill icon since there aren't always device equivalents
    if (OptionalObject != none)
    {
	    KillDamageType = class<TrDmgType_Base>(OptionalObject);
    }

	if (KillDamageType != none)
	{
        WeaponIcon = KillDamageType.default.m_nKillIconIndex;
	}
    
	if( bMessageBeep && InMessageClass.default.bBeep ) PlayerOwner.PlayBeepSound();

    if (RelatedPRI_1 != none) KillerName = RelatedPRI_1.PlayerName;
    if (RelatedPRI_2 != none) VictimName = RelatedPRI_2.PlayerName;
    
    // Kill Camera Info Box
    if ( class<UTLocalMessage>(InMessageClass) == class'TrDeathMessage')
    {
        if (RelatedPRI_2.Name == PlayerOwner.PlayerReplicationInfo.Name)
        {
            m_GFxHud.CreateKillCamInfo(TrPlayerReplicationInfo(RelatedPRI_1), TrPlayerReplicationInfo(RelatedPRI_2), KillDamageType);
        }
    }
    
	if( class<UTLocalMessage>(InMessageClass) != none )
	{
		switch ( class<UTLocalMessage>(InMessageClass).default.MessageArea )
		{
		case 1:
			if (RelatedPRI_2.GetTeamNum() == PlayerOwner.GetTeamNum()) FriendlyType = 1;

			//AREA 1: THE COMBAT LOG
			if (RelatedPRI_1 == none)
			{
				// If nothing special killed this player, it was a suicide.
				if (KillDamageType == class'TrDmgType_BaseTurret')
				{
					if (FriendlyType > 0) KillerName = "Diamond Sword";
					else KillerName = "Blood Eagle";
				}
				else
				{
					AddUpdateToCombatLog(FriendlyType, "Suicide", TRICON_KILLTYPE_GENERIC, VictimName);
					break;
				}
			}
	        
			AddUpdateToCombatLog(FriendlyType, KillerName, WeaponIcon, VictimName);
			break;

		case 2:
			// AREA 2: THE PROMPT PANEL
			AddToPromptPanel(CriticalString, GC_APT_HIGH);
			break;

		case 3:
			// AREA 3: KILL MESSAGE AREA
			if (Switch == 1)
			{
			    TrPRI=TrPlayerReplicationInfo(RelatedPRI_2);
			    AddUpdateToKillMessage(TrPRI.GetRankIcon(),TrPRI.m_nPlayerIconIndex,TrPRI.PlayerName,CriticalString);
			}
			break;

		case 4:
			// AREA 4: HERO.
			AddToHeroStatus(CriticalString,LifeTime);
			break;
		}
	}
}

function ChatMessageReceived(int Channel, string Sender, string Message)
{
    local array<PlayerReplicationInfo> PRIArray;
	local bool isOnSameTeam, isPublicChat;
	local int ChatColorIdx;
	local PlayerReplicationInfo CurrPRI;
    local LocalPlayer lp;
    local TrGameViewportClient trvpc;
    local color ChatColor;

	// No GRI, so no PRI array either.
	if (WorldInfo.GRI == none)
	{
		return;
	}

    Sender = StripTag(Sender);

	// Loop through all players, determining if they are on the same team.
	PRIArray = WorldInfo.GRI.PRIArray;
	foreach PRIArray(CurrPRI)
	{
		if (StripTag(CurrPRI.PlayerName) ~= Sender)
		{
			isOnSameTeam = CurrPRI.GetTeamNum() == TrPlayerOwner.GetTeamNum();
            Sender = CurrPRI.PlayerName;
			break;
		}
	}

	if( !(Left(Message, 2) ~= "[V") )
	{
		// If not a VGS
		PlayerOwner.ClientPlaySound(SoundCue'Aud_menu.ChatMessage_Sent.A_CUE_UI_ChatMessage_Sent_1');
	}

    if (Channel == GC_CC_PERSONAL)
    {
        return; //TODO: merge the hud & menu variants
    }
    if (Channel == GC_CC_GLOBAL)
    {
        SetTimer(15.0, false, 'HideGlobalAlert');
        m_GFxHud.SetGlobalAlert(Message);
        HasGlobalChatAsAlert = true;
    }
    else
    {
		if (Channel == GC_CC_INSTANCE)
		{
			isPublicChat = true;

			if (isOnSameTeam)
			{
				ChatColorIdx = FriendlyChatColorIdx;
                ChatColor = FriendlyChatColor;
			}
			else
			{
				ChatColorIdx = EnemyChatColorIdx;
                ChatColor = EnemyChatColor;
			}
		}
		else if (Channel == GC_CC_LOCAL_TEAM)
		{
			ChatColorIdx = FriendlyChatColorIdx;
            ChatColor = FriendlyChatColor;
		}
        else 
        {
            ChatColor = WhiteColor;
        }

        if (TrPlayerOwner.m_bShowHUDChat) m_GFxHud.ShowChatLog();
        else m_GFxHud.HideChatLog();

        m_GFxHud.UpdateChatLog(Sender$">"@Message, ChatColorIdx, isPublicChat);

	    if (TrPlayerOwner != none)
	    {
            lp = LocalPlayer(TrPlayerOwner.Player);
            if(lp != none)
            {
                trvpc = TrGameViewportClient(lp.ViewportClient);
                if(trvpc != None)
                {
                    if(trvpc.ViewportConsole != None)
                    {
                        trvpc.ViewportConsole.OutputText(Sender$">"@Message);                    
                    }                    
                    
                    if(Channel == GC_CC_LOCAL_TEAM)
                    {
                        trvpc.ChatConsole.OutputText(Sender$"> [Team]"@Message, ChatColor); //TODO: Localize "Team"
                    }
                    else
                    {
                        trvpc.ChatConsole.OutputText(Sender$">"@Message, ChatColor);
                    }
                }
            }
	    }
    }
}

function string StripTag(string sValue)
{
    local int i;

    if (Left(sValue, 1) == "[")
    {
        for (i = 2; i < Len(sValue); i++)
        {
            if (Mid(sValue, i, 2) == "] ")
            {
                return Mid(sValue, i+2);
            }
        }
    }

    return sValue;
}

function SendLocalMessageToGlobalAlert(string Message)
{
    if(!HasGlobalChatAsAlert)
    {
        SetTimer(3.5, false, 'HideGlobalAlert');
        m_GFxHud.SetGlobalAlert(Message);
    }
}

function SendLocalMessageToChat(string Message)
{
    local LocalPlayer lp;
    local TrGameViewportClient trvpc;

    if (TrPlayerOwner.m_bShowHUDChat) m_GFxHud.ShowChatLog();
    else m_GFxHud.HideChatLog();

    m_GFxHud.UpdateChatLog(Message, SelfChatColorIdx, false);

	if (TrPlayerOwner != none)
	{
		lp = LocalPlayer(TrPlayerOwner.Player);
        if(lp != none)
        {
            trvpc = TrGameViewportClient(lp.ViewportClient);
            if(trvpc != none)
            {
                if(trvpc.ViewportConsole != None)
                {
                    trvpc.ViewportConsole.OutputText(Message);                
                }
                else
                {
                    trvpc.ChatConsole.OutputText(Message);
                }
            }
        }
	}
}

function SetPlayerClassObjects(string ClassName, int PerkIcon1, int PerkIcon2)
{
    m_sLastClassName = ClassName;
    m_nLastPerk1Icon = PerkIcon1;
    m_nLastPerk2Icon = PerkIcon2;

    m_GFxHud.SetPlayerClassObjects(ClassName, PerkIcon1, PerkIcon2);
}

function HideGlobalAlert()
{
    m_GFxHud.HideGlobalAlert();
    HasGlobalChatAsAlert = false;
}

function KickVoteMessage(bool bComplete, string Message)
{
    if (bComplete)
    {
        bVotePending = false;
        SetTimer(5.0, false, 'HideGlobalAlert');
    }
    else
    {
        bVotePending = true;
        PlayerOwner.ClientPlaySound(SoundCue'Aud_menu.Vote_Kick.A_CUE_UI_VoteKick_PopUp');
    }

    m_GFxHud.SetGlobalAlert(Message);
    HasGlobalChatAsAlert = true;
}

function EnableGameTypeHUD()
{
    if (m_GameClass == class'TrGame_TrRabbit')
    {
		if (RabbitLeaderboard != none)
		{
			RabbitLeaderboard.bIsActive = true;
			RabbitLeaderboard.Show();
		}
        if (TeamRabbitStats != none) TeamRabbitStats.Hide();
        if (HUDTeamCTFStats != none) HUDTeamCTFStats.Hide();
		if (ArenaStats != none) ArenaStats.Hide();
		if (DaDStats != none) DaDStats.Hide();
		if (CaHStats != none) CaHStats.Hide();
    }
	else if (m_GameClass == class'TrGame_TrTeamRabbit')
	{
		if (TeamRabbitStats != none)
		{
			TeamRabbitStats.bIsActive = true;
			TeamRabbitStats.Show();
		}
        if (HUDTeamCTFStats != none) HUDTeamCTFStats.Hide();
        if (RabbitLeaderboard != none) RabbitLeaderboard.Hide();
		if (ArenaStats != none) ArenaStats.Hide();
		if (DaDStats != none) DaDStats.Hide();
		if (CaHStats != none) CaHStats.Hide();
	}
	else if (m_GameClass == class'TrGame_TrArena')
	{
		if (ArenaStats != none)
		{
			ArenaStats.bIsActive = true;
			ArenaStats.Show();
		}
        if (TeamRabbitStats != none) TeamRabbitStats.Hide();
        if (HUDTeamCTFStats != none) HUDTeamCTFStats.Hide();
        if (RabbitLeaderboard != none) RabbitLeaderboard.Hide();
		if (DaDStats != none) DaDStats.Hide();
		if (CaHStats != none) CaHStats.Hide();
	}
	else if (m_GameClass == class'TrGame_TrDaD')
	{
		if (DaDStats != none)
		{
			DaDStats.bIsActive = true;
			DaDStats.Show();
		}
        if (TeamRabbitStats != none) TeamRabbitStats.Hide();
        if (HUDTeamCTFStats != none) HUDTeamCTFStats.Hide();
        if (RabbitLeaderboard != none) RabbitLeaderboard.Hide();
		if (ArenaStats != none) ArenaStats.Hide();
		if (CaHStats != none) CaHStats.Hide();
	}
	else if (m_GameClass == class'TrGame_TrCaH')
	{
		if (CaHStats != none)
		{
			CaHStats.bIsActive = true;
			CaHStats.Show();
		}
        if (TeamRabbitStats != none) TeamRabbitStats.Hide();
        if (HUDTeamCTFStats != none) HUDTeamCTFStats.Hide();
        if (RabbitLeaderboard != none) RabbitLeaderboard.Hide();
		if (ArenaStats != none) ArenaStats.Hide();
		if (DaDStats != none) DaDStats.Hide();
	}
    else
    {
		if (HUDTeamCTFStats != none)
		{
			HUDTeamCTFStats.bIsActive = true;
			HUDTeamCTFStats.Show();
		}
        if (TeamRabbitStats != none) TeamRabbitStats.Hide();
        if (RabbitLeaderboard != none) RabbitLeaderboard.Hide();
		if (ArenaStats != none) ArenaStats.Hide();
		if (DaDStats != none) DaDStats.Hide();
		if (CaHStats != none) CaHStats.Hide();
	}
}

exec function ShowSpectatorPlayer()
{
	if( !m_bIsSpectatorPlayerPanelVisible )
	{
		m_GFxHud.ShowSpectatorPlayer();
		m_bIsSpectatorPlayerPanelVisible = true;
	}
}

exec function HideSpectatorPlayer()
{
	if( m_bIsSpectatorPlayerPanelVisible )
	{
		m_GFxHud.HideSpectatorPlayer();
		m_bIsSpectatorPlayerPanelVisible = false;
	}
}

function UpdateSpectatorPlayerPanel(TrPawn ViewTargetTrPawn)
{
    local string perk1Name;
    local string perk2Name;
    local class<TrDevice> perkAClass;
    local class<TrDevice> perkBClass;
    local class<TrFamilyInfo> FamilyInfo;
	local TrPlayerReplicationInfo ViewTargetPRI;

	if( ViewTargetTrPawn != none )
	{
		ViewTargetPRI = ViewTargetTrPawn.GetTribesReplicationInfo();

		if( ViewTargetPRI != none && ViewTargetPRI.GetCurrentClass() != none )
		{
			// Update the panel.
			m_GFxHud.SetSpectatorPlayerPanel_FlagCarried(ViewTargetPRI.bHasFlag);
			m_GFxHud.SetSpectatorPlayerPanel_PlayerName(ViewTargetPRI.PlayerName);
			m_GFxHud.SetSpectatorPlayerPanel_ClassName(Caps(ViewTargetPRI.GetCurrentClass().default.FriendlyName));
			m_GFxHud.SetSpectatorPlayerPanel_NextRegen(""); //TODO:
			if( float(ViewTargetTrPawn.HealthMax) != 0.0 )
			{
				m_GFxHud.SetSpectatorPlayerPanel_HealthFillBar(11.0 - 10.0 * float(ViewTargetTrPawn.Health)/float(ViewTargetTrPawn.HealthMax));
			}
			m_GFxHud.SetSpectatorPlayerPanel_Health(string(ViewTargetTrPawn.Health));
			if( TrPlayerOwner.r_fViewTargetMaxPowerPool != 0.0 )
			{
				m_GFxHud.SetSpectatorPlayerPanel_EnergyFillBar(11.0 - 10.0 * (TrPlayerOwner.r_fViewTargetCurrentPowerpool/TrPlayerOwner.r_fViewTargetMaxPowerPool));
			}
			m_GFxHud.SetSpectatorPlayerPanel_Energy(string(FCeil(TrPlayerOwner.r_fViewTargetCurrentPowerpool)));
			m_GFxHud.SetSpectatorPlayerPanel_PrimaryAmmoCount(string(TrPlayerOwner.r_nViewTargetPrimaryAmmoCount)$"/"$string(TrPlayerOwner.r_nViewTargetPrimaryMaxAmmoCount));
			m_GFxHud.SetSpectatorPlayerPanel_PrimaryWeaponName(Caps(ViewTargetPRI.GetCurrentClass().static.GetDeviceClassByEquipPoint(EQP_Primary).default.ItemName));
			m_GFxHud.SetSpectatorPlayerPanel_SecondaryAmmoCount(string(TrPlayerOwner.r_nViewTargetSecondaryAmmoCount)$"/"$string(TrPlayerOwner.r_nViewTargetSecondaryMaxAmmoCount));
			m_GFxHud.SetSpectatorPlayerPanel_SecondaryWeaponName(Caps(ViewTargetPRI.GetCurrentClass().static.GetDeviceClassByEquipPoint(EQP_Secondary).default.ItemName));
			m_GFxHud.SetSpectatorPlayerPanel_OffhandIcon(ViewTargetPRI.GetCurrentClass().static.GetDeviceClassByEquipPoint(EQP_Belt).default.m_nIconIndex);
			m_GFxHud.SetSpectatorPlayerPanel_OffhandAmmo(string(TrPlayerOwner.r_nViewTargetOffhandAmmoCount));
			m_GFxHud.SetSpectatorPlayerPanel_OffhandName(Caps(ViewTargetPRI.GetCurrentClass().static.GetDeviceClassByEquipPoint(EQP_Belt).default.ItemName));
			m_GFxHud.SetSpectatorPlayerPanel_PackIcon(ViewTargetPRI.GetCurrentClass().static.GetDeviceClassByEquipPoint(EQP_Pack).default.m_nIconIndex);
			m_GFxHud.SetSpectatorPlayerPanel_PackAmmo(TrPlayerOwner.r_nViewTargetPackAmmoCount == -1 ? "" : string(TrPlayerOwner.r_nViewTargetPackAmmoCount));
			m_GFxHud.SetSpectatorPlayerPanel_PackName(Caps(ViewTargetPRI.GetCurrentClass().static.GetDeviceClassByEquipPoint(EQP_Pack).default.ItemName));
			
            FamilyInfo = ViewTargetPRI.GetCurrentClass();
            perkAClass = ViewTargetPRI.GetEquipDevice(FamilyInfo, EQP_PerkA);
            perkBClass = ViewTargetPRI.GetEquipDevice(FamilyInfo, EQP_PerkB);

            if (perkAClass == none) perk1Name = "PERK 1";
            else perk1Name = perkAClass.default.ItemName;

            if (perkBClass == none) perk2Name = "PERK 2";
            else perk2Name = perkBClass.default.ItemName;		
			
			
			//if( ViewTargetPRI.r_ActivePerksAndSkills.Perk1Class != none )
			//{
				m_GFxHud.SetSpectatorPlayerPanel_Perk1Icon(0);
				m_GFxHud.SetSpectatorPlayerPanel_Perk1Name(Caps(perk1Name));
			//}
			//if( ViewTargetPRI.r_ActivePerksAndSkills.Perk2Class != none )
			//{
				m_GFxHud.SetSpectatorPlayerPanel_Perk2Icon(0);
				m_GFxHud.SetSpectatorPlayerPanel_Perk2Name(Caps(perk2Name));
			//}
			m_GFxHud.SetSpectatorPlayerPanel_SkiIndicatorFillBar(m_GFxHud.GetSkiSpeedStep(VSize(ViewTargetTrPawn.Velocity)));
			m_GFxHud.SetSpectatorPlayerPanel_SkiIndicatorSpeed(string(ViewTargetTrPawn.CalculatePawnSpeed()));
			m_GFxHud.SetSpectatorPlayerPanel_Selected(2);
		}
	}
}

exec function ShowSpectatorVehicle()
{
	if( !m_bIsSpectatorVehiclePanelVisible )
	{
		m_GFxHud.ShowSpectatorVehicle();
		m_bIsSpectatorVehiclePanelVisible = true;
	}
}

exec function HideSpectatorVehicle()
{
	if( m_bIsSpectatorVehiclePanelVisible )
	{
		m_GFxHud.HideSpectatorVehicle();
		m_bIsSpectatorVehiclePanelVisible = false;
	}
}

function UpdateSpectatorVehiclePanel(TrVehicle ViewTargetVehicle)
{
	local PlayerReplicationInfo DriverPRI;
	local PlayerReplicationInfo PassengerPRI;

	if( ViewTargetVehicle != none )
	{
		DriverPRI = TrPlayerOwner.r_ViewTargetVehicleDriverPRI;
		PassengerPRI = TrPlayerOwner.r_ViewTargetVehiclePassengerPRI;

		m_GFxHud.SetSpectatorVehiclePanel_FlagCarried(false);
		m_GFxHud.SetSpectatorVehiclePanel_VehicleName(ViewTargetVehicle.m_sName);
		m_GFxHud.SetSpectatorVehiclePanel_DriverName(DriverPRI != none ? DriverPRI.PlayerName : "");
		m_GFxHud.SetSpectatorVehiclePanel_PassengerName(PassengerPRI != none ? PassengerPRI.PlayerName : "");
		if( float(ViewTargetVehicle.HealthMax) != 0.0 )
		{
			m_GFxHud.SetSpectatorVehiclePanel_HealthFillBar(11.0 - 10.0 * float(ViewTargetVehicle.Health)/float(ViewTargetVehicle.HealthMax));
		}
		m_GFxHud.SetSpectatorVehiclePanel_Health(string(ViewTargetVehicle.Health));
		if( TrPlayerOwner.r_fViewTargetVehicleMaxPowerPool == 0.0 )
		{
			m_GFxHud.SetSpectatorVehiclePanel_EnergyFillBar(0);
			m_GFxHud.SetSpectatorVehiclePanel_Energy("");
		}
		else
		{
			m_GFxHud.SetSpectatorVehiclePanel_EnergyFillBar(11.0 - 10.0 * (TrPlayerOwner.r_fViewTargetVehicleCurrentPowerPool/TrPlayerOwner.r_fViewTargetVehicleMaxPowerPool));
			m_GFxHud.SetSpectatorVehiclePanel_Energy(string(FCeil(100.0 * TrPlayerOwner.r_fViewTargetVehicleCurrentPowerPool / TrPlayerOwner.r_fViewTargetVehicleMaxPowerPool)));
		}
		m_GFxHud.SetSpectatorVehiclePanel_PrimaryWeaponName(ViewTargetVehicle.m_sWeapon1Name);
		m_GFxHud.SetSpectatorVehiclePanel_PrimaryWeaponReady(TrPlayerOwner.r_bViewTargetVehiclePrimaryWeaponReady ? 1 : 2);
		m_GFxHud.SetSpectatorVehiclePanel_PrimaryWeaponVisible(ViewTargetVehicle.m_sWeapon1Name != "");
		m_GFxHud.SetSpectatorVehiclePanel_SecondaryWeaponName(ViewTargetVehicle.m_sWeapon2Name);
		m_GFxHud.SetSpectatorVehiclePanel_SecondaryWeaponReady(TrPlayerOwner.r_bViewTargetVehicleSecondaryWeaponReady ? 1 : 2);
		m_GFxHud.SetSpectatorVehiclePanel_SecondaryWeaponVisible(ViewTargetVehicle.m_sWeapon2Name != "");
		m_GFxHud.SetSpectatorVehiclePanel_SkiIndicatorFillBar(m_GFxHud.GetSkiSpeedStep(VSize(ViewTargetVehicle.Velocity)));
		m_GFxHud.SetSpectatorVehiclePanel_SkiIndicatorSpeed(string(FCeil(VSize(ViewTargetVehicle.Velocity) * 0.072)));
	}
}

exec function ShowSpectatorBookmark()
{
	if( !m_bIsSpectatorBookmarkPanelVisible )
	{
		m_GFxHud.ShowSpectatorBookmark();
		m_bIsSpectatorBookmarkPanelVisible = true;
	}
}

exec function HideSpectatorBookmark()
{
	if( m_bIsSpectatorBookmarkPanelVisible )
	{
		m_GFxHud.HideSpectatorBookmark();
		m_bIsSpectatorBookmarkPanelVisible = false;
	}
}

function UpdateSpectatorBookmarkPanel(TrCamera_SpectatorBookmark Bookmark)
{
	if( Bookmark != none )
	{
		m_GFxHud.SetSpectatorBookmarkPanel_BookmarkName(Bookmark.GetSpectatorName());
	}
}

exec function ShowSpectatorObjectivePanel()
{
	if( !m_bIsSpectatorObjectivePanelVisible )
	{
		m_GFxHud.ShowSpectatorObjectivePanel();
		m_bIsSpectatorObjectivePanelVisible = true;
	}
}

exec function HideSpectatorObjectivePanel()
{
	if( m_bIsSpectatorObjectivePanelVisible )
	{
		m_GFxHud.HideSpectatorObjectivePanel();
		m_bIsSpectatorObjectivePanelVisible = false;
	}
}

function UpdateSpectatorObjectivePanel(Actor ObjectiveActor)
{
	local int ObjectiveHealth;
	local int ObjectiveHealthMax;

	if( ObjectiveActor != none )
	{
		m_GFxHud.SetSpectatorObjectivePanel_ObjectiveName(ObjectiveActor.GetSpectatorName());
		m_GFxHud.SetSpectatorObjectivePanel_ObjectiveDescription(ObjectiveActor.GetSpectatorDescription());
		ObjectiveActor.GetSpectatorHealthInfo(ObjectiveHealth, ObjectiveHealthMax);
		if( float(ObjectiveHealthMax) != 0.0 )
		{
			m_GFxHud.SetSpectatorObjectivePanel_HealthFillBar((11.0 - 10.0 * float(ObjectiveHealth)/float(ObjectiveHealthMax)), ObjectiveHealth);
		}
	}
}

exec function ShowSpectatorFloatCameraPanel()
{
	if( !m_bIsSpectatorFloatCameraPanelVisible )
	{
		m_GFxHud.ShowSpectatorFloatCameraPanel();
		m_bIsSpectatorFloatCameraPanelVisible = true;
	}
}

exec function HideSpectatorFloatCameraPanel()
{
	if( m_bIsSpectatorFloatCameraPanelVisible )
	{
		m_GFxHud.HideSpectatorFloatCameraPanel();
		m_bIsSpectatorFloatCameraPanelVisible = false;
	}
}

function UpdateSpectatorFloatCameraPanel()
{
	m_GFxHud.SetSpectatorFloatCameraPanel_Name("Floating Camera");

	if( PlayerOwner != none )
	{
		m_GFxHud.SetSpectatorFloatCameraPanel_Description("Movement Speed:"@FCeil(PlayerOwner.SpectatorCameraSpeed));
	}
}

function HideAllSpectatorPanels()
{
	HideSpectatorPlayer();
	HideSpectatorVehicle();
	HideSpectatorBookmark();
	HideSpectatorObjectivePanel();
	HideSpectatorFloatCameraPanel();
	
	// Controls screen.
	m_GFxHud.ShowSpectatorControls(false);
	if( TrPlayerOwner != none )
	{
		TrPlayerOwner.m_bShowSpectatorControls = false;
	}
}

function OnViewTargetChange(actor NewViewTarget)
{
	if( m_GFxHud.ShouldShowSpectatorReticule() )
	{
		// Viewing nothing
		if( m_GFxHud.Reticules != none )
		{
			m_GFxHud.Reticules.ChangeReticule(THR_FREE_SPECTATOR);
			m_GFxHud.Reticules.SetVisible(true);
		}
	}
	else
	{
		if( m_GFxHud.Reticules != none )
		{
			m_GFxHud.Reticules.SetVisible(false);
		}
	}
}

exec function TestNumber(int Value)
{
	//AddOverheadNumber(Value, vect4(0,0,0,0));
}

function AddOverheadNumber(int Value, vector4 WorldLocation)
{
	local OverheadNumber NewOverheadNumber;

	NewOverheadNumber.NumberValue = Value;
	NewOverheadNumber.WorldSpaceLocation = WorldLocation;
	NewOverheadNumber.CurrentColor = m_OverheadNumberColorMin;
	NewOverheadNumber.RemainingTime = m_fOverheadNumberTotalTime;
	m_OverheadNumbers.AddItem(NewOverheadNumber);
}

function UpdateOverheadNumbers(float DeltaTime)
{
	local int i;
	local float AccumulatedTime, ScalingPeakTime, Alpha;
	local vector ViewLocation, OverheadNumberLocation;
	local rotator ViewRotation;

	for( i = 0; i < m_OverheadNumbers.Length; i++ )
	{
		m_OverheadNumbers[i].RemainingTime -= DeltaTime;

		if( m_OverheadNumbers[i].RemainingTime <= 0.0 )
		{
			// Number has expired.
			m_OverheadNumbers.Remove(i,1);
			i--;
		}
		else
		{
			AccumulatedTime = m_fOverheadNumberTotalTime - m_OverheadNumbers[i].RemainingTime;

			// Position the number.
			m_OverheadNumbers[i].WorldSpaceLocation.Z += DeltaTime * m_fOverheadNumberZSpeed;

			// Color the number.
			if( AccumulatedTime > m_fOverheadNumberColorizeTimeMax )
			{
				// Use the 'max' color since we have expired the color transition. Don't take alpha since
				// the fade portion controls this.
				m_OverheadNumbers[i].CurrentColor.R = m_OverheadNumberColorMax.R;
				m_OverheadNumbers[i].CurrentColor.G = m_OverheadNumberColorMax.G;
				m_OverheadNumbers[i].CurrentColor.B = m_OverheadNumberColorMax.B;

			}
			else if( AccumulatedTime > m_fOverheadNumberColorizeTimeMin && m_fOverheadNumberColorizeTimeMin < m_fOverheadNumberColorizeTimeMax )
			{
				Alpha = (m_fOverheadNumberColorizeTimeMin - (m_fOverheadNumberColorizeTimeMax - AccumulatedTime)) / (m_fOverheadNumberColorizeTimeMax - m_fOverheadNumberColorizeTimeMin);
				m_OverheadNumbers[i].CurrentColor.R = Lerp(m_OverheadNumberColorMin.R, m_OverheadNumberColorMax.R, Alpha);
				m_OverheadNumbers[i].CurrentColor.G = Lerp(m_OverheadNumberColorMin.G, m_OverheadNumberColorMax.G, Alpha);
				m_OverheadNumbers[i].CurrentColor.B = Lerp(m_OverheadNumberColorMin.B, m_OverheadNumberColorMax.B, Alpha);
			}

			// Fade the number.
			if( m_OverheadNumbers[i].RemainingTime < m_fOverheadNumberFadeTime && m_fOverheadNumberFadeTime > 0.0 )
			{
				m_OverheadNumbers[i].CurrentColor.A = int( (m_OverheadNumbers[i].RemainingTime / m_fOverheadNumberFadeTime) * 255);
			}

			// 'Plump' the number.
			if( AccumulatedTime < m_fOverheadNumberScaleTime )
			{
				// We are within range for scaling the number.
				ScalingPeakTime = m_fOverheadNumberScaleTime / 2.0;
				if( AccumulatedTime < ScalingPeakTime )
				{
					// Grow the  number to m_fOverheadNumberMaxScaleAmount.
					m_OverheadNumbers[i].CurrentScale = 1.0 + ((AccumulatedTime / ScalingPeakTime) * m_fOverheadNumberMaxScaleAmount);
				}
				else
				{
					// Shrink the number back to 1.0.
					m_OverheadNumbers[i].CurrentScale = 1.0 + ((1.0 - ((AccumulatedTime - (m_fOverheadNumberScaleTime - ScalingPeakTime)) / (m_fOverheadNumberScaleTime - ScalingPeakTime))) * m_fOverheadNumberMaxScaleAmount);
				}
			}
			else if( m_OverheadNumbers[i].CurrentScale != 1.0 )
			{
				m_OverheadNumbers[i].CurrentScale = 1.0;
			}

			if( TrPlayerOwner != none )
			{
				OverheadNumberLocation.X = m_OverheadNumbers[i].WorldSpaceLocation.X;
				OverheadNumberLocation.Y = m_OverheadNumbers[i].WorldSpaceLocation.Y;
				OverheadNumberLocation.Z = m_OverheadNumbers[i].WorldSpaceLocation.Z;

				// Only attempt to show this number if we are looking in its direction.
				TrPlayerOwner.GetPlayerViewPoint( ViewLocation, ViewRotation );
				if( Vector(ViewRotation) dot Normal(OverheadNumberLocation - ViewLocation) >= 0 )
				{
					OverheadNumberLocation = Canvas.Project(OverheadNumberLocation);
					OverheadNumberLocation.Z = m_OverheadNumbers[i].WorldSpaceLocation.W;
					DrawColoredMarkerText(string(m_OverheadNumbers[i].NumberValue), m_OverheadNumbers[i].CurrentColor, OverheadNumberLocation, Canvas, m_OverheadNumbers[i].CurrentScale, m_OverheadNumbers[i].CurrentScale);
				}
			}
		}
	}
}

simulated event Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    
    if (bPlayAward)
    {
        AwardTimelineLoc += DeltaTime;

        if (AwardTimelineLoc <= 0)
        {
            bPlayAward = false;
        }
    }
}


simulated event PostRenderFor(PlayerController PC, Canvas DrawCanvas, vector CameraPosition, vector CameraDir)
{
    super.PostRenderFor(PC, DrawCanvas, CameraPosition, CameraDir);

    if (bPlayAward)
    {
        PlayAward(DrawCanvas);
    }
}

function PlayAward(Canvas DrawCanvas)
{
    local float progress;
    local float timelinePercent;
    local float scale;
    local float scaledSize;
    local float scaledHeight;

    scale = 1;
    timelinePercent = (AwardTimelineLoc/AwardTimelineLength * 100);

    if (timelinePercent < 0 || timelinePercent > 100) return;
        
	if (timelinePercent < 10)
    {
        progress = timelinePercent/10;
        scale += (AwardFadeInScale * (1 - (progress)));
        AwardMIC.SetScalarParameterValue('Opacity', progress);
        AwardMIC.SetScalarParameterValue('FadeInEffect', 1);
    }
    else
    {
        if (timelinePercent < 35)
        {
            progress = timelinePercent/35;
            AwardMIC.SetScalarParameterValue('FadeInEffect', 1 - progress);
        }

        if (timelinePercent > 80)
        {
            progress = (timelinePercent-80)/20;
            AwardMIC.SetScalarParameterValue('Opacity', 1 - progress);
        }
    }

    scaledSize = AwardBaseSize * scale;
    scaledHeight = AwardBaseHeight - scaledSize;

	DrawCanvas.SetPos((1024-scaledSize)/2, scaledHeight);
	DrawCanvas.DrawMaterialTile(AwardMIC, scaledSize, scaledSize, 0.0, 0.0, 1.0, 1.0);
}

function QueueAccolade(int Icon, string Title, string Subtitle, optional bool bIsBadge = false)
{
    local QueuedAccolade accolade;

    if (bAccoladePlaying)
    {
        accolade.Icon = Icon;
        accolade.bIsBadge = bIsBadge;
        accolade.Title = Title;
        accolade.Subtitle = Subtitle;
        QueuedAccolades.AddItem(accolade);
    }
    else
    {
        AddFlyingIcon(Icon, Caps(Title), Caps(Subtitle), bIsBadge ? 1 : 0);
	    RunQueuedAccoladesTimer(bIsBadge);
    }
}

function CheckQueuedAccolades()
{
    if (QueuedAccolades.Length > 0)
    {
        AddFlyingIcon(QueuedAccolades[0].Icon, Caps(QueuedAccolades[0].Title), Caps(QueuedAccolades[0].Subtitle), QueuedAccolades[0].bIsBadge ? 1 : 0);
        RunQueuedAccoladesTimer(QueuedAccolades[0].bIsBadge);
        QueuedAccolades.Remove(0, 1);
    }
    else
    {
        ClearQueuedAccoladesTimer();
    }
}

function RunQueuedAccoladesTimer(bool bIsBadge)
{
    local float waitTime;

    if (bIsBadge) waitTime = 5.0f;
    else waitTime = 2.3f;

    bAccoladePlaying = true;
    SetTimer(waitTime,false,'CheckQueuedAccolades');
}

function ClearQueuedAccoladesTimer()
{
    bAccoladePlaying = false;
    ClearTimer('CheckQueuedAccolades');
}

function DeployableReplicated(TrDeployable NewDep)
{
	if (NewDep == none)
	{
		return;
	}

	// We own this deployable, add it to our owned list.
	if (PlayerOwner != none && PlayerOwner.PlayerReplicationInfo == NewDep.r_OwnerPRI && m_OwnedDeployables.Find(NewDep) == INDEX_NONE)
	{
		m_OwnedDeployables.AddItem(NewDep);
	}
}

function MineReplicated(TrProj_Mine NewMine)
{
	if (NewMine == none)
	{
		return;
	}

	// We own this deployable, add it to our owned list.
	if (PlayerOwner != none && PlayerOwner.PlayerReplicationInfo == NewMine.r_OwnerPRI && m_OwnedMines.Find(NewMine) == INDEX_NONE)
	{
		m_OwnedMines.AddItem(NewMine);
	}
}

function UpdateOwnedItems()
{
	local bool bUpdate;
	local int i, drawnItems;

	drawnItems = 0;

	if (!PlayerOwner.IsDead())
	{
		// Delete old deployables.
		for (i = 0; i < m_OwnedDeployables.Length; i++)
		{
		    if (m_OwnedDeployables[i] == none || !m_OwnedDeployables[i].IsAliveAndWell())
		    {
			    bUpdate = true;
			    m_OwnedDeployables.Remove(i--, 1);
		    }
		}

	    // Delete old mines.
	    for (i = 0; i < m_OwnedMines.Length; i++)
	    {
		    if (m_OwnedMines[i] == none || !m_OwnedMines[i].IsAliveAndWell())
		    {
			    bUpdate = true;
			    m_OwnedMines.Remove(i--, 1);
		    }
	    }

	    // Render active deployables.
		if (bUpdate || m_LastDeployableCount != m_OwnedDeployables.Length)
		{
			bUpdate = true;

			for (i = 0; i < m_OwnedDeployables.Length; i++)
			{
				if (drawnItems < 6)
				{
					m_GFxHud.UpdateOwnedItem(drawnItems++, true, m_OwnedDeployables[i].m_nIconStackId);
				}
			}
		}

        drawnItems = m_OwnedDeployables.Length;

		// Render active mines.
		if (bUpdate || m_LastMineCount != m_OwnedMines.Length)
		{
			bUpdate = true;

			for (i = 0; i < m_OwnedMines.Length; i++)
			{
				if (drawnItems < 6)
				{
					m_GFxHud.UpdateOwnedItem(drawnItems++, true, m_OwnedMines[i].m_nIconStackId);
				}
			}
		}
	}

    if (bUpdate)
    {
        m_LastDeployableCount = m_OwnedDeployables.Length;
        m_LastMineCount = m_OwnedMines.Length;

	    // Hide empty slots.
	    for (i = drawnItems; i < 6; i++)
	    {
		    m_GFxHud.UpdateOwnedItem(i, false);
	    }
    }
}

defaultproperties
{
   TeamPlayerInfoMaxDist=20000.000000
   ObjectiveInfoMaxDist=20000.000000
   ColorFriend=(B=255,G=186,R=119,A=255)
   ColorEnemy=(B=83,G=83,R=248,A=255)
   LaserTargetTracePossible=(B=0,G=255,R=0,A=255)
   LaserTargetTraceImprobable=(B=0,G=0,R=255,A=255)
   InfoChatColorIdx=3
   FriendlyChatColorIdx=1
   SelfChatColorIdx=1
   WhisperChatColorIdx=3
   FriendlyChatColor=(B=212,G=208,R=158,A=255)
   EnemyChatColor=(B=111,G=111,R=255,A=255)
   TeamChatColor=(B=218,G=254,R=199,A=255)
   WhisperChatColor=(B=101,G=165,R=207,A=255)
   m_MusicManagerClass=Class'TribesGame.TrMusicManager'
   m_fSkiEffectMaxIntensity=40.000000
   m_fSkiEffectMinIntensity=16.000000
   m_fSkiEffectFadeInTime=0.250000
   m_fSkiEffectFadeOutTime=0.120000
   m_fSkiEffectStrobeTime=1.200000
   m_InvulnerableFadeOutSpeed=3.000000
   m_ShieldFadeOutSpeed=3.000000
   m_ShieldHitFadeInSpeed=8.000000
   m_ShieldHitFadeOutSpeed=2.000000
   m_JammerPackFadeOutSpeed=3.000000
   m_VignetteValueMultiplier=4.500000
   AwardBaseSize=100.000000
   AwardBaseHeight=150.000000
   AwardTimelineLength=2.500000
   AwardFadeInScale=5.500000
   m_nPotentialSeekingTargetHUDRotationRate=20000
   m_fPotentialSeekingTargetHUDZoomTime=0.200000
   m_fPotentialSeekingTargetHUDZoomEnd=0.200000
   m_fPotentialSeekingTargetHUDZoomOpacityEnd=1.000000
   m_fSeekingTargetHUDZoomTime=0.300000
   m_fSeekingTargetHUDZoomStart=1.250000
   m_fSeekingTargetHUDZoomEnd=0.200000
   m_fSeekingTargetHUDZoomOpacityEnd=1.000000
   m_fInitialSeekingTargetYaw=16384.000000
   m_fHealthBarPlacementY=10.000000
   m_fHealthBarWidth=50.000000
   m_fHealthBarHeight=10.000000
   m_fNamePlacementY=-20.000000
   m_fCaratPlacementY=-21.000000
   m_fVehicleNamePlacementY=-30.000000
   m_fMineNamePlacementY=-35.000000
   m_fMineDeployerNamePlacementY=-52.000000
   m_nNameFontRenderInfo=(bClipText=True,bEnableShadow=True,GlowInfo=(bEnableGlow=True,GlowColor=(R=0.000000,G=0.000000,B=0.000000,A=1.000000),GlowOuterRadius=(X=0.420000,Y=0.540000),GlowInnerRadius=(X=0.200000,Y=0.500000)))
   m_fOverheadNumberZSpeed=170.000000
   m_OverheadNumberColorMin=(B=255,G=255,R=255,A=255)
   m_OverheadNumberColorMax=(B=83,G=83,R=248,A=255)
   m_fOverheadNumberTotalTime=1.700000
   m_fOverheadNumberFadeTime=1.300000
   m_fOverheadNumberScaleTime=0.450000
   m_fOverheadNumberMaxScaleAmount=0.650000
   m_fOverheadNumberColorizeTimeMin=0.250000
   m_fOverheadNumberColorizeTimeMax=0.500000
   m_fMarker2DDistance=0.250000
   MinimapHUDClass=Class'TribesGame.GfxTrHud'
   bPostRenderIfNotVisible=True
   Name="Default__TrHUD"
   ObjectArchetype=UTGFxHudWrapper'UTGame.Default__UTGFxHudWrapper'
}
