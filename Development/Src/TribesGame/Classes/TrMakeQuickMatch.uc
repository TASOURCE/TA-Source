class TrMakeQuickMatch extends Object;





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
const ITEM_VOICE_T2BDERM03                              = 8726;#linenumber 4

var transient byte                          ControllerId;       // Controller that is in charge.
var transient float                         SearchStarted;      // appSeconds() of when the current search was started. 0 = not searching.

// Cached online subsystem pointers
var transient OnlineSubsystem				OnlineSub;
var transient OnlineGameInterface			GameInterface;

// Search or create a game settings
var TrGameSearchCommon                      SearchSettings;
var TrGamesettingsCommon                    GameSettings;

var private transient bool                  bIssuedInitialQuery;    // A search for query has been posted.
var private transient bool                  bProcessingJoin;        // Indicates that we're currently processing a join request

////////////////////////////////////////////////////////
function bool Init(byte ControllerIndex, int GameMode)
{
	OnlineSub = class'GameEngine'.static.GetOnlineSubsystem();

	if (OnlineSub == none)
	{
        return (false);
	}

	// Grab the game interface to verify the subsystem supports it
	GameInterface = OnlineSub.GameInterface;

	if (GameInterface == none)
	{
        return (false);
	}

    ControllerId = ControllerIndex;

    switch (GameMode)
    {
    case CONTEXT_GAME_MODE_TRCTF:
    case CONTEXT_GAME_MODE_TRTDM:
    case CONTEXT_GAME_MODE_TRRABBIT:
    case CONTEXT_GAME_MODE_TRSIEGE:
    case CONTEXT_GAME_MODE_TRSTORM:
    case CONTEXT_GAME_MODE_TRTEAMRABBIT:
	case CONTEXT_GAME_MODE_TRDEFENDANDDESTROY:
	}

    return (true);
}

function Launch()
{
    SubmitGameSearch();
}

function Cleanup()
{
	if (bIssuedInitialQuery)
	{	
		GameInterface.ClearFindOnlineGamesCompleteDelegate(OnSearchComplete);
        bIssuedInitialQuery = false;
	}

    if (bProcessingJoin)
    {
		GameInterface.ClearJoinOnlineGameCompleteDelegate(OnJoinGameComplete);
        bProcessingJoin = false;
    }
}

function bool SubmitGameSearch()
{
    if (SearchStarted > 0)
    {
        // Search in progress.
        return (false);
    }

    bIssuedInitialQuery = true;
    SearchSettings = new class'TrGameSearchTrCTF';
    SearchSettings.MaxSearchResults = 20;
    SearchSettings.bIsLanQuery      = FALSE;
	SearchSettings.bUsesArbitration = TRUE;

	//	SearchSettings.NumPrivateConnections    = 0;

//    Query = TR_QUERY_CTF;
//    SearchSettings.SetStringSettingValue(CONTEXT_GAME_MODE, CONTEXT_GAME_MODE_TRCTF);

	// Set the function to call when the search is done
	GameInterface.AddFindOnlineGamesCompleteDelegate(OnSearchComplete);


    return GameInterface.FindOnlineGames(ControllerId, SearchSettings);
}


function LocalPlayer GetLP()
{
    local int i;
	local Engine Eng;

	Eng = class'Engine'.static.GetEngine();

    for (i = 0; i < Eng.GamePlayers.Length; i++)
    {
        if (Eng.GamePlayers[i].ControllerId == ControllerId)
        {
            return (Eng.GamePlayers[i]);
        }
    }

	return (none);
}

function PlayerController GetPC()
{
	local LocalPlayer LocalPlayerOwner;
	
	LocalPlayerOwner = GetLP();

	if (LocalPlayerOwner == none)
	{
		return none;
	}

	return LocalPlayerOwner.Actor;
}

final function ConsoleCommand(string Cmd, optional bool bWriteToLog)
{
    local PlayerController PC;

    PC = GetPC();
    
    if (PC != none)
    {
        PC.ConsoleCommand(Cmd);
    }

    return;
}

function string BuildJoinURL(string ResolvedConnectionURL)
{
	local string ConnectURL;

	ConnectURL = "open " $ ResolvedConnectionURL;
    ConnectURL $= "?name=Player";

	return ConnectURL;
}

function bool RequestJoin(OnlineGameSearchResult GameToJoin)
{
    if (bProcessingJoin)
    {
        return (false);
    }

	bProcessingJoin = true;

	// Set the delegate for notification
	GameInterface.AddJoinOnlineGameCompleteDelegate(OnJoinGameComplete);

	if (!GameInterface.JoinOnlineGame(ControllerId, GAME_SESSION_NAME, GameToJoin))
	{
		bProcessingJoin = false;
        return (false);
	}

    return (true);
}

/**
 * Called by the online subsystem when the game search has completed
 *
 * @param bWasSuccessful true if the async action completed without error, false if there was an error
 */
function OnSearchComplete(bool bWasSuccessful)
{
    local int i;

	if (!bWasSuccessful)
	{
		;
        return;
	}

    if (SearchSettings == none)
    {
		;
        return;
    }

    ;

	for (i = 0; i < SearchSettings.Results.Length; i++)
	{
//        SearchSettings.Results[i];

        RequestJoin(SearchSettings.Results[i]);
        break;
	}

    return;
}

function OnJoinGameComplete(name SessionName, bool bSuccessful)
{
	local string URL;	

	;

    Cleanup();

	// Figure out if we have an online subsystem registered
	if (bSuccessful)
	{
		// Get the platform specific information
		if (GameInterface.GetResolvedConnectString(GAME_SESSION_NAME,URL))
		{				
			// Call the game specific function to appending/changing the URL
			URL = BuildJoinURL(URL);				

			;                                

			// Get the resolved URL and build the part to start it
            ConsoleCommand(URL);                
		}
	}
	else
	{
		GameInterface.DestroyOnlineGame(GAME_SESSION_NAME);
	}

    return;
}


//////////////#############################
//#########################################
//#########################################
//#########################################
//#########################################

defaultproperties
{
   Name="Default__TrMakeQuickMatch"
   ObjectArchetype=Object'Core.Default__Object'
}
