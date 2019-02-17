/**
 * 
 */
class TrPlayerController extends UTPlayerController
	config(Game)
    native;





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
const ITEM_VOICE_T2BDERM03                              = 8726;#linenumber 8







var actor                   m_aHoverActor;
var float                   m_fLastWeaponSwitchTimestamp;   // Timestamp for the last weaponswitch (to prevent scrolling fast through the weapons).

var() editoronly bool       m_bEditorMode;

/** Jetpack */
var float                   m_fRemainingInitiatingJettingTime;  // Amount of time remaining on an initial jet burst.
var transient bool          m_bPressingJetpackButton;           // Is user pressing the jetpack button? When out of powerpool and not jetting, we still need to know if user is pressing jetpack.            
var bool                    m_bPressingJetpack;                 // Are we pressing jetpack? This exists on server and client and is necessary for savedmoves.
var bool                    m_bJumpJet;
var bool                    m_bBlink;

/** Kickback */
var         float       m_fKickbackViewBlendOutTime;    // How long to blend out of the current kickback.
var         float       m_fKickbackViewBlendInTime;     // How long to blend out of the current kickback.
var         float       m_fLastKickbackViewTime;        // Remaining time to blend out of the current kickback.
var         rotator     m_rKickbackAim;                 // Target aim.
var         rotator     m_rCurrentKickbackDirection;
var         bool        m_bKickbackBlendingIn;

/** Custom start Camera */
var CameraActor         m_OverwatchCam;
var int                 m_OverwatchTeam;

var int                 m_RequestedTeam;

var bool                m_bAftermathKill;
var bool                bWasAutoBalanced;

/** Sounds */
var AudioComponent m_AudioComponentLowHealthLoop;  // Are the low health effects currently playing?
var AudioComponent m_AudioComponentRechargeHealth; // Recharge health sound.
var AudioComponent m_AudioComponentMissileLockingLoop;
var AudioComponent m_AudioComponentMissileSeekingSelfLoop; // A missile is seeking this controller's pawn.
var AudioComponent m_AudioComponentMissileTargetingSelfLoop; // A missile is targeting this controller's pawn.
var(Sounds) AudioComponent m_AudioComponentCreditsSound;
var bool m_bPlayCreditsSound;

var SoundCue m_MissileLockingCue;
var SoundCue m_MissileLockedCue;
var SoundCue m_MissileFiredCue;
var SoundCue m_MissileSeekingSelfCue;

var(Sounds) SoundCue m_RicochetSound3P;

/////////////////////////////////////// Credits ////////////////////////////////////////
var	repnotify	int     r_nCurrentCredits;
var Array<TrEventCredits> m_EventCreditMap;

/** Stations */
var TrStation           m_CurrentStation;

/**Zoom**/
var float	    m_fDesiredZoomFOV;
var float       m_fDesiredMagnifiedZoomFOV;
var float	    m_fZoomRate;
var float	    c_fZoomButtonPressedTimeStamp;
var EZoomState	m_ZoomState;	                // Current zoom state.
var float	    c_fHUDZoomDuration;             // Client only! How long this client has been zoomed in.
var transient bool c_bPressingZoomButton;       // Is user pressing the zoom button (for times where we want to resume zooming).
var MaterialEffect m_ZoomedEffect;              // Zoom overlay.
var bool        m_bZoomMagnified;               // Should the zoom be magnified?
var bool        m_bReturnTo3PAfterZoom;         // Should post-zoom go back to 3P?

/** Music Manager. */
var TrMusicManager m_MusicManager;

/** Accolade Manager. */
var TrAccoladeManager m_AccoladeManager;

/** TrAnnouncer */
var TrAnnouncer m_Announcer;

/** Last timestamp the controlled pawn caused damage. */
var float m_fLastHitEnemyTime;

/** Players earn XP for the time played in each match */
var float m_fPlayBeginTime;

var bool  m_bPlayerSwappedTeams;

/** Replicated flag set when controlled pawn hits enemy */
var repnotify byte r_nHitEnemy;

/** Replicated flag set when controlled pawn hits enemy via headshot */
var byte r_nHitEnemyHeadshot;
var byte m_nLastHitEnemyHeadshot;

/** Hold onto our time left on our various spawns types **/
var int m_nRespawnTimeRemaining;
var int m_nClientSpawnTimeRemaining;
var transient repnotify float r_fRespawnTime;

// last time we requested a loadout
var float m_LastLoadoutRequestTime;

// Last PlayerController we killed
var TrPlayerController m_LastKilledBy;

// Client and server version of who last killed us.
var Actor r_KilledBy;

// Actual actor that last damaged us (could be a projectile).
var Actor m_LastDamagedBy;
var int m_nLastDamagerHealthPercent;
var int m_nLastDamagerUpgradeLevel;

/** Amount of time skiing remains enabled after user has let go of it. */
var config float m_fSkiFollowthroughTime;
var config float m_fMinActiveSkiTimeToEnableFollowthough;
var float m_LastPressedSkiTimeStamp;

/** Are we requesting to ski? */
var bool m_bRequestingSki;

/** When riding in a vehicle as a passenger, what seat I'm currently in. */
var int m_VehicleSeatIndex;

/** Whether or not I have been alerted about getting to an inv station */
var bool m_bLoadoutChangeAlerted;

var repnotify bool r_bNeedTeam;
var repnotify bool r_bNeedLoadout;

var int m_BeginPlayedTime;
var Weapon m_LastWeaponEquipped;

/** Handles camera shaking. */
var TrCameraModifier_CameraShake m_CameraShake;

var int m_nLatestAccoladeIcon;                          // latest accolade, used to show icon for accolade in the combat messages

struct native TrCameraShakeInfo
{
	var() editinline CameraShake Shake;
	var()            name        ShakeName;
};

/** List of camera shakes that this controller may play. */
var() editinline array<TrCameraShakeInfo> m_CameraShakes;

var config bool m_bEnableCameraSpeedEffect;

/** Camera effect for high speeds. */
var() editinline protected UDKEmitCameraEffect m_SpeedCameraEffect;
var() editinline protected UDKEmitCameraEffect  m_WeatherCameraEffect;
var array<TrWeatherVolume> m_CurrentWeatherVolumes;

/** The speed at which the speed camera takes effect. */
var() float m_fSpeedCameraSpeedSqared;

var() PostProcessSettings m_DefaultPPSettings;
var() PostProcessSettings m_RoundEndedPPSettings;
var() float m_RoundEndedPPInterpSpeed;
var float m_RoundEndedPPAlpha;
var float m_RoundEndedPPTarget;
var float m_RoundEndedVZeroSpeed;

var float m_fIdleCheckTimer;

var int  m_LastVGSUse;

var int m_ActiveClassId;

/** Family info of the pawn we previously possessed.*/
var transient class<TrFamilyInfo> m_OldPossessedFamilyInfo;

/** If we are in the process of possessing a pawn, remember the last vehicle he was piloting. */
var transient TrVehicle m_LastAcknowledgedVehicle;

/** Help Text Manager. */
var transient TrHelpTextManager m_HelpTextManager;
var class<TrHelpTextManager> m_HelpTextManagerClass;

/** Keeps track of how far we've skied */
var transient float m_fTotalDistanceSkiedSq;
var float m_fDistanceCheckInterval;
var float m_fLastDistanceCheckTime;
var float m_fLastDistanceSkiedSq;
var float m_fHideSkiHelpTextDistanceThresholdSq;
var bool m_bSkiHelpTextThresholdReached;

/** Keeps track of how far we've jetpacked */
var transient float m_fTotalDistanceJetpackedSq;
var float m_fHideJetpackHelpTextDistanceThresholdSq;
var bool m_bJetpackHelpTextThresholdReached;

var float m_fSpeedCheckInterval;
var float m_fLastSpeedCheckTime;
var float m_fLastSpeedCheckCount;
var float m_fSpeedCheckTotal;

var float m_fSkiSpeedRecord;
var float m_fFlagCapSpeedRecord;
var float m_fFlagGrabSpeedRecord;

/** 
 *  New Player Assist 
 */

/** Max multiplier for how to mitigate when taking damage. */
var() private float s_fNewPlayerAssistMitigateTakeDamageMultiplier;

/** Max multiplier for how much damage player deals. */
var() private float s_fNewPlayerAssistMitigateCauseDamageMultiplier;

var() private int s_nMaxNewPlayerAssistPoints;
var() private int s_nNewPlayerAssistPoints;

var() float m_fFreeCamYawOffset;
var() float m_fFreeCamPitchOffset;

/** Timestamp for last spot target. */
var float m_fLastSpotTargetTime;

/** Flood protection for spamming chat. */
var int m_fMaxBroadcastSpamCount;       // Max number of chats we can play before flood protection.
var array<float> m_fLastBroadcastTimes; // Keeps track of broadcast times
var float m_fMessageSpamTime;           // Time between seconds for a message to be considered spam.
var float m_fLockoutFromSpamTime;       // Time to lockout player from chat when spam is detected.
var float m_fSpamLockoutTimeStamp;      // Timestamp when the spam lockout began.

/** List of actors that we have as potential seeking targets. */
var array<Actor> m_PotentialSeekingTargets;

var bool m_bMonkeyMode;

/** Was the last death a user-intitiated suicide. */
var bool m_bLastDeathWasUserSuicide;
var float m_fUserSuicideTimePenalty;

/** Timestamp of the last flag grab. (AUTHORITY ONLY)*/
var float m_fLastFlagGrabTimestamp;

/** 
 *  Projectiles needing tethering. Owned projectiles received from the server
 *  will build up here.
 */
var private array<TrProjectile> m_ProjectilesNeedingTethering;

/** Death Camera */
var bool m_bViewThroughDeathCamera;
var float m_fDeathCameraOuterScale;
var float m_fDeathCameraInnerScale;
var float m_fDeathCameraCurrentScale;
var float m_fDeathCameraInterpSpeed;
var vector m_vDeathCamOffset;

/** Paper doll used for character select screen. */
var TrPaperDoll m_PaperDoll;

var float LoadingScreenTimeout;

/** Whether this controller just joined the server or not */
var bool m_bJustJoined;

/** Amount of 'determination' applied to this player. */
var protected float m_fDeterminationAmount;

/** Builds up determination, to be flushed to m_fDeterminationAmount. */
var protected float m_fDeterminationAccumulator;

/** Is the player currently jump-jetting? */
var protected transient bool  m_bIsJumpJetting;

/** Challenges completed during this game */
var repnotify bool r_bDailyCompleted;
var repnotify bool r_bWeeklyCompleted;

var MaterialEffect m_RoundEndedME;

var TrStatsInterface Stats;

/** Amount of damage needed to gain 1 credit */
var int m_DamageNeededForCredit;

var int m_TeamAssistCredit;
var int m_TeamRabbitAssistCredit;

struct native VGSAudioCommand
{
	var TrPlayerReplicationInfo VGSInstigator;
	var AudioComponent VGSAudioComponent;
	var SoundCue QueuedSoundCue;
};
var array<VGSAudioCommand> m_VGSAudioCommands;
var config int m_nMaxVGSSoundChannels;

/** Cache of camera bookmarks so that we can cycle through them when spectating. */
var transient array<CameraActor> m_SpectatorCameraBookmarks;

/** Cache of generators so that we can cycle through them when spectating. */
var transient array<TrPowerGenerator> m_SpectatorGenerators;

/** Cache of flag stands so that we can cycle through them when spectating. */
var transient array<TrCTFBase> m_SpectatorFlagStands;

/** Cache of flags so that we can cycle through them when spectating. */
var transient array<TrFlagBase> m_SpectatorFlags;

/** Cache of vehicles so that we can cycle through them when spectating. */
var transient array<TrVehicle> m_SpectatorVehicles;

/** Spectator HUD options. */
var transient bool m_bShowSpectatorControls;
var transient bool m_bShowSpectatorHUD;

/** Are we roving spectating? */
var bool m_bIsRovingSpectating;

/** Roving spectate replication. */
var float r_fViewTargetNextRegenTimestamp;
var float r_fViewTargetCurrentPowerpool;
var float r_fViewTargetMaxPowerPool;
var int r_nViewTargetPrimaryAmmoCount;
var int r_nViewTargetSecondaryAmmoCount;
var int r_nViewTargetPrimaryMaxAmmoCount;
var int r_nViewTargetSecondaryMaxAmmoCount;
var int r_nViewTargetOffhandAmmoCount;
var int r_nViewTargetPackAmmoCount;
var float r_fViewTargetVehicleCurrentPowerPool;
var float r_fViewTargetVehicleMaxPowerPool;
var bool r_bViewTargetVehiclePrimaryWeaponReady;
var bool r_bViewTargetVehicleSecondaryWeaponReady;
var PlayerReplicationInfo r_ViewTargetVehicleDriverPRI;
var PlayerReplicationInfo r_ViewTargetVehiclePassengerPRI;
var Vector r_vViewTargetViewLocation;
var Rotator r_rViewTargetViewRotation;

/** Spectating transient keybinds */
struct native SpectatorKeybindViewTargetMap
{
	var KeyBind KeyBinding;
	var Actor ViewTarget;
};
var transient array<SpectatorKeybindViewTargetMap> m_SpectatorTransientKeybinds;

var TrChatConsoleCommands m_PlayerCommands;

/** Call-in cooldowns */
var float               m_fCallInCooldown[TR_MAX_CALLINS];
var repnotify byte      r_nCallinCooldownFlash[TR_MAX_CALLINS];
var byte                m_nCallinCooldownFlashStored[TR_MAX_CALLINS];

var globalconfig bool m_bEnableOverheadDamageIndicators;
var globalconfig bool m_bShowHUDObjectives;
var globalconfig bool m_bShowHUDReticule;
var globalconfig bool m_bShowHUDCredits;
var globalconfig bool m_bShowHUDAccolades;
var globalconfig bool m_bShowHUDBadges;
var globalconfig bool m_bShowHUDScores;
var globalconfig bool m_bShowHUDHealthBar;
var globalconfig bool m_bShowHUDVisor;
var globalconfig bool m_bShowHUDChat;
var globalconfig bool m_bShowHUDCombatLog;
var globalconfig bool m_bShowHUDKillbox;
var globalconfig bool m_bShowHUDDeathcam;
var globalconfig bool m_bShowHUDHeroText;
var globalconfig bool m_bShowHUDPromptPanel;
var globalconfig bool m_bShowHUDRespawnTimer;
var globalconfig bool m_bShowHUDSkiBars;
var globalconfig bool m_bShowHUDFriendColoring;
var globalconfig bool m_bShowHUDNotifications;
var globalconfig bool m_bShowHUDFriendStateNotifications;
var globalconfig bool m_bShowHUDCracks;
var globalconfig bool m_bAnimMenu;
var globalconfig int  m_WhisperFilter;
var globalconfig bool m_bAllowSimulatedProjectiles;


/** Alien FX */
var AlienFXManager    AlienFX;
var globalconfig bool EnableAlienFX;

/** Manages loading content for Tribes. */
var TrContentLoader c_ContentLoader;

/** Cached references to the content data for our pending class. */
var array<class<TrDeviceContentData> > m_CachedPendingClassDeviceContentData;

/** List of device classes we expect to asynchronously load for a pending class. */
var array<class<TrDevice> > m_PendingLoadoutDeviceClasses;

/** Equip Interface. */
var TrEquipInterface m_TrEquipInterface;

/** Inventory Helper. */
var TrInventoryHelper m_TrInventoryHelper;

var bool bBlockForAcquisition;
var bool bAutoRevertSetting;

var globalconfig bool m_bEnableChatFilter;

/** While we are preloading a skin for a pawn, keep track of the pawn needing the skin. */
struct native PendingSkin
{
	var TrPlayerReplicationInfo TrPRI;
	var int SkinId;
};
var transient protected array<PendingSkin> m_Pending3PSkins;
var transient protected array<PendingSkin> m_Pending1PSkins;

/** 
 *  When in ATrPawn::physFalling(), there can be discrepencies in edge cases
 *  where the 2D velocity on the client is <= GroundSpeed but is > GroundSpeed 
 *  on the server, so have client send what he predicted with this edge case.
 */
var bool m_bAirSpeedBoundToGroundSpeed;

/** Used for unifying deceleration calculations when walking. */
var WalkingDeceleration m_CurrentDecelerationFactor;

/** Did we just eject from a vehicle? */
var bool m_bEjectedFromVehicle;

var int FriendlyFireKills;
var int FriendlyFireDamage;

var int  VGSClassId;
var bool bWarmingUp;

/** Limit how rapidly we can suicide. */
var float m_fLastSuicideTimestamp;

var float fSniperRespawnDelay;

var TrStrings Strings;

native exec function    SendCtrlRequest(string fsRequest);
native exec function    SendGameRequest(string fsRequest);
native exec function    TestSteamPurchase();

native function         ShowAdminPage(string serverUrl);
native function         SetHitValidationMode(int loggingMode,int validationMode);

/** Server kick commands */
native function         KickPlayerFromMatch(int Reason);

native function bool    MainMenuIsOpen();
native function         SetMenuInGame();
native function         SendMenuToLobby();
native function         TweenSummaryScreen();
native function         SetMenuSummaryScreen();
native function         SetMenuEndOfMatch();
native function         BeginExperienceTweens();
native function         KickVoteReply(bool bVote);
native function         SetMenuMatchCountdown(int Seconds);
native function int     GetUserSelectedClass();
native function         RevertSetting();
native function         SendMenuBack();
native function         FireAcquisition();
native function         ForceFocus();
native function         UpdateTVTimer();
native function         UpdateDealTimer();
native function         UpdateQueueTimer();
native function         ToggleWorkingGraphic(bool bEnabled);
native function         EndHotkeyBlock();
native function         MutePlayer(string PlayerName);
native function         UnmutePlayer(string PlayerName);
native function bool    IsTrPlayerMuted(string PlayerName);

native function bool    HaveMenu();
native function bool    IsChatFiltered(string PlayerName);
native function         RequestKickVote(string PlayerName);
native function         HideMenu();
native exec function    OpenMenu();
native exec function    OpenClasses();
native exec function    ToggleFriends();
native exec function    ToggleSettings();
native exec function    ToggleMainMenu();
native function         ClaimPromotion(string PromoCode);
native function         FireUILoadSummary();
native function         FireRefreshPage();

native function         ToggleBassBoost(bool bEnable);
native function bool    IsBassBoostToggled();

native function         ForwardChatFlag();

native function         ShowNotification(string Message, string Message2);
native function         HideNotification();
native function         ChatMessageReceived(int Channel, string Sender, string Message);

native function         ShowChat();
native function         HideChat();
native exec function    ToggleChat();
native exec function    PushChat(string chatStr);


native exec function    Bug();          // Opens the crash report dialog for a bug report (Release only)
native exec function    _Crash();       // Throws an exception to crash the game
native function bool	IsGameUsingSeekFreeLoading();
native function         ResetRunaway();

/** Vehicle Menu Functions*/
native function         ClearVehicleMenu();
native function         ShowVehicleMenu(int Credits);
native function         AddVehicleMenuOption(string ClassName, string DisplayName, int Cost, int Icon, int CountSpawned, int CountAllowed);

native function         GetOnlineFriends(out array<string> vFriends);

native function int     GetLanguageFontIndex();

native final function   PlayReliableSound(SoundCue InSoundCue, optional bool bNotReplicated, optional bool bNoRepToOwner, optional bool bStopWhenOwnerDestroyed, optional vector SoundLocation, optional bool bNoRepToRelevant);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

replication
{
    if (bNetDirty && bNetOwner && Role == ROLE_Authority)
        r_nCurrentCredits, r_nHitEnemy, r_nHitEnemyHeadshot, r_fRespawnTime, r_nCallinCooldownFlash;
	if (bNetDirty && Role == ROLE_Authority)
		r_KilledBy, r_bDailyCompleted, r_bWeeklyCompleted, r_bNeedTeam, r_bNeedLoadout;
	if (bNetDirty && Role == ROLE_Authority && m_bIsRovingSpectating ) // Spectator-only replication.
		r_fViewTargetNextRegenTimestamp, r_fViewTargetCurrentPowerpool, r_fViewTargetMaxPowerPool, r_nViewTargetPrimaryAmmoCount,
		r_nViewTargetSecondaryAmmoCount, r_nViewTargetPrimaryMaxAmmoCount, r_nViewTargetSecondaryMaxAmmoCount, r_nViewTargetOffhandAmmoCount,
		r_nViewTargetPackAmmoCount, r_fViewTargetVehicleCurrentPowerPool, r_fViewTargetVehicleMaxPowerPool, r_bViewTargetVehiclePrimaryWeaponReady,
		r_bViewTargetVehicleSecondaryWeaponReady, r_ViewTargetVehicleDriverPRI, r_ViewTargetVehiclePassengerPRI, r_vViewTargetViewLocation, r_rViewTargetViewRotation;
}

simulated event PostBeginPlay()
{
	local TrMapInfo MI;
	local TrGame TrGameInfo;
	local TrGameReplicationInfo TrGRI;
    local OnlineSubSystem OnlineSystem;
	local OnlineChatInterface ChatInterface;

	ResetSoundMode();

	super.PostBeginPlay();

    r_bNeedTeam = true;
    r_bNeedLoadout = true;
    bNetDirty = true;

	bPreventRespawn = true;

	if( !IsGameUsingSeekFreeLoading() )
	{







	}

	if( PlayerReplicationInfo != none && !PlayerReplicationInfo.bOnlySpectator )
	{
		SetViewTargetAsOverwatch();
	}

    if( Role == ROLE_Authority )
    {        
        m_fPlayBeginTime = WorldInfo.TimeSeconds;

		// Don't create awards, XP, etc. if we are roaming a map.
		TrGameInfo = TrGame(WorldInfo.Game);

		if (TrGameInfo != none)
		{
		    if (WorldINfo.NetMode == NM_STANDALONE)
            {
                if (!TrGameInfo.m_bRoamingMap || TrGame_TrTraining(TrGameInfo) != none)
                {
                    r_bNeedTeam = false;
                    r_bNeedLoadout = false;
	                bPreventRespawn = false;
                    bNetDirty = true;
                }
            }
            else
            {
			    LoadPlayerProfile();
                Stats = TrGameInfo.Stats;
            }

            if (class<TrGame_TrRabbit>(WorldInfo.GRI.GameClass) != none)
            {
                r_bNeedTeam = false;
                bNetDirty = true;
            }
            
            TrGRI = TrGameReplicationInfo(TrGameInfo.GameReplicationInfo);

            if (TrGRI != none)
            {
                bWarmingUp = TrGRI.bWarmupRound;
            }

        }

		if (m_AccoladeManager == none)
		{
		    m_AccoladeManager = new class'TrAccoladeManager';
            m_AccoladeManager.Initialize(self);
		}
    }
    else
    {
        // If we don't register a HUD within 2 seconds, we're most likely at the
        // end of match (or borked). Close the loading screen.
        SetTimer(5.0, false, 'SetMenuInGame');
        m_PlayerCommands = new(self) class'TrChatConsoleCommands';
    }

	InitHelpTextManager();

	MI = TrMapInfo(WorldInfo.GetMapInfo());
	if( MI != none && MI.m_WeatherEffect != none )
	{
		m_WeatherCameraEffect = Spawn(MI.m_WeatherEffect, self);
		m_WeatherCameraEffect.RegisterCamera(self);
	}

	if( m_Announcer == none )
	{
		m_Announcer = Spawn(class'TrAnnouncer', self);
	}

	if( c_ContentLoader == none )
	{
		c_ContentLoader = new(self) class'TrContentLoader';
	}

	if( m_TrEquipInterface == none )
	{
		m_TrEquipInterface = new class'TrEquipInterface';
	}

	if( m_TrInventoryHelper == none )
	{
		m_TrInventoryHelper = new class'TrInventoryHelper';
	}
    
    if (WorldINfo.NetMode != NM_DedicatedServer)
    {
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

        if (Strings == none)
        {
            Strings = new class'TrStrings';
        }
    
        if (AlienFX == none)
        {
		    AlienFX = new class'AlienFXManager';	
		    AlienFX.Init(EnableAlienFX);
	    }
    }		
}

simulated function InitHelpTextManager()
{
	if( m_HelpTextManager == none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		m_HelpTextManager = Spawn(m_HelpTextManagerClass, self);
		m_fTotalDistanceSkiedSq = 0.0;
		m_bSkiHelpTextThresholdReached = false;
		m_fTotalDistanceJetpackedSq = 0.0;
		m_bJetpackHelpTextThresholdReached = false;
	}
}

// Override the InitInput to grab the latest Engine level keybindings so that
// any changes to settings can be loaded on the fly instead of having to restart.
event InitInputSystem()
{
    super.InitInputSystem();

    GetEngineSettings(true);
}

reliable client function PlayAnnouncerSound(SoundCue AnnouncementCue, bool bPlayRightNow)
{
	if( m_Announcer != none )
	{
		m_Announcer.PlayAnnouncement(AnnouncementCue, bPlayRightNow);
	}
}

exec function TestAnnouncement(bool bPlayRightNow)
{
	PlayAnnouncerSound(SoundCue'AUD_VOX_BE_Leader.A_CUE_Gen_Pos_A', bPlayRightNow);
}

reliable client event ClientHearReliableSound(SoundCue ASound, Actor SourceActor, vector SourceLocation, bool bStopWhenOwnerDestroyed, optional bool bIsOccluded )
{
	local AudioComponent AC;

	if ( SourceActor == None )
	{
		AC = GetPooledAudioComponent(ASound, SourceActor, bStopWhenOwnerDestroyed, true, SourceLocation);
		if (AC == None)
		{
			return;
		}
		AC.bUseOwnerLocation = false;
		AC.Location = SourceLocation;
	}
	else if ( (SourceActor == GetViewTarget()) || (SourceActor == self) )
	{
		AC = GetPooledAudioComponent(ASound, None, bStopWhenOwnerDestroyed);
		if (AC == None)
		{
			return;
		}
		AC.bAllowSpatialization = false;
	}
	else
	{
		AC = GetPooledAudioComponent(ASound, SourceActor, bStopWhenOwnerDestroyed);
		if (AC == None)
		{
			return;
		}
		if (!IsZero(SourceLocation) && SourceLocation != SourceActor.Location)
		{
			AC.bUseOwnerLocation = false;
			AC.Location = SourceLocation;
		}
	}
	AC.Play();
}

reliable client function ClientMySaberLauncherTargetingUpdated(EMissileLock MissileLockValue)
{
	switch( MissileLockValue )
	{
		case EMissileLocking:
			if( m_AudioComponentMissileLockingLoop == none )
			{
				m_AudioComponentMissileLockingLoop = CreateAudioComponent(m_MissileLockingCue, true, true);
				m_AudioComponentMissileLockingLoop.bAutoDestroy = false;
			}
			else
			{
				m_AudioComponentMissileLockingLoop.Stop();
				m_AudioComponentMissileLockingLoop.SoundCue = m_MissileLockingCue;
				m_AudioComponentMissileLockingLoop.Play();
			}
			break;
		case EMissileLocked:
			if( m_AudioComponentMissileLockingLoop == none )
			{
				m_AudioComponentMissileLockingLoop = CreateAudioComponent(m_MissileLockedCue, true, true);
				m_AudioComponentMissileLockingLoop.bAutoDestroy = false;
			}
			else
			{
				m_AudioComponentMissileLockingLoop.Stop();
				m_AudioComponentMissileLockingLoop.SoundCue = m_MissileLockedCue;
				m_AudioComponentMissileLockingLoop.Play();
			}
			break;
		default:
			if( m_AudioComponentMissileLockingLoop != none )
			{
				m_AudioComponentMissileLockingLoop.bAutoDestroy = true;
				m_AudioComponentMissileLockingLoop.Stop();
				m_AudioComponentMissileLockingLoop = none;
			}
	}
}

/** 
 *  EventSwitch values:
 *  1 - Start playing saber launcher targeting sound.
 *  2 - Stop playing saber launcher targeting sound.
 *  3 - Start playing missile tracking sound.
 *  4 - Stop playing missile tracking sound.
 *  5 - Stop playing tracking and targeting sound.
 */
reliable client function ClientSeekingMissileTargetingSelfEvent(int EventSwitch)
{
    local TrHUD TrH;

    TrH = TrHUD(myHUD);

    if (myHUD == none || TrH == none)
    {
        return;
    }

	//`log("MISSILE EVENT:"@EventSwitch);
	switch( EventSwitch )
	{
		case 1:
			if( IsDead() )
			{
				return;
			}

			if( m_AudioComponentMissileTargetingSelfLoop == none )
			{
				m_AudioComponentMissileTargetingSelfLoop = CreateAudioComponent(m_MissileLockingCue, false, true); 
			}
						
			// If we are already not playing, then play.
			if( !m_AudioComponentMissileTargetingSelfLoop.IsPlaying() )
			{
				m_AudioComponentMissileTargetingSelfLoop.Play();
			}
			
			TrHUD(myHUD).AddToPromptPanelTime(class'TrWarningMessage'.static.GetString(3), -1, GC_APT_NORMAL);
			break;
		case 2:
			// Stop playing the sound.
			if( m_AudioComponentMissileTargetingSelfLoop != none )
			{
				m_AudioComponentMissileTargetingSelfLoop.Stop();
			}
			
			TrHUD(myHUD).ClearPromptPanelMessage(class'TrWarningMessage'.static.GetString(3));
			break;
		case 3:
			if( IsDead() )
			{
				return;
			}

			// Stop the targeting sound (this will resume if needed from the server when this missile explodes).
			ClientSeekingMissileTargetingSelfEvent(2);

			// Play the seeking sound.
			if( m_AudioComponentMissileSeekingSelfLoop == none )
			{
				m_AudioComponentMissileSeekingSelfLoop = CreateAudioComponent(m_MissileSeekingSelfCue, false, true); 
			}
				
			if( !m_AudioComponentMissileSeekingSelfLoop.IsPlaying() )
			{
				m_AudioComponentMissileSeekingSelfLoop.Play();
			}
			TrHUD(myHUD).AddToPromptPanelTime(class'TrWarningMessage'.static.GetString(2), -1, GC_APT_HIGH);
			break;
		case 4:
			// Stop the seeking sound.
			if( m_AudioComponentMissileSeekingSelfLoop != none )
			{
				m_AudioComponentMissileSeekingSelfLoop.Stop();
			}
			TrHUD(myHUD).ClearPromptPanelMessage(class'TrWarningMessage'.static.GetString(2));
			break;
		case 5:
			ClientSeekingMissileTargetingSelfEvent(2);
			ClientSeekingMissileTargetingSelfEvent(4);
			break;
	}
}

reliable client function OnMissileIntercepted()
{
	TrHUD(myHUD).AddToHeroStatus(class'TrWarningMessage'.static.GetString(4), 4.0);
}

event ShowHUDNotification(string message, string message2)
{
	local TrHUD TrH;

	TrH = TrHUD(myHUD);
	if (TrH != none && TrH.m_GFxHud != none)
	{
		TrH.m_GFxHud.ShowNotification(message, message2);
	}
}

event HideHUDNotification()
{
	local TrHUD TrH;

	TrH = TrHUD(myHUD);
	if (TrH != none && TrH.m_GFxHud != none)
	{
		TrH.m_GFxHud.HideNotification();
	}
}

/* =====================================================
* ::CheckBulletWhip
*
 * @param	BulletWhip - whip sound to play
 * @param	FireLocation - where shot was fired
 * @param	FireDir	- direction shot was fired
 * @param	HitLocation - impact location of shot
* =====================================================
*/
function CheckBulletWhip(soundcue BulletWhip, vector FireLocation, vector FireDir, vector HitLocation)
{
	local vector PlayerDir;
	local float Dist, PawnDist;

	if ( ViewTarget != None  )
	{
		// if bullet passed by close enough, play sound
		// first check if bullet passed by at all
		PlayerDir = ViewTarget.Location - FireLocation;
		Dist = PlayerDir Dot FireDir;
		if ( (Dist > 0) && ((FireDir Dot (HitLocation - ViewTarget.Location)) > 0) )
		{
			// check distance from bullet to vector
			PawnDist = VSize(PlayerDir);
			if ( Square(PawnDist) - Square(Dist) < 100000 )
			{
				// check line of sight
				if ( FastTrace(ViewTarget.Location + class'UTPawn'.default.BaseEyeheight*vect(0,0,1), FireLocation + Dist*FireDir) )
				{
					ClientHearSound(BulletWhip, none, HitLocation, false);
				}
			}
		}
	}
}

simulated event ReplicatedEvent(name VarName)
{
    local TrHUD TrH;

    if (VarName == 'r_nCurrentCredits')
    {
		if( r_nCurrentCredits != 0 )
		{
			if (MyHUD!=None)
			{
				TrHUD(MyHUD).UpdateHUDCredits(r_nCurrentCredits,-1);
			}
		}
		else
		{
			TrHUD(MyHUD).UpdateHUDCredits(0,0);
		}

        UpdateCallInAvailability();
        return;
    }
    else if ( VarName == 'r_nHitEnemy' )
	{
		m_fLastHitEnemyTime = WorldInfo.TimeSeconds;
	}
	else if( VarName == 'r_fRespawnTime' )
	{
		if( r_fRespawnTime != 0.0 )
		{
			MinRespawnDelay = r_fRespawnTime;
			InitRespawnTimer();
		}
	}
	else if( VarName == 'r_nCallinCooldownFlash' )
	{
		UpdateCallInCooldown();
	}
	else if (VarName == 'r_bNeedTeam')
	{
	    TrH = TrHUD(myHUD);

        if (TrH != none)
        {
            if (r_bNeedTeam)
            {
                TrH.RestoreHUDState();
            }
            else
            {
                TrH.CompleteTeamSelectionMenuClose();
            }
        }
	}

	Super.ReplicatedEvent(VarName);
}

function ProcessCreditEvent(TrCreditEventType eventType, bool bProxyEvent )
{
	local int i, CreditsToAward;
    local bool bFreeCredits;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	if (Role!=ROLE_Authority) return;

	TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
	}

	// Process the offhand kill credit perk/skill.
	if( VM != none && eventType == OffhandKillCredit )
	{
		ModifyCredits(VM.m_nExtraCreditsFromBeltKills, true);
		return;
	}

	for (i=0; i<m_eventCreditMap.Length; i++)
	{
		CreditsToAward = 0;
		if (m_eventCreditMap[i].eventType==eventType)
		{
			// assign credits
			CreditsToAward = bProxyEvent ? m_eventCreditMap[i].proxyEventCredits : m_eventCreditMap[i].eventCredits;

            if (eventType == PlayerDeathEvent)
            {
                // Mark the credits as free so they won't count towards AFK checks
                bFreeCredits = true;
            }

			// Skills/Perks
			if( VM != none )
			{
				if( eventType == PlayerKillEvent )
				{
					CreditsToAward += VM.m_nCreditsFromKillsBuff;
				}
			}

			ModifyCredits(CreditsToAward, bFreeCredits);

			break;
		}
	}
}

function int GetCurrentCredits()
{
    return r_nCurrentCredits;
}

function ModifyCredits(int Count, optional bool bFreeCredits = false)
{
	local TrPlayerController TrPC;
	local TrGameReplicationInfo TrGRI;
    local TrPlayerReplicationInfo TrPRI;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if( TrGRI.bWarmupRound )
	{
		return;
	}
	
    if (Role==ROLE_Authority)
	{
        if (TrGRI == none || TrGRI.r_ServerConfig == none || !TrGRI.r_ServerConfig.bTeamCredits)
        {
            UpdateCurrentCredits(Count);
        }
        else
        {
		    foreach WorldInfo.AllControllers(class'TrPlayerController', TrPC)
		    {
                if (TrPC.GetTeamNum() == GetTeamNum())
                {
                    TrPC.UpdateCurrentCredits(Count);
                }
		    }
        }
        
        TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

        if (TrPRI != none)
        {
            if (count > 0)
            {
                TrPRI.m_nCreditsEarned += Count;

                if (bFreeCredits)
                {
                    TrPRI.m_nFreeCredits += Count;
                }
            }
        }

        if (Stats != none)
        {
            if (Count > 0)
            {
                Stats.AddCreditsEarned(self, Count);
	            Stats.AddCredits(self, Count, false, bFreeCredits);
            }
            else
            {
                Stats.AddCreditsSpent(self, -Count);
	            Stats.AddCredits(self, -Count, true, bFreeCredits);
            }
        }
	}
}

function UpdateCurrentCredits(int Count)
{
    local TrPlayerReplicationInfo TrPRI;

	r_nCurrentCredits += count;
	r_nCurrentCredits = FMax(0,r_nCurrentCredits);

	bNetDirty=true;

	ClientUpdateCredits(Count);

    TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

    if (TrPRI != none)
    {
        TrPRI.m_nCurrentCredits += count;
    }
}

// Plays client-side credits gained sound. Money money money!
simulated function CreditsSoundFinished(AudioComponent AC)
{
	if (AC != none && m_bPlayCreditsSound)
	{
		m_bPlayCreditsSound = false;
		m_AudioComponentCreditsSound.FadeIn(0.05f, 1.0);
	}
}

reliable client function ClientUpdateCredits(int Count)
{
	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		if (m_AudioComponentCreditsSound != none)
		{
			if (!m_AudioComponentCreditsSound.IsPlaying() && m_AudioComponentCreditsSound.FadeOutTargetVolume != 0.0f)
			{
				m_AudioComponentCreditsSound.FadeIn(0.05f, 1.0f);
				m_AudioComponentCreditsSound.OnAudioFinished = none;
			}
			else if (m_AudioComponentCreditsSound.IsPlaying() && m_AudioComponentCreditsSound.FadeOutTargetVolume != 0.0f)
			{
				m_bPlayCreditsSound = true;
				m_AudioComponentCreditsSound.OnAudioFinished = CreditsSoundFinished;
				m_AudioComponentCreditsSound.FadeOut(0.05, 0.0f);
			}
		}

		if (myHUD != none)
		{
			TrHUD(myHUD).UpdateHUDCredits(count, r_nCurrentCredits);
		}
	}
}

simulated function int GetLatestAccoladeIconIndex()
{
	local int temp;
	temp=m_nLatestAccoladeIcon;
	m_nLatestAccoladeIcon=0;
	return temp;
}

reliable client function ClientShowAccoladeIcon(int IconIndex, string Description, string Points)
{
    if (WorldInfo.NetMode != NM_DedicatedServer && MyHUD != none && IconIndex > 0)
	{
		TrHud(MyHUD).AddFlyingIcon(IconIndex, Caps(Description), Caps(Points));
		m_nLatestAccoladeIcon = IconIndex;
	}
}

reliable client function ClientShowAccoladeText(string Message, int ShowTime)
{
    if (WorldInfo.NetMode != NM_DedicatedServer && MyHUD != none)
	{
        TrHUD(myHUD).AddToHeroStatus(Message, ShowTime);
	}
}

function ResetStreaks()
{
	if (Role == ROLE_Authority && m_AccoladeManager != none )
	{
		m_AccoladeManager.ResetStreaks();
	}
}

// Cheat command for adding credits.
//`if(`notdefined(ShippingPC))
exec function GiveCredits(int Count)
{
    ServerGiveCreditsCheat(Count);
}
reliable server function ServerGiveCreditsCheat(int Count)
{
	if (InTraining())
		return;

    ModifyCredits(Count);
}
//`endif

function TrDevice GetDeviceByEquipPoint(TR_EQUIP_POINT EquipPoint)
{
    local TrInventoryManager invMan;

    if (Pawn != None)
    {
        invMan = TrInventoryManager(Pawn.InvManager);

        if (invMan != None)
        {
            return invMan.GetDeviceByEquipPoint(EquipPoint);
        }
    }

    return None;
}

//
//	override since parent's version requires netmode standalone
//
function bool AimingHelp(bool bInstantHit)
{
	return bAimingHelp;
}

// Just changed to pendingWeapon, called on server and local client
function NotifyChangedWeapon( Weapon PreviousWeapon, Weapon NewWeapon )
{
    local TrDevice dev;

    super.NotifyChangedWeapon(PreviousWeapon, NewWeapon);

    if (NewWeapon != None)
    {
        dev = TrDevice(NewWeapon);
        if (dev != None)
		{
			dev.OnSwitchToWeapon();
		}
    }

    if (PreviousWeapon != None)
    {
        dev = TrDevice(PreviousWeapon);
        if (dev != None)
		{
			dev.OnSwitchAwayFromWeapon();
		}
    }
}

/** Tells the weapon to manually reload. */
exec function ReloadWeapon()
{
	local bool bCanReload;
	local TrDevice TrDev;
	local TrVehicleWeapon TrVW;

	if (Pawn == none)
		return;

	TrDev = TrDevice(Pawn.Weapon);
	if (TrDev != none && TrDev.CanClientRequestReloadNow())
	{
		if (TrDev.m_bEndZoomOnReload)
			TrEndZoom();

		TrDev.RequestReload();

		bCanReload = true;
	}

	TrVW = TrVehicleWeapon(Pawn.Weapon);
	if (TrVW != none && TrVW.CanClientRequestReloadNow())
	{
		if (TrVW.m_bEndZoomOnReload)
			TrEndZoom();

		TrVW.RequestReload();

		bCanReload = true;
	}

    if( Role != Role_Authority && bCanReload )
    {
        ServerReloadWeapon();
    }
}

reliable server function ServerReloadWeapon()
{
    ReloadWeapon();
}








reliable server function ServerSetCharFamily(String FamilyClassStr)
{
    local bool now;
	local class<TrFamilyInfo> familyClass;

	if (InTraining())
		return;

    now = false;
	familyClass = class<TrFamilyInfo>(DynamicLoadObject(FamilyClassStr, class'Class'));

    if (familyClass == None)
    {
	    FamilyClassStr = "TribesGame.TrFamilyInfo_"$FamilyClassStr;
    	familyClass = class<TrFamilyInfo>(DynamicLoadObject(FamilyClassStr, class'Class'));
        //`log("Looking for"@FamilyClassStr@": found"@familyClass);
        now = true;
    }
	
    if (familyClass != None)
    {
        ServerRequestLoadoutChange(familyClass, LST_DEFAULT);
        //ServerSetCharacterClass(familyClass);

        if (now)
        {
            Suicide();
        }
    }
}

exec function Suicide()
{
	local TrPlayerReplicationInfo TrPRI;

	if( WorldInfo.TimeSeconds - m_fLastSuicideTimestamp < 5 )
	{
		// Limit how rapidly we can suicide.
		return;
	}

	TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

	if( class<TrGame_TrRabbit>(WorldInfo.GRI.GameClass) != none && TrPRI != none && TrPRI.bHasFlag )
	{
		// Don't allow suiciding in rabbit if we are the flag carrier.
		return;
	}

	if( IsGameTypeArena() )
	{
		// Don't allow suiciding in arena.
		return;
	}

	m_bLastDeathWasUserSuicide = true;
	ServerSuicide();
	m_fLastSuicideTimestamp = WorldInfo.TimeSeconds;
}

reliable server function ServerSuicide()
{

	if( WorldInfo.TimeSeconds - m_fLastSuicideTimestamp < 5 )
	{
		// Limit how rapidly we can suicide.
		return;
	}

	m_bLastDeathWasUserSuicide = true;
	
	if( (Pawn != None) )
	{
		m_fLastSuicideTimestamp = WorldInfo.TimeSeconds;
		Pawn.Suicide();
	}
}

function EArmorType GetArmorType()
{
	local TrPawn aPawn;

	aPawn = TrPawn(Pawn);
	if (aPawn != none)
		return aPawn.GetArmorType();

	return ARMOR_Medium;
}

/** Returns the total amount of time respawning should take. */
function float GetRespawnDelayTotalTime()
{
	local TrGameReplicationInfo TrGRI;
    local TrPlayerReplicationInfo TrPRI;
	local float Time;

	Time = default.MinRespawnDelay;
	
    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
        Time = TrGRI.r_ServerConfig.RespawnTime;
	}

    TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

    if (TrPRI != none && class<TrFamilyInfo_Light_Sentinel>(TrPRI.GetCurrentClass()) != none)
    {
        Time += fSniperRespawnDelay;
    }

	// Suicides now are kills to last player who damaged.
	/*
	if( m_bLastDeathWasUserSuicide )
	{
		Time += m_fUserSuicideTimePenalty;
	}*/

	return Time;
}

/*
 *  Don't limit rotations on flying vehicles
 */
event Rotator LimitViewRotation( Rotator ViewRotation, float ViewPitchMin, float ViewPitchMax )
{
	if (IsInVehicle() && Pawn.IsA('TrVehicle_BaseFlying'))
		return ViewRotation;
	else
		return super.LimitViewRotation(ViewRotation,ViewPitchMin,ViewPitchMax);
}

////////////////////////////KEY BIND FUNCITONS//////////////////////////////////

exec function PressedMelee()
{
    local TrInventoryManager InvMan;

    InvMan = TrInventoryManager(Pawn.InvManager);
	if (InvMan != none)
	{
		InvMan.AutoFireWeapon(EQP_Melee);
	}
	TrEndZoom();
}

exec function PressedLaser()
{
	// CALL-IN: As part of the call-in code, laser targeter is no longer available via pressing "L".
	/*local TrInventoryManager InvMan;

	InvMan = TrInventoryManager(Pawn.InvManager);
	if (InvMan != none)
	{
		InvMan.SwitchWeaponByEquipPoint(EQP_LaserTarget);
	}*/
}

exec function PressedBelt()
{
	local TrDevice TrDev;
    local TrInventoryManager InvMan;

	if( Pawn == none )
	{
		return;
	}

    InvMan = TrInventoryManager(Pawn.InvManager);
	TrDev = TrDevice(Pawn.Weapon);

	// We have a non-tribes weapon, woops.
	if (TrDev == none)
		return;

    // If we have a deployable out as our weapon, change to our regular
    // weapon first and then use the belt item.
    if (!TrDev.IsA('TrDevice_Deployable'))
    {
		if (InvMan != none)
		{
			InvMan.AutoFireWeapon(EQP_Belt);

			// Clear out associated help text.
			if( m_HelpTextManager != none )
			{
				m_HelpTextManager.ClearOffhandReminderTimer();
			}
		}
    }
    else
    {
		PressedWeaponSwitch(FALSE);
		SetTimer(0.1,false,'PressedBelt');
	}

	TrEndZoom();
}

exec function PressedPack()
{
    local TrDevice_Pack PackDevice;
	local TrDevice_Deployable DeployableDevice;
	local TrPawn TrP;

    PackDevice = TrDevice_Pack(GetDeviceByEquipPoint(EQP_Pack));
	TrP = TrPawn(Pawn);
	DeployableDevice = TrDevice_Deployable(GetDeviceByEquipPoint(EQP_Pack));
    if( PackDevice != None )
    {
        PackDevice.ToggleActivate();
    }
	else if( TrP != none && DeployableDevice != none )
	{
		if( DeployableDevice.GetAmmoCount() > 0 )
		{
			// TEMP UNTIL HUD SUPPORT -- Show nag.
			TrHUD(myHUD).AddToHeroStatus(class'TrDeployableMessage'.static.GetString(4,,,,DeployableDevice), 2.0);

			// Activate the pack only if it's not the current weapon.
			if (TrP.Weapon != DeployableDevice)
			{
				ActivateDevice(EQP_Pack);
			}
		}
		else
		{
			// No ammo.
			//TEMP UNTIL HUD SUPPORT -- Show nag.
			TrHUD(myHUD).AddToHeroStatus(class'TrDeployableMessage'.static.GetString(5), 1.0);
		}
	}

}

exec function PressedDeployable()
{
    ActivateDevice(EQP_Deployable);
	TrEndZoom();
}

exec function SetShowEquip(bool bShow)
{
    ;
}

exec function PressedConsoleUse()
{
    if( !Use() )
    {
        // Use was unsuccessful, try a reload.
        ReloadWeapon();
    }
}

exec function PressedWeaponSwitch( bool bFilterTimeStamp )
{
	if (GetZoomedState() == ZST_NotZoomed)
	{
		if( !bFilterTimeStamp || (bFilterTimeStamp && WorldInfo.TimeSeconds - m_fLastWeaponSwitchTimestamp > 0.25f) )
		{
			NextWeapon();
		}
		m_fLastWeaponSwitchTimestamp = WorldInfo.TimeSeconds;
	}
}

exec function EquipPrimary()
{
	local TrInventoryManager InvMan;
	local TrDevice_AutoFire AutoFireDevice; 

	if( Pawn != none )
	{
		AutoFireDevice = TrDevice_AutoFire(Pawn.Weapon);
		if( AutoFireDevice != none )
		{
			// Don't allow switching while autofiring.
			return;
		}

		InvMan = TrInventoryManager(Pawn.InvManager);
		if (InvMan != none)
		{
			TrEndZoom();
			InvMan.SwitchWeaponByEquipPoint(EQP_Primary);
		}
	}
}

exec function EquipSecondary()
{
	local TrInventoryManager InvMan;
	local TrDevice_AutoFire AutoFireDevice; 

	if( Pawn != none )
	{
		AutoFireDevice = TrDevice_AutoFire(Pawn.Weapon);
		if( AutoFireDevice != none )
		{
			// Don't allow switching while autofiring.
			return;
		}

		InvMan = TrInventoryManager(Pawn.InvManager);
		if (InvMan != none)
		{
			TrEndZoom();
			InvMan.SwitchWeaponByEquipPoint(EQP_Secondary);
		}
	}
}

exec function SwitchWeapon(byte T)
{
	local TrDevice_AutoFire AutoFireDevice; 

	if( Pawn != none )
	{
		AutoFireDevice = TrDevice_AutoFire(Pawn.Weapon);
		if( AutoFireDevice != none )
		{
			// Don't allow switching while autofiring.
			return;
		}
	}
	super.SwitchWeapon(T);
}























exec function PrevWeapon()
{
	TrEndZoom();
	Super.PrevWeapon();
}

exec function NextWeapon()
{
	TrEndZoom();
	Super.NextWeapon();
}

/** Used to fire devices that are not in-hand (primary or secondary) */
function ActivateDevice(TR_EQUIP_POINT EquipPoint)
{
    local TrDevice_Deployable DeployableDevice;
	local TrPawn TrP;

    DeployableDevice = TrDevice_Deployable(GetDeviceByEquipPoint(EquipPoint));

    if( DeployableDevice == None )
    {
        // No device is equipped in this slot.
		//`log("No device in slot "@EquipPoint);
        return;
    }

    // Get out of a zoom if we're bringing activating an item
    ReleaseZoom();

    if ( DeployableDevice.m_bUsesDeployMode && DeployableDevice.CanAttemptDeploy() )
    {
        // Device is a deployable.
		TrP = TrPawn(Pawn);

		if( TrP != none )
		{
			TrP.SetActiveWeapon(DeployableDevice);
			return;
		}
    }
}

// The player wants to fire.
exec function StartFire( optional byte FireModeNum )
{
    local TrDevice InHandWeapon;

	// Woopsy, somehow we don't have a Pawn.
	if (Pawn == none)
	{
		;
		return;
	}

    ;

    InHandWeapon = TrDevice(Pawn.Weapon);

    // TrDevice_AutoFires have their own way of firing (see TrInventoryManager::AutoFireWeapon()).
    if( InHandWeapon != None && InHandWeapon.IsA('TrDevice_AutoFire') )
    {
        return;
    }

    if( InHandWeapon != None && !InHandWeapon.m_bAllowFireWhileZoomed &&  (GetZoomedState() != ZST_NotZoomed) )
    {
		InHandWeapon.PlayDryFireZoom();
        return;
    }

    super.StartFire(FireModeNum);
}

simulated event UpdateLockedTarget(actor LockedActor)
{
    local TrPawn p;
    p = TrPawn(pawn);

    if ((p != None) && p.r_LockedTarget != LockedActor)
    {
        p.r_LockedTarget = LockedActor;
        if (Role < Role_Authority)
        {
            p.ServerUpdateLockedTarget(LockedActor);
        }
    }
}

/** Displays the team that the player is now on. Called every time a team change occurs. */
function IdentifyTeamMessage()
{
	local class<TrGame_TrRabbit> RabbitGame;
	local TrGameReplicationInfo TrGRI;

	RabbitGame = class<TrGame_TrRabbit>(WorldInfo.GRI.GameClass);
	if( RabbitGame == none )
	{
		TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
		// Don't play team id message if in warmup round.
		if( TrGRI != none && !TrGRI.bWarmupRound )
		{
			ReceiveLocalizedMessage( class'TrGameMessage', GetTeamNum()+1, PlayerReplicationInfo);
		}
	}
}

// override so we don't get UT startup messages
//
reliable client function PlayStartupMessage(byte StartupStage)
{
}
reliable client function FindValidGRI();
reliable client function InitHUDObjects();
reliable client function ClientStartSpawnTimer();

// Pulled this out since we can swap teams (using the Team Selection Menu) mid-game
reliable server function bool ServerRequestPickTeam(byte RequestedTeamNum)
{
	local TrGame TrG;

	TrG = TrGame(WorldInfo.Game);
	if( TrG != none )
	{
		if( TrG.RequestTeam(RequestedTeamNum, self) )
		{
            CompletePickTeam();
            return true;
		}
	}

    return false;
}

function CompletePickTeam()
{
    local int teamNum;
	local TrVehicle TrV;

    teamNum = GetTeamNum();

    if (Stats != none)
    {
        Stats.SetTeam(self, teamNum);
    }

    r_bNeedTeam = teamNum == 255 ? true : false;
    m_bJustJoined = false;
    bNetDirty = true;

    ClientEndTeamSelect(teamNum);

	// When a player switches teams, destroy all of their deployables and projectiles.
	DestroyAllOwnedDeployables();
	DestroyAllOwnedProjectiles();

    // Player is alive, take em down
	// If they are in a vehicle, kill them and not the vehicle.
	TrV = TrVehicle(Pawn);

	if (TrV != none)
	{
		TrV.KillControllerForTeamChange(self);
	}
	else if (Pawn != none)
	{
		Pawn.KilledBy(Pawn);
	}
}

reliable server function ServerRequestAutoAssignTeam()
{
    local TrGame TrG;
    local TrGameReplicationInfo TrGRI;

	if (GetTeamNum() != 255)
	{
		return;
	}

    if (WorldInfo.GRI.GameClass == class'TrGame_TRRabbit')
    {
        return;
    }

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI == none || TrGRI.r_ServerConfig == none)
    {
        return;
    }

    if (TrGRI.r_ServerConfig.TeamAssignType == TAT_AUTOASSIGN)
    {
        TrG = TrGame(WorldInfo.Game);

        if (TrG != none && TrG.AutoAssignTeam(self))
        {
            CompletePickTeam();
        }
    }
}

reliable client function ClientEndTeamSelect(int RequestedTeamNum)
{
    local TrHUD TrH;

    TrH = TrHUD(myHUD);

    m_RequestedTeam = RequestedTeamNum;

    if (TrH != none)
    {
        if (r_bNeedTeam)
        {
            TrH.bShowObjectives = GetHUDObjectivesValue();
        }

		if (TrH.TeamSelectionMenuMovie != none)
		{
			TrH.TeamSelectionMenuMovie.CompleteMovie();
		}
    }

    if (r_bNeedLoadout)
    {
        OpenClasses();
    }
}

exec function ChangeTeam(optional string TeamName)
{
	local byte NewTeamNum;

	if ((PlayerReplicationInfo == None) || (PlayerReplicationInfo.Team == None) || (PlayerReplicationInfo.Team.TeamIndex > 1) )
		NewTeamNum = 0;
	else
		NewTeamNum = 1 - PlayerReplicationInfo.Team.TeamIndex;

	ServerRequestPickTeam(NewTeamNum);
}

auto state PlayerWaiting
{
	simulated event BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);

		ResetSoundMode();

        if (WorldInfo.GRI == none)
        {
            SetTimer(0.2, true, 'FindValidGRI');
        }
        else if( WorldInfo.GRI.GameClass == class'TrGame_TRRabbit' )
		{
		    //bPreventRespawn = false;
			// Skip all the pick team logic if in rabbit.
			//ClientStartSpawnTimer();
		}
	}
	
	reliable server function bool ServerRequestPickTeam(byte RequestedTeamNum)
	{
		local TrGame TrG;

		TrG = TrGame(WorldInfo.Game);
		if( TrG != none )
		{
			if( TrG.RequestTeam(RequestedTeamNum, self) )
			{
                //bPreventRespawn = false;
                if (Stats != none) Stats.SetTeam(self, RequestedTeamNum);

                r_bNeedTeam = RequestedTeamNum == 255 ? true : false;
                bNetDirty = true;

                if (!r_bNeedLoadout && RequestedTeamNum < 255) bPreventRespawn = false;

                ClientEndTeamSelect(RequestedTeamNum);


                return true;
			}
		}

        return false;
	}

    // Some clients can't load the GRI fast enough and we need to pick it up
    reliable client function FindValidGRI()
    {
        if (WorldInfo.GRI != none)
        {
            if( WorldInfo.GRI.GameClass == class'TrGame_TRRabbit' )
		    {
			    // Skip all the pick team logic if in rabbit.
			    ClientStartSpawnTimer();
		    }

            ClearTimer('FindValidGRI');
        }
    }

	reliable client function ClientStartSpawnTimer()
	{
		local UTGameReplicationInfo UTGRI;

		UTGRI = UTGameReplicationInfo(WorldInfo.GRI);

		// If we're in the warmup phase, base the spawning timer off the amount of time
		// remaining until game start. If it's close to starting, use default spawn time.
		if (UTGRI != none && UTGRI.bWarmupRound)
		{
			m_nClientSpawnTimeRemaining = UTGameReplicationInfo(WorldInfo.GRI).RemainingTime;
		}
        else
        {
            m_nClientSpawnTimeRemaining = 0;
        }

        // The HUD likes to load slowly and we have to ping it to get the elements
        // we want to show as soon as possible. Fix until we get a valid callback.
        SetTimer(0.2, false, 'InitHUDObjects');

		UpdateClientSpawnTimer();
	}

    reliable client function InitHUDObjects()
    {
        local TrHUD TrH;
        //local GFxTrHud GFxTrH;

        TrH = TrHUD(myHUD);

        /*if (TrH == none)
        {
            SetTimer(0.2, false, 'InitHUDObjects');
            return;
        }

        GFxTrH = GfxTrHud(TrH.HudMovie);

        if (GFxTrH == none)
        {
            SetTimer(0.2, false, 'InitHUDObjects');
            return;
        }

        GFxTrH.SetPlayerRankIcon(TrPlayerReplicationInfo(PlayerReplicationInfo).GetRankIcon());
        GFxTrH.SetPlayerTeamIcon(0);*/
    
        TrH.RestoreHUDState();
    }

	exec function StartFire( optional byte FireModeNum )
	{	
		if( IsGameTypeArena() || IsGameTypeDaD() || IsGameTypeCaH() )
		{
			// Fixing a bug where players could get stuck if bPreventRespawn was false.
			super.StartFire(FireModeNum);
			return;
		}

		// Suppress firing until pawn officially spawns.
		if (bPreventRespawn) 
		{
			super.StartFire(FireModeNum);
		}
	}

	reliable server function ServerRestartPlayer()
	{
		local TrGame TrG;

		TrG = TrGame(WorldInfo.Game);
		if( TrG != none )
		{ 
			if( TrG.AllowRespawn(self) )
			{
				Super.ServerRestartPlayer();
			}
		}
	}
}

function ViewAPlayer(int dir)
{
    local int i, CurrentIndex, NewIndex;
	local PlayerReplicationInfo PRI;
	local bool bSuccess;

	if( !(GetTeamNum() == 0 || GetTeamNum() == 1) )
	{
		Super.ViewAPlayer(dir);
		return;
	}

	CurrentIndex = -1;
	if ( RealViewTarget != None )
	{
		// Find index of current viewtarget's PRI
		For ( i=0; i<WorldInfo.GRI.PRIArray.Length; i++ )
		{
			if ( RealViewTarget == WorldInfo.GRI.PRIArray[i] )
			{
				CurrentIndex = i;
				break;
			}
		}
	}

	// Find next valid viewtarget in appropriate direction
	for ( NewIndex=CurrentIndex+dir; (NewIndex>=0)&&(NewIndex<WorldInfo.GRI.PRIArray.Length); NewIndex=NewIndex+dir )
	{
		PRI = WorldInfo.GRI.PRIArray[NewIndex];
		if ( (PRI != None) && (Controller(PRI.Owner) != None) && (Controller(PRI.Owner).Pawn != None)
			&& WorldInfo.Game.CanSpectate(self, PRI) && PRI.GetTeamNum() == GetTeamNum() )
		{
			bSuccess = true;
			break;
		}
	}

	if ( !bSuccess )
	{
		// wrap around
		CurrentIndex = (NewIndex < 0) ? WorldInfo.GRI.PRIArray.Length : -1;
		for ( NewIndex=CurrentIndex+dir; (NewIndex>=0)&&(NewIndex<WorldInfo.GRI.PRIArray.Length); NewIndex=NewIndex+dir )
		{
			PRI = WorldInfo.GRI.PRIArray[NewIndex];
		if ( (PRI != None) && (Controller(PRI.Owner) != None) && (Controller(PRI.Owner).Pawn != None)
			&& WorldInfo.Game.CanSpectate(self, PRI) )
			{
				bSuccess = true;
				break;
			}
		}
	}

	if ( bSuccess )
		SetViewTarget(PRI);
}

event ServerPlayerTick(float DeltaTime)
{
}

event PlayerTick( float DeltaTime )
{
    local TrPawn TrP;
    local class<TrFamilyInfo> FI;
	local vector CamLoc;
	local rotator CamRot;

    Super.PlayerTick(DeltaTime);

	`log( "im king" );
	
    TrP = TrPawn(Pawn);
    if( TrP != None )
    {
        if (GetZoomedState() != ZST_NotZoomed)
        {
            c_fHUDZoomDuration += DeltaTime;
        }

        FI = TrP.GetCurrCharClassInfo();

		if (FI!=None)
		{
			if( (!m_AudioComponentLowHealthLoop.IsPlaying()) && (TrP.GetHealthPct() <= FI.default.m_fLowHealthThreshold) )
			{
				PlayLowHealthFX();
			}
			else if( (m_AudioComponentLowHealthLoop.IsPlaying()) && (TrP.GetHealthPct() > FI.default.m_fLowHealthThreshold) && (m_AudioComponentLowHealthLoop.FadeOutStopTime == -1.f)  )
			{
				StopLowHealthFX();
			}
		}

		if( TrP.r_bIsHealthRecharging && !m_AudioComponentRechargeHealth.IsPlaying() )
		{
			PlayRechargeHealthFX();
		}
		else if( !TrP.r_bIsHealthRecharging && m_AudioComponentRechargeHealth.IsPlaying() && m_AudioComponentRechargeHealth.FadeOutStopTime == -1.f )
		{
			StopRechargeHealthFX();
		}
    }
    else
    {
        if( m_AudioComponentLowHealthLoop.IsPlaying() )
        {
            StopLowHealthFX();
        }

		if( m_AudioComponentRechargeHealth.IsPlaying() )
		{
			StopRechargeHealthFX();
		}
    }

	if( m_WeatherCameraEffect != none )
	{
		GetPlayerViewPoint(CamLoc, CamRot);
		m_WeatherCameraEffect.UpdateLocation(CamLoc, CamRot, FOVAngle);
	}

	// Speed effect.
	if( m_bEnableCameraSpeedEffect )
	{
		if( Pawn != none && m_SpeedCameraEffect != none )
		{
			GetPlayerViewPoint(CamLoc, CamRot);
			m_SpeedCameraEffect.UpdateLocation(CamLoc, CamRot, FOVAngle);

			if( VSizeSq(Pawn.Velocity) > m_fSpeedCameraSpeedSqared )
			{
				SpeedCamEffect(true);
			}
			else
			{
				SpeedCamEffect(false);
			}
		}

		if( m_SpeedCameraEffect == none )
		{
			// User has enabled the effect, spawn it if we don't have it already.
			m_SpeedCameraEffect = Spawn(class'TrEmitCameraEffect_Speed', self);
			m_SpeedCameraEffect.RegisterCamera(self);
		}
	}
	else
	{
		if( m_SpeedCameraEffect != none )
		{
			// User has disabled the effect.
			m_SpeedCameraEffect.Destroy();
			m_SpeedCameraEffect = none;

		}
	}
	
	if (EnableAlienFX && AlienFX != none)
	{
		AlienFX.Tick(DeltaTime);
	}
}

function Rotator GetAdjustedAimFor( Weapon W, vector StartFireLoc )
{
	local rotator Result;
	Result = Super.GetAdjustedAimFor(W, StartFireLoc);

	// Take out any free cam.
	Result.Yaw -= m_fFreeCamYawOffset;
	Result.Pitch -= m_fFreeCamPitchOffset;

	return Result;
}

exec function StartWeather()
{
	m_WeatherCameraEffect = Spawn(class'TrEmitCameraEffect_Snow', self);
	m_WeatherCameraEffect.RegisterCamera(self);
}

exec function StopWeather()
{
	m_WeatherCameraEffect.Destroy();
	m_WeatherCameraEffect = none;
}

simulated function PawnEnteredWeatherVolume(bool bDeactivatePawnCentricWeather, TrWeatherVolume WeatherVolume)
{
	m_CurrentWeatherVolumes.AddItem(WeatherVolume);
	if( bDeactivatePawnCentricWeather && m_WeatherCameraEffect != none && m_WeatherCameraEffect.ParticleSystemComponent.bIsActive )
	{
		m_WeatherCameraEffect.Deactivate();
	}
}

simulated function PawnLeftWeatherVolume(bool bDeactivatePawnCentricWeather, TrWeatherVolume WeatherVolume)
{
	m_CurrentWeatherVolumes.RemoveItem(WeatherVolume);
	if( bDeactivatePawnCentricWeather && m_WeatherCameraEffect != none && m_CurrentWeatherVolumes.Length == 0 )
	{
		m_WeatherCameraEffect.Activate();
	}
}

function PlayLowHealthFX()
{
	local TrPawn TrP;

	TrP = TrPawn(Pawn);

	if( TrP != none )
	{
		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			if( m_AudioComponentLowHealthLoop.SoundCue == None )
			{
				m_AudioComponentLowHealthLoop.SoundCue = class<TrPawnSoundGroup>(TrP.SoundGroupClass).default.m_LowHealthSound;
			}
			m_AudioComponentLowHealthLoop.Play();
		}
	}
}

function StopLowHealthFX()
{
    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        if( m_AudioComponentLowHealthLoop.FadeOutStopTime == -1.f )
        {
            m_AudioComponentLowHealthLoop.FadeOut(0.1f, 0.f);
        }
    }    
}

function PlayRechargeHealthFX()
{
	local TrPawn TrP;

	if (WorldInfo.NetMode != NM_DedicatedServer)
	{
		TrP = TrPawn(Pawn);
		if (TrP != none)
		{
			if( m_AudioComponentRechargeHealth.SoundCue == None )
			{
				m_AudioComponentRechargeHealth.SoundCue = class<TrPawnSoundGroup>(TrP.SoundGroupClass).default.m_RechargeHealthSound;
			}
			m_AudioComponentRechargeHealth.FadeIn(0.1f, 1.0f);
		}
	}
}

function StopRechargeHealthFX()
{
    if( WorldInfo.NetMode != NM_DedicatedServer )
    {
        if( m_AudioComponentRechargeHealth.FadeOutStopTime == -1.f )
        {
            m_AudioComponentRechargeHealth.FadeOut(0.2f, 0.f);
        }
    }    
}

/** Toggle jetpack on (bEnabled is important to make sure we don't somehow get backwards between press/release) */
exec function ToggleJetpack(bool bEnabled, optional bool bJump)
{
	m_bPressingJetpackButton = bEnabled;
}

/** Toggle jetpack on (bEnabled is important to make sure we don't somehow get backwards between press/release) */
simulated function EnableJetpack(bool bEnabled, optional bool bJump, optional bool bForcedOff)
{
	local TrPawn TrP;
    local vector TraceStart, TraceEnd, HitLocation, HitNormal;

	if( bEnabled && !IsMoveInputIgnored() )
	{
		m_bPressingJetpack = true;
		m_bJumpJet = bJump;

		// Flag for applying an initial burst.
		TraceStart = Pawn.Location;
		TraceEnd = TraceStart;
		TraceEnd.Z -= Pawn.GetCollisionHeight() * 2.f;

		TrP = TrPawn(Pawn);
		if (TrP != none)
		{
			// Add a boost to flying.
			if( (Pawn.Physics == PHYS_Walking || Pawn.Physics == PHYS_Skiing) || Trace(HitLocation, HitNormal, TraceEnd, TraceStart, FALSE,,,TRACEFLAG_Blocking) != None )
			{
				m_fRemainingInitiatingJettingTime = TrP.GetCurrCharClassInfo().default.m_fJetpackInitTotalTime;
			}

			// If jetting, change air control
			TrP.AirControl = TrP.GetCurrCharClassInfo().default.m_fFIAirControl + 0.20f;

			Trp.r_bIsJetting = TRUE;
			Trp.PlayJetpackEffects();
		}
	}
	else
	{
		m_bPressingJetpack = false;

		// Flag for applying an initial burst.
		m_fRemainingInitiatingJettingTime = 0.0f;

		TrP = TrPawn(Pawn);
		if (TrP != none)
		{
			// If getting out of jetting, change air control
			TrP.AirControl = TrP.GetCurrCharClassInfo().default.m_fFIAirControl;

			Trp.r_bIsJetting = FALSE;
			Trp.StopJetpackEffects();
		}
	}
}

/** Toggles move input. FALSE means movement input is cleared. */
function IgnoreMoveInput( bool bNewMoveInput )
{
	Super.IgnoreMoveInput(bNewMoveInput);

    // Force jetpack off.
    EnableJetpack(false,, true);
}

exec function DoJump()
{
	if ( WorldInfo.Pauser == PlayerReplicationInfo )
		SetPause( False );
	else
		bPressedJump = true;
}

/** Client wants to blink. The blink gets sent up with the SavedMove. */
simulated function PerformBlink()
{
	m_bBlink = true;
}

simulated function GetBlinkPackAccel(out vector NewAccel, out float BlinkPackPctEffectiveness)
{
	local float BlinkPackSpeedCapMultiplier, PawnSpeed;
	local Vector ViewPos;
	local Rotator ViewRot;
	local TrPawn TrP;
	local TrDevice_Blink BlinkPack;

	TrP = TrPawn(Pawn);
	BlinkPack = TrDevice_Blink(GetDeviceByEquipPoint(EQP_Pack));
	if( BlinkPack != none && TrP != none )
	{
		GetPlayerViewPoint(ViewPos, ViewRot);

		// Start with a local-space impulse amount.
		NewAccel = BlinkPack.GetBlinkImpulse();

		// Transform from local to world space.
		NewAccel = NewAccel >> ViewRot;

		// Always make sure we have upward impulse.
		if( NewAccel.Z <= BlinkPack.m_fMinZImpulse )
		{
			NewAccel.Z = BlinkPack.m_fMinZImpulse;
		}

		// Modify the acceleration based on the power pool.
		BlinkPackPctEffectiveness = BlinkPack.m_fPowerPoolCost > 0.0 ? FClamp(TrP.GetPowerPoolPercent() * 100.0 / BlinkPack.m_fPowerPoolCost, 0.0, 1.0) : 1.0;
		
		// Modify the acceleration based on a speed cap
		PawnSpeed = VSize(TrP.Velocity);
		BlinkPackSpeedCapMultiplier = 1.0;
		if( ((Normal(TrP.Velocity) dot Vector(ViewRot)) >= 0 ) && PawnSpeed > BlinkPack.m_fSpeedCapThresholdStart )
		{
			BlinkPackSpeedCapMultiplier = Lerp(1.0f, BlinkPack.m_fSpeedCapPct, FPctByRange(Min(PawnSpeed, BlinkPack.m_fSpeedCapThreshold), BlinkPack.m_fSpeedCapThresholdStart, BlinkPack.m_fSpeedCapThreshold));
		}
		BlinkPackPctEffectiveness *= BlinkPackSpeedCapMultiplier;

		// Apply the effectiveness debuff.
		NewAccel *= BlinkPackPctEffectiveness;

		BlinkPack.OnBlink(BlinkPackPctEffectiveness);
	}
}

// Player movement.
// Player Standing, walking, running, falling.
state PlayerWalking
{
    simulated function BeginState(Name PreviousStateName)
	{
        super.BeginState(PreviousStateName);

		// Only handle requests on the client.
		if (WorldInfo.NetMode != NM_DedicatedServer)
		{
			if (m_bRequestingSki)
			{
				PressedSki(false);
			}

			m_bRequestingSki = false;
		}
    }

	function PlayerMove( float DeltaTime )
	{
		local vector			X,Y,Z, NewAccel;
		local eDoubleClickDir	DoubleClickMove;
		local rotator			OldRotation;
		local bool				bSaveJump;
		local float MaxAccel;
		local vector Velocity2D;
		local float groundSpeedThrottle, pawnGroundSpeed, AccelSpeed;
		local TrPawn TrP;
		local TrDevice_Blink BlinkPack;

		m_CurrentDecelerationFactor = WalkingDeceleration_None;
		m_bAirSpeedBoundToGroundSpeed = false;

		TrP = TrPawn(Pawn);
		if( TrP == None )
		{
			GotoState('Dead');
		}
		else
		{
			if( TrP != none )
			{
				if( m_bPressingJetpackButton && !m_bPressingJetpack && TrP.GetPowerPoolPercent() >= 0.1 && !IsMoveInputIgnored() )
				{
					// We are pressing the jetpack button but not jetpacking and we are allowed to jetpack.
					EnableJetpack(true, m_bJumpJet);
				}
				else if( m_bPressingJetpack && (TrP.GetPowerPoolPercent() <= 0.0 || IsMoveInputIgnored()) )
				{
					// We are jetpacking and are no longer allowed to continue.
					EnableJetpack(false,,true);
				}
				else if( !m_bPressingJetpackButton && m_bPressingJetpack )
				{
					// We are no longer pressing the jetpack button so don't jetpack!
					EnableJetpack(false,,true);
				}
			}

			if( m_bBlink )
			{
				BlinkPack = TrDevice_Blink(GetDeviceByEquipPoint(EQP_Pack));
				if( BlinkPack != none )
				{
					// Update rotation.
					OldRotation = Rotation;
					UpdateRotation( DeltaTime );

					// Save this move and replicate it
					if( Role < ROLE_Authority ) 
					{
						ReplicateMove(DeltaTime, NewAccel, DCLICK_None, OldRotation - Rotation);
					}
					else
					{
						ProcessMove(DeltaTime, NewAccel, DCLICK_None, OldRotation - Rotation);
					}
				}

				m_bBlink = false;
			}
			else
			{
				if( m_bPressingJetpack )
				{
					// Update acceleration.
					GetAxes(Pawn.Rotation,X,Y,Z);
					NewAccel = (PlayerInput.aForward * X) + (PlayerInput.aStrafe * Y);
					NewAccel = Normal(NewAccel) * Pawn.AirSpeed;
					NewAccel = TrP.GetJetpackAirControl(NewAccel, Z);

					// Update rotation.
					OldRotation = Rotation;
					UpdateRotation( DeltaTime );

					if( PlayerInput.aForward > 0.0 )
					{
						AccelSpeed = VSize(NewAccel);
						NewAccel = NewAccel << Pawn.Rotation;
						NewAccel.X *= TrP.m_fForwardJettingPct;
						NewAccel = NewAccel >> Pawn.Rotation;
						NewAccel = Normal(NewAccel) * AccelSpeed;
					}

					TrP.UpdateJetpackEffects();

					if( m_fRemainingInitiatingJettingTime > 0.f )
					{
						pawnGroundSpeed = VSize(TrP.Velocity);

						// Add a boost inversely proportional to the remaining ramp up time
						// and also inversely proportional to the relative ground speed
						groundSpeedThrottle = 1.0;
						if (pawnGroundSpeed>TrP.GroundSpeed)
						{
							groundSpeedThrottle = 0;
							if (pawnGroundSpeed<TrP.m_fMaxJetpackBoostGroundspeed)
							{
								groundSpeedThrottle = 1.0 - (pawnGroundSpeed/TrP.m_fMaxJetpackBoostGroundspeed);
							}
							//`log("Throttling groundspeed by "@groundSpeedThrottle);
						}

						m_fRemainingInitiatingJettingTime = FMax(0.f, m_fRemainingInitiatingJettingTime - DeltaTime);
						NewAccel += Normal(Normal(NewAccel) + Z) * groundSpeedThrottle;
					}

					if ( Role < ROLE_Authority )
					{
						ReplicateMove(DeltaTime, NewAccel, DCLICK_None, OldRotation - Rotation);
					}
					else 
					{
						ProcessMove(DeltaTime, NewAccel, DCLICK_None, OldRotation - Rotation);
					}
				}
				else
				{
					GetAxes(Pawn.Rotation,X,Y,Z);

					// Update acceleration.
					NewAccel = PlayerInput.aForward*X + PlayerInput.aStrafe*Y;
					NewAccel.Z	= 0;
					NewAccel = Pawn.AccelRate * Normal(NewAccel);

					DoubleClickMove = PlayerInput.CheckForDoubleClickMove( DeltaTime/WorldInfo.TimeDilation );

					// Update rotation.
					OldRotation = Rotation;
					UpdateRotation( DeltaTime );
					bDoubleJump = false;

					if( bPressedJump && Pawn.CannotJumpNow() )
					{
						bSaveJump = true;
						bPressedJump = false;
					}
					else
					{
						bSaveJump = false;
					}

					if( Pawn.Physics == PHYS_Falling )
					{
						// Compute the acceleration.
						MaxAccel = Pawn.AccelRate * Pawn.AirControl;
						if( VSizeSq(NewAccel) > MaxAccel * MaxAccel )
						{
							NewAccel = Normal(NewAccel);
							NewAccel *= MaxAccel;
						}

						// Decide now, rather than in the physics move, whether we are binding our
						// velocity to the groundspeed or not.
						Velocity2D = Pawn.Velocity;
						Velocity2D.Z = 0.0;
						if( VSize2D(Velocity2D) < Pawn.GroundSpeed && !m_bEjectedFromVehicle )
						{
							m_bAirSpeedBoundToGroundSpeed = true;
						}
					}

					if( VSizeSq(TrP.Velocity) > (TrP.GroundSpeed * TrP.GroundSpeed * 1.1) )
					{
						// Pawn is traveling faster than what we allow, so apply deceleration.
						// This gets swept up by the TrSavedMove.
						if (TrP.m_fStoppingDistance<TrP.m_fMaxStoppingDistance/4)
						{
							m_CurrentDecelerationFactor = WalkingDeceleration_A;
						}
						else if (TrP.m_fStoppingDistance<TrP.m_fMaxStoppingDistance/2)
						{
							m_CurrentDecelerationFactor = WalkingDeceleration_B;
						}
						else if (TrP.m_fStoppingDistance<3*TrP.m_fMaxStoppingDistance/4)
						{
							m_CurrentDecelerationFactor = WalkingDeceleration_C;
						}
						else if (TrP.m_fStoppingDistance<TrP.m_fMaxStoppingDistance)
						{
							m_CurrentDecelerationFactor = WalkingDeceleration_D;
						}
						else
						{
							m_CurrentDecelerationFactor = WalkingDeceleration_E;
						}
					}

					if( Role < ROLE_Authority ) // then save this move and replicate it
					{
						ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
					}
					else
					{
						ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
					}
					bPressedJump = bSaveJump;
				}
			}
		}
	}

	function ProcessMove(float DeltaTime, vector NewAccel, eDoubleClickDir DoubleClickMove, rotator DeltaRot)
	{
		local TrPawn TrP;
		local float BlinkPackPctEffectiveness;

		TrP = TrPawn(Pawn);
		if( TrP == None )
		{
			return;
		}

		if( m_bBlink )
		{
			if( TrP.Physics != PHYS_Falling && TrP.Physics != PHYS_Flying )
			{
				TrP.SetPhysics(PHYS_Falling);
			}

			GetBlinkPackAccel(NewAccel, BlinkPackPctEffectiveness);
			TrP.Velocity += NewAccel;

			if( Role == ROLE_Authority )
			{
				TrP.r_nBlinked++;
			}
			
			TrP.PlayBlinkPackEffect();

			if (Role == ROLE_Authority)
			{
				// Update ViewPitch for remote clients
				Pawn.SetRemoteViewPitch( Rotation.Pitch );

			}
			return;
		}

		if( m_bPressingJetpack )
		{
			if( Pawn.Physics != PHYS_Flying )
			{
				if( m_bJumpJet )
				{
					Pawn.DoJump(bUpdating);
				}

				Pawn.SetPhysics(PHYS_Flying);
			}
		}
		else
		{
			if( Pawn.Physics == PHYS_Flying )
			{
				Pawn.SetPhysics(PHYS_Falling);
			}
		}

		if (Role == ROLE_Authority)
		{
			// Update ViewPitch for remote clients
			Pawn.SetRemoteViewPitch( Rotation.Pitch );
		}

		Pawn.Acceleration = NewAccel;

		if( Pawn.Physics != PHYS_Flying )
		{
			CheckJumpOrDuck();
		}
	}

	exec function ToggleJetpack(bool bEnabled, optional bool bJump)
	{
		global.ToggleJetpack(bEnabled, bJump);
		EnableJetpack(bEnabled, bJump);
	}
}

function InitRespawnTimer()
{
	// Play a respawn alarm sound beginning 3s before respawn.
	if( IsLocalPlayerController() )
	{
		// Removed for shorter respawn experiment.
		//SetTimer(MinRespawnDelay - 5.0,false,'SwitchCameraToOverwatch');
		bPreventRespawn = true;
		SetTimer(MinRespawnDelay - 3.0 ,false,'PlayRespawnSoonSound');
		SetTimer(3.0, false, 'SwitchToDeathCamera');

		m_nRespawnTimeRemaining = MinRespawnDelay;
		UpdateRespawnTimer();
	}
}

function UpdateRespawnTimer()
{
	if (MyHUD!=None) TrHUD(MyHUD).UpdateRespawnTimer(m_nRespawnTimeRemaining);

	if (m_nRespawnTimeRemaining > 0)
	{
		m_nRespawnTimeRemaining--;
		SetTimer(1.0 ,false,'UpdateRespawnTimer');
	}
	else
	{
		if( IsGameTypeArena() && TrPlayerReplicationInfo(PlayerReplicationInfo).r_bIsCrossedOffArenaList )
		{
			TrHUD(myHUD).UpdateRespawnText(Strings.FireToSpectate);
		}
		else
		{
			TrHUD(myHUD).UpdateRespawnText(Strings.FireToRespawn);
		}
		bPreventRespawn = false;
		m_LastLoadoutRequestTime = 0.0f;
	}
}

// Called from the client, requesting to respawn.
reliable server function ServerRequestRespawn()
{
	local TrGame TrG;
	local TrGameReplicationInfo TrGRI;

	TrG = TrGame(WorldInfo.Game);
	if( TrG != none )
	{
	    if( TrG.AllowRespawn(self) && !r_bNeedLoadout && !r_bNeedTeam)
		{
			if( !IsTimerActive('UpdateRespawnTimer') )
			{
				Respawn();
			}
		}
		else
		{
			TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
			if( TrGRI != none && !TrGRI.bWarmupRound && IsGameTypeArena() )
			{
				Spectate(false);
			}
		}
	}
}

// Hook for client to request a respawn from the server.
simulated function RequestRespawn();

// Perform a respawn.
function Respawn()
{
    bPreventRespawn = false;

	if( Role == ROLE_Authority )
	{
		ServerReStartPlayer();
		m_LastLoadoutRequestTime = 0.0f;
	}
}

/*function SwitchCameraToOverwatch()
{
	// This basically prevents respawning as well as flags to show the overwatch cam.
	bPreventRespawn = true;
	ServerPreventRespawn(true);
}*/

function PlayRespawnSoonSound()
{
    PlaySound(SoundCue'AUD_PC_Notifications.Respawn.A_CUE_PC_RespawnSoon', TRUE);
}

/** 
 *  Put things that need to be turned off or checked when a pawn dies here. 
 *  Resetting and death use this to make sure things are cleaned up.
 *  Don't put anything state specific in here though, such as a death music event.
 */
function CleanupGameplayEffectsOnDeath()
{
	local AudioDevice Audio;
	local TrHUD MyTrHud;

	StopLowHealthFX();
	StopRechargeHealthFX();
	if( m_AudioComponentMissileLockingLoop != none )
	{
		m_AudioComponentMissileLockingLoop.FadeOut(1.0,0);
	}

	// Stop any missile seeking sounds.
	ClientSeekingMissileTargetingSelfEvent(2);
	ClientSeekingMissileTargetingSelfEvent(4);

	m_bPressingJetpack = false;
	m_bJumpJet = false;
	m_fRemainingInitiatingJettingTime = 0.0;
	m_bBlink = false;

	// Clear out any cached vehicles.
    m_LastAcknowledgedVehicle = none;

	// Reset messaging update about visitng a station
	m_bLoadoutChangeAlerted = false;

	// We're dead, don't request anything.
	m_bRequestingSki = false;

	// Reset our sound mode.
	Audio = class'Engine'.static.GetAudioDevice();
	if (Audio != None)
	{
		Audio.SetSoundMode('default');
	}

	MyTrHud = TrHUD(myHUD);
	if (MyTrHud != None ) 
	{
		MyTrHud.ClearPromptPanel();
		MyTrHud.ToggleSkiEffect(FALSE, 0);
	}

	TrEndZoom();
}

simulated function OnCrossedOffArenaList();

State Dead
{
    event PlayerTick( float DeltaTime )
    {
        Super.PlayerTick(DeltaTime);
    }

	exec function SpotTarget();

	exec function StartFire( optional byte FireModeNum )
	{
		RequestRespawn();
	}

	simulated function OnCrossedOffArenaList()
	{
		local TrHUD MyTrHud;

		MyTrHud = TrHUD(myHUD);
		if( MyTrHud != None ) 
		{
			MyTrHud.UpdateRespawnText(Strings.OutOfRespawns);
		}
	}

    simulated function BeginState(Name PreviousStateName)
	{
		local TrHUD MyTrHud;
		local class<TrGame> TrGameClass;

		m_bEjectedFromVehicle = false;
		EnableJetpack(false,,true);
		CleanupGameplayEffectsOnDeath();
		
		if (AlienFX != none && EnableAlienFX)
		{
			AlienFX.SetHealth(0);
		}
		
		MyTrHud = TrHUD(myHUD);
		if (MyTrHud != None ) 
		{
			if( IsGameTypeArena() )
			{
				if( TrPlayerReplicationInfo(PlayerReplicationInfo).r_bIsCrossedOffArenaList )
				{
					MyTrHud.UpdateRespawnText(Strings.OutOfTeamRespawns);
					MyTrHud.ShowHUDPlayerSpawning();
				}
				else if( WorldInfo.GRI.Teams[GetTeamNum()].Score == 0 )
				{
					MyTrHud.UpdateRespawnTimer(0);
					MyTrHud.UpdateRespawnText(Strings.TimeUntilRespawn);
					MyTrHud.ShowHUDPlayerSpawning();
				}
			}
			else
			{
			    MyTrHud.UpdateRespawnTimer(0);
				MyTrHud.UpdateRespawnText(Strings.TimeUntilRespawn);
				MyTrHud.ShowHUDPlayerSpawning();
			}

			// Play the damage effect on the hud.
			if( GFxTrHUD(MyTrHud.HudMovie) != none )
			{
				GFxTrHUD(MyTrHud.HudMovie).PlayDamageEffectWithNoDirectionalIndicator(1.0);
			}
		}

		if( Role == ROLE_Authority && !TrGameReplicationInfo(WorldInfo.GRI).bWarmupRound )
		{
			r_fRespawnTime = GetRespawnDelayTotalTime();
			MinRespawnDelay = r_fRespawnTime;
			InitRespawnTimer();
		}

        if( IsLocalPlayerController() )
        {
            // Play death dirge.
            TrClientMusicEvent(0);
        }

		// Tell player how to change classes.
		if( m_HelpTextManager != none )
		{
			m_HelpTextManager.RequestHelpText(HelpText_ChangingClassHowTo);
			m_HelpTextManager.RemoveHelpText(HelpText_ChangingClassHowTo, 7.0, true);
		}

		// Set a timer to respawn if the game mode requires it.
		TrGameClass = class<TrGame>(WorldInfo.GRI.GameClass);
		if( TrGameClass != none && TrGameClass.default.m_fForcedRespawnTime > 0.0 )
		{
			SetTimer(TrGameClass.default.m_fForcedRespawnTime,false,'ForcedRespawnTimer');
		}

		Super.BeginState(PreviousStateName);
	}

	function ForcedRespawnTimer()
	{
		ServerRequestRespawn();
	}

    function FindGoodView()
	{
		local rotator GoodRotation;

		GoodRotation = Rotation;
		GetViewTarget().FindGoodEndView(self, GoodRotation);
		SetRotation(GoodRotation);
	}

    function PlayerMove(float DeltaTime)
	{
		local vector X,Y,Z;
		local rotator DeltaRot, ViewRotation;

		GetAxes(Rotation,X,Y,Z);
		// Update view rotation.
		ViewRotation = Rotation;
		
        // Calculate Delta to be applied on ViewRotation
		DeltaRot.Yaw	= PlayerInput.aTurn;
		DeltaRot.Pitch	= PlayerInput.aLookUp;
		ProcessViewRotation( DeltaTime, ViewRotation, DeltaRot );
		SetRotation(ViewRotation);
		if ( Role < ROLE_Authority ) // then save this move and replicate it
				ReplicateMove(DeltaTime, vect(0,0,0), DCLICK_None, rot(0,0,0));

		if ( !IsTimerActive() || GetTimerCount() > MinRespawnDelay )
		{
			bFrozen = false;
		}

		ViewShake(DeltaTime);
	}

	simulated function RequestRespawn()
	{
		if( !IsTimerActive('UpdateRespawnTimer') )
		{
			ServerRequestRespawn();
		}
	}
	
    simulated function EndState(name NextStateName)
	{
		local TrHUD TrH;

		TrH = TrHUD(myHUD);

		RefreshHUD();
		r_fRespawnTime = 0.0; // Reset. Will be set correctly on the next death.
		m_bLastDeathWasUserSuicide = false;
		m_bViewThroughDeathCamera = false;
		SetBehindView(false);
		ClearTimer('EndDeathCamera');
		ClearTimer('ForcedRespawnTimer');

		if( TrH != none )
		{
			TrH.ClearWhiteout();
		}

		super.EndState(NextStateName);
	}

	// Server was also restarting in super, we don't do that.
	event Timer();
}

event Possess(Pawn aPawn, bool bVehicleTransition)
{
	local TrPawn TrP;
	local TrGame TrG;


	super.Possess(aPawn, bVehicleTransition);

	// Immediately upon spawn (possessing) we want to switch the HUD back to normal.
	RefreshHUD();
	
	if (!bVehicleTransition)
	{
        // Set our begin time here and on inventory stations
        m_BeginPlayedTime = WorldInfo.TimeSeconds;

		// Ensures we bring up our primary on spawn
		EquipPrimary();
        
	    // Reset my streaks since I respawned
        ResetStreaks();

		// Reset the actor that last killed us.
		r_KilledBy = none;
		ClearTimer('SetViewTargetAsOverwatch');

		TrP = TrPawn(aPawn);
		if( TrP != none )
		{
			if( IsGameTypeArena() )
			{
				TrP.GoInvulnerable(5.0);
			}
			else
			{
				TrP.GoInvulnerable(3.0);
			}
		}

		TrG = TrGame(WorldInfo.Game);
		if( TrG != none )
		{
			TrG.OnServerSpawnedPlayer(self);
		}

		// Add determination. This will be applied on next respawn if not cleared out by
		// gameplay, i.e., touching a flag or killing a pawn.
		// BZ 9957: Don't apply determination if our last death was a suicide, or if we are in round warmup. Clear it if we suicided last.
		if (m_bLastDeathWasUserSuicide)
		{
			ClearDetermination();
		}
		else if (!TrG.bWarmupRound)
		{
			AddDetermination();
		}
	}
}

reliable client function RefreshHUD()
{
	if (MyHUD!=None) TrHUD(MyHUD).ShowHUDPlayerAlive();
}

reliable client function bool GetAirVehicleInversion()
{
    // Stub
    return false;
}

reliable server function ServerSetAirVehicleControls(bool bInvert)
{
    // Stub
}

simulated function SetAirVehicleControls(bool bInvert)
{
	// Stub
}

simulated function bool IsInVehicle()
{
	return false;
}

simulated event ClientVehiclePhysUpdated(TrVehicle InVehicle)
{
	if (InVehicle != none)
	{
		ServerVerifyVehiclePhys(WorldInfo.TimeSeconds, InVehicle.Throttle, InVehicle.Steering, InVehicle.Rise, ((Rotation.Yaw & 65535) << 16) + (Rotation.Pitch & 65535), InVehicle.VState.RBState);
	}
}

simulated event ServerVehiclePhysUpdated(TrVehicle InVehicle)
{
	if (InVehicle != none)
	{
		ServerCorrectClientPhys(WorldInfo.TimeSeconds);
	}
}

unreliable server function ServerVerifyVehiclePhys(float Timestamp, float InForward, float InStrafe, float InUp, int View, RigidBodyState InRBState)
{
	local rotator ViewRotation;
	local TrVehicle CurrVehicle;

	// Ignore old moves.
	if (CurrentTimeStamp >= TimeStamp)
	{
		return;
	}

	// Save this move.
	CurrentTimeStamp = TimeStamp;
	ServerTimeStamp = WorldInfo.TimeSeconds;

	// Apply the view difference.
	ViewRotation.Pitch = (View & 65535);
	ViewRotation.Yaw = (View >> 16);
	ViewRotation.Roll = 0;
	SetRotation(ViewRotation);

	// Apply the new client physics.
	CurrVehicle = TrVehicle(Pawn);
	if (CurrVehicle != none)
	{
		CurrVehicle.SetInputs(InForward, InStrafe, InUp);
		CurrVehicle.m_bClientPhysDirty = true;
		CurrVehicle.m_ClientRBState = InRBState;
	}
}

unreliable client function ServerCorrectClientPhys(float Timestamp)
{
	local TrVehicle CurrVehicle;

	// Ignore old moves.
	if (CurrentTimeStamp >= TimeStamp)
	{
		return;
	}

	// Save this move.
	CurrentTimeStamp = TimeStamp;

	// Apply the new server physics.
	CurrVehicle = TrVehicle(Pawn);
	if (CurrVehicle != none)
	{
		CurrVehicle.m_bServerCorrectionForce = true;
	}
}
































reliable server function ServerToggleVehicleJets(bool bEnabled)
{
    ToggleVehicleJets(bEnabled);
}

simulated function ToggleVehicleJets(bool bEnabled)
{
	local TrVehicle CurrentVehicle;

	CurrentVehicle = TrVehicle(Pawn);
	if (CurrentVehicle != None)
	{
        CurrentVehicle.ToggleBoosters(bEnabled);
	}
}

// Player Driving a vehicle.
state PlayerDriving
{
    simulated function BeginState(Name PreviousStateName)
	{
        local bool bInvert;

        // Turn off any jetpacking when getting into a vehicle.
        m_bPressingJetpackButton = FALSE;

		// Set inversion for flight controls.
        bInvert = GetAirVehicleInversion();
		SetAirVehicleControls(bInvert);

		if (TrHUD(MyHUD) != None)
		{
			TrHUD(MyHUD).ToggleSkiEffect(FALSE,0);
		}

		// Force boosting/jetpacks off on vehicles.
		ToggleVehicleJets(false);
        if( Role < Role_Authority )
        {
            ServerToggleVehicleJets(false);
        }

        Super.BeginState(PreviousStateName);
    }

	event EndState(Name NextStateName)
	{
		super.EndState(NextStateName);

		if( PlayerInput != none )
		{
			m_bEjectedFromVehicle = true;
		}
	}

	exec function PressedZoom()
	{
        local TrVehicle_BaseFlying CurrentFlyingVehicle;

		// Auto-flight leveling is only enabled on flying vehicles.
		CurrentFlyingVehicle = TrVehicle_BaseFlying(Pawn);
		if (CurrentFlyingVehicle != None && CurrentFlyingVehicle.m_bCanAutoLevelVehicle)
		{
			c_bPressingZoomButton = true;
            CurrentFlyingVehicle.ServerToggleLevelFlight(true);
        }
		else
		{
			global.PressedZoom();
		}
	}

	exec function ReleasedZoom()
	{
        local TrVehicle_BaseFlying CurrentFlyingVehicle;

		// Auto-flight leveling is only enabled on flying vehicles.
		CurrentFlyingVehicle = TrVehicle_BaseFlying(Pawn);
		if (CurrentFlyingVehicle != None && CurrentFlyingVehicle.m_bCanAutoLevelVehicle)
		{
			c_bPressingZoomButton = false;
            CurrentFlyingVehicle.ServerToggleLevelFlight(false);
        }
		else
		{
			global.ReleasedZoom();
		}
	}

    exec function ToggleJetpack(bool bEnabled, optional bool bJump)
    {
		Global.ToggleJetpack(bEnabled, bJump);
		
		ToggleVehicleJets(bEnabled);
        if( Role < Role_Authority )
        {
            ServerToggleVehicleJets(bEnabled);
        }
    }
    
    // Client has access to playerinput (server does not have valid values)
    reliable client function bool GetAirVehicleInversion()
    {
        return PlayerInput.bInvertAirVehicles;
    }

    // Server is in control of vehicle movement so set its inversion here (if flying)
    reliable server function ServerSetAirVehicleControls(bool bInvert)
    {
		SetAirVehicleControls(bInvert);
    }

	simulated function SetAirVehicleControls(bool bInvert)
	{
        local TrVehicle CurrentVehicle;

		// Replicate the inversion settings to the server.
		if (Role < ROLE_Authority)
		{
			ServerSetAirVehicleControls(bInvert);
		}

		CurrentVehicle = TrVehicle(Pawn);
		if (CurrentVehicle != None && CurrentVehicle.SimObj.Class == class'TrVehicleSimChopper')
		{
            TrVehicleSimChopper(CurrentVehicle.SimObj).SetVehicleControls(bInvert);
		}
	}

	simulated function bool IsInVehicle()
	{
		return true;
	}

	// Set the throttle, steering etc. for the vehicle based on the input provided
	function ProcessDrive(float InForward, float InStrafe, float InUp, bool InJump)
	{
		local TrVehicle CurrentVehicle;

		CurrentVehicle = TrVehicle(Pawn);
		if (CurrentVehicle != None)
		{
			//`log("Forward:"@InForward@" Strafe:"@InStrafe@" Up:"@InUp);
			bPressedJump = InJump;
			CurrentVehicle.SetInputs(InForward, -InStrafe, InUp);
			CheckJumpOrDuck();
		}
	}

	function PlayerMove( float DeltaTime )
	{
		local TrVehicle CurrentVehicle;

		CurrentVehicle = TrVehicle(Pawn);
		if( Pawn == None )
		{
			GotoState('Dead');
			return;
		}

		// update 'looking' rotation
		UpdateRotation(DeltaTime);

		// Process the move locally.
		ProcessDrive(PlayerInput.RawJoyUp, PlayerInput.RawJoyRight, PlayerInput.aUp, bPressedJump);

		// Only send the move to the server if we are a weapon pawn or we don't have improved lag support, if we are driving ClientVehiclePhysUpdated sends the inputs to the server.
		if (Role < ROLE_Authority && ((CurrentVehicle != none && !CurrentVehicle.m_bImprovedLagSupport) || Pawn.IsA('UDKWeaponPawn')))
		{
			ServerDrive(PlayerInput.RawJoyUp, PlayerInput.RawJoyRight, PlayerInput.aUp, bPressedJump, ((Rotation.Yaw & 65535) << 16) + (Rotation.Pitch & 65535));
		}

		bPressedJump = false;
	}
}

// Player riding in a vehicle (has full control of their weapons).
function ProcessRiding(rotator ViewRotation);
unreliable server function ServerRiding(float TimeStamp, int View);

state PlayerRidingInVehicle
{
ignores SeePlayer, HearNoise, Bump;

	function ReplicateMove(float DeltaTime, vector NewAccel, eDoubleClickDir DoubleClickMove, rotator DeltaRot);

	function ProcessRiding(rotator ViewRotation)
	{
		local TrPawn TrP;

        TrP = TrPawn(Pawn);
		if (TrP == none)
		{
			return;
		}

		if (Role == ROLE_Authority)
		{
			// Reset velocity and acceleration.
			TrP.Velocity = vect(0,0,0);
			TrP.Acceleration = vect(0,0,0);

			// Update ViewPitch for remote clients
			TrP.SetRemoteViewPitch(ViewRotation.Pitch);
			TrP.r_RemoteViewYaw = (ViewRotation.Yaw & 65535) >> 8;
		}
	}

	unreliable server function ServerRiding(float TimeStamp, int View)
	{
		local rotator ViewRotation;

		// Ignore old moves.
		if (CurrentTimeStamp >= TimeStamp)
		{
			return;
		}

		// Save this move.
		CurrentTimeStamp = TimeStamp;
		ServerTimeStamp = WorldInfo.TimeSeconds;

		// Unpack the view rotation.
		ViewRotation.Pitch = (View & 65535);
		ViewRotation.Yaw = (View >> 16);
		ViewRotation.Roll = 0;

		// Apply the rotation.
		SetRotation(ViewRotation);
		ProcessRiding(ViewRotation);
	}

	function PlayerMove( float DeltaTime )
	{
		if( Pawn == None )
		{
			GotoState('Dead');
			return;
		}

		UpdateRotation(DeltaTime);

		// Process the riding passenger view.
		if( Role < ROLE_Authority )
		{
			ServerRiding(WorldInfo.TimeSeconds, ((Rotation.Yaw & 65535) << 16) + (Rotation.Pitch & 65535));
		}
		else
		{
			CurrentTimeStamp = Worldinfo.TimeSeconds;
			ServerTimeStamp = worldinfo.TimeSeconds;
			ProcessRiding(Rotation);
		}
	}

	unreliable server function bool ServerUse()
	{
		local TrVehicle CurrentVehicle;

		CurrentVehicle = TrVehicle(Pawn.Base);
		if( CurrentVehicle != None )
		{
			return CurrentVehicle.RidingPawnLeave(CurrentVehicle.GetSeatIndexForController(self), false);
		}

        return FALSE;
	}

	event BeginState(Name PreviousStateName)
	{
		CleanOutSavedMoves();
	}

	event EndState(Name NextStateName)
	{
		CleanOutSavedMoves();

		if( PlayerInput != none )
		{
			m_bEjectedFromVehicle = true;
		}
	}

	simulated function bool IsInVehicle()
	{
		return true;
	}

	exec function SwitchToSeat(byte T)
	{
		local TrPawn TrP;

        TrP = TrPawn(Pawn);
        if( TrP != None )
        {
			if( TrVehicle(TrP.DrivenWeaponPawn.BaseVehicle) != none )
			{
				ServerSwitchToSeat(T, TrVehicle(TrP.DrivenWeaponPawn.BaseVehicle));
			}
        }
	}

	event Rotator LimitViewRotation( Rotator ViewRotation, float ViewPitchMin, float ViewPitchMax )
	{
		local TrPawn TrP;
		local TrVehicle CurrentVehicle;
		local Vector SeatLocation;
		local Rotator SeatRotation;
		local float SeatIndex;

		// Fetch the TrPawn.
		TrP = TrPawn(Pawn);
		if (TrP == none)
		{
			return ViewRotation;
		}

		// Fetch the seat index and current vehicle.
		SeatIndex = TrP.DrivenWeaponPawn.SeatIndex;
		CurrentVehicle = TrVehicle(TrP.DrivenWeaponPawn.BaseVehicle);
		if (CurrentVehicle == none || SeatIndex < 0)
		{
			return ViewRotation;
		}

		// Fetch the seat information.
		CurrentVehicle.Mesh.GetSocketWorldLocationAndRotation(CurrentVehicle.Seats[SeatIndex].SeatSocket, SeatLocation, SeatRotation);

		// Limit the yaw.
		if( CurrentVehicle.Seats[SeatIndex].m_fViewYawLimit != 0.f )
		{
			ViewRotation.Pitch = ViewRotation.Pitch & 65535;
			if( ViewRotation.Yaw > SeatRotation.Yaw + CurrentVehicle.Seats[SeatIndex].m_fViewYawLimit )
			{
				ViewRotation.Yaw = SeatRotation.Yaw + CurrentVehicle.Seats[SeatIndex].m_fViewYawLimit;
			}
			else if( ViewRotation.Yaw < SeatRotation.Yaw - CurrentVehicle.Seats[SeatIndex].m_fViewYawLimit )
			{
				ViewRotation.Yaw = SeatRotation.Yaw - CurrentVehicle.Seats[SeatIndex].m_fViewYawLimit;
			}
		}

		// Limit the pitch.
		ViewRotation.Pitch = ViewRotation.Pitch & 65535;
		if( ViewRotation.Pitch > CurrentVehicle.Seats[SeatIndex].ViewPitchMax &&
			ViewRotation.Pitch < (65535+CurrentVehicle.Seats[SeatIndex].ViewPitchMin) )
		{
			if( ViewRotation.Pitch < 32768 )
			{
				ViewRotation.Pitch = CurrentVehicle.Seats[SeatIndex].ViewPitchMax;
			}
			else
			{
				ViewRotation.Pitch = 65535 + CurrentVehicle.Seats[SeatIndex].ViewPitchMin;
			}
		}

		return ViewRotation;
	}
}

exec function SwitchToCallIn(byte T)
{
	local TrDevice_LaserTargeter LaserTargeter;
	local TrInventoryManager InvMan;
	local TrDevice_AutoFire AutoFireDevice; 

	InvMan = TrInventoryManager(Pawn.InvManager);
	if (Pawn == none || InvMan == none)
		return;

	AutoFireDevice = TrDevice_AutoFire(Pawn.Weapon);
	if( AutoFireDevice != none )
	{
		// Don't allow switching while autofiring.
		return;
	}

	// If we don't have a laser targeter, we don't have a valid call-in, or we are wanting to switch to the current call-in, early abort.
	LaserTargeter = TrDevice_LaserTargeter(GetDeviceByEquipPoint(EQP_LaserTarget));
	if (LaserTargeter == none || !LaserTargeter.IsValidCallIn(T-1) || (LaserTargeter.r_ActiveCallin == (T-1) && LaserTargeter == Pawn.Weapon))
		return;

	// Notify the server of our call-in choice.
	ServerRequestCallInChange(T);

	// Set the active call-in (will be replicated later to confirm, but this is to have the hologram correct initially).
	LaserTargeter.SetActiveCallIn(T-1);

	// Switch to the laser targeter.
	InvMan.SwitchWeaponByEquipPoint(EQP_LaserTarget);
}

reliable server function ServerRequestCallInChange(byte T)
{
	local TrDevice_LaserTargeter LaserTargeter;

	// Set the active call-in.
	LaserTargeter = TrDevice_LaserTargeter(GetDeviceByEquipPoint(EQP_LaserTarget));
	if (LaserTargeter != none)
	{
		LaserTargeter.SetActiveCallIn(T-1);
	}
}

exec function SwitchToSeat(byte T)
{
    local TrPawn TrP;
    local TrVehicle TrV;
    local TrWeaponPawn TrWP;

    TrV = TrVehicle(Pawn);

	if (TrV != none)
	{
		ServerSwitchToSeat(T, TrV);
        return;
	}

    TrWP = TrWeaponPawn(Pawn);

	if (TrWP != none)
	{
        TrV = TrVehicle(TrWP.MyVehicle);

        if (TrV != none)
        {
		    ServerSwitchToSeat(T, TrV);
            return;
        }
	}

    TrP = TrPawn(Pawn);

	if (TrP != none)
	{
        TrV = TrVehicle(TrP.DrivenWeaponPawn.BaseVehicle);

		if (TrV != none)
		{
		    ServerSwitchToSeat(T, TrV);
            return;
		}
	}
	
	ServerSwitchToSeat(T);
}

reliable server function ServerSwitchToSeat(byte T, optional TrVehicle V)
{
    local TrPawn TrP;
    local TrWeaponPawn TrWP;

    if (V != none)
    {
        V.SwitchSeat(T-1, self);
        return;
    }

	if (Pawn == none)
	{
		return;
	}

	V = TrVehicle(Pawn);

    if (V != none)
    {
	    V.SwitchSeat(T-1, self);
        return;
    }

    TrWP = TrWeaponPawn(Pawn);

	if (TrWP != none)
	{
        V = TrVehicle(TrWP.MyVehicle);

        if (V != none)
        {        
		    V.SwitchSeat(T-1, self);
            return;
        }
	}

    TrP = TrPawn(Pawn);

	if (TrP != none)
	{
        V = TrVehicle(TrP.DrivenWeaponPawn.BaseVehicle);

        if (V != none)
        {
		    V.SwitchSeat(T-1, self);
            return;
        }
	}
}

simulated function bool TriggerInteracted()
{
	local TrDevice CurrentDevice, DeviceToSwap;
	local TrGameObjective CurrObjective;
	local TrInventoryManager TrInvManager;
	local TrRepairStation CurrRepair;
	local class<TrDevice> WeaponClass;
	local TR_EQUIP_POINT CurrentEquipPoint;

	// Are we in a game objective volume?
	foreach Pawn.OverlappingActors(class'TrGameObjective', CurrObjective, Pawn.VehicleCheckRadius)
	{
		// Try to upgrade the objective.
		if (CurrObjective.GetTeamNum() == GetTeamNum() && 
			CurrObjective.IsInLOS_Basic(Pawn) && 
			CurrObjective.PerformUpgrade(self))
			return true;
	}

	// Are we in a repair station volume?
	foreach Pawn.OverlappingActors(class'TrRepairStation', CurrRepair, Pawn.VehicleCheckRadius)
	{
		TrInvManager = TrInventoryManager(Pawn.InvManager);
		// We need a valid inventory manager, can't already have the repair tool, and must have LOS.
		if (TrInvManager != none && 
			TrInvManager.HasInventoryOfClass(class'TribesGame.TrDevice_RepairTool') == none && 
			CurrRepair.IsInLOS_Basic(Pawn) && 
			CurrRepair.GetTeamNum() == GetTeamNum())
		{
			CurrentEquipPoint = EQP_Secondary;
			CurrentDevice = TrDevice(Pawn.Weapon);
			if( CurrentDevice != none && CurrentDevice.r_eEquipAt == EQP_Primary )
			{
				CurrentEquipPoint = EQP_Primary;
			}

			// Remove the current secondary weapon.
			DeviceToSwap = TrInvManager.GetDeviceByEquipPoint(CurrentEquipPoint);
			if (DeviceToSwap != none)
			{
				TrInvManager.RemoveFromInventory(DeviceToSwap);

				if (Role == ROLE_Authority)
				{
					DeviceToSwap.Destroy();
				}
			}

			// Load the repair gun.
			WeaponClass = class<TrDevice>(DynamicLoadObject("TribesGame.TrDevice_RepairTool", class'Class'));
			DeviceToSwap = Spawn(WeaponClass);
			if (DeviceToSwap != none)
			{
				// Add the repair gun to inventory, and switch to it.
				TrInvManager.AddInventory(DeviceToSwap, false);
				DeviceToSwap.r_eEquipAt = CurrentEquipPoint;
				Pawn.bNetDirty = true;
				TrInvManager.SwitchWeaponByEquipPoint(CurrentEquipPoint);

				// Signal to the repair station that the repair tool has been ganked.
				CurrRepair.PawnGrabbedRepairTool();

				// Pulse the HUD just like a pickup does.
				ClientPulseHUD(1);

				return true;
			}
		}
	}

	if (Role < ROLE_Authority)
		return false;

	return super.TriggerInteracted();
}

//
//	does the pawn need to go to the inventory station?
//
simulated function bool NeedToVisitInventoryStation()
{
	if (WorldInfo.TimeSeconds - m_LastLoadoutRequestTime < 30 && m_LastLoadoutRequestTime > 0.0f)
		return true;
	if (Pawn!=None && TrDevice(Pawn.Weapon)!=None && TrDevice(Pawn.Weapon).NeedToVisitInventoryStation())
		return true;
	return false;
}

// stores loadout selection in PRI
reliable server function ServerRequestLoadoutChange(class<TrFamilyInfo> FamilyInfo, int Loadout)
{
    local bool bActivate;
	local TrPawn TrP;
	local TrGameReplicationInfo TrGRI;
	local TrPlayerReplicationInfo TrPRI;

    TrP = TrPawn(Pawn);

    if( InTraining() )
	{
		bActivate = true;
	}

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

	if (TrPRI != none && TrGRI != none && TrGRI.r_ServerConfig != none)
	{
		if (TrGRI.IsClassAllowed(m_RequestedTeam, FamilyInfo) && TrPRI.RequestLoadoutChange(FamilyInfo, Loadout))
		{
            if (!r_bNeedTeam) bPreventRespawn = false;

	        r_bNeedLoadout = false;
            bNetDirty = true;

            if (TrP != none && bActivate)
            {
		        TrP.ActivatePendingClass();
            }
		}
	}
}

simulated function int GetVehicleCost(class<TrVehicle> VehicleClass)
{
	local int CreditCost;
	local TrGameReplicationInfo TrGRI;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;

	// Fetch the overridden vehicle cost.
	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
		CreditCost = TrGRI.r_ServerConfig.VehiclePrices[VehicleClass.default.m_VehicleType];
	}

	// Skill/perk
	TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);
	if( TrPRI != none )
	{
		VM = TrPRI.GetCurrentValueModifier();
		if( VM != none )
		{
			CreditCost *= FClamp(1.0 - VM.m_fVehicleCostBuffPct, 0.0, 1.0);
		}
	}

	return CreditCost;
}

function UpdatePaperDoll(class<TrFamilyInfo> FamilyInfo, class<TrDevice> DeviceClass, optional class<TrSkin> SkinClass = none, optional int TeamNum = 0)
{
	local vector CamLoc;
	local Rotator CamRot;

	if( FamilyInfo != none )
	{
		if( m_PaperDoll == none )
		{
			GetPlayerViewPoint(CamLoc, CamRot);
			m_PaperDoll = Spawn(class'TrPaperDollTransient', self,, CamLoc, CamRot,,true);
		}	

		if( m_PaperDoll != none )
		{
			m_PaperDoll.SetHidden(false);
			m_PaperDoll.SetFamilyInfo(FamilyInfo, DeviceClass, SkinClass, PlayerReplicationInfo.GetTeamNum());
		}
	}
	else
	{
		if( m_PaperDoll != none )
		{
			m_PaperDoll.SetHidden(true);
		}
	}
}

function UpdatePaperDoll_Device(class<TrDevice> DeviceClass)
{
	local vector CamLoc;
	local Rotator CamRot;

	if( DeviceClass != none )
	{
		if( m_PaperDoll == none )
		{
			GetPlayerViewPoint(CamLoc, CamRot);
			m_PaperDoll = Spawn(class'TrPaperDollTransient', self,, CamLoc, CamRot,,true);
		}	

		if( m_PaperDoll != none )
		{
			m_PaperDoll.SetWeaponOnlyMesh(DeviceClass);
		}
	}
}

exec function SpawnVehicle(string vehicleClassStr)
{
    RequestBuyVehicle(vehicleClassStr);
}

event RequestBuyVehicle(string vehicleClassStr)
{
	local class<TrVehicle> VehicleClass;
	local int CreditCost;

	if (vehicleClassStr=="")
		return;
	vehicleClassStr = "TribesGame."$vehicleClassStr;
	VehicleClass = class<TrVehicle>(DynamicLoadObject(vehicleClassStr, class'Class'));
	if (VehicleClass==None)
	{
		return;
	}

	// Determine the credit cost.
	CreditCost = InTraining() ? 0 : GetVehicleCost(VehicleClass);

	// can we afford the selected vehicle?
	if( GetCurrentCredits() < CreditCost )
	{
		return;
	}

	ServerRequestSpawnVehicle(VehicleClass);
}

exec function PressedSki(bool bJump)
{
	local TrPawn TrP;
    local TrGameReplicationInfo TrGRI;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none && !TrGRI.r_bSkiEnabled)
    {
        return;
    }

	TrP = TrPawn(Pawn);

	if( Pawn != none )
	{
		if( TrP != none )
		{
			// We are no longer requesting to ski!
			m_bRequestingSki = false;
			TrP.SetSkiing(TRUE, bJump);
			ServerStartSki(bJump);
			m_LastPressedSkiTimeStamp = WorldInfo.TimeSeconds;
			ClearTimer('ReleasedSki');
		    	
			if ( TrHUD(MyHUD) != None )
			{
				TrHUD(MyHUD).ToggleSkiEffect(TRUE, VSize(Pawn.Velocity));
			}
		}
		// If we are in a vehicle, request ski.
		else if (Pawn.IsA('TrVehicle'))
		{
			m_bRequestingSki = true;
		}
	}
}

exec function ReleasedSki()
{
	local TrPawn TrP;
    local TrGameReplicationInfo TrGRI;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none && !TrGRI.r_bSkiEnabled)
    {
        return;
    }

	TrP = TrPawn(Pawn);

	if( TrP != none )
	{
		TrP.SetSkiing(FALSE);
		ServerStopSki();
	}

	// If we release the button, no matter what... don't ski.
	m_bRequestingSki = false;

	if ( TrHUD(MyHUD) != None )
	{
		TrHUD(MyHUD).ToggleSkiEffect(FALSE,0);
	}
}

exec function ToggleSki()
{
	local TrPawn TrP;

 	TrP = TrPawn(Pawn);

	if( TrP != none )
	{
		TrP.SetSkiing(!TrP.r_bIsSkiing);

		if( TrP.r_bIsSkiing )
		{
			PressedSki(false);
		}
		else
		{
			ReleasedSki();
		}
	}
}

exec function DelayReleasedSki()
{
	// If already delaying a ski and another request comes to stop skiing OR if the player has quickly tapped skiing, don't followthrough.
	if( (IsTimerActive('ReleasedSki')) || (WorldInfo.TimeSeconds - m_LastPressedSkiTimeStamp < m_fMinActiveSkiTimeToEnableFollowthough) )
	{
		ReleasedSki();
		ClearTimer('ReleasedSki');
	}
	else
	{
		// Delay the request to release skiing.
		if( m_fSkiFollowthroughTime > 0 )
		{
			SetTimer(m_fSkiFollowthroughTime, false, 'ReleasedSki');
		}
		else
		{
			ReleasedSki();
		}
	}
}

exec function SetBindSkiJet( int Method )
{
	if( Method == 0 )
	{
		ConsoleCommand("setbind XboxTypeS_LeftShoulder GBA_DelaySki");
		ConsoleCommand("setbind XboxTypeS_LeftTrigger GBA_ConsoleJets");
	}
	else
	{
		ConsoleCommand("setbind XboxTypeS_LeftShoulder GBA_ConsoleJets");
		ConsoleCommand("setbind XboxTypeS_LeftTrigger GBA_DelaySki");
	}
}

exec function ToggleShowObjectMarkers()
{
    local TrHUD hud;

    hud = TrHUD(MyHUD);

    if (hud != None)
	{
        hud.bShowObjectives = !hud.bShowObjectives;
    }
}

reliable server function ServerStartSki(bool bJump)
{
	local TrPawn TrP;

    TrP = TrPawn(Pawn);
    if( TrP != None )
    {
		TrP.SetSkiing(TRUE, bJump);
    }
}

reliable server function ServerStopSki()
{
	local TrPawn TrP;

    TrP = TrPawn(Pawn);
    if( TrP != None )
    {
		TrP.SetSkiing(FALSE);
    }
}

reliable client function ClientSetHUD(class<HUD> newHUDType)
{
	local TrPlayerInput TrPI;

	super.ClientSetHUD(newHudType);

	TrPI = TrPlayerInput(PlayerInput);
	if( TrPI != none )
	{
		TrPI.SetHUDTarget(TrHUD(myHUD));
	}
}

exec function SwitchHud()
{
	local class<HUD> NewHUDClass;

	//`log("SWITCHEROO THE HUD "$WorldInfo.GRI.GameClass);
	NewHUDClass = WorldInfo.GRI.GameClass.Default.HUDType;
	if ( UTGFxHUDWrapper(myHUD) == None )
	{
		NewHUDClass = class'TrHud'; //WorldInfo.GRI.GameClass.Default.bTeamGame ? class'TrHUDTeam' : class'TrHUD';
	}
	ClientSetHud(NewHUDClass);
}

simulated function OnKickback(rotator KickbackAim, float KickbackBlendOutTime)
{
    m_rKickbackAim = Normalize(KickbackAim);
    m_fKickbackViewBlendOutTime = KickbackBlendOutTime;
    m_fKickbackViewBlendInTime = 20.f;
    m_fLastKickbackViewTime = WorldInfo.TimeSeconds;
    m_bKickbackBlendingIn = TRUE;
}

simulated event UpdateKickbackDirection(float DeltaTime)
{
    if( Pawn == None || Pawn.Weapon == None )
    {
        return;
    }

    if( m_bKickbackBlendingIn )
    {
        m_rCurrentKickbackDirection.Pitch = FInterpTo(m_rCurrentKickbackDirection.Pitch, m_rKickbackAim.Pitch, DeltaTime, 20.f);
        m_rCurrentKickbackDirection.Yaw = FInterpTo(m_rCurrentKickbackDirection.Yaw, m_rKickbackAim.Yaw, DeltaTime, 20.f);
        m_rCurrentKickbackDirection.Roll = FInterpTo(m_rCurrentKickbackDirection.Roll, m_rKickbackAim.Roll, DeltaTime, 20.f);
        if( vector(m_rCurrentKickbackDirection) dot vector(m_rKickbackAim) > 0.999 )
        {
            // Blend in complete.
            m_bKickbackBlendingIn = FALSE;
        }
    }
    else if( Pawn.Weapon != none )
    {
        if( !Pawn.Weapon.IsFiring() && m_rCurrentKickbackDirection != rot(0,0,0) )
        {
            m_rCurrentKickbackDirection.Pitch = FInterpTo(m_rCurrentKickbackDirection.Pitch, 0.f , DeltaTime, m_fKickbackViewBlendOutTime);
            m_rCurrentKickbackDirection.Yaw = FInterpTo(m_rCurrentKickbackDirection.Yaw, 0.f, DeltaTime, m_fKickbackViewBlendOutTime);
            m_rCurrentKickbackDirection.Roll = FInterpTo(m_rCurrentKickbackDirection.Roll, 0.f, DeltaTime, m_fKickbackViewBlendOutTime);
        }
    }
    else if( m_rCurrentKickbackDirection != rot(0,0,0) )
    {
        m_rCurrentKickbackDirection.Pitch = FInterpTo(m_rCurrentKickbackDirection.Pitch, 0.f , DeltaTime, m_fKickbackViewBlendOutTime);
        m_rCurrentKickbackDirection.Yaw = FInterpTo(m_rCurrentKickbackDirection.Yaw, 0.f, DeltaTime, m_fKickbackViewBlendOutTime);
        m_rCurrentKickbackDirection.Roll = FInterpTo(m_rCurrentKickbackDirection.Roll, 0.f, DeltaTime, m_fKickbackViewBlendOutTime);
    }

    m_rCurrentKickbackDirection = Normalize(m_rCurrentKickbackDirection);
}

function RestoreMoveInput()
{
	ResetPlayerMovementInput();
	ClientRestoreMoveInput();
	if( Pawn != none && Pawn.Physics == PHYS_None )
	{
		Pawn.SetPhysics(PHYS_Walking);
	}
}

reliable client function ClientRestoreMoveInput()
{
	ResetPlayerMovementInput();
	if( Pawn != none && Pawn.Physics == PHYS_None )
	{
		Pawn.SetPhysics(PHYS_Walking);
	}
}

/** Called by client when it has chosen a vehicle it wishes to spawn. */
reliable server function ServerRequestSpawnVehicle(class<TrVehicle> VehicleClass)
{
	local int CreditCost;
    local TrVehicleStation VehicleStation;

	CreditCost = GetVehicleCost(VehicleClass);

    VehicleStation = TrVehicleStation(m_CurrentStation);
    if( VehicleStation != None )
    {
        if( VehicleStation.RequestSpawnVehicle(VehicleClass.default.m_VehicleType) )
        {
			// charge for the purchase
			if( !InTraining() )
			{
				ModifyCredits(-CreditCost);
			}
        }
    }
}

simulated function bool PerformedUseAction()
{
	// BZ 7921: Fixed "use" button showing vehicle or inventory menus... this is no longer needed.
	// if inside a vehicle station, load vehicle menu
	/*if (m_CurrentStation!=None)
	{
		if (m_CurrentStation.IsA('TrVehicleStation'))
		{
			TrHUD(MyHUD).ToggleVehicleMenu();
			return true;
		}

		if (m_CurrentStation.IsA('TrInventoryStation'))
		{
			TrHUD(MyHUD).ToggleDeployableMenu();
			return true;
		}
	}*/

    return Super.PerformedUseAction();
}

simulated event EZoomState GetZoomedState()
{
	if ( GetFOVAngle() != DefaultFOV )
	{
		if ( GetFOVAngle() == DesiredFOV )
		{
			return ZST_Zoomed;
		}

		return ( GetFOVAngle() < DesiredFOV ) ? ZST_ZoomingOut : ZST_ZoomingIn;
	}
	return ZST_NotZoomed;
}

// User pressed zoom button
exec function PressedZoom()
{
	c_bPressingZoomButton = true;

	if( PlayerInput.bUseToggleZoom )
	{
		// Toggle zoom.
		if( m_ZoomState == ZST_NotZoomed )
		{
			TrStartZoom();
		}
		else
		{
			TrEndZoom();
		}
	}
	else
	{
		TrStartZoom();
	}
}

// User released zoom button.
exec function ReleasedZoom()
{
	c_bPressingZoomButton = false;

	if( !PlayerInput.bUseToggleZoom )
	{
        TrEndZoom();
	}
}

exec function MagnifyZoom()
{
	local MaterialInstanceConstant ZoomMIC;
    local TrDevice dev;

	if( m_ZoomState != ZST_NotZoomed && !m_bZoomMagnified )
	{
		dev = TrDevice(Pawn.Weapon);
		if (dev != none && dev.m_ZoomInSoundCue != none)
		{
			PlaySound(dev.m_ZoomInSoundCue, true);
		}

		if (m_ZoomedEffect != none && m_ZoomedEffect.Material != none)
		{
			ZoomMIC = MaterialInstanceConstant(m_ZoomedEffect.Material);
			if (ZoomMIC != none)
			{
				ZoomMIC.SetScalarParameterValue('ZoomLevel', 1.0f);
			}
		}

		m_bZoomMagnified = true;
		StartZoom(m_fDesiredMagnifiedZoomFOV, m_fZoomRate);
	}
}

exec function DemagnifyZoom()
{
	local MaterialInstanceConstant ZoomMIC;
    local TrDevice dev;

	if( m_ZoomState != ZST_NotZoomed && m_bZoomMagnified )
	{
		dev = TrDevice(Pawn.Weapon);
		if (dev != none && dev.m_ZoomOutSoundCue != none)
		{
			PlaySound(dev.m_ZoomOutSoundCue, true);
		}

		if (m_ZoomedEffect != none && m_ZoomedEffect.Material != none)
		{
			ZoomMIC = MaterialInstanceConstant(m_ZoomedEffect.Material);
			if (ZoomMIC != none)
			{
				ZoomMIC.SetScalarParameterValue('ZoomLevel', 0.0f);
			}
		}

		m_bZoomMagnified = false;
		StartZoom(m_fDesiredZoomFOV, m_fZoomRate);
	}
}

// For when we need to end zoom regardless of the toggle, like if a deployable is brought out
function ReleaseZoom()
{
    TrEndZoom();
}

// Call this when we want to poll if the user is pressing the zoom button for for some reason is not
// zoomed (i.e., if a reload caused the zoom to zoom out).
function CheckZoomButton()
{
	if( c_bPressingZoomButton && m_ZoomState == ZST_NotZoomed )
	{
		PressedZoom();
	}
}

exec function TrStartZoom()
{
	local bool bCanZoom;
    local TrDevice TrDev;
	local TrPawn TrP;
	local TrVehicleWeapon TrVW;
    
	if( pawn == none ) return;
    
	// ML: Disabled the timestamp based zoom.
    //c_fZoomButtonPressedTimeStamp = WorldInfo.TimeSeconds;

	// If we are a device, can we zoom?
	TrDev = TrDevice(Pawn.Weapon);
	if( TrDev != none )
	{
		bCanZoom = TrDev.CanViewZoom();

		if( TrDev.r_bIsReloading && TrDev.m_bEndZoomOnReload )
		{
			bCanZoom = false;
		}
	}

	// If we are a vehicle weapon, can we zoom?
	TrVW = TrVehicleWeapon(Pawn.Weapon);
	if (TrVW != none && !bCanZoom)
	{
		bCanZoom = TrVW.CanViewZoom();
	}

	// We can't zoom, abort.
	if (!bCanZoom)
	{
		return;
	}

    //check whether currently zoomed, if so, comes out zoom
    if (GetZoomedState() == ZST_NotZoomed)
    {
		StartZoom(m_bZoomMagnified ? m_fDesiredMagnifiedZoomFOV : m_fDesiredZoomFOV, m_fZoomRate);
		
        // Tell server we're now zoomed (bypass the zooming in/out).
		m_ZoomState = ZST_Zoomed;
        ServerSetZoom(ZST_Zoomed);
        
        if (TrDev != None)
        {
			// Tell device that it is zoomed.
			TrDev.StartZoom(self);
			TrDev.SetAltReticule();
        }

		if (TrVW != none)
		{
			// Tell vehicle weapon that it is zoomed.
			TrVW.StartZoom(self);
			TrVW.SetAltReticule();
		}

		// Hide the mesh.
		TrP = TrPawn(Pawn);
		if (TrP != none)
		{
			TrP.SetFirstPersonBodyVisibility(true);
		}

		m_bReturnTo3PAfterZoom = bBehindView;

		// Disable behind-view for zooming.
		if (bBehindView)
		{
			ServerSetBehindView(false);
		}
    }
    else
    {
        //current zoomed in/out, just stop zoom
        TrEndZoom();
    }

	ResetZoomDuration(true);
}

exec function TrStopZoom()
{
    //button click or button hold?
	// ML: Disabled the timestamp based zoom.
	/*
    if ((WorldInfo.TimeSeconds - c_fZoomButtonPressedTimeStamp) < 0.3f)
    {
        return;
    }*/
        
    //generic zoom
    TrEndZoom();
}

simulated function TrEndZoom()
{
	local bool bReturnTo3P;
    local TrDevice TrDev;
	local TrPawn TrP;
	local TrVehicleWeapon TrVW;

	bReturnTo3P = (m_ZoomState != ZST_NotZoomed && m_bReturnTo3PAfterZoom) || bBehindView;

	// Make sure the zoom overlay is off.
	if( m_ZoomedEffect != none )
	{
		m_ZoomedEffect.bShowInGame = false;
		m_ZoomedEffect = none;
	}

    EndZoom();

	// Tell server we're done zooming.
	ServerSetZoom(ZST_NotZoomed);
	m_ZoomState = ZST_NotZoomed;

	if( Pawn != none )
	{
		TrDev = TrDevice(Pawn.Weapon);
		if (TrDev != None)
		{
			// Tell device that it is no longer zoomed.
			TrDev.EndZoom(self, bReturnTo3P);
			TrDev.ResetAltReticule();
		}

		TrVW = TrVehicleWeapon(Pawn.Weapon);
		if (TrVW != none)
		{
			// Tell vehicle weapon that it is no longer zoomed.
			TrVW.EndZoom(self, bReturnTo3P);
			TrVW.ResetAltReticule();
		}
	}

    ResetZoomDuration(false);

	// If we aren't returning to behind-view mode, unhide the mesh.
	TrP = TrPawn(Pawn);
	if (TrP != none)
	{
		TrP.SetFirstPersonBodyVisibility(bReturnTo3P);
	}

	if (bReturnTo3P != bBehindView)
	{
		ServerSetBehindView(bReturnTo3P);
		m_bReturnTo3PAfterZoom = false;
	}
}

simulated function ResetZoomDuration(optional bool bPlayRechargeSoundOnWeapon)
{
	local TrDevice_SniperRifle SniperRifle;

	if( Pawn == none )
	{
		return;
	}

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		c_fHUDZoomDuration = 0;

		SniperRifle = TrDevice_SniperRifle(Pawn.Weapon);
		if( SniperRifle != none ) 
		{
			if( bPlayRechargeSoundOnWeapon && m_ZoomState != ZST_NotZoomed )
			{
				SniperRifle.PlayScopeRechargeSound();
			}
			else
			{
				SniperRifle.StopScopeRechargeSound();
			}
		}
	}
}

reliable server function ServerSetZoom(EZoomState NewZoomState)
{
	// Set the timestamp to the actual time if zoomed, otherwise set to -1.
	m_ZoomState = NewZoomState;
}

reliable client event ReceiveLocalizedMessage( class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	// Wait for player to be up to date with replication when joining a server, before stacking up messages
	if ( WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.GRI == None )
		return;

    super.ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

reliable client event ReceiveLocalizedNagMessage(class<LocalMessage> Message, int Switch, optional float Time = 2.0f)
{
	// Wait for player to be up to date with replication when joining a server, before stacking up messages
	if ( WorldInfo.NetMode == NM_DedicatedServer || WorldInfo.GRI == None )
		return;

    if (Message != None && Switch >= 0)
    {
		TrHUD(myHUD).AddToPromptPanelTime(Message.static.GetString(Switch), Time, GC_APT_NORMAL);
    }
}

simulated event Destroyed()
{
	local TrDeployable TrDeploy;
	local TrProjectile TrProj;

	// Destroy all deployables I own.
	foreach DynamicActors(class'TrDeployable', TrDeploy)
	{
		if (TrDeploy.m_Controller == self)
		{
			TrDeploy.r_Health = -1;
			TrDeploy.bNetDirty = true;
			TrDeploy.OnHealthChanged(true);
		}
	}

	// Destroy all projectiles I own.
	foreach DynamicActors(class'TrProjectile', TrProj)
	{
		if (TrProj.InstigatorController == self)
		{
			TrProj.DetonateObsolete();
		}
	}

	Super.Destroyed();

	if (m_MusicManager != None)
	{
		m_MusicManager.Destroy();
	}

	if( m_Announcer != none )
	{
		m_Announcer.Destroy();
	}
}
 
unreliable client function TrClientMusicEvent(int EventIndex)
{
	if ( m_MusicManager != None )
		m_MusicManager.MusicEvent(EventIndex);
}

// This is called every time the client has spawned with a new pawn.
reliable client function ClientRestart(Pawn NewPawn)
{
	local TrPawn TrP;

    Super.ClientRestart(NewPawn);

    // Player has restarted.
    TrClientMusicEvent(1);

	if( m_HelpTextManager != none )
	{
		if( !m_bSkiHelpTextThresholdReached )
		{
			m_HelpTextManager.RequestHelpText(HelpText_SkiingHowTo);
		}

		if( !m_bJetpackHelpTextThresholdReached )
		{
			m_HelpTextManager.RequestHelpText(HelpText_JetpackHowTo);
		}
	}

	TrP = TrPawn(NewPawn);
	if( TrP != none )
	{
		// Update team blockers.
		TrP.UpdateTeamBlockerMaterials();
	}
}

reliable client function UpdateClientSpawnTimer()
{
	/*local TrHUD TrH;

	//TrH = TrHUD(myHUD);
    
    ClearTimer('InitHUDObjects');

	if (m_nClientSpawnTimeRemaining > 0)
	{
		/*if (TrH!=None) TrH.UpdateRespawnText("Time Until Spawn");
		if (TrH!=None) TrH.UpdateRespawnTimer(m_nClientSpawnTimeRemaining);

		SetTimer(1.0,false,'UpdateClientSpawnTimer');
		m_nClientSpawnTimeRemaining--;*/
	}
	else if (MainMenuIsOpen())
	{
		/*TrH.UpdateRespawnTimer(0);
		TrH.UpdateRespawnText("");
		SetTimer(1.0,false,'UpdateClientSpawnTimer');*/
	}
	else
	{
        ClearTimer('InitHUDObjects');
		TrH.UpdateRespawnTimer(0);
		bPreventRespawn = false;
		ServerPreventRespawn(false);
	}*/
}

function GameHasEnded(optional Actor EndGameFocus, optional bool bIsWinner)
{
	// and transition to the game ended state
	GotoState('RoundEnded');
	ClientGameEnded(EndGameFocus, bIsWinner);
}

state RoundEnded
{
	event BeginState(Name PreviousStateName)
	{
		local TrPawn TrP;

		EnableJetpack(false,,true);

		// The match has ended, end vehicle jets.
		ToggleVehicleJets(false);
		if (Role < ROLE_Authority)
		{
			ServerToggleVehicleJets(false);
		}

		if( m_AudioComponentMissileLockingLoop != none )
		{
			m_AudioComponentMissileLockingLoop.FadeOut(1.0,0);
		}

		// Stop any sounds the player has.
		TrP = TrPawn(Pawn);
		if (TrP != none)
		{
			TrP.StopLocalEffectsAndSounds();
		}

		CleanupGameplayEffectsOnDeath();

		// Go into the game-over sound mode.
		MatchEndSoundMode();

		// Stop health effect sounds.
		StopLowHealthFX();
		StopRechargeHealthFX();

		// Stop any missile seeking sounds.
		ClientSeekingMissileTargetingSelfEvent(2);
		ClientSeekingMissileTargetingSelfEvent(4);

		// Clear out any help text.
		if (myHUD != none)
		{
			TrHUD(myHUD).ClearHelpText();
		}

        /*m_RoundEndedPPInterpSpeed = 2.0f;
		m_RoundEndedPPTarget = 1.0f;
		m_RoundEndedPPAlpha = 0;*/

		super.BeginState(PreviousStateName);
	}

	event PlayerTick( float DeltaTime )
    {
		/*local TrHUD HUD;

		HUD = TrHUD(MyHUD);
		if( HUD != none && m_RoundEndedME != none )
		{
			m_RoundEndedME.bShowInGame = !(HUD.bIsMainMenuOpen);
		}*/

        Super.PlayerTick(DeltaTime);
    }

	function EndState( Name NextStateName )
	{
		/*if( m_RoundEndedME != none )
		{
			m_RoundEndedME.bShowInGame = false;
		}*/

		super.EndState(NextStateName);
	}

	function SetViewTarget(Actor NewViewTarget, optional ViewTargetTransitionParams TransitionParams)
	{
		local Controller C;

		// Don't allow us to attempt to view ourself.
		C = Controller(NewViewTarget);
		if( C != none )
		{
			return;
		}
		super.SetViewTarget(NewViewTarget, TransitionParams);
	}

	exec function SpotTarget();

	function bool AllowHelpTextToDisplay()
	{
		return false;
	}

	function FindGoodView()
	{
	}

	function PlayerMove(float DeltaTime)
	{
		ViewShake(DeltaTime);

		bPressedJump = false;

		if (Role < ROLE_Authority)
		{
		    ReplicateMove(DeltaTime, vect(0,0,0), DCLICK_None, rot(0,0,0));
		}
	}
}

function CheckJumpOrDuck()
{
	if ( Pawn == None )
	{
		return;
	}
    else if ( bPressedJump )
	{
		Pawn.DoJump( bUpdating );
	}
}

reliable client function ClientGameEnded(optional Actor EndGameFocus, optional bool bIsWinner)
{
	if ( (PlayerReplicationInfo != None) && !PlayerReplicationInfo.bOnlySpectator )
		PlayWinMessage( bIsWinner );

	ClientEndZoom();

	GotoState('RoundEnded');

    TrClientMusicEvent(bIsWinner ? 4: 5);
}









reliable server function ServerDropFlag()
{
	// Do not allow flag dropping in rabbit.
	if( WorldInfo.GRI.GameClass == class'TrGame_TRRabbit' )
	{
		return;
	}
	super.ServerDropFlag();
}

simulated event GetPlayerViewPoint( out vector POVLocation, out Rotator POVRotation )
{
	local float DeltaTime;
	local UTPawn P;
	local CameraShakeInstance CSI;
	local TPOV POV;
	local int i;

	// Book-end this function with the same caching found in UTPlayerController::GetPlayerViewPoint().
	P = IsLocalPlayerController() ? UTPawn(CalcViewActor) : None;
	if (LastCameraTimeStamp == WorldInfo.TimeSeconds
		&& CalcViewActor == ViewTarget
		&& CalcViewActor != None
		&& CalcViewActor.Location == CalcViewActorLocation
		&& CalcViewActor.Rotation == CalcViewActorRotation
		)
	{
		if ( (P == None) || ((P.EyeHeight == CalcEyeHeight) && (P.WalkBob == CalcWalkBob)) )
		{
			// use cached result
			POVLocation = CalcViewLocation;
			POVRotation = CalcViewRotation;
			return;
		}
	}

	DeltaTime = WorldInfo.TimeSeconds - LastCameraTimeStamp;

	super.GetPlayerViewPoint(POVLocation, POVRotation);

	if( m_CameraShake != none && WorldInfo.NetMode != NM_DedicatedServer )
	{
		for( i=0;i<m_CameraShake.ActiveShakes.Length;i++ )
		{
			CSI = m_CameraShake.ActiveShakes[i];
			m_CameraShake.UpdateCameraShake(DeltaTime, CSI, POV);
			m_CameraShake.ActiveShakes[i] = CSI;
			POVRotation += POV.Rotation;
			POVLocation += POV.Location >> Rotation;
		}

		for( i=0;i<m_CameraShake.ActiveShakes.Length;i++ )
		{
			CSI = m_CameraShake.ActiveShakes[i];
			if( CSI.OscillatorTimeRemaining == 0.f )
			{
				m_CameraShake.ActiveShakes.Remove(i,1);
			}
		}
	}

	POVRotation += m_rCurrentKickbackDirection;

	// Book-end this function with the same caching found in UTPlayerController::GetPlayerViewPoint().
	// cache result
	CalcViewActor = ViewTarget;
	if (ViewTarget != none)
	{
		CalcViewActorLocation = ViewTarget.Location;
		CalcViewActorRotation = ViewTarget.Rotation;
	}
	CalcViewLocation = POVLocation;
	CalcViewRotation = POVRotation;
}

exec function ActivateFreeCam()
{
	if( Pawn != none && !Pawn.IsFirstPerson() )
	{
		bFreeCamera = true;
	}
}

exec function DeactivateFreeCam()
{
	bFreeCamera = false;
}

simulated function SetViewTargetAsOverwatch(optional bool bForce = false)
{
	local CameraActor CA;

	if( bForce || Pawn == none || Pawn.IsInState('Dying') )
	{
		// OR with the team number here in case the player switched, we want their camera to swap as well
		if (m_OverwatchCam == none || GetTeamNum() != m_OverwatchTeam)
		{
			foreach AllActors(class'CameraActor', CA)
			{
				if (WorldInfo.GRI != none && WorldInfo.GRI.GameClass == class'TrGame_TRRabbit' && TrCamera_Rabbit(CA) != None)
				{
					break;
				}
				else if (GetTeamNum() == 0 && TrCamera_BloodEagle(CA) != None)
				{
					break;
				}
				else if (GetTeamNum() == 1 && TrCamera_DiamondSword(CA) != None)
				{
					break;
				}
				else if( TrCamera_Neutral(CA) != none )
				{
					break;
				}   
				// Backup camera in case LDs have not placed a neutral camera.
				else if( GetTeamNum() == 255 && TrCamera_BloodEagle(CA) != none )
				{
					break;
				}
			}

			m_OverwatchTeam = GetTeamNum();
			m_OverwatchCam = CA;
		}

		if (m_OverwatchCam != None && ViewTarget != m_OverwatchCam)
		{
			SetViewTarget(m_OverwatchCam);

			if (myHUD != none)
				TrHUD(myHUD).Fade(1, 0.5, 0.15);
		}
	}
}

exec function PlayCameraShake(optional name ShakeName, optional float Scale = 1.0, optional CameraShake SourceShake)
{
	local int i;

	if( ShakeName == '' && SourceShake == none )
	{
		return;
	}

	// If a specific shake wasn't specified, search for one in our m_CameraShakes list.
	if( SourceShake == none )
	{
		for( i = 0; i < m_CameraShakes.Length; i++ )
		{
			if( ShakeName == m_CameraShakes[i].ShakeName )
			{
				SourceShake = m_CameraShakes[i].Shake;
				break;
			}
		}
	}

	if( SourceShake != none )
	{
		if( m_CameraShake == none )
		{
			m_CameraShake = new class'TrCameraModifier_CameraShake';
		}

		m_CameraShake.AddCameraShake(SourceShake, Scale);
	}
}

/**
 * Tells the client to play a waveform for the specified damage type
 *
 * @param FFWaveform The forcefeedback waveform to play
 * @param FFWaveformInstigator the actor causing the waveform to play
 */
reliable client event ClientPlayForceFeedbackWaveform(ForceFeedbackWaveform FFWaveform,optional Actor FFWaveformInstigator)
{
	if (PlayerInput != None && !PlayerInput.bUsingGamepad )
	{
		return; // don't play forcefeedback if gamepad isn't being used
	}

	if( ForceFeedbackManager != None && PlayerReplicationInfo != None && IsForceFeedbackAllowed() )
	{
		ForceFeedbackManager.PlayForceFeedbackWaveform(FFWaveform,FFWaveformInstigator);
	}
}

function UpdateSpeedCameraEffect(bool bEnabled)
{
	if( bEnabled )
	{
		if( m_SpeedCameraEffect != none && !m_SpeedCameraEffect.bCurrentlyActive )
		{
			m_SpeedCameraEffect.ParticleSystemComponent.ActivateSystem();
			m_SpeedCameraEffect.bCurrentlyActive = true;
		}
	}
	else
	{
		if( m_SpeedCameraEffect != none && m_SpeedCameraEffect.bCurrentlyActive )
		{
			m_SpeedCameraEffect.ParticleSystemComponent.DeactivateSystem();
			m_SpeedCameraEffect.bCurrentlyActive = false;
		}
	}
}

exec function SpeedCamEffect(bool bEnabled)
{
	UpdateSpeedCameraEffect(bEnabled);
}

/** Plays an effect on the camera that brightens the screen for a moment. */
unreliable client function ClientPulseHUD(byte Reason)
{
	local float PulseAmount, PulseSpeed;

	switch( Reason )
	{
		case 0: // Flag grab.
			PulseAmount = 1.0;
			PulseSpeed = 2.0;
			break;
		case 1: // Ammo pickup.
			PulseAmount = 1.0;
			PulseSpeed = 4.0;
			break;
		case 2: // CaH point captured.
			PulseAmount = 1.0;
			PulseSpeed = 2.0;
			break;
	}
	
	if (EnableAlienFX && AlienFX != none)
	{
		AlienFX.Objective();
	}

	TrHUD(MyHUD).PulsePickupFlashEffect(PulseAmount, PulseSpeed);
}

function PulseShield()
{
	if (myHUD != none)
	{
		TrHUD(MyHUD).PulseShieldEffect();
	}
}

function AddTimePlayed()
{
    local int i;
    local int timePlayed;
    local TrDevice TrD;
    local class<TrDevice> deviceClass;
    local TrInventoryManager TrIM;
    local TrPlayerReplicationInfo TrPRI;

    if (Role == ROLE_AUTHORITY)
	{
        if (Stats != none && m_BeginPlayedTime > 0)
        {
            timePlayed = WorldInfo.TimeSeconds - m_BeginPlayedTime;
            m_BeginPlayedTime = -1;

            Stats.UpdateTimePlayed(self, timePlayed);

            TrPRI = TrPLayerReplicationinfo(PlayerReplicationInfo);

            if (TrPRI != none)
            {
                if (Pawn != none)
                {
                    TrIM = TrInventoryManager(Pawn.InvManager);
                }

                for (i = EQP_Melee; i < EQP_MAX; i++)
                {
                    if (TrIM != none)
                    {
                        TrD = TrIM.GetDeviceByEquipPoint(TR_EQUIP_POINT(i));
                    }

                    deviceClass = TrPRI.GetEquipDevice(TrPRI.GetCurrentClass(), TR_EQUIP_POINT(i));

                    if (deviceClass != none)
                    {
                        if (TrD != none)
                        {
                            Stats.UpdateWeapon(self, deviceClass.default.DBWeaponId, deviceClass.default.DBXPActivityId, TrD.m_ShotsFired, timePlayed);
                            TrD.UpdateShotsFired(true);
                        }
                        else
                        {
                            Stats.UpdateWeapon(self, deviceClass.default.DBWeaponId, deviceClass.default.DBXPActivityId, 0, timePlayed);
                        }
                    }
                }
            }
        }
        else
        {
            ;
        }
	}
}

// Called when the Controller possesses the pawn.
function AcknowledgePossession(Pawn P)
{
	local TrPawn TrP;
	local class<TrGame_TrRabbit> RabbitGame;
	local TrGameReplicationInfo GRI;
	local TrPlayerReplicationInfo TrPRI;

	super.AcknowledgePossession(P);

	if( Role < ROLE_Authority )
	{
		ServerSetAllowSimProjectiles(m_bAllowSimulatedProjectiles);
	}

	TrP = TrPawn(P);

	if( TrP != none ) // Only fade if we are possessing a pawn.
	{
		// Only do the fade if we are possessing a new pawn (not repossessing the one from before driving a vehicle)
		if( m_LastAcknowledgedVehicle == none && myHUD != none ) 
		{
			TrHUD(myHUD).Fade(1, 0.2, 0.0);
		}
	}
	else
	{
		if (P != none && P.IsA('TrWeaponPawn'))
			m_LastAcknowledgedVehicle = TrVehicle(TrWeaponPawn(P).MyVehicle);
		else
			m_LastAcknowledgedVehicle = TrVehicle(P);
	}

	if( TrP != none )
	{
		TrPRI = TrPlayerReplicationInfo(TrP.PlayerReplicationInfo);
		if( TrPRI != none )
		{
			m_OldPossessedFamilyInfo = class<TrFamilyInfo>(TrPRI.CharClassInfo);
		}
	}

	if( TrP != none && TrP.IsLocallyControlled() )
	{
		if( TrP.m_AudioComponentSpeedSound == none )
		{
			TrP.m_AudioComponentSpeedSound = CreateAudioComponent(SoundCue'AUD_PC_Movement.Speed.A_CUE_PC_Speed_1P');
			TrP.m_AudioComponentSpeedSound.bShouldRemainActiveIfDropped = true;
		}

		if( m_SpeedCameraEffect == none && m_bEnableCameraSpeedEffect )
		{
			m_SpeedCameraEffect = Spawn(class'TrEmitCameraEffect_Speed', self);
			m_SpeedCameraEffect.RegisterCamera(self);
		}

		RabbitGame = class<TrGame_TrRabbit>(WorldInfo.GRI.GameClass);
		if( RabbitGame != none )
		{
			// We're in a rabbit match.
			GRI = TrGameReplicationInfo(WorldInfo.GRI);
			if( GRI != none )
			{
				if( GRI.m_CurrentRabbitPRI != none )
				{
					// Kill the rabbit!
					ReceiveLocalizedMessage( class'TrRabbitScoreMessage', 8, PlayerReplicationInfo);
				}
				else
				{
					// Get to the flag!
					ReceiveLocalizedMessage( class'TrRabbitScoreMessage', 9, PlayerReplicationInfo);
				}
			}
		}
	}
}

simulated function MatchEndSoundMode()
{
	/*local AudioDevice Audio;

	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

	Audio = class'Engine'.static.GetAudioDevice();

	if (Audio != None)
	{
		Audio.SetSoundMode('TR_MatchEnd');
	}*/
}

simulated function ResetSoundMode()
{
	local AudioDevice Audio;

	if (WorldInfo.NetMode == NM_DedicatedServer)
	{
		return;
	}

	Audio = class'Engine'.static.GetAudioDevice();

	if (Audio != None)
	{
		Audio.SetSoundMode('Default');
	}
}

// Suppress the tip of the help text queue.
exec function SuppressHelpText()
{
	local EHelpTextType TypeToRemove;

	if( m_HelpTextManager != none && m_HelpTextManager.m_HelpTextQueue.Length > 0 )
	{
		TypeToRemove = m_HelpTextManager.m_HelpTextQueue[0];
		m_HelpTextManager.RemoveHelpText(TypeToRemove);
		m_HelpTextManager.SuppressHelpText(TypeToRemove);
	}
}

function bool AllowHelpTextToDisplay()
{
	return true;
}

function bool ChooseBloodEagle()
{
	if( WorldInfo.GRI.GameClass != class'TrGame_TRRabbit' )
	{
		return ServerRequestPickTeam(0);
	}

    return false;
}

function bool ChooseDiamondSword()
{
	if( WorldInfo.GRI.GameClass != class'TrGame_TRRabbit' )
	{
		return ServerRequestPickTeam(1);
	}

    return false;
}

function TalkVGS(string Command)
{
	local Console PlayerConsole;
	local LocalPlayer LP;

	LP = LocalPlayer( Player );
	if( ( LP != None ) && ( LP.ViewportClient.ViewportConsole != None ) )
	{
		PlayerConsole = LocalPlayer( Player ).ViewportClient.ViewportConsole;
		PlayerConsole.ConsoleCommand("Say"@Command);
	}
}

exec function Say(string Msg)
{
	// Limit chat to 128 characters.
	Msg = Left(Msg, 128);
    
    if (IsPlayerCommand(Msg))
    {
        return;
    }

	if (AllowTextMessage(Msg))
	{
		// Send the message.
		if (!BroadcastChatMessage(GC_CC_INSTANCE, Msg))
			super.Say(Msg);
	}
}

function bool IsPlayerCommand(string Msg)
{
    local TrGameEngine Eng;
    
    if (left(Msg,1) == "/")
    {
        Eng = TrGameEngine(class'Engine'.static.GetEngine());        
        if (Eng != none)
        {
            Eng.HandlePlayerCommandInput(Msg,self);
            return true;
        }        
    }

    return false;
}

event ShowFeedbackMessage(string Message)
{
    local TrHud hud;

    hud = TrHud(MyHud);
    if(hud != None)
    {
        hud.SendLocalMessageToGlobalAlert(Message);
    }
}

function bool BroadcastChatMessage(GC_CHAT_CHANNEL Channel, string Message)
{
	local OnlineSubSystem OnlineSystem;
	local OnlineChatInterface ChatInterface;

	// Fetch the online system.
	OnlineSystem = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSystem == none)
		return false;

	// Do we have a valid in-game chat interface?
	ChatInterface = OnlineSystem.ChatInterface;
	if (ChatInterface == none)
		return false;

    //PlaySound(SoundCue'Aud_menu.ChatMessage_Sent.A_CUE_UI_ChatMessage_Sent_1', true);

	// Send the chat message.
	ChatInterface.SendChatMessage(Channel, Message);

	return true;
}

function bool SendPrivateChatMessage(string PlayerName, string Message)
{
    local OnlineSubSystem OnlineSystem;
	local OnlineChatInterface ChatInterface;

	// Fetch the online system.
	OnlineSystem = class'GameEngine'.static.GetOnlineSubsystem();
	if (OnlineSystem == none)
		return false;

	// Do we have a valid in-game chat interface?
	ChatInterface = OnlineSystem.ChatInterface;
	if (ChatInterface == none)
		return false;

    //PlaySound(SoundCue'Aud_menu.ChatMessage_Sent.A_CUE_UI_ChatMessage_Sent_1', true);

	// Send the chat message.
	ChatInterface.SendPrivateChatMessage(PlayerName, Message);

	return true;
}


function color GetChatColor(GC_CHAT_CHANNEL Channel, optional bool bSameTeam = false, optional out int ChatColorIdx)
{
    if (Channel == GC_CC_INSTANCE)
	{
		if (bSameTeam)
		{		
            ChatColorIdx = class'TrHUD'.default.FriendlyChatColorIdx;
            return class'TrHUD'.default.FriendlyChatColor;
		}
		else
		{			
            ChatColorIdx = class'TrHUD'.default.EnemyChatColorIdx;
            return class'TrHUD'.default.EnemyChatColor;
		}
        
	}
	else if (Channel == GC_CC_LOCAL_TEAM)
	{		
        ChatColorIdx = class'TrHUD'.default.FriendlyChatColorIdx;
        return class'TrHUD'.default.FriendlyChatColor;        
	}
    else if (Channel == GC_CC_PERSONAL)
    {
        ChatColorIdx = class'TrHUD'.default.WhisperChatColorIdx;
        return class'TrHUD'.default.WhisperChatColor;
    }
    
    ChatColorIdx = class'TrHUD'.default.InfoChatColorIdx;
    return class'TrHUD'.default.WhiteColor;    
}

event AddChatToConsole(string Sender, string ChatMessage, GC_CHAT_CHANNEL Channel)
{
    local TrGameViewportClient ViewportClient;
	local LocalPlayer LP;
    local string outputstr;

	LP = LocalPlayer( Player );
	if (LP != none)
	{
		ViewportClient = TrGameViewportClient(LP.ViewportClient);
		if (ViewportClient != none)
		{            
            if(Channel == GC_CC_LOCAL_TEAM)
            {
                outputstr = Sender$"> [Team]"@ChatMessage;  //todo localize
            }
            else
            {
                outputstr = Sender$">"@ChatMessage;
            }
     
            ViewportClient.ChatConsole.OutputText(outputstr, GetChatColor(Channel));
		}
	}
}

native function string GetLastTellSender();

exec function ReplyTalk()
{
    local TrGameViewportClient ViewportClient;
	local LocalPlayer LP;
    local string replystr;

	LP = LocalPlayer( Player );
	if (LP != none)
	{
		ViewportClient = TrGameViewportClient(LP.ViewportClient);
		if (ViewportClient != none)
		{
            if(CanCommunicate())
            {
                replystr = GetLastTellSender();
                if(replystr != "")
                {
                    replystr = "@"$replystr@"";
                }
			    ViewportClient.ChatConsole.StartTypingChat("Say",false,replystr);
            }            
		}
	}
}

exec function Talk()
{
	local TrGameViewportClient ViewportClient;
	local LocalPlayer LP;

	LP = LocalPlayer( Player );
	if (LP != none)
	{
		ViewportClient = TrGameViewportClient(LP.ViewportClient);
		if (ViewportClient != none)
		{
            if(CanCommunicate())
            {
			    ViewportClient.ChatConsole.StartTypingChat("Say");
            }
            else
            {
                ViewportClient.ChatConsole.StartTyping("Command");
            }
		}
	}
}

// Same as UTPlayerController's, we just have to duplicate it here because some moron thought it should be private instead of protected.
simulated private function bool CanCommunicate()
{
	if ( (OnlineSub != None) && (OnlineSub.PlayerInterface != None) && (LocalPlayer(Player) != None) )
	{
		return ( OnlineSub.PlayerInterface.CanCommunicate(LocalPlayer(Player).ControllerId) != FPL_Disabled && !bServerMutedText );
	}

	// assume we are allowed to talk unless the online layer specifically says we cannot
	return !bServerMutedText;
}

exec function ChatConsole(bool bTeam = false)
{
    local LocalPlayer LP;
    local TrGameViewportClient ViewportClient;

	LP = LocalPlayer(Player);
	if (LP != none)
	{
		ViewportClient = TrGameViewportClient(LP.ViewportClient);

		if (ViewportClient != none && LP.ViewportClient.ViewportConsole != None)
		{
            LP.ViewportClient.ViewportConsole.GotoState( '' );
        }
    }
    
    TalkConsole(bTeam);
}

event TalkConsole(bool bTeam)
{
	local LocalPlayer LP;
    local TrChatConsole PlayerConsole;
	local TrGameViewportClient ViewportClient;

	LP = LocalPlayer(Player);

	if (LP != none)
	{
		ViewportClient = TrGameViewportClient(LP.ViewportClient);

		if (ViewportClient != none)
		{
            PlayerConsole = TrGameViewportClient(LP.ViewportClient).ChatConsole;

            if (PlayerConsole != none)
            {
                if (bTeam)
                {
                    PlayerConsole.StartTypingChat("TeamSay", true);
                }
                else
                {
                    PlayerConsole.StartTypingChat("Say", true);
                }
            }
		}
	}
}

exec function TeamTalk()
{
	local TrGameViewportClient ViewportClient;
	local LocalPlayer LP;

	LP = LocalPlayer( Player );
	if (LP != none)
	{
		ViewportClient = TrGameViewportClient(LP.ViewportClient);
		if (ViewportClient != none)
		{
            if(CanCommunicate())
            {
			    ViewportClient.ChatConsole.StartTypingChat("TeamSay");
            }
            else
            {
                ViewportClient.ChatConsole.StartTyping("Command");
            }
		}
	}
}

exec function TeamSay(string Msg)
{
	// Limit chat to 128 characters.
	Msg = Left(Msg, 128);

	if (AllowTextMessage(Msg))
	{
		// Send the message.
		if (!BroadcastChatMessage(GC_CC_LOCAL_TEAM, Msg))
			super.TeamSay(Msg);
	}
}

function bool AllowTextMessage(string Msg)
{
	if( m_fSpamLockoutTimeStamp != 0.0 && WorldInfo.TimeSeconds - m_fSpamLockoutTimeStamp < m_fLockoutFromSpamTime )
	{
		// We are in a lockout. Don't allow more messages until lockout is expired.
		WarnPlayerAboutSpam();
		return false;
	}

	if( m_fLastBroadcastTimes.Length == 0 )
	{
		// Nothing to compare for spam, so allow the message.
		m_fLastBroadcastTimes.AddItem(WorldInfo.TimeSeconds);
		LastBroadcastTime = WorldInfo.TimeSeconds;
		return true;
	}

	if( WorldInfo.TimeSeconds - m_fLastBroadcastTimes[m_fLastBroadcastTimes.Length-1] > m_fMessageSpamTime )
	{
		// The last message was beyond the spam time, clear out the list and allow it.
		m_fLastBroadcastTimes.Remove(0, m_fLastBroadcastTimes.Length);

		m_fLastBroadcastTimes.AddItem(WorldInfo.TimeSeconds);
		LastBroadcastTime = WorldInfo.TimeSeconds;
		return true;
	}
	else
	{
		// This message is considered possible spam.
		if( m_fLastBroadcastTimes.Length >= m_fMaxBroadcastSpamCount )
		{
			// The message is spam. Don't allow it to broadcast and lockout chat.
			m_fSpamLockoutTimeStamp = WorldInfo.TimeSeconds;
			WarnPlayerAboutSpam();
			return false;
		}
		else
		{
			// Register this message's timestamp, but allow the message to broadcast.
			m_fLastBroadcastTimes.AddItem(WorldInfo.TimeSeconds);
			LastBroadcastTime = WorldInfo.TimeSeconds;
			return true;
		}
	}
}

function WarnPlayerAboutSpam()
{
	TrHud(MyHud).SendLocalMessageToChat("FLOOD PROTECTION: You must wait another"@FCeil(m_fLockoutFromSpamTime - (WorldInfo.TimeSeconds - m_fSpamLockoutTimeStamp))@"seconds.");
}

exec function BeginVGS()
{
    local TrPlayerInput TrPI;

    TrPI = TrPlayerInput(PlayerInput);

	if (TrPI != none)
	{
		TrPI.StartVGS();
	}
}

exec function SpotTarget()
{
	local class<TrGame_TrRabbit> RabbitGame;

	RabbitGame = class<TrGame_TrRabbit>(WorldInfo.GRI.GameClass);
	if( RabbitGame == none )
	{
		if( m_fLastSpotTargetTime + 3.0 < WorldInfo.TimeSeconds )
		{
			if( TrPlayerInput(PlayerInput) != none )
			{
				if( TrPlayerInput(PlayerInput).PlaySpottedCommand() )
				{
					// Remember last spotted time.
					m_fLastSpotTargetTime = WorldInfo.TimeSeconds;

					// Clear out associated help text.
					if( m_HelpTextManager != none )
					{
						m_HelpTextManager.ClearSpotTargetReminderTimer();
					}
				}
			}
		}
	}
}

/** Temp method for changing the voice on characters. */



















/** The local owner of this controller is requesting a VGS command. */
reliable server function ServerRequestVGSContextCommand(EVGSContextActor ContextActor, EVGSContextLocation ContextLocation, bool bEnemyLocation, Actor SpottedActor )
{
	local TrBroadcastHandler TrBroadcast;

	TrBroadcast = TrBroadcastHandler(WorldInfo.Game.BroadcastHandler);
	if( TrBroadcast != none )
	{
		TrBroadcast.TeamBroadcastVGSContextCommand(PlayerReplicationInfo, ContextActor, ContextLocation, bEnemyLocation);
		TrBroadcast.OnActorSpotted(SpottedActor);
	}
}

/** The local owner of this controller is requesting a VGS command. */
reliable server function ServerRequestVGSCommand(VGSCommandType VGSCommandIndex, bool bGlobal)
{
	local TrBroadcastHandler TrBroadcast;

	TrBroadcast = TrBroadcastHandler(WorldInfo.Game.BroadcastHandler);
	if( TrBroadcast != none )
	{
		if( bGlobal )
		{
			TrBroadcast.GlobalBroadcastVGSCommand(PlayerReplicationInfo, VGSCommandIndex);
		}
		else
		{
			TrBroadcast.TeamBroadcastVGSCommand(PlayerReplicationInfo, VGSCommandIndex);
		}
	}
}

reliable client function ClientReceiveVGSCommand(PlayerReplicationInfo PRI, VGSCommandType VGSCommandIndex)
{
	local TrPlayerInput TrPI;
	local TrPlayerReplicationInfo TrPRI;
    local string VGSString;
    local TrVGSCommand vgsCmd;
    local TrHUD trHud;

	TrPI = TrPlayerInput(PlayerInput);
	TrPRI = TrPlayerReplicationInfo(PRI);

    //`log("Received VGS:"$TrPI.m_VGSCommandList.m_CommandList[VGSCommandIndex].ChatString);
    
    if( TrPI != none && TrPRI != none )
	{
        if(IsChatFiltered(TrPRI.PlayerName))
        {
            return;
        }

        if ( TrPRI.r_VoiceClass != none )
        {
		    TrPRI.r_VoiceClass.static.PlaySoundEx(VGSCommandIndex, self, PRI);
        }

        trHUD = TrHUD(myHUD);
        if(trHUD != None)
        {            
            vgsCmd = TrPI.m_VGSCommandList.m_CommandList[VGSCommandIndex];
            VGSString = vgsCmd.KeyBindPath@vgsCmd.ChatString;		
            trHUD.ChatMessageReceived(vgsCmd.VGSScope == VGSScope_Global ? GC_CC_INSTANCE : GC_CC_LOCAL_TEAM, TrPRI.PlayerName, VGSString);            
        }
	}
}

reliable client function ClientReceiveVGSContextCommand(PlayerReplicationInfo PRI, EVGSContextActor ContextActor, EVGSContextLocation ContextLocation, bool bEnemyLocation )
{
	local TrPlayerInput TrPI;
	local TrPlayerReplicationInfo TrPRI;

	TrPI = TrPlayerInput(PlayerInput);
	TrPRI = TrPlayerReplicationInfo(PRI);

	if( TrPI != none && TrPRI != none && TrPRI.r_VoiceClass != none )
	{
		TrPRI.r_VoiceClass.static.PlaySoundContext(self, ContextActor, ContextLocation, bEnemyLocation, PRI);
	}
}

exec function ShowMoveErrors(bool bEnabled)
{
	bDebugClientAdjustPosition = bEnabled;
}

event OnSkiHelpTextDistanceThresholdReached()
{
	m_bSkiHelpTextThresholdReached = true;
	if( m_HelpTextManager != none )
	{
		m_HelpTextManager.RemoveHelpText(HelpText_SkiingHowTo);
	}
}

event OnJetpackHelpTextDistanceThresholdReached()
{
	m_bJetpackHelpTextThresholdReached = true;
	if( m_HelpTextManager != none )
	{
		m_HelpTextManager.RemoveHelpText(HelpText_JetpackHowTo);
	}
}

function LoadPlayerProfile()
{
    local TgPlayerProfile profile;
    local OnlineSubsystemMcts Mcts;
    local TrPlayerReplicationInfo TrPRI;

    Mcts = OnlineSubsystemMcts(OnlineSub);

    if (Mcts == none) return;

    profile = new class'TgPlayerProfile';
    
    if (!Mcts.ReadPlayerProfileData(PlayerReplicationInfo.UniqueId.Uid, profile))
    {
        // We failed to get the profile... keep trying until we get it since
        // it can be slow to post the player info to the game server
        SetTimer(1.0f, false, 'LoadPlayerProfile');
        return;
    }

    if (profile == none) return;

    s_nNewPlayerAssistPoints = profile.AssistPoints;

    TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

    if (TrPRI == none) return;

    //TrPRI.SetPlayerGP(profile.Tokens);
    TrPRI.SetPlayerXP(profile.XPLevel);

    if (Stats != none) Stats.SetXP(self, profile.XPLevel);

    // Just in case we need to reupdate the rank icon
    InitHUDObjects();
}

function float GetNewPlayerAssistAmount()
{
	return FClamp(float(s_nNewPlayerAssistPoints) / s_nMaxNewPlayerAssistPoints, 0.0, 1.0);
}

function UpdateNewPlayerAssistPoints(int AmoutToSubtract)
{
    local OnlineSubsystemMcts Mcts;
    local TgPlayerProfile     profile;

    if (s_nNewPlayerAssistPoints <= 0)
    {
        return;
    }

	// For some reason, Clamp() wasn't working!
	s_nNewPlayerAssistPoints -= AmoutToSubtract;
	if( s_nNewPlayerAssistPoints < 0 )
	{
		s_nNewPlayerAssistPoints = 0;
	}
	else if( s_nNewPlayerAssistPoints > s_nMaxNewPlayerAssistPoints )
	{
		s_nNewPlayerAssistPoints = s_nMaxNewPlayerAssistPoints;
	}

	Mcts = OnlineSubsystemMcts(OnlineSub);

    if (Mcts != none && PlayerReplicationInfo != none)
    {
        profile = new class'TgPlayerProfile';
        profile.AssistPoints = AmoutToSubtract;
        Mcts.WritePlayerProfileData(PlayerReplicationInfo.UniqueId.Uid, profile);
    }
}

// Invalid for now. We will try just using one value for mitigation and protection
/*
function float GetNewPlayerAssistTakeDamageMultiplier()
{
	return s_fNewPlayerAssistMitigateTakeDamageMultiplier * GetNewPlayerAssistAmount();
}*/

function float GetNewPlayerAssistToApply()
{
	return ((s_fNewPlayerAssistMitigateCauseDamageMultiplier - 1.0) * GetNewPlayerAssistAmount()) + 1.0;
}

// REMOVE THESE BEFORE SHIPPING!






















exec function BehindView()
{
	// If we are zoomed, ignore 3P toggles.
	if (GetZoomedState() != ZST_NotZoomed)
	{
		m_bReturnTo3PAfterZoom = !m_bReturnTo3PAfterZoom;
		return;
	}

	if( TrPlayerPawn(Pawn) != none )
	{
		ServerSetBehindView(!bBehindView);
	}
}

function ServerSetBehindView(bool bNewBehindView)
{
	bBehindView = bNewBehindView;
	if ( !bBehindView )
	{
		bFreeCamera = false;
	}

	if (LocalPlayer(Player) == None)
	{
		ClientSetBehindView(bNewBehindView);
	}
	else if (UTPawn(ViewTarget) != None)
	{
		UTPawn(ViewTarget).SetThirdPersonCamera(bNewBehindView);
	}
}

reliable client function ClientSetBehindView(bool bNewBehindView)
{
	if (LocalPlayer(Player) != None)
	{
		SetBehindView(bNewBehindView);
	}
}

/** 
 *  Player input class on the TrPlayerController dffers from the front-end user
 *  so we have to manually manipulate the engine level settings for use and
 *  reconfiguring while we are in-game. Must be done on the player controller
 *  as PlayerInput classes may not be instantiated without a PC outer.
 */
function PlayerInput GetEngineSettings(optional bool bUse = false)
{
    local PlayerInput EngineInput;
    
    EngineInput = new (self) class'Engine.PlayerInput';

    if (bUse)
    {
        PlayerInput.Bindings = EngineInput.Bindings;
        PlayerInput.MouseSensitivity = EngineInput.MouseSensitivity;
        PlayerInput.FlyingPitchSensitivity = EngineInput.FlyingPitchSensitivity;
        PlayerInput.FlyingYawSensitivity = EngineInput.FlyingYawSensitivity;
        PlayerInput.bInvertMouse = EngineInput.bInvertMouse;
        PlayerInput.bInvertAirVehicles = EngineInput.bInvertAirVehicles;
        PlayerInput.bEnableMouseSmoothing = EngineInput.bEnableMouseSmoothing;
        PlayerInput.bUseToggleZoom = EngineInput.bUseToggleZoom;

        SetFOV(PlayerInput.FOVSetting);
    }

    return EngineInput;
}
function TrPlayerInput_Spectator GetSpectatorSettings()
{
    local TrPlayerInput_Spectator SpecInput;

    SpecInput = new (self) class'TrPlayerInput_Spectator';

    return SpecInput;
}

/** Called when a motion sensor wants to sound an alarm. */
reliable client function ClientOnMotionSensorAlarmSounded(TrDeployable_MotionSensor MotionSensor)
{
	ReceiveLocalizedMessage( class'TrSensorMessage', 0, PlayerReplicationInfo);
	MotionSensor.TriggerHUDAlarm();
}
reliable client function ClientOnMotionSensorMineSounded()
{
	ReceiveLocalizedMessage( class'TrSensorMessage', 1, PlayerReplicationInfo);
}

/** Preloads the content for a pending loadout. */
function LoadPendingLoadoutContentData(int ClassId, int Loadout)
{
    local int i;
	local class<TrDevice> DeviceClass;

	m_PendingLoadoutDeviceClasses.Remove(0,m_PendingLoadoutDeviceClasses.Length);
	m_CachedPendingClassDeviceContentData.Remove(0,m_CachedPendingClassDeviceContentData.Length);

	for (i = 0; i < EQP_MAX; i++)
    {
		DeviceClass = m_TrInventoryHelper.GetEquipClass(m_TrEquipInterface.GetActiveEquipId(ClassId,i,Loadout));
		if( DeviceClass != none )
		{
			LoadPendingDeviceContentData(DeviceClass);
		}
    }
}

/** Preloads a specific weapon class. */
function LoadPendingDeviceContentData(class<TrDevice> DeviceClass)
{
	if( DeviceClass != none )
	{
		// Remember the class we are beginning to preload. This allows us to 'check it off the list'
		// when it gets loaded.
		if( m_PendingLoadoutDeviceClasses.Find(DeviceClass) == INDEX_NONE )
		{
			m_PendingLoadoutDeviceClasses.AddItem(DeviceClass);
		}
		c_ContentLoader.StartLoadingDeviceContentPackage(DeviceClass);
	}
}

reliable client function bool RegisterPendingClass(int ClassId, int Loadout)
{
	local TrGameReplicationInfo TrGRI;
	local class<TrFamilyInfo> ClassFamilyInfo;
	local TrHUD TrH;

    if (ClassId < 0) 
    {
        ClassId = GetUserSelectedClass();
    }

	ClassFamilyInfo = GetFamilyInfoFromId(ClassId);
	
	if (ClassFamilyInfo == none)
	{
		return false;
	}

	TrH = TrHUD(myHUD);
	
    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);
	if (TrGRI != none && TrGRI.r_ServerConfig != none)
	{
		if (!TrGRI.IsClassAllowed(m_RequestedTeam, ClassFamilyInfo))
		{
            TrH.m_GFxHud.UpdateChatLog(Caps(ClassFamilyInfo.default.FriendlyName)@"DENIED - LOCKED BY SERVER", class'TrHUD'.default.InfoChatColorIdx, false);
            return false;
		}
	}

    if (!m_TrEquipInterface.IsClassOwned(ClassId) && !InTraining())
    {
        TrH.m_GFxHud.UpdateChatLog("CLASS LOCKED - "@Caps(ClassFamilyInfo.default.FriendlyName), class'TrHUD'.default.InfoChatColorIdx, false);
        return false;
    }
    
	// Load the content for our pending loadout.
	LoadPendingLoadoutContentData(ClassId, Loadout);
	ServerRequestLoadoutChange(ClassFamilyInfo, Loadout);

    // Show user in chat log that their pending class has changed
	if( TrH != none )
	{
        if (m_bShowHUDChat) TrH.m_GFxHud.ShowChatLog();
        else TrH.m_GFxHud.HideChatLog();

        if (InTraining())
        {
            TrH.m_GFxHud.UpdateChatLog(Caps(Strings.Testing)@Caps(Strings.TrClass)@"-"@Caps(ClassFamilyInfo.default.FriendlyName)@"("$m_TrEquipInterface.GetLoadoutName(ClassId, Loadout)$")", class'TrHUD'.default.InfoChatColorIdx, false);
        }
        else if (IsDead() || IsWaiting())
        {
            TrH.m_GFxHud.UpdateChatLog(Caps(Strings.SpawningAs)@"-"@Caps(ClassFamilyInfo.default.FriendlyName)@"("$m_TrEquipInterface.GetLoadoutName(ClassId, Loadout)$")", class'TrHUD'.default.InfoChatColorIdx, false);
        }
        else
        {
		    TrH.m_GFxHud.UpdateChatLog(Caps(Strings.Pending)@Caps(Strings.TrClass)@"-"@Caps(ClassFamilyInfo.default.FriendlyName)@"("$m_TrEquipInterface.GetLoadoutName(ClassId, Loadout)$")", class'TrHUD'.default.InfoChatColorIdx, false);
        }
	}

    // Only give our station message if we have an actual change
    if( !IsDead() )
    {
		if( m_HelpTextManager != none )
		{
			m_HelpTextManager.RequestHelpText(HelpText_ChangingClassDescription);
			m_HelpTextManager.RemoveHelpText(HelpText_ChangingClassDescription, 7.0, true);
		}
    }

    return true;
}

simulated function class<TrFamilyInfo> GetFamilyInfoFromId(int ClassId)
{
    local int i;
    local class<TrFamilyInfo> FamilyInfo;
    local class<TrFamilyInfoList> InfoList;

	InfoList = class<TrFamilyInfoList>(DynamicLoadObject("TribesGame.TrFamilyInfoList", class'Class'));
	if (InfoList == none)
		return none;

    for (i = 0; i < InfoList.default.ClassList.Length; i++)
    {
	    FamilyInfo = class<TrFamilyInfo>(DynamicLoadObject("TribesGame."$InfoList.default.ClassList[i], class'Class'));

        if (FamilyInfo.default.ClassId == ClassId) return FamilyInfo;
    }

    return none;
}

simulated event HideHUDElements()
{
    local TrHUD TrH;
    
    TrH = TrHUD(myHUD);
    
    if (TrH != none)
    {
        TrH.HideHUDElements(false, false);
    }
}

reliable client function ClientShowFlagIcon(bool bShow)
{
	if (myHUD != none)
	{
		if (bShow) GfxTrHud(TrHUD(myHUD).HudMovie).ShowFlagCarried();
		else GfxTrHud(TrHUD(myHUD).HudMovie).HideFlagCarried();
	}
}

reliable client function ClientSetPlayerClassObjects(string ClassName, int PerkIcon1, int PerkIcon2)
{
    TrHUD(myHUD).SetPlayerClassObjects(ClassName, PerkIcon1, PerkIcon2);
}

reliable client function UpdatePotentialSeekingTargets(array<Actor> NewPotentialTargets)
{
	local Actor A; 
	local int i;

	while( m_PotentialSeekingTargets.Length > 0 )
	{
		A = m_PotentialSeekingTargets[0];
		if( A != none && NewPotentialTargets.Find(A) == -1 )
		{
			// Old potential target is not in the new target list.
			A.m_bPotentialSeekingTarget = false;
		}
		m_PotentialSeekingTargets.Remove(0,1);
	}

	for( i=0; i<NewPotentialTargets.Length; i++ )
	{
		m_PotentialSeekingTargets.AddItem(NewPotentialTargets[i]);

		NewPotentialTargets[i].m_bPotentialSeekingTarget = true;
	}
}

event bool NotifyHitWall(vector HitNormal, actor Wall)
{
	local TrPawn TrP;

	TrP = TrPawn(Pawn);
	if( TrP != none && TrStation(Wall) == none ) // Don't take splat damage from a station.
	{
		TrP.TakeFallingDamage();
		TrP.m_bSplattedAgainstWall = true;
	}
	return true;
}

event NotifyFallingHitWall(vector HitNormal, actor Wall)
{
	local TrPawn TrP;

	TrP = TrPawn(Pawn);
	if( TrP != none && TrStation(Wall) == none) // Don't take splat damage from a station.
	{
		TrP.TakeFallingDamage();
		TrP.m_bSplattedAgainstWall = true;
	}
}




















function Spectate(bool bNeutral)
{
    if (!bNeutral)
    {
        r_bNeedTeam = false;
    }

    bPreventRespawn = true;
    r_bNeedLoadout = false;
	m_bShowSpectatorHUD = true;
	m_bShowSpectatorControls = true;
	ServerSpectate(bNeutral);
}

function EndSpectate();

reliable client function ClientSpectate(bool bNeutral)
{
    local TrHUD TrH;

	if( bNeutral )
	{
		GotoState('NeutralRovingSpecate');

        TrH = TrHUD(myHUD);

        if (TrH != none && TrH.TeamSelectionMenuMovie != none)
	    {
		    TrH.TeamSelectionMenuMovie.CompleteMovie(false);
	    }
	}
	else
	{
		GotoState('ArenaTeamSpectate');
	}
}

reliable server function ServerSpectate(bool bNeutral)
{
	if( TrGame(WorldInfo.Game).CanEnterSpectate(self, bNeutral) )
	{
        bPreventRespawn = true;
		r_bNeedLoadout = false;

		ServerSuicide();

		// When a player spectates, destroy all of their deployables and projectiles.
		DestroyAllOwnedDeployables();
		DestroyAllOwnedProjectiles();

		if( bNeutral )
		{
			GotoState('NeutralRovingSpecate');
		}
		else
		{
		    r_bNeedTeam = false;
			GotoState('ArenaTeamSpectate');
		}
		ClientSpectate(bNeutral);
	}
}

unreliable server function ServerViewFlags(int dir);
unreliable server function ServerViewFlagStands(int dir);
unreliable server function ServerViewGenerators(int dir);
unreliable server function ServerViewBookmark(int dir);
unreliable server function ServerViewVehicles(int dir);
unreliable server function ServerViewFastestPlayer();
unreliable server function ServerViewActor(Actor ActorToView);
unreliable client function ClientOnViewTargetChange(actor NewViewTarget);
reliable server function ServerIncreaseCamDistance(int Amount);
reliable server function ServerDecreaseCamDistance(int Amount);
reliable server function ServerSetMoveSpeed(float NewSpeed);
function OnViewTargetCapturedFlag(TrFlagCTF NewFlagToWatch);
function OnViewTargetFlagReturned();
function OnViewTargetDroppedFlag(TrFlagBase NewFlagToWatch);
function OnViewTargetLeftVehicle(PlayerReplicationInfo NewPRIToWatch);
simulated function GetViewTargetList(optional out TrPawn PawnViewTarget, optional out TrVehicle VehicleViewTarget, optional out TrCamera_SpectatorBookmark BookmarkViewTarget, optional out Actor ObjectiveViewTarget);

function bool InRovingSpectate()
{
    return m_bIsRovingSpectating;
}

state RovingSpectate extends Spectating
{
    ignores SwitchWeapon, BehindView, PrevWeapon, NextWeapon, StartFire, 
    	ServerViewObjective, StartAltFire, PerformedUseAction;

	function BeginState(Name PreviousStateName)
	{
		local vector eyeLoc;
		local rotator eyeRot;
		local CameraActor Cam;
		local TrPowerGenerator Gen;
		local TrCTFBase FlagStand;
		local TrHUD TrH;

		TrH = TrHUD(myHUD);

		m_bIsRovingSpectating = true;

		if( WorldInfo.NetMode != NM_DedicatedServer )
		{
			m_bShowSpectatorHUD = true;

			// Pull the bindings from the spectator input class.
			PlayerInput.Bindings = GetSpectatorSettings().Bindings;

			if( TrH != none )
			{
				// Initialize the spectator HUD.
				TrH.OnSpectate(true);

				// Clear out any help text.
				TrH.ClearHelpText();

				// Clear out the post effects.
				if( TrH.m_GFxHud != none && TrHUD(myHUD).m_GFxHud.m_DirectionalDamageEffect != none )
				{
					TrH.m_GFxHud.m_DirectionalDamageEffect.bShowInGame = false;
					TrH.m_GFxHud.m_bNearDeathOn = false;
					TrH.ClearWhiteout();
				}

				TrH.CreateSpectatorHUDCache();
			}

			// Set the music based on the state of the game.
			if( m_MusicManager != none )
			{
				m_MusicManager.SetStateBasedOnGameState();
			}
		}

		// Start at the current view.
		GetPlayerViewPoint(eyeLoc,eyeRot);
		SetLocation(eyeLoc);
		SetRotation(eyeRot);
		
		if( Role == ROLE_Authority )
		{
			// Start in "roving mode"
			ViewSelf();
		}

		// Clean up stuff that happens when the pawn died.
		ClearTimer('PlayRespawnSoonSound');
		ClearTimer('SwitchToDeathCamera');

		bBehindView = true;

		PlayerCamera = Spawn(class'TrCamera_Spectator', self);
		if( PlayerCamera != none )
		{
			PlayerCamera.InitializeFor(self);
			SetLocation(eyeLoc);
			SetRotation(eyeRot);
			PlayerCamera.SetFOV(GetFOVAngle());
			PlayerCamera.UpdateCamera(0.0);

			ServerUnPossess();
			bPreventRespawn = true;
		}

		// Cache all the camera bookmarks.
		if( m_SpectatorCameraBookmarks.Length > 0 )
		{
			m_SpectatorCameraBookmarks.Remove(0,m_SpectatorCameraBookmarks.Length);
		}
		foreach DynamicActors(class'CameraActor', Cam)
		{
			if( Cam.IsA('TrCamera_SpectatorBookmark') )
			{
				m_SpectatorCameraBookmarks.AddItem(Cam);
			}
		}

		// Cache all the generators.
		if( m_SpectatorGenerators.Length > 0 )
		{
			m_SpectatorGenerators.Remove(0,m_SpectatorGenerators.Length);
		}
		foreach DynamicActors(class'TrPowerGenerator', Gen)
		{
			m_SpectatorGenerators.AddItem(Gen);
		}

		// Cache all the flagstand bookmarks.
		if( m_SpectatorFlagStands.Length > 0 )
		{
			m_SpectatorFlagStands.Remove(0,m_SpectatorFlagStands.Length);
		}
		foreach DynamicActors(class'TrCTFBase', FlagStand)
		{
			m_SpectatorFlagStands.AddItem(FlagStand);
		}

		super.BeginState(PreviousStateName);
	}

	function EndState(Name NextStateName)
	{
		local TrHUD TrH;
		local TrCamera_Spectator SpecCamera;

		TrH = TrHUD(myHUD);

		SpecCamera = TrCamera_Spectator(PlayerCamera);
		if( SpecCamera != none )
		{
			// Make sure any hidden pawns are now visible.
			SpecCamera.ShowHiddenPawn();
		}

		m_bIsRovingSpectating = false;
		bPreventRespawn = false;
		bRun = 0;
		bBehindView = false;

		if( NextStateName != 'RoundEnded' )
		{
			if( WorldInfo.NetMode != NM_DedicatedServer )
			{
				if( TrH != none )
				{                    
                    TrHUD(myHUD).RestoreHUDState();

					// Make sure we don't see any spectator panels.
					TrHUD(myHUD).HideAllSpectatorPanels();

					// Clear the cache out.
					TrH.ClearSpectatorHUDCache();
				}
				
				// Reset the bindings back to normal input mode.
				PlayerInput.Bindings = GetEngineSettings(true).Bindings;
			}
		}

		super.EndState(NextStateName);
	}

	event ServerPlayerTick(float DeltaTime)
	{
		local TrPawn ViewTargetPawn;
		local TrInventoryManager TrIM;
		local TrDevice PrimaryWeapon, SecondaryWeapon, OffhandWeapon;
		local TrDevice_Deployable PackWeapon;
		local TrVehicle ViewTargetVehicle;
		local TrVehicleWeapon TrVW;
		local int i;
		local TrPlayerController TrPC;
		local Vector ViewLoc;
		local Rotator ViewRot;

		GetViewTargetList(ViewTargetPawn, ViewTargetVehicle);
		if( ViewTargetPawn != none )
		{
			r_fViewTargetCurrentPowerpool = ViewTargetPawn.GetCurrentPowerPool();
			r_fViewTargetMaxPowerPool = ViewTargetPawn.GetMaxPowerPool();

			TrPC = TrPlayerController(ViewTargetPawn.Controller);
			if( TrPC != none )
			{   
				TrPC.GetPlayerViewPoint(ViewLoc, ViewRot);
				r_vViewTargetViewLocation = ViewLoc;
				r_rViewTargetViewRotation = ViewRot;
			}

			TrIM = TrInventoryManager(ViewTargetPawn.InvManager);
			if( TrIM != none )
			{
				// Primary weapon.
				PrimaryWeapon = TrIM.GetDeviceByEquipPoint(EQP_Primary);
				r_nViewTargetPrimaryAmmoCount = PrimaryWeapon == none ? 0 : PrimaryWeapon.r_AmmoCount.CarriedAmmoCount + PrimaryWeapon.r_AmmoCount.ClipAmmoCount;
				r_nViewTargetPrimaryMaxAmmoCount = PrimaryWeapon == none ? 0 : int(PrimaryWeapon.GetMaxAmmoCount()) + PrimaryWeapon.m_nMaxCarriedAmmo;
				
				// Secondary weapon.
				SecondaryWeapon = TrIM.GetDeviceByEquipPoint(EQP_Secondary);
				r_nViewTargetSecondaryAmmoCount = SecondaryWeapon == none ? 0 : SecondaryWeapon.r_AmmoCount.CarriedAmmoCount + SecondaryWeapon.r_AmmoCount.ClipAmmoCount;
				r_nViewTargetSecondaryMaxAmmoCount = SecondaryWeapon == none ? 0 : int(SecondaryWeapon.GetMaxAmmoCount()) + SecondaryWeapon.m_nMaxCarriedAmmo;

				// Offhand.
				OffhandWeapon = TrIM.GetDeviceByEquipPoint(EQP_Belt);
				r_nViewTargetOffhandAmmoCount = OffhandWeapon == none ? 0 : OffhandWeapon.r_AmmoCount.CarriedAmmoCount;

				// Pack.
				PackWeapon = TrDevice_Deployable(TrIM.GetDeviceByEquipPoint(EQP_Pack));
				r_nViewTargetPackAmmoCount = PackWeapon == none ? -1 : PackWeapon.AmmoCount;
			}

			// Vehicle Energy
			r_ViewTargetVehicleDriverPRI = none;
			r_ViewTargetVehiclePassengerPRI = none;
			if( ViewTargetVehicle != none )
			{
				r_fViewTargetVehicleCurrentPowerPool = ViewTargetVehicle.m_fCurrentPowerPool;
				r_fViewTargetVehicleMaxPowerPool = ViewTargetVehicle.r_fMaxPowerPool;
			
				for( i = 0; i < ViewTargetVehicle.Seats.Length; i++ )
				{
					TrVW = TrVehicleWeapon(ViewTargetVehicle.Seats[i].Gun);
					if( TrVW != none )
					{
						if( i == 0 )
						{
							r_bViewTargetVehiclePrimaryWeaponReady = !TrVW.r_bIsReloading && !TrVW.IsTimerActive('RefireCheckTimer');
						}
						else if( i > 0 )
						{
							r_bViewTargetVehicleSecondaryWeaponReady = !TrVW.r_bIsReloading && !TrVW.IsTimerActive('RefireCheckTimer');
						}
					}

					if( i == 0 )
					{
						r_ViewTargetVehicleDriverPRI = ViewTargetVehicle.PlayerReplicationInfo;
					}
					else if( i > 0 )
					{
						r_ViewTargetVehiclePassengerPRI = ViewTargetVehicle.PassengerPRI[i];
					}
				}
			}
		}
	}

	/** 
	 *  Returns a list of things we are actively viewing.
	 */
	simulated function GetViewTargetList(optional out TrPawn PawnViewTarget, optional out TrVehicle VehicleViewTarget, optional out TrCamera_SpectatorBookmark BookmarkViewTarget, optional out Actor ObjectiveViewTarget)
	{
		local TrFlagBase Flag;
		local TrCTFBase CTFBase;
		local TrPlayerReplicationInfo TrPRI;
		local TrGameObjective Objective;

		if( ViewTarget == none || ViewTarget == self )
		{
			return;
		}

		// View target is a spectator camera
		BookmarkViewTarget = TrCamera_SpectatorBookmark(ViewTarget);
		if( BookmarkViewTarget != none )
		{
			return;
		}

		// View target is pawn.
		PawnViewTarget = TrPawn(ViewTarget);
		if( PawnViewTarget != none )
		{
			// If pawn is in a vehicle, find the vehicle to view as well.
			if( TrVehicle(PawnViewTarget.DrivenVehicle) != none )
			{
				VehicleViewTarget = TrVehicle(PawnViewTarget.DrivenVehicle);
			}
			else if( TrVehicle(PawnViewTarget.Base) != none && 
				(TrVehicle(PawnViewTarget.Base).PassengerPRI[0] == PawnViewTarget.PlayerReplicationInfo ||
				 TrVehicle(PawnViewTarget.Base).PassengerPRI[1] == PawnViewTarget.PlayerReplicationInfo || 
				 TrVehicle(PawnViewTarget.Base).PassengerPRI[2] == PawnViewTarget.PlayerReplicationInfo || 
				 TrVehicle(PawnViewTarget.Base).PassengerPRI[3] == PawnViewTarget.PlayerReplicationInfo))
			{
				VehicleViewTarget = TrVehicle(PawnViewTarget.Base);
			}

			// If pawn is carrying a flag, set the objective actor viewing.
			TrPRI = PawnViewTarget.GetTribesReplicationInfo();
			if( TrPRI != none )
			{
				ObjectiveViewTarget = TrPRI.GetFlag();
			}
		}
		else
		{
			// View target is flag.
			Flag = TrFlagBase(ViewTarget);
			if( Flag != none )
			{
				ObjectiveViewTarget = Flag;
				if( Flag.HolderPRI != none )
				{
					// Viewing a flag that is held by a pawn.
					PawnViewTarget = TrPawn(Flag.Base);
				}
			}
			else
			{
				// View target is a vehicle.
				VehicleViewTarget = TrVehicle(ViewTarget);
				if( VehicleViewTarget != none )
				{
					if( VehicleViewTarget.Driver != none )
					{
						// Viewing a vehicle with a driver.
						PawnViewTarget = TrPawn(VehicleViewTarget.Driver);
					}
				}
				else
				{
					Objective = TrGameObjective(ViewTarget);
					if( Objective != none )
					{
						ObjectiveViewTarget = Objective;
					}
					else
					{
						CTFBase = TrCTFBase(ViewTarget);
						if( CTFBase != none )
						{
							ObjectiveViewTarget = CTFBase;
						}
					}
				}
			}
		}
	}

	function bool AllowHelpTextToDisplay()
	{
		return false;
	}

	function PlayerMove(float DeltaTime)
	{
		super.PlayerMove(DeltaTime);

		if (WorldInfo.Pauser != None)
		{
			PlayerCamera.UpdateCamera(DeltaTime);
		}
	}

	simulated event GetPlayerViewPoint( out vector out_Location, out Rotator out_Rotation )
	{
		// Use the base PlayerController implementation of GetPlayerViewPoint so we can use cameras properly.
		super(PlayerController).GetPlayerViewPoint(out_Location, out_Rotation);
	}

	exec function ViewPlayerByName(string PlayerName);

	exec function SetLookRightScale(float NewScale)
	{
		PlayerInput.LookRightScale = NewScale;
	}

	exec function SetLookUpScale(float NewScale)
	{
		PlayerInput.LookUpScale = NewScale;
	}

	function SetMoveSpeed(float NewSpeed)
	{
		SpectatorCameraSpeed = fMax(NewSpeed, 100.0);

		if( Role < ROLE_Authority )
		{
			ServerSetMoveSpeed(NewSpeed);
		}
	}

	reliable server function ServerSetMoveSpeed(float NewSpeed)
	{
		SetMoveSpeed(NewSpeed);
	}

	exec function ShowSpectatorHUD()
	{
		m_bShowSpectatorHUD = !m_bShowSpectatorHUD;
		TrHUD(myHUD).OnSpectate(false);
	}

	function EndSpectate()
	{
		ServerRequestRespawn();
	}

	reliable server function ServerRequestRespawn()
	{
		local TrGame TrG;

		TrG = TrGame(WorldInfo.Game);
		if( TrG != none )
		{ 
			if( TrG.AllowRespawn(self) && !r_bNeedLoadout && !r_bNeedTeam)
			{
				SetViewTarget(self);
				Reset();
			}
		}
	}

	exec function IncreaseCamDistance(int Amount)
	{
		local TrCamera_Spectator SpecCamera;
		local TrPawn TrP;
		local bool bIsViewingAVehicle;

		bIsViewingAVehicle = ViewTarget.IsA('TrVehicle');
		if( !bIsViewingAVehicle )
		{
			TrP = TrPawn(ViewTarget);
			bIsViewingAVehicle = TrVehicle(TrP.GetVehicleBase()) != none;
		}

		if( ViewTarget.IsA('TrPawn') || ViewTarget.IsA('TrGameObjective') || ViewTarget.IsA('TrFlagBase') || ViewTarget.IsA('CTFFlagStand') || bIsViewingAVehicle )
		{
			PlayerCamera.FreeCamDistance = FMin(PlayerCamera.FreeCamDistance + Amount, TrCamera_Spectator(PlayerCamera).m_MaxCamDistance);
		}

		SpecCamera = TrCamera_Spectator(PlayerCamera);
		if( SpecCamera != none && SpecCamera.m_bViewFixed3p && PlayerCamera.FreeCamDistance > SpecCamera.m_fMaxFixedViewCamDistance && ViewTarget.IsA('TrPawn') && !bIsViewingAVehicle )
		{
			SpecCamera.FreeCamDistance = SpecCamera.m_fMaxFixedViewCamDistance;
		}

		if( Role < ROLE_Authority )
		{
			ServerIncreaseCamDistance(Amount);
		}
	}

	exec function DecreaseCamDistance(int Amount)
	{
		local TrCamera_Spectator SpecCamera;
		local TrPawn TrP;
		local bool bIsViewingAVehicle;

		bIsViewingAVehicle = ViewTarget.IsA('TrVehicle');
		if( !bIsViewingAVehicle )
		{
			TrP = TrPawn(ViewTarget);
			bIsViewingAVehicle = TrVehicle(TrP.GetVehicleBase()) != none;
		}

		if( ViewTarget.IsA('TrPawn') || ViewTarget.IsA('TrGameObjective') || ViewTarget.IsA('TrFlagBase') || ViewTarget.IsA('CTFFlagStand') || bIsViewingAVehicle )
		{
			PlayerCamera.FreeCamDistance = FMax(PlayerCamera.FreeCamDistance - Amount, TrCamera_Spectator(PlayerCamera).m_MinCamDistance);
		}

		SpecCamera = TrCamera_Spectator(PlayerCamera);
		if( SpecCamera != none && SpecCamera.m_bViewFixed3p && PlayerCamera.FreeCamDistance > SpecCamera.m_fMaxFixedViewCamDistance && ViewTarget.IsA('TrPawn') && !bIsViewingAVehicle )
		{
			SpecCamera.FreeCamDistance = SpecCamera.m_fMaxFixedViewCamDistance;
		}

		if( Role < ROLE_Authority )
		{
			ServerDecreaseCamDistance(Amount);
		}
	}

	reliable server function ServerIncreaseCamDistance(int Amount)
	{
		IncreaseCamDistance(Amount);
	}

	reliable server function ServerDecreaseCamDistance(int Amount)
	{
		DecreaseCamDistance(Amount);
	}

	exec function IncreaseSpeed(float Amount)
	{
		if( ViewTarget == self )
		{
			SetMoveSpeed(Min(SpectatorCameraSpeed + Amount, TrCamera_Spectator(PlayerCamera).m_fMaxSpeed));
		}
	}

	exec function DecreaseSpeed(float Amount)
	{
		if( ViewTarget == self )
		{
			SetMoveSpeed(Max(SpectatorCameraSpeed - Amount, 0));
		}
	}

	function bool IsValidSpectatorFocusTarget(Actor A)
	{
		if( A == none )
		{
			return false;
		}

		if( A.IsA('TrPawn') || A.IsA('TrVehicle') )
		{
			return true;
		}

		return false;
	}

	exec function ViewNextPlayer()
	{
		local TrCamera_Spectator Cam;
		local vector POVLoc, ViewDir, HitLocation, HitNormal, ActorDir;
		local Rotator POVRot;
		local Actor BestContextActor, A;
		local float BestDist, Dist;

		// First try to center in on what the reticule is pointing at, if in roving mode.
		if( ViewTarget == self || ViewTarget == none )
		{
			GetPlayerViewPoint(POVLoc, POVRot);
			ViewDir = Vector(POVRot);

			// Give priority to a valid actor that is directly down sights
			A = Trace(HitLocation, HitNormal, POVLoc + (ViewDir * 10000.0), POVLoc, true,,,TRACEFLAG_Bullet);
			if( IsValidSpectatorFocusTarget(A) )
			{
				BestContextActor = A;
			}

			// Find the closest valid target to the reticule.
			if( BestContextActor == none )
			{
				BestDist = 0.98;
				foreach DynamicActors(class'Actor',A)
				{
					if( IsValidSpectatorFocusTarget(A) )
					{
						ActorDir = Normal(A.Location - POVLoc);
						Dist = ViewDir dot ActorDir;
						if( Dist > BestDist )
						{
							// Make sure actor is in LOS to POV.
							if( A == Trace(HitLocation, HitNormal, A.Location, POVLoc, true,,,TRACEFLAG_Bullet) )
							{
								BestContextActor = A;
								BestDist = Dist;
							}
						}
					}
				}
			}

			if( BestContextActor != none )
			{
				ServerViewActor(BestContextActor);
				return;
			}
		}

		Cam = TrCamera_Spectator(PlayerCamera);

		if( Cam.m_bViewCameraBookmarks )
		{
			ServerViewBookmark(+1);
		}
		else if( Cam.m_bViewGenerators )
		{
			ServerViewGenerators(+1);
		}
		else if( Cam.m_bViewFlagStands )
		{
			ServerViewFlagStands(+1);
		}
		else if( Cam.m_bViewFlags )
		{
			ServerViewFlags(+1);
		}
		else if( Cam.m_bViewVehicles )
		{
			ServerViewVehicles(+1);
		}
		else if( Cam.m_bFastestPlayer )
		{
			ServerViewFastestPlayer();
		}
		else
		{
			ServerViewNextPlayer();
		}
	}

	exec function ViewPreviousPlayer()
	{
		local TrCamera_Spectator Cam;

		Cam = TrCamera_Spectator(PlayerCamera);

		if( Cam.m_bViewCameraBookmarks )
		{
			ServerViewBookmark(-1);
		}
		else if( Cam.m_bViewGenerators )
		{
			ServerViewGenerators(-1);
		}
		else if( Cam.m_bViewFlagStands )
		{
			ServerViewFlagStands(-1);
		}
		else if( Cam.m_bViewVehicles )
		{
			ServerViewVehicles(-1);
		}
		else if( Cam.m_bViewFlags )
		{
			ServerViewFlags(-1);
		}
		else if( Cam.m_bFastestPlayer )
		{
			ServerViewFastestPlayer();
		}
		else
		{
			ServerViewPrevPlayer();
		}
	}

	exec function ViewBookmarks(bool bEnabled)
	{
		TrCamera_Spectator(PlayerCamera).m_bViewCameraBookmarks = bEnabled;
	}

	exec function ViewGenerators(bool bEnabled)
	{
		TrCamera_Spectator(PlayerCamera).m_bViewGenerators = bEnabled;
	}

	exec function ViewFlagStands(bool bEnabled)
	{
		TrCamera_Spectator(PlayerCamera).m_bViewFlagStands = bEnabled;
	}

	exec function ViewFlags(bool bEnabled)
	{
		TrCamera_Spectator(PlayerCamera).m_bViewFlags = bEnabled;
	}

	exec function ViewVehicles(bool bEnabled)
	{
		TrCamera_Spectator(PlayerCamera).m_bViewVehicles = bEnabled;
	}

	exec function ViewFastestPlayer(bool bEnabled)
	{
		TrCamera_Spectator(PlayerCamera).m_bFastestPlayer = bEnabled;
	}

	exec function ToggleLockViewToPlayer()
	{
		TrCamera_Spectator(PlayerCamera).m_bViewFixed3p = !TrCamera_Spectator(PlayerCamera).m_bViewFixed3p;
	}

	exec function ViewSelf()
	{
		local Vector ViewLoc;
		local Rotator ViewRot;

		if( ViewTarget != self )
		{
			GetPlayerViewPoint(ViewLoc, ViewRot);

			ServerViewSelf();

			SetLocation(ViewLoc);
			SetRotation(ViewRot);
		}
	}

	unreliable server function ServerViewSelf(optional ViewTargetTransitionParams TransitionParams)
	{
		if (IsSpectating())
		{
			ResetCameraMode();
			SetViewTarget( Self, TransitionParams );
			ClientSetViewTarget( Self, TransitionParams );
			ClientOnViewTargetChange(none);
		}
	}

	unreliable server function ServerViewFlags(int dir)
	{
		local int i, CurrentIndex;
		local TrFlagBase Flag;

		// Refresh m_SpectatorFlags.
		if( m_SpectatorFlags.Length > 0 )
		{
			m_SpectatorFlags.Remove(0,m_SpectatorFlags.Length);
		}
		foreach DynamicActors(class'TrFlagBase', Flag)
		{
			m_SpectatorFlags.AddItem(Flag);
		}

		// Find the current index.
		CurrentIndex = INDEX_NONE;
		if( ViewTarget != none )
		{
			for( i=0; i < m_SpectatorFlags.Length; i++ )
			{
				if( ViewTarget == m_SpectatorFlags[i] )
				{
					CurrentIndex = i;
					break;
				}
			}
		}

		if( CurrentIndex + dir < 0 )
		{
			Flag = m_SpectatorFlags[m_SpectatorFlags.Length - 1];
		}
		else if( CurrentIndex + dir < m_SpectatorFlags.Length )
		{
			Flag = m_SpectatorFlags[CurrentIndex + dir];
		}
		else
		{
			Flag = m_SpectatorFlags[0];
		}

		SetViewTarget(Flag,PlayerCamera.BlendParams);
		ClientOnViewTargetChange(Flag);
	}

	unreliable server function ServerViewFastestPlayer()
	{
		local TrPawn TrP, FastestPawn;

		foreach DynamicActors(class'TrPawn', TrP)
		{
			if( FastestPawn == none )
			{
				FastestPawn = TrP;
			}
			else if( VSizeSq(TrP.Velocity) > VSizeSq(FastestPawn.Velocity) )
			{
				FastestPawn = TrP;
			}
		}

		if( FastestPawn != none )
		{
			SetViewTarget(FastestPawn.PlayerReplicationInfo, PlayerCamera.BlendParams);
			ClientOnViewTargetChange(FastestPawn.PlayerReplicationInfo);
		}
	}

	unreliable server function ServerViewActor(Actor ActorToView)
	{
		SetViewTarget(ActorToView, PlayerCamera.BlendParams);
		ClientOnViewTargetChange(ActorToView);
	}

	unreliable server function ServerViewVehicles(int dir)
	{
		local int i, CurrentIndex;
		local TrVehicle V;
		local bool bFoundVehicle;
		
		// Since the number of vehicles is dynamic, update our cached list.
		for( i=0; i<m_SpectatorVehicles.Length; i++ )
		{
			if( m_SpectatorVehicles[i] == none )
			{
				m_SpectatorVehicles.Remove(i,1);
				i--;
			}
		}

		// Add any new vehicles.
		ForEach DynamicActors(class'TrVehicle' , V)
		{
			for( i=0; i<m_SpectatorVehicles.Length; i++ )
			{
				if( m_SpectatorVehicles[i] == V )
				{
					bFoundVehicle = true;

					// Find the current index.
					if( ViewTarget == m_SpectatorVehicles[i] )
					{
						CurrentIndex = i;
					}

					break;
				}
			}

			if( !bFoundVehicle )
			{
				m_SpectatorVehicles.AddItem(V);
			}

			bFoundVehicle = false;
		}

		if( m_SpectatorVehicles.Length == 0 )
		{
			// There are no vehicles!
			return;
		}

		if( CurrentIndex + dir < 0 )
		{
			V = m_SpectatorVehicles[m_SpectatorVehicles.Length - 1];
		}
		else if( CurrentIndex + dir < m_SpectatorVehicles.Length )
		{
			V = m_SpectatorVehicles[CurrentIndex + dir];
		}
		else
		{
			V = m_SpectatorVehicles[0];
		}

		SetViewTarget(V,PlayerCamera.BlendParams);
		ClientOnViewTargetChange(V);
	}

	unreliable server function ServerViewFlagStands(int dir)
	{
		local int i, CurrentIndex;
		local TrCTFBase FlagStand;

		// Find the current index.
		CurrentIndex = INDEX_NONE;
		if( ViewTarget != none )
		{
			for( i=0; i < m_SpectatorFlagStands.Length; i++ )
			{
				if( ViewTarget == m_SpectatorFlagStands[i] )
				{
					CurrentIndex = i;
					break;
				}
			}
		}

		if( CurrentIndex + dir < 0 )
		{
			FlagStand = m_SpectatorFlagStands[m_SpectatorFlagStands.Length - 1];
		}
		else if( CurrentIndex + dir < m_SpectatorFlagStands.Length )
		{
			FlagStand = m_SpectatorFlagStands[CurrentIndex + dir];
		}
		else
		{
			FlagStand = m_SpectatorFlagStands[0];
		}

		SetViewTarget(FlagStand,PlayerCamera.BlendParams);
		ClientOnViewTargetChange(FlagStand);
	}

	unreliable server function ServerViewGenerators(int dir)
	{
		local int i, CurrentIndex;
		local TrPowerGenerator Gen;

		// Find the current index.
		CurrentIndex = INDEX_NONE;
		if( ViewTarget != none )
		{
			for( i=0; i < m_SpectatorGenerators.Length; i++ )
			{
				if( ViewTarget == m_SpectatorGenerators[i] )
				{
					CurrentIndex = i;
					break;
				}
			}
		}

		if( CurrentIndex + dir < 0 )
		{
			Gen = m_SpectatorGenerators[m_SpectatorGenerators.Length - 1];
		}
		else if( CurrentIndex + dir < m_SpectatorGenerators.Length )
		{
			Gen = m_SpectatorGenerators[CurrentIndex + dir];
		}
		else
		{
			Gen = m_SpectatorGenerators[0];
		}

		SetViewTarget(Gen,PlayerCamera.BlendParams);
		ClientOnViewTargetChange(Gen);
	}

	unreliable server function ServerViewBookmark(int dir)
	{
		local int i, CurrentIndex;
		local CameraActor SpectatorBookmark;

		// Find the current index.
		CurrentIndex = INDEX_NONE;
		if( ViewTarget != none )
		{
			for( i=0; i < m_SpectatorCameraBookmarks.Length; i++ )
			{
				if( ViewTarget == m_SpectatorCameraBookmarks[i] )
				{
					CurrentIndex = i;
					break;
				}
			}
		}

		if( CurrentIndex + dir < 0 )
		{
			SpectatorBookmark = m_SpectatorCameraBookmarks[m_SpectatorCameraBookmarks.Length - 1];
		}
		else if( CurrentIndex + dir < m_SpectatorCameraBookmarks.Length )
		{
			SpectatorBookmark = m_SpectatorCameraBookmarks[CurrentIndex + dir];
		}
		else
		{
			SpectatorBookmark = m_SpectatorCameraBookmarks[0];
		}

		SetViewTarget(SpectatorBookmark,PlayerCamera.BlendParams);
		ClientOnViewTargetChange(SpectatorBookmark);
	}

	function ViewAPlayer(int dir)
	{
		local int i, CurrentIndex, NewIndex;
		local PlayerReplicationInfo PRI;
		local bool bSuccess;

		CurrentIndex = -1;
		if ( RealViewTarget != None )
		{
			// Find index of current viewtarget's PRI
			For ( i=0; i<WorldInfo.GRI.PRIArray.Length; i++ )
			{
				if ( RealViewTarget == WorldInfo.GRI.PRIArray[i] )
				{
					CurrentIndex = i;
					break;
				}
			}
		}

		// Find next valid viewtarget in appropriate direction
		for ( NewIndex=CurrentIndex+dir; (NewIndex>=0)&&(NewIndex<WorldInfo.GRI.PRIArray.Length); NewIndex=NewIndex+dir )
		{
			PRI = WorldInfo.GRI.PRIArray[NewIndex];
			if ( (PRI != None) && (Controller(PRI.Owner) != None) && (Controller(PRI.Owner).Pawn != None)
				&& WorldInfo.Game.CanSpectate(self, PRI) )
			{
				bSuccess = true;
				break;
			}
		}

		if ( !bSuccess )
		{
			// wrap around
			CurrentIndex = (NewIndex < 0) ? WorldInfo.GRI.PRIArray.Length : -1;
			for ( NewIndex=CurrentIndex+dir; (NewIndex>=0)&&(NewIndex<WorldInfo.GRI.PRIArray.Length); NewIndex=NewIndex+dir )
			{
				PRI = WorldInfo.GRI.PRIArray[NewIndex];
			if ( (PRI != None) && (Controller(PRI.Owner) != None) && (Controller(PRI.Owner).Pawn != None)
				&& WorldInfo.Game.CanSpectate(self, PRI) )
				{
					bSuccess = true;
					break;
				}
			}
		}

		if ( bSuccess )
		{
			SetViewTarget(PRI,PlayerCamera.BlendParams);
			ClientOnViewTargetChange(PRI);
		}
	}

	unreliable client function ClientOnViewTargetChange(actor NewViewTarget)
	{
		local TrCamera_SpectatorBookmark Bookmark;
		local TrHUD TrH;
 
		TrH = TrHUD(myHUD);
		if( TrH == none )
		{
			return;
		}

		if( PlayerCamera != none )
		{
			PlayerCamera.StopAllCameraAnims();
		}

		TrH.OnViewTargetChange(NewViewTarget);

		Bookmark = TrCamera_SpectatorBookmark(NewViewTarget);
		if( Bookmark != none )
		{
			// Update the bookmark panel.
			TrH.UpdateSpectatorBookmarkPanel(Bookmark);
			PlayerCamera.PlayCameraAnim(CameraAnim'CameraAnims.BookMarks.BookmarkCameraAnim1',,,0.3,0.3,true,true,,true);
		}
	}

	function OnViewTargetCapturedFlag(TrFlagCTF NewFlagToWatch)
	{
		// Since a flag was captured it would be jarring to keep watching the
		// captured flag as it teleports back to base. So, keep watching the other flag.
		SetViewTarget(NewFlagToWatch);
		ClientOnViewTargetChange(NewFlagToWatch);
	}

	function OnViewTargetFlagReturned()
	{
		// Since the flag was returned it would be jarring to keep watching the
		// flag as it teleports back to base. So, go to free rove.
		ViewSelf();
	}

	function OnViewTargetDroppedFlag(TrFlagBase NewFlagToWatch)
	{
		// Since a flag was captured it would be jarring to keep watching the
		// captured flag as it teleports back to base. So, keep watching the other flag.
		SetViewTarget(NewFlagToWatch);
		ClientOnViewTargetChange(NewFlagToWatch);
	}

	function OnViewTargetLeftVehicle(PlayerReplicationInfo NewPRIToWatch)
	{
		SetViewTarget(NewPRIToWatch);
		ClientOnViewTargetChange(NewPRIToWatch);
	}

	exec function BindSpectatorViewTarget(name Key)
	{
		local int i;

		if( ViewTarget == self || ViewTarget == none )
		{
			LogKeyBindHowTo(0);
			return;
		}
		
		for( i = 0; i < m_SpectatorTransientKeybinds.Length; i++ )
		{
			if( m_SpectatorTransientKeybinds[i].KeyBinding.Name == Key )
			{
				// Update the key bind.
				m_SpectatorTransientKeybinds[i].ViewTarget = ViewTarget;
				LogKeyBindSuccess(Key, ViewTarget.GetSpectatorName());
				return;
			}
		}

		// Add the key bind.
		i = m_SpectatorTransientKeybinds.Add(1);
		m_SpectatorTransientKeybinds[i].KeyBinding.Name = Key;
		m_SpectatorTransientKeybinds[i].ViewTarget = ViewTarget;
		LogKeyBindSuccess(Key, ViewTarget.GetSpectatorName());
	}

	function LogKeyBindSuccess(name Key, string ViewTargetName)
	{
		if( ViewTargetName == "" )
		{
			TrHUD(myHUD).AddToPromptPanelTime("Bound"@Key@"to view target", 3.0, GC_APT_MAX);
		}
		else
		{
			TrHUD(myHUD).AddToPromptPanelTime("Bound"@Key@"to"@ViewTargetName, 3.0, GC_APT_MAX);
		}
	}

	function LogKeyBindHowTo(int Switch)
	{
		switch( Switch )
		{
			case 0:    
				TrHUD(myHUD).AddToPromptPanelTime("Must have an active view target to bind", 3.0, GC_APT_MAX);
				return;
			case 1:    
				TrHUD(myHUD).AddToPromptPanelTime("Press Alt+Numpad to bind an active view target", 3.0, GC_APT_MAX);
				return;
		}
	}

	exec function GotoViewTarget(name Key)
	{
		local int i;
		local TrPawn PawnViewTarget;
		local Actor NewViewTarget;
		
		for( i = 0; i < m_SpectatorTransientKeybinds.Length; i++ )
		{
			if( m_SpectatorTransientKeybinds[i].KeyBinding.Name == Key )
			{
				NewViewTarget = m_SpectatorTransientKeybinds[i].ViewTarget;
				if( NewViewTarget != none )
				{
					// If viewing a pawn, view the PRI instead.
					PawnViewTarget = TrPawn(NewViewTarget);
					if( PawnViewTarget != none && PawnViewTarget.PlayerReplicationInfo != none )
					{
						NewViewTarget = PawnViewTarget.PlayerReplicationInfo;
					}

					// Update the key bind.
					ServerViewActor(NewViewTarget);
					return;
				}
			}
		}
		LogKeyBindHowTo(1);
	}
}

state NeutralRovingSpecate extends RovingSpectate
{
	function BeginState(Name PreviousStateName)
	{
		local TrHUD TrH;

		TrH = TrHUD(myHUD);

		if( TrH != none )
		{
			// Spectator controls should display when entering spectating.
			TrH.ShowSpectatorControls(true);
		}

		Super.BeginState(PreviousStateName);

		// Go to a neutral team.
		TrGame(WorldInfo.Game).RequestTeam(255, self);
	}
}

state ArenaTeamSpectate extends RovingSpectate
{
	function BeginState(Name PreviousStateName)
	{
		Super.BeginState(PreviousStateName);

		ViewNextPlayer();
	}
}

// This is basic spectating. "RovingSpectate" state is used for actually being a "spectator."
state Spectating
{
	exec function SwitchWeapon(byte F){}

	function BeginState(Name PreviousStateName)
	{
		ServerUnPossess();
		super.BeginState(PreviousStateName);
	}

	function EndState(Name NextStateName)
	{
		super.EndState(NextStateName);
	}

	function SetServerViewNextPlayer();

	function ProcessMove(float DeltaTime, vector NewAccel, eDoubleClickDir DoubleClickMove, rotator DeltaRot)
	{
		local vector OldLocation;

		LastActiveTime = WorldInfo.TimeSeconds;
		OldLocation = Location;
		super.ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);

		if ( bCameraOutOfWorld )
		{
			bCameraOutOfWorld = false;
			SetLocation(OldLocation);
		}
	}

	exec function ViewPlayerByName(string PlayerName);

	exec function BehindView();

	exec function PrevWeapon();

	exec function NextWeapon();

	exec function StartFire( optional byte FireModeNum );

	unreliable server function ServerViewObjective();

	exec function StartAltFire( optional byte FireModeNum );

	exec function SetLookRightScale(float NewScale)
	{
		PlayerInput.LookRightScale = NewScale;
	}

	exec function SetLookUpScale(float NewScale)
	{
		PlayerInput.LookUpScale = NewScale;
	}

	exec function SetMoveSpeed(float NewSpeed)
	{
		SpectatorCameraSpeed = NewSpeed;
	}

	function EndSpectate()
	{
		ServerRequestRespawn();
	}

	reliable server function ServerRequestRespawn()
	{
		local TrGame TrG;

		TrG = TrGame(WorldInfo.Game);
		if( TrG != none )
		{ 
			if( TrG.AllowRespawn(self) && !r_bNeedLoadout && !r_bNeedTeam)
			{
				Reset();
			}
		}
	}
}

reliable server function ServerUnPossess()
{
	local Pawn TmpPawn;
	if (Pawn != None)
	{
		TmpPawn = Pawn;
		UnPossess();
		TmpPawn.Destroy();
	}
}

unreliable client function ClientPlayTakeHit(vector HitLoc, byte Damage, class<DamageType> DamageType)
{
	DamageShake(Damage, DamageType);
	HitLoc += Pawn.Location;

	if ( UTHUDBase(MyHUD) != None )
	{
		UTHUDBase(MyHUD).DisplayHit(HitLoc, Damage, DamageType);
	}

	if( DamageType == class'TrDmgType_Fell' )
	{
		PlaySound(SoundCue'AUD_PC_Notifications.Fall_Damage.A_CUE_PC_Impact_FallDamage_1');
	}
}

simulated function ClientPlayReticuleHitSound()
{
	// Play a sound for the successful hit.
	if (r_nHitEnemyHeadshot != m_nLastHitEnemyHeadshot)
	{
		PlaySound(SoundCue'AUD_PC_Notifications.Headshot.A_CUE_PC_ImpactOnPawnNotify_Headshot', true);
	}
	else
	{
		PlaySound(SoundCue'AUD_PC_Notifications.Impact__Notify.A_CUE_PC_HitImpactOnPawnNotify', true);
	}

	m_nLastHitEnemyHeadshot = r_nHitEnemyHeadshot;
}

unreliable client function ClientPlayBluePlateImpact()
{
	PlaySound(SoundCue'AUD_PC_BulletImpact.BluePlate_Impact.A_CUE_PC_BluePlate_1P_Impact', true);
}

unreliable client function ClientPlayAirMailImpact()
{
	// As per Benjie, use Blue Plate sound for now.
	PlaySound(SoundCue'AUD_PC_BulletImpact.BluePlate_Impact.A_CUE_PC_BluePlate_1P_Impact', true);
	//PlaySound(SoundCue'AUD_PC_BulletImpact.AirMail_Impact.A_CUE_PC_AirMail_1P_Impact', true);
}



















function SummarizeAwards()
{
    if (Stats != none)
    {
        Stats.AddDistanceSkied(self, m_fTotalDistanceSkiedSq/200);
        Stats.SetSpeedSkied(self, m_fSkiSpeedRecord);
        Stats.SetSpeedFlagGrab(self, m_fFlagGrabSpeedRecord);
    }
}

reliable client function ClientMatchOver(int Winner, string WinnerName)
{
    local TrHUD TrH;

    TrH = TrHUD(myHUD);

    if (TrH != none)
    {
        TrH.PlayMatchOver(Winner, WinnerName);
    }
}

reliable client function ClientSetEndOfMatch()
{
    SetMenuEndOfMatch();
}

reliable client function ClientFadeToSummary()
{
    local TrHUD TrH;

    TrH = TrHUD(myHUD);

    if (TrH != none)
    {
        TrH.FadeInSummary();
    }

    SetTimer(0.7f,false,'SetMenuSummaryScreen');
    SetTimer(1.0f,false,'BeginExperienceTweens');
}

reliable client function UpdateMatchCountdown(int Seconds)
{
    SetMenuMatchCountdown(Seconds);
}

reliable client function UpdateRoundCountdown(int Seconds, int Round)
{
    //TEMP! This is goofy but works for testing.
	TrHUD(myHUD).AddToHeroStatus("Round"@Round@"begins in:"@string(Seconds), 1.0);
}

reliable client function UpdateGameCountdown(int Seconds)
{
    //TEMP! This is goofy but works for testing.
	TrHUD(myHUD).AddToHeroStatus("Match begins in:"@string(Seconds), 1.0);
}

function ServerKickPlayer(optional int Reason = 0)
{
    if (ROle == ROLE_Authority)
    {
        ClientKickPlayer(Reason);
    }
}

reliable client function ClientKickPlayer(int Reason)
{
    KickPlayerFromMatch(Reason);
}

event KickWarning()
{
	if ( WorldInfo.TimeSeconds - LastKickWarningTime > 0.5 )
	{
		ReceiveLocalizedMessage( class'TrPromptMessage', 2, None, None, self );
		LastKickWarningTime = WorldInfo.TimeSeconds;
	}
}

function FumbledFlag()
{
	ClientOnFumbledFlag();
}

reliable client function ClientOnFumbledFlag()
{
	PlayCameraShake('ConcussionShake',1.0);
	ReceiveLocalizedMessage(class'TrWarningMessage', 0);
	TrHUD(myHUD).FumbleFlag(0.75);
}








simulated function UpdateCallInAvailability()
{
    local int i;
    local GfxTrHud TrH;
	local TrDevice_LaserTargeter LaserTargeter;

    if (Role == ROLE_Authority)
    {
        // This is UI business, get outta here.
        return;
    }

    TrH = GFxTrHud(TrHUD(myHUD).HudMovie);
    if (TrH == none)
    {
        return;
    }

	LaserTargeter = TrDevice_LaserTargeter(GetDeviceByEquipPoint(EQP_LaserTarget));
	if (LaserTargeter == none)
	{
		return;
	}
    
    for (i = 0; i < TR_MAX_CALLINS; i++)
    {                    
        if (LaserTargeter.r_CallIns[i] != none)
        {
            if (r_nCurrentCredits >= LaserTargeter.r_CallIns[i].CreditCost)
            {
                TrH.UpdateCallIn(i, true, true);
            }
            else
            {
                TrH.UpdateCallIn(i, true, false);
            }
        }
        else
        {
            TrH.UpdateCallIn(i, true, false);
        }
    }
}

simulated function UpdateCallInCooldown()
{
	local int i;

	// Loop through all call-ins.
	for (i = 0; i < TR_MAX_CALLINS; i++)
	{
		// Determine which one of the call-ins flashed to be updated, and update variables.
		if (r_nCallinCooldownFlash[i] != m_nCallinCooldownFlashStored[i])
		{
			m_nCallinCooldownFlashStored[i] = r_nCallinCooldownFlash[i];
			m_fCallInCooldown[i] = WorldInfo.TimeSeconds;
		}
	}
}

simulated function CalcCameraOnViewTarget( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
{
	local TrPlayerPawn TrP;
	local TrDeployable TrD;
	local TrVehicle TrV;

	TrP = TrPlayerPawn(ViewTarget);
	if( m_bViewThroughDeathCamera )
	{
		if( TrP != none && TrP != Pawn )
		{
			TrP.CalcOtherWatchingCam( fDeltaTime, out_CamLoc, out_CamRot, out_FOV, self );
			return;
		}
		TrD = TrDeployable(ViewTarget);
		if( TrD != none )
		{
			TrD.CalcOtherWatchingCam( fDeltaTime, out_CamLoc, out_CamRot, out_FOV, self );
			return;
		}
		TrV = TrVehicle(ViewTarget);
		if( TrV != none )
		{
			TrV.CalcOtherWatchingCam( fDeltaTime, out_CamLoc, out_CamRot, out_FOV, self );
		}
	}
	ViewTarget.CalcCamera( fDeltaTime, out_CamLoc, out_CamRot, out_FOV );
}

simulated function bool IsGameTypeArena()
{
	return class<TrGame_TrArena>(WorldInfo.GRI.GameClass) != none;
}

simulated function bool IsGameTypeDaD()
{
	return class<TrGame_TrDaD>(WorldInfo.GRI.GameClass) != none;
}

simulated function bool IsGameTypeCaH()
{
	return class<TrGame_TrCaH>(WorldInfo.GRI.GameClass) != none;
}

simulated function SwitchToDeathCamera()
{
	local Vector CameraLocation;
	local Rotator CameraRotation;

	if( r_KilledBy != none && r_KilledBy != Pawn )
	{
		GetPlayerViewPoint(CameraLocation, CameraRotation);
		m_bViewThroughDeathCamera = true;
		m_fDeathCameraCurrentScale = m_fDeathCameraOuterScale;
		SetViewTarget(r_KilledBy);
		SetRotation(Rotator(r_KilledBy.Location - CameraLocation));
		SetBehindView(true);
	}
	SetTimer(5.0, false, 'SetViewTargetAsOverwatch');
}































//m_ProjectilesNeedingTethering
simulated function AddProjectileToTetherList(TrProjectile P)
{
	m_ProjectilesNeedingTethering.AddItem(P);
}

simulated function CheckTetherList(TrProjectile P)
{
	m_ProjectilesNeedingTethering.RemoveItem(P);
}

simulated function TrProjectile TetherProjectile(TrProjectile ProjectileFromServer)
{
	local int i;
	local TrProjectile TetheredProjectile;

	for( i = 0; i < m_ProjectilesNeedingTethering.Length; i++ )
	{
		// Find a match for the projectile from the server to a client projectile.
		if( m_ProjectilesNeedingTethering[i].r_nTetherId == ProjectileFromServer.r_nTetherId )
		{
			TetheredProjectile = m_ProjectilesNeedingTethering[i];
			m_ProjectilesNeedingTethering.Remove(i,1);
			return TetheredProjectile;
		}
	}
	;
	return none;
}

function ConfigureSkiSpeedSteps(float SoftCap)
{
    local TrHUD TrH;
    local GFxTrHud GFxTrH;

    TrH = TrHUD(myHUD);

    if (TrH != none)
    {
        GFxTrH = GfxTrHud(TrH.HudMovie);

        if (GFxTrH != none)
        {
            GFxTrH.ConfigureSkiSpeedSteps(SoftCap);
        }
    }
}
/*
`if(`notdefined(ShippingPC))
exec function DrawCharacter(bool bEnabled)
{
	local vector CamLoc;
	local Rotator CamRot;

	GetPlayerViewPoint(CamLoc, CamRot);

	if( bEnabled )
	{
		if( m_PaperDoll == none )
		{
			m_PaperDoll = Spawn(class'TrPaperDoGetFamilyInfoFromIdll', self,, CamLoc, CamRot,,true);
			PaperDoll(0);
		}
	}
	else
	{
	}
}
`endif
*/

function LoadingTimer(bool bStart)
{
    if (bStart)
    {
        SetTimer(LoadingScreenTimeout, false, 'SendMenuToLobby');
    }
    else
    {
        ClearTimer('SendMenuToLobby');
    }
}

function float GetCurrentDetermination()
{
	return m_fDeterminationAmount;
}

function FlushAccumulatedDetermination()
{
	m_fDeterminationAmount += m_fDeterminationAccumulator;
	m_fDeterminationAmount = FMin(m_fDeterminationAmount, 300.0);
	m_fDeterminationAccumulator = 0.0;
}

function ClearDetermination()
{
	local TrPawn TrP;
	local TrPlayerReplicationInfo TrPRI;
	local TrValueModifier VM;
	local float MaxHealthPool;
	local class<TrFamilyInfo> FamilyInfo;

	m_fDeterminationAmount = 0.0;
	m_fDeterminationAccumulator = 0.0;

	TrP = TrPawn(Pawn);
	if( TrP != none )
	{
		FamilyInfo = TrP.GetCurrCharClassInfo();
		if( FamilyInfo != none )
		{
			MaxHealthPool = FamilyInfo.default.m_nMaxHealthPool;

			TrPRI = TrP.GetTribesReplicationInfo();
			if( TrPRI != none )
			{
				VM = TrPRI.GetCurrentValueModifier();
				if( VM != none )
				{
					MaxHealthPool += VM.m_fHealthBuff;
				}
			}

			TrP.SetMaxHealthPool(MaxHealthPool);
		}
	}
}

function AddDetermination()
{
	m_fDeterminationAccumulator += 100.0;
	m_fDeterminationAccumulator = FMin(m_fDeterminationAccumulator, 300.0);
}

function OnMenuMovieOpened()
{
	local TrHUD TrH;
	
	TrH = TrHUD(myHUD);

	if (TrH != none)
	{
		if (TrH.TeamSelectionMenuMovie != none && TrH.TeamSelectionMenuMovie.MovieClip != none)
		{
			TrH.TeamSelectionMenuMovie.MovieClip.SetVisible(false);
		}

        if(TrH.m_GFxHud != none)
        {
            TrH.m_GFxHud.SystemEnableNotifies(false);
        }
        
        TrH.SetVisible(false);
		TrH.bIsMainMenuOpen = true;
        TrH.RestoreHUDState();
	}
	
	if (AlienFX != none && EnableAlienFX)
	{
		AlienFX.Menu(true);
	}
}

function OnMenuMovieClosed()
{
	local TrHUD TrH;
	
	TrH = TrHUD(myHUD);

	if (TrH != none)
	{
        TrH.SetVisible(true);
		TrH.bIsMainMenuOpen = false;
		TrH.RestoreHUDState();

        if (r_bNeedTeam)
        {
            TrH.ToggleTeamSelectionMenu();
        }
        else
        {
            TrH.CompleteTeamSelectionMenuClose();
        }

        if (TrH.m_GFxHud != none)
        {
            TrH.m_GFxHud.SystemEnableNotifies(true);
        }
	}
	
	if (AlienFX != none && EnableAlienFX)
	{
		AlienFX.Menu(false);
	}

	// Clear out any paper doll.
	if( m_PaperDoll != none )
	{
		m_PaperDoll.SetHidden(true);
		m_PaperDoll.Destroy();
		m_PaperDoll = none;
	}
}







































































































unreliable client function ClientPlayVGSAudio(SoundCue ASound, PlayerReplicationInfo InstigatorPRI)
{
	local int i;
	local VGSAudioCommand Command;

	for( i = 0; i < m_VGSAudioCommands.Length; i++ )
	{
		if( m_VGSAudioCommands[i].VGSInstigator == InstigatorPRI )
		{
			// Fade out the current command (to prevent pops) and queue up the next soundcue to recycle the audio component.
			m_VGSAudioCommands[i].VGSAudioComponent.FadeOut(0.075, 0.0);
			m_VGSAudioCommands[i].QueuedSoundCue = ASound;
			return;
		}
	}

	if( (InstigatorPRI != PlayerReplicationInfo) && (m_VGSAudioCommands.Length > m_nMaxVGSSoundChannels) )
	{
		// Only allow a new sound to play if we aren't already at our max VGS channel usage or if our own local player 
		// initiated the voice command.
		return;
	}

	// Instigator isn't currently playing a command, so create a new entry and play it.
	Command.VGSAudioComponent = GetPooledAudioComponent(ASound, InstigatorPRI, false);
	if( Command.VGSAudioComponent == none )
	{
		return;
	}

	Command.VGSAudioComponent.bAllowSpatialization = false;
	Command.VGSAudioComponent.OnAudioFinished = VGSAudioFinished;
	Command.VGSAudioComponent.Play();
	Command.VGSInstigator = TrPlayerReplicationInfo(InstigatorPRI);

	m_VGSAudioCommands.AddItem(Command);
}

function VGSAudioFinished(AudioComponent AC)
{
	local int i;

	for( i = 0; i < m_VGSAudioCommands.Length; i++ )
	{
		if( m_VGSAudioCommands[i].VGSAudioComponent == AC )
		{
			// Check to see if there is a queued sound cue. If there is, play that, recycling this AC.
			if( m_VGSAudioCommands[i].QueuedSoundCue != none && m_VGSAudioCommands[i].VGSAudioComponent != none && m_VGSAudioCommands[i].VGSInstigator != none )
			{
				m_VGSAudioCommands[i].VGSAudioComponent.SoundCue = m_VGSAudioCommands[i].QueuedSoundCue;
				m_VGSAudioCommands[i].VGSAudioComponent.OnAudioFinished = VGSAudioFinished;
				m_VGSAudioCommands[i].QueuedSoundCue = none;
				m_VGSAudioCommands[i].VGSAudioComponent.Play();
				return;
			}

			// We are done with this audio component, remove it.
			m_VGSAudioCommands.Remove(i,1);
		}
	}
}



















reliable client function ClientSetLastDamagerInfo(int Health, int UpgradeLevel)
{
    m_nLastDamagerHealthPercent = Health;
    m_nLastDamagerUpgradeLevel = UpgradeLevel;
}

function EnableTinyWeapons(bool bEnable)
{
    local int i;
    local TrDevice device;

    for (i = 0; i < EQP_MAX; i++)
    {
        device = GetDeviceByEquipPoint(TR_EQUIP_POINT(i));

        if (device != none)
        {
            device.m_bTinyWeaponsEnabled = bEnable;
        }
    }

    device = Spawn(class'TrDevice', self);
    device.m_bTinyWeaponsEnabled = bEnable;
    device.SaveConfig();
}

function bool GetTinyWeaponValue()
{
    local TrDevice device;
    
    device = Spawn(class'TrDevice', self);

    if (device != none)
    {
        return device.m_bTinyWeaponsEnabled;
    }

    return false;
}

function EnableChatFilter(bool bEnable)
{
    ;
    m_bEnableChatFilter = bEnable;
    SaveConfig();
    ForwardChatFlag();
}

function bool GetChatFilterValue()
{
    return m_bEnableChatFilter;
}


function EnableDamageCounter(bool bEnable)
{
    m_bEnableOverheadDamageIndicators = bEnable;
    SaveConfig();
}

function bool GetDamageCounterValue()
{
    return m_bEnableOverheadDamageIndicators;
}

function EnableHUDObjectives(bool bEnable)          { m_bShowHUDObjectives = bEnable; SaveConfig(); }
function EnableHUDReticule(bool bEnable)            { m_bShowHUDReticule = bEnable; SaveConfig(); }
function EnableHUDCredits(bool bEnable)             { m_bShowHUDCredits = bEnable; SaveConfig(); }
function EnableHUDAccolades(bool bEnable)           { m_bShowHUDAccolades = bEnable; SaveConfig(); }
function EnableHUDBadges(bool bEnable)              { m_bShowHUDBadges = bEnable; SaveConfig(); }
function EnableHUDScores(bool bEnable)              { m_bShowHUDScores = bEnable; SaveConfig(); }
function EnableHUDHealthBar(bool bEnable)           { m_bShowHUDHealthBar = bEnable; SaveConfig(); }
function EnableHUDVisor(bool bEnable)               { m_bShowHUDVisor = bEnable; SaveConfig(); }
function EnableHUDChat(bool bEnable)                { m_bShowHUDChat = bEnable; SaveConfig(); }
function EnableHUDCombatLog(bool bEnable)           { m_bShowHUDCombatLog = bEnable; SaveConfig(); }
function EnableHUDKillbox(bool bEnable)             { m_bShowHUDKillbox = bEnable; SaveConfig(); }
function EnableHUDDeathcam(bool bEnable)            { m_bShowHUDDeathcam = bEnable; SaveConfig(); }
function EnableHUDHeroText(bool bEnable)            { m_bShowHUDHeroText = bEnable; SaveConfig(); }
function EnableHUDPromptPanel(bool bEnable)         { m_bShowHUDPromptPanel = bEnable; SaveConfig(); }
function EnableHUDRespawnTimer(bool bEnable)        { m_bShowHUDRespawnTimer = bEnable; SaveConfig(); }
function EnableHUDSkiBars(bool bEnable)             { m_bShowHUDSkiBars = bEnable; SaveConfig(); }
function EnableHUDFriendColoring(bool bEnable)      { m_bShowHUDFriendColoring = bEnable; SaveConfig(); }
function EnableHUDNotifications(bool bEnable)       { m_bShowHUDNotifications = bEnable; SaveConfig(); }
function EnableHUDFriendStateNotifications(bool bEnable) { m_bShowHUDFriendStateNotifications = bEnable; SaveConfig(); }
function EnableHUDCracks(bool bEnable)              { m_bShowHUDCracks = bEnable; SaveConfig(); }
function ShowAlienFX(bool bEnable)                  { EnableAlienFX = bEnable; SaveConfig(); }

function bool GetHUDObjectivesValue()
{
    return m_bShowHUDObjectives;
}

function bool GetHUDNotifications()
{
    return m_bSHowHUDNotifications;
}

function bool GetHUDFriendStateNotifications()
{
    return m_bSHowHUDFriendStateNotifications;
}

function int GetWhisperFilterValue()
{
    return m_WhisperFilter;
}

function SetWhisperFilter(INT FilterValue)
{
    m_WhisperFilter = FilterValue;
    SaveConfig();
}

/** Creates a timer for tweening Daily challenges and the XP screen */
function SummaryTweenTimer(int Amount)
{
    if (Amount > 0)
    {
        SetTimer(Amount * 4.0f, false, 'TweenSummaryScreen');
    }
    else
    {
        TweenSummaryScreen();
    }
}

exec function VoteNo()
{
    local TrHUD TrH;
    
    TrH = TrHUD(myHUD);

    if (TrH != none && TrH.bVotePending)
    {
        TrH.KickVoteMessage(true, "You voted 'No'");
        KickVoteReply(false);
        PlaySound(SoundCue'Aud_menu.Vote_Kick.A_CUE_UI_VoteKick_ButtonPress', TRUE);        
    }
}

exec function VoteYes()
{
    local TrHUD TrH;
    
    TrH = TrHUD(myHUD);

    if (TrH != none && TrH.bVotePending)
    {
        TrH.KickVoteMessage(true, "You voted 'Yes'");
        KickVoteReply(true);
        PlaySound(SoundCue'Aud_menu.Vote_Kick.A_CUE_UI_VoteKick_ButtonPress', TRUE);        
    }
}

function FlashShooterHitReticule(int DamageAmount, bool isInstantHit, int TeamNum)
{
    if (Role == ROLE_Authority)
    {
		if (TeamNum!= GetTeamNum() && !IsDead())
		{
			if (DamageAmount > 0)
			{
				r_nHitEnemy++;
                bNetDirty = true;
			}
			else if (DamageAmount == 0 && isInstantHit)
			{
				// Play a ricochet sound since we aren't doing damage.
				PlaySound(m_RicochetSound3P);
			}
		}
    }
}

function ServerShowOverheadNumber(int NumberToShow, vector WorldLocation, float fScreenDepth)
{
    ClientShowOverheadNumber(NumberToShow, WorldLocation, fScreenDepth);
}

reliable client function ClientShowOverheadNumber(int NumberToShow, vector WorldLocation, float fScreenDepth)
{
	local TrHUD TrH;
	local vector4 NewWorldLocation;

	TrH = TrHUD(myHUD);

	NewWorldLocation.X = WorldLocation.X;
	NewWorldLocation.Y = WorldLocation.Y;
	NewWorldLocation.Z = WorldLocation.Z;
	NewWorldLocation.W = fScreenDepth;

	if (NewWorldLocation.W == 0.0f)
	{
		NewWorldLocation.W = WorldLocation.Z;
	}

	if( TrH != none && m_bEnableOverheadDamageIndicators )
	{
		TrH.AddOverheadNumber(NumberToShow, NewWorldLocation);
	}
}

/** Utility for converting damage into credits. */
function int GetCreditsForDamageAmount(int DamageAmount)
{
	return DamageAmount / m_DamageNeededForCredit;
}

function CashForDamage(int DamageAmount)
{
    if (Role == ROLE_AUTHORITY)
    {
        ModifyCredits(GetCreditsForDamageAmount(DamageAmount), false);
    }
}

function AwardTeamAssistCredits()
{
    if (Role == ROLE_AUTHORITY)
    {
        ModifyCredits(m_TeamAssistCredit, true);
    }
}

function AwardTeamRabbitAssistCredits(int Multiplier)
{
    if (Role == ROLE_AUTHORITY)
    {
        ModifyCredits(m_TeamRabbitAssistCredit * Multiplier, true);
    }
}

exec function TypeKeyPressed()
{
    


    local TrChatConsole PlayerConsole;        
    
 
	local LocalPlayer LP;

	LP = LocalPlayer(Player);

    if (LP != none)
	{
        


        PlayerConsole = TrGameViewportClient(LP.ViewportClient).ChatConsole;
        
        
        if(PlayerConsole != None)
        {		    
            PlayerConsole.StartTyping("");            
	        PlayerConsole.bCaptureKeyInput = true;
        }
	}
}

// Don't allow FOV to be run from an exec command.
exec function FOV(float F);

/** 
 *  Called when the pawn wants to set its FOV to what the user wants after something else may have
 *  modified it.
 */
function FixFOV()
{
	if( PlayerInput != none )
	{
		// Revert to the PlayerInput FOVSetting.
		OnFootDefaultFOV = PlayerInput.FOVSetting;
	}
	Super.FixFOV();
}

function SetFOV(float NewFOV)
{
	if( (NewFOV >= 40.0) || (WorldInfo.NetMode==NM_Standalone) || PlayerReplicationInfo.bOnlySpectator )
	{
		NewFOV = FClamp(NewFOV, 40, 120);

        if (OnFootDefaultFOV == NewFOV)
        {
            return;
        }

		if ( Vehicle(Pawn) == None )
		{
			FixFOV();
		}

		SaveConfig();
	}
}

/** Client tells the server that he has been notified about this class.
 *  The online shop is not available to the server right now, so the
 *  price comparison must unfortunately been done on the client */
reliable server function ServerSetClassAffordable(int BitMask)
{
    local TgPlayerProfile profile;
    local OnlineSubsystemMcts Mcts;

    Mcts = OnlineSubsystemMcts(OnlineSub);

    if (Mcts != none && PlayerReplicationInfo != none)
    {
        profile = new class'TgPlayerProfile';
        profile.InfoMask = BitMask;
        Mcts.WritePlayerProfileData(PlayerReplicationInfo.UniqueId.Uid, profile);
    }
}

/** Class bit for classes the player has already been alerted about */
function int GetClassBit(int ClassId)
{
    local class<TrFamilyInfo> FamilyInfo;
    
    FamilyInfo = GetFamilyInfoFromId(ClassId);

    if (FamilyInfo != none)
    {
        return FamilyInfo.default.InfoBit;
    }

    return 0;
}

function TestTrainingSlot(TR_EQUIP_POINT EquipType, int EquipId)
{
	if (InTraining())
    {
        TestSlot(EquipType, EquipId, true);
    }
}

simulated function bool InTraining()
{
	local TrGame TrGameInfo;

	TrGameInfo = TrGame(WorldInfo.Game);

	if (TrGameInfo != none && WorldINfo.NetMode == NM_STANDALONE)
    {
        if (TrGameInfo.m_bRoamingMap || TrGame_TrTraining(TrGameInfo) != none)
        {
            return true;
        }
    }

    return false;
}

function TestSlot(TR_EQUIP_POINT EquipType, int EquipId, optional bool bTraining = false)
{
    local TrHUD TrH;
    local string weaponType;
    local class<TrSkin> skinClass;
    local class<TrDevice> device;
    
    switch (EquipType)
    {
    case EQP_Primary:   weaponType = "PRIMARY";     break;
    case EQP_Secondary: weaponType = "SECONDARY";   break;
    case EQP_Belt:      weaponType = "BELT";        break;
    case EQP_Pack:      weaponType = "PACK";        break;
    case EQP_PerkA:     weaponType = "PERK TYPE A"; break;
    case EQP_PerkB:     weaponType = "PERK TYPE B"; break;
    case EQP_Skin:      weaponType = "SKIN";        break;
    default:            weaponType = "WEAPON";      break;
    }

    device = m_TrInventoryHelper.GetEquipClass(EquipId);

	if( device != none )
	{
		// Start preloading this device's content.
		LoadPendingDeviceContentData(device);
	}

    TrH = TrHUD(myHUD);

    if (TrH != none && TrH.m_GFxHud != none)
    {
        if (device == none)
        {
            skinClass = m_TrInventoryHelper.GetSkinClass(EquipId);

            if (skinClass != none)
            {
                if (bTraining) TrH.m_GFxHud.UpdateChatLog("TESTING"@weaponType@"-"@skinClass.default.ItemName, class'TrHUD'.default.InfoChatColorIdx, false);
                else TrH.m_GFxHud.UpdateChatLog("PENDING"@weaponType@"-"@skinClass.default.ItemName, class'TrHUD'.default.InfoChatColorIdx, false);
            }
        }
        else if (bTraining)
        {
            TrH.m_GFxHud.UpdateChatLog("TESTING"@weaponType@"-"@device.default.ItemName, class'TrHUD'.default.InfoChatColorIdx, false);
        }
        else
        {
            TrH.m_GFxHud.UpdateChatLog("PENDING"@weaponType@"-"@device.default.ItemName, class'TrHUD'.default.InfoChatColorIdx, false);
        }
    }

    ServerTestSlot(EquipType, EquipId);
}

reliable server function ServerTestSlot(TR_EQUIP_POINT EquipId, int EquipItem)
{
    local TrPlayerReplicationInfo TrPRI;

    TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

	if (TrPRI != none && InTraining())
    {
        TrPRI.SetActiveEquip(EquipId, EquipItem);
        TrPRI.bNetDirty = true;
        OnRefreshInventory(none);
    }
}

/** Called when content has finished preloading. */
event OnDeviceContentDataClassLoaded(class<TrDeviceContentData> DeviceContentDataClass)
{
	local class<TrDevice> DeviceClass;
	local int i;

	if( DeviceContentDataClass != none )
	{
		// Match the content that just loaded with a device class.
		DeviceClass = DeviceContentDataClass.default.m_TrDeviceClass;
		if( DeviceClass != none )
		{
			i = m_PendingLoadoutDeviceClasses.Find(DeviceClass);
			if( i != INDEX_NONE )
			{
				// Check the content off the list.
				m_PendingLoadoutDeviceClasses.Remove(i,1);

				// Cache the content so GC won't collect it.
				m_CachedPendingClassDeviceContentData.AddItem(DeviceContentDataClass);
			}
		}
	}

	// If we are in a menu, update the paper doll.
	if( m_PaperDoll != none )
	{
		m_PaperDoll.OnDeviceContentDataClassLoaded(DeviceContentDataClass);
	}
}

/** Called when 3P content has finished preloading. */
event On3PSkinContentLoaded(class<TrPlayerSkin3PData> Skin3PDataClass)
{
	local int i;
	local bool bRemoveFromList;

	// Find which pawn(s) this load is for.
	for(i = 0; i < m_Pending3PSkins.Length; i++ )
	{
		if( m_Pending3PSkins[i].TrPRI == none )
		{
			// Player is gone, so remove him from the list.
			bRemoveFromList = true;
		}
		else
		{
			if( m_Pending3PSkins[i].SkinId == Skin3PDataClass.default.m_nSkinId )
			{
				// We have a match! Give the PRI the skin and let it manage when to apply it.
				m_Pending3PSkins[i].TrPRI.On3PSkinContentLoaded(Skin3PDataClass);
				bRemoveFromList = true;
			}
		}

		if( bRemoveFromList )
		{
			m_Pending3PSkins.Remove(i,1);
			i--;
		}
	}

	if( m_PaperDoll != none )
	{
		m_PaperDoll.OnCharacterMeshContentDataClassLoaded(Skin3PDataClass);
	}
}

/** Called when 1P content has finished preloading. */
event On1PSkinContentLoaded(class<TrPlayerSkin1PData> Skin1PDataClass)
{
}

/** Call this when preloading a skin for a pawn so that we can apply it to him when it loads. */
function AddPending3PSkin(TrPlayerReplicationInfo TrPRI, int SkinId)
{
	local PendingSkin NewPendingSkin;

	NewPendingSkin.TrPRI = TrPRI;
	NewPendingSkin.SkinId = SkinId;
	m_Pending3PSkins.AddItem(NewPendingSkin);
}

/** Called from the main menu when a class is selected. */
function OnClassSelectedMainMenu()
{
	// TODO: Play reaction anim.
}

/** GiveCredits kismet event. */
function OnGiveCredits(TrSeqAct_GiveCredits Action)
{
	ModifyCredits(Action.Amount);
}

/** GiveAccolade kismet event. */
function OnGiveAccolade(TrSeqAct_GiveAccolade Action)
{
	m_AccoladeManager.QueueAccolade(Action.AccoladeType);
}

/** PlayVGSCommand kismet event. */
function OnPlayVGSCommand(TrSeqAct_PlayVGSCommand Action)
{
	local TrPlayerReplicationInfo PRI;

	PRI = Spawn(class'TrPlayerReplicationInfo', self,, vect(0,0,0),rot(0,0,0));
	PRI.SetPlayerName(Action.CommandInstigatorName);
	ClientReceiveVGSCommand(PRI, Action.VGSCommand);
	PRI.LifeSpan = 1.0;
}

/** RefreshInventory kismet event. */
function OnRefreshInventory(TrSeqAct_RefreshInventory Action)
{
	local TrPawn TrP;

	TrP = TrPawn(Pawn);
	if( TrP != none )
	{
		TrP.RefreshInventory(true); // Even though this isn't a spawn, this will revive health.
	}
}

function StartForceFocusTimer()
{
    SetTimer(0.1f, false, 'ForceFocus');
}

function StartAcquisitionFireTimer()
{
    SetTimer(0.1f, false, 'FireAcquisition');
}

function StartSettingBlock()
{
    bAutoRevertSetting = true;
    SetTimer(15.0f, false, 'AutoRevertSetting');
}

function AutoRevertSetting()
{
    if (bAutoRevertSetting)
    {
        RevertSetting();
    }
}

function StartSendMenuBackTimer()
{
    bAutoRevertSetting = true;
    SetTimer(0.1f, false, 'SendMenuBack');
}
























function QueueTimer(bool bStart)
{
    if (bStart)
    {
        SetTimer(0.8f, true, 'UpdateQueueTimer');
    }
    else
    {
        ClearTimer('UpdateQueueTimer');
    }
}

function TVTimer()
{
    SetTimer(60.0f, true, 'UpdateTVTimer');
}

function DealTimer()
{
    SetTimer(1.0f, true, 'UpdateDealTimer');
}
function StartHotkeyBlock()
{
    SetTimer(0.375f, false, 'EndHotkeyBlock');
}

state ArenaRoundEnded
{
	event BeginState(Name PreviousStateName)
	{
		CleanupGameplayEffectsOnDeath();
		StopFiring();
		ServerStopSki();
		if ( (Pawn != None) && (Pawn.Controller == self) )
			Pawn.Controller = None;
		Pawn = None;
		FOVAngle = DesiredFOV;
		Enemy = None;
		bFrozen = true;
		bPressedJump = false;
		CleanOutSavedMoves();
		SetViewTargetAsOverwatch(true);
	}

	function bool AllowHelpTextToDisplay()
	{
		return false;
	}

	function PlayerMove(float DeltaTime)
	{
		ViewShake(DeltaTime);

		bPressedJump = false;
	}

	exec function SpotTarget();
}

reliable client function ClientArenaRoundEnded(int WinningTeam)
{
	local TrHUD TrH;

	GotoState('ArenaRoundEnded');

	TrH = TrHUD(myHUD);
    if (TrH != none)
    {
        TrH.PlayRoundOver(WinningTeam);
    }
}

/** 
 *  Server tells the client to reset through ClientPlayerResettingAndRespawning().
 *  Client cleans up self and destroys pawn, then signals to the server
 *  that we're ready to be respawned.
 */
state PlayerResettingAndRespawning
{
	event BeginState(Name PreviousStateName)
	{
		local TrPawn TrP;

		// Stop any sounds the player has.
		TrP = TrPawn(Pawn);
		if (TrP != none)
		{
			TrP.StopLocalEffectsAndSounds();
		}
		StopFiring();
		ServerStopSki();

		CleanupGameplayEffectsOnDeath();
		if ( (Pawn != None) && (Pawn.Controller == self) )
			Pawn.Controller = None;
		Pawn = None;
		FOVAngle = DesiredFOV;
		Enemy = None;
		bFrozen = true;
		bPressedJump = false;
		CleanOutSavedMoves();
		//SetViewTargetAsOverwatch(true);
		ServerRequestRespawn();
	}

	exec function StartFire( optional byte FireModeNum )
	{
		ServerRequestRespawn();
	}

	reliable server function ServerRequestRespawn()
	{
		local TrGame TrG;

		TrG = TrGame(WorldInfo.Game);
		if( TrG != none )
		{ 
			if( TrG.AllowRespawn(self) && !r_bNeedLoadout && !r_bNeedTeam)
			{
				SetViewTarget(self);
				Reset();
			}
		}
	}
}

reliable client function ClientPlayerResettingAndRespawning()
{
	GotoState('PlayerResettingAndRespawning');
}

// Authority only! Destroys all deployables owned by this pawn.
function DestroyAllOwnedDeployables(optional class<TrDevice> DestroyIfNotOfType)
{
	local TrGameReplicationInfo GRI;
	local TrDeployable Deployable;

	GRI = TrGameReplicationInfo(WorldInfo.GRI);

	if( GRI != none )
	{
		foreach GRI.m_Deployables(Deployable)
		{
			if( Deployable.m_Controller == self && !Deployable.r_bInDestroyedState && 
				(DestroyIfNotOfType == none || DestroyIfNotOfType.default.m_WeaponDeployables[0] != Deployable.Class) )
			{
				Deployable.r_Health = 0;
				Deployable.OnHealthChanged(true);
				Deployable.LifeSpan = 1.0;
			}
		}
	}
}

// Authority only! Destroys all mines owned by this pawn.
function DestroyAllOwnedMines(optional class<TrDevice> DestroyIfNotOfType)
{
	local TrProj_Mine TrMine;

	// Destroy all projectiles I own.
	foreach DynamicActors(class'TrProj_Mine', TrMine)
	{
		if (TrMine.InstigatorController == self && 
			(DestroyIfNotOfType == none || DestroyIfNotOfType.default.WeaponProjectiles[0] != TrMine.Class ))
		{
			TrMine.DetonateObsolete();
		}
	}
}

// Authority only! Destroys all projectiles owned by this pawn.
function DestroyAllOwnedProjectiles()
{
	local TrProjectile TrProj;

	// Destroy all projectiles I own.
	foreach DynamicActors(class'TrProjectile', TrProj)
	{
		if (TrProj.InstigatorController == self)
		{
			TrProj.DetonateObsolete();
		}
	}
}

event QueueBadge(int Icon, string Title, string XPReward)
{
    TrHUD(myHUD).QueueAccolade(Icon, Title, XPReward, true);
}

reliable client function ClientQueueAccolade(int Icon, string Title, string Subtitle, optional bool bIsBadge = false)
{
    TrHUD(myHUD).QueueAccolade(Icon, Title, Subtitle, bIsBadge);
}

exec function ClassHotkeyPTH() { QuickLoadouts(CLASS_TYPE_LIGHT_PATHFINDER); }
exec function ClassHotkeySEN() { QuickLoadouts(CLASS_TYPE_LIGHT_SENTINEL); }
exec function ClassHotkeyINF() { QuickLoadouts(CLASS_TYPE_LIGHT_INFILTRATOR); }
exec function ClassHotkeySLD() { QuickLoadouts(CLASS_TYPE_MEDIUM_SOLDIER); }
exec function ClassHotkeyRDR() { QuickLoadouts(CLASS_TYPE_MEDIUM_RAIDER); }
exec function ClassHotkeyTCN() { QuickLoadouts(CLASS_TYPE_MEDIUM_TECHNICIAN); }
exec function ClassHotkeyJUG() { QuickLoadouts(CLASS_TYPE_HEAVY_JUGGERNAUGHT); }
exec function ClassHotkeyDMB() { QuickLoadouts(CLASS_TYPE_HEAVY_DOOMBRINGER); }
exec function ClassHotkeyBRT() { QuickLoadouts(CLASS_TYPE_HEAVY_BRUTE); }

exec function QuickClasses()
{
    local TrPlayerInput TrPI;

    TrPI = TrPlayerInput(PlayerInput);

    if (TrPI != none)
    {
        TrPI.StartVGSClasses();
    }
}

function QuickLoadouts(int ClassId)
{
    local TrPlayerInput TrPI;

    TrPI = TrPlayerInput(PlayerInput);

    if (TrPI != none)
    {
        TrPI.StartVGSLoadouts(ClassId);
    }
}

function EndVGSInput()
{
    local TrPlayerInput TrPI;

    TrPI = TrPlayerInput(PlayerInput);

    if (TrPI != none)
    {
        TrPI.EndVGS();
    }
}























/** Hold on loading the summary until earned badges are sent across */
function StartUILoadSummaryTimer()
{
    SetTimer(1.5f, false, 'FireUILoadSummary');
}





























































function OpenVehicleMenu(TrVehicleStation VehicleStation)
{
	local int CreditCost;
	local int j;
	local int VehicleCount, VehicleMaxAllowed;
    local TrPawn TrP;
    local class<TrFamilyInfo> FamilyInfo;

    TrP = TrPawn(Pawn);

    if (TrP == none)
    {
        return;
    }

    FamilyInfo = TrP.GetCurrCharClassInfo();

    if (FamilyInfo == none)
    {
        return;
    }

	ClearVehicleMenu();

	for (j = 0; j < FamilyInfo.default.VehicleSelectionList.Length; j++)
	{
		// Determine the credit cost.
		CreditCost = InTraining() ? 0 : GetVehicleCost(FamilyInfo.default.VehicleSelectionList[j]);
		VehicleCount = 0;
		VehicleMaxAllowed = 0;

		if (VehicleStation != none)
		{
			VehicleCount = VehicleStation.GetNumVehiclesSpawnedByType(FamilyInfo.default.VehicleSelectionList[j].default.m_VehicleType);
			VehicleMaxAllowed = VehicleStation.GetMaxVehicleCountAllowed(FamilyInfo.default.VehicleSelectionList[j].default.m_VehicleType);
		}

        if (VehicleMaxAllowed > 0)
        {
		    AddVehicleMenuOption(string(FamilyInfo.default.VehicleSelectionList[j]),
				                 FamilyInfo.default.VehicleSelectionList[j].default.m_sName,
				                 CreditCost,
				                 FamilyInfo.default.VehicleSelectionList[j].default.m_nIconIndex, 
				                 VehicleCount, 
				                 VehicleMaxAllowed);
        }
	}

	ShowVehicleMenu(GetCurrentCredits());
}

function int GetTeamClassCount(int ClassId)
{
    local int i;
    local int count;
    local TrGameReplicationInfo TrGRI;
	local TrPlayerReplicationInfo TrPRI;
    local array<PlayerReplicationInfo> PRIArray;

	TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none)
    {
        PRIArray = TrGRI.PRIArray;

	    for (i = 0; i < PRIArray.Length; i++ )
	    {
		    TrPRI = TrPlayerReplicationInfo(PRIArray[i]);

		    if (TrPRI != none && (TrPRI.GetTeamNum() != 255) && (TrPRI.GetTeamNum() == m_RequestedTeam) && !TrPRI.bOnlySpectator)
		    {
                if (TrPRI.GetCurrentClass() != none && TrPRI.GetCurrentClass().default.ClassId == ClassId)
                {
                    count++;
                }
		    }
	    }
    }

    return count;
}

simulated function OnScoreChanged(UTTeamInfo T)
{
	local int TeamNumber;

	TeamNumber = GetTeamNum();
	if( TeamNumber == 0 || TeamNumber == 1 )
	{
		if( IsGameTypeCaH() )
		{
			// Check to see if we need to play a message based on this score.
			if( WorldInfo.GRI.GoalScore - T.Score == 25 )
			{
				ReceiveLocalizedMessage(class'TrCaHMessage', T.GetTeamNum() == TeamNumber ? 3 : 2,,,T);
			}
			else if( T.Score % 50 == 0 )
			{
				// Play a score message every 50 scores.
				ReceiveLocalizedMessage(class'TrCaHMessage', T.GetTeamNum() == TeamNumber ? 5 : 4,,,T);
			}
		}
	}
}

simulated function int GetAllowedClassCount(TrClassType ClassType)
{
    local TrGameReplicationInfo TrGRI;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none && TrGRI.r_ServerConfig != none)
    {
        return TrGRI.r_ServerConfig.GetClassCount(ClassType);
    }

    return 16;
}

simulated function int GetActiveClassId()
{
    local TrPlayerReplicationInfo TrPRI;
    local class<TrFamilyInfo> FamilyInfo;

    TrPRI = TrPlayerReplicationInfo(PlayerReplicationInfo);

    if (TrPRI != none)
    {
        FamilyInfo = TrPRI.GetCurrentClass();

        if (FamilyInfo != none)
        {
            return FamilyInfo.default.ClassId;
        }
    }

    return 0;
}

function CheckFriendlyFireKills()
{
    local TrGameReplicationInfo TrGRI;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none && TrGRI.r_ServerConfig != none && TrGRI.r_ServerConfig.FFKillLimit > 0)
    {
        if (FriendlyFireKills >= TrGRI.r_ServerConfig.FFKillLimit)
        {
            ServerKickPlayer(0);
        }
    }
}

function CheckFriendlyFireDamage()
{
    local TrGameReplicationInfo TrGRI;

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI != none && TrGRI.r_ServerConfig != none && TrGRI.r_ServerConfig.FFDamageLimit > 0)
    {
        if (FriendlyFireDamage >= TrGRI.r_ServerConfig.FFDamageLimit)
        {
            ServerKickPlayer(0);
        }
    }
}

function StartRefreshPageTimer()
{
    SetTimer(0.3f, false, 'FireRefreshPage');
}

function UpdateMainMenuPaperDoll_Mesh(EContentDataType Type);

function ClearMainMenuPaperDoll();

function ClearPaperDoll()
{
    if (m_PaperDoll != none)
    {
        m_PaperDoll.m_LastFamilyClassRequest = none;
        m_PaperDoll.m_LastDeviceOnlyRequest = none;
    }
}

function SpecList()
{
    local int i;
    local LocalPlayer LP;
    local TrGameViewportClient TrVC;
    local TrGameReplicationInfo TrGRI;

    LP = LocalPlayer(Player);

    if (LP == none)
    {
        return;
    }

    TrVC = TrGameViewportClient(LP.ViewportClient);

    if (TrVC == none || TrVC.ViewportConsole == none)
    {
        return;
    }

    TrGRI = TrGameReplicationInfo(WorldInfo.GRI);

    if (TrGRI == none)
    {
        return;
    }

    if (TrGRI.PRIArray.Length == 0)
    {
        TrVC.ViewportConsole.OutputText("<NO SPECTATORS>");
    }

    for (i = 0; i < TrGRI.PRIArray.Length; i++)
    {
        if (TrGRI.PRIArray[i].GetTeamNum() == 255 && TrGRI.PRIArray[i].PlayerName != "Player")
        {
            TrVC.ViewportConsole.OutputText("<SPECTATING>"@TrGRI.PRIArray[i].PlayerName);
        }
    }
}

function SampleVoice(class<TrPlayerVoice> VoiceClass)
{
    VoiceClass.static.PlayRandomSample(self);
}

event string StripTag(string sValue)
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

simulated function SetAllowSimProjectiles(bool bAllow)
{
	m_bAllowSimulatedProjectiles = bAllow;
	ServerSetAllowSimProjectiles(bAllow);
	SaveConfig();
}

reliable server function ServerSetAllowSimProjectiles(bool bAllow)
{
	m_bAllowSimulatedProjectiles = bAllow;
}

defaultproperties
{
   m_bEditorMode=True
   m_bJustJoined=True
   m_bEnableOverheadDamageIndicators=True
   m_bShowHUDReticule=True
   m_bShowHUDCredits=True
   m_bShowHUDAccolades=True
   m_bShowHUDBadges=True
   m_bShowHUDScores=True
   m_bShowHUDHealthBar=True
   m_bShowHUDChat=True
   m_bShowHUDCombatLog=True
   m_bShowHUDKillbox=True
   m_bShowHUDDeathcam=True
   m_bShowHUDHeroText=True
   m_bShowHUDPromptPanel=True
   m_bShowHUDRespawnTimer=True
   m_bShowHUDSkiBars=True
   m_bShowHUDNotifications=True
   m_bShowHUDFriendStateNotifications=True
   m_bShowHUDCracks=True
   m_bAllowSimulatedProjectiles=True
   m_RequestedTeam=255
   Begin Object Class=AudioComponent Name=LowHealthLoop
      bShouldRemainActiveIfDropped=True
      Name="LowHealthLoop"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   m_AudioComponentLowHealthLoop=LowHealthLoop
   Begin Object Class=AudioComponent Name=RechargeHealth
      bShouldRemainActiveIfDropped=True
      Name="RechargeHealth"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   m_AudioComponentRechargeHealth=RechargeHealth
   Begin Object Class=AudioComponent Name=CreditsSound
      bShouldRemainActiveIfDropped=True
      Name="CreditsSound"
      ObjectArchetype=AudioComponent'Engine.Default__AudioComponent'
   End Object
   m_AudioComponentCreditsSound=CreditsSound
   m_EventCreditMap(0)=(eventCredits=400,proxyEventCredits=400)
   m_EventCreditMap(1)=(EventType=PlayerDeathEvent,eventCredits=200,proxyEventCredits=200)
   m_EventCreditMap(2)=(EventType=FlagCaptureEvent,eventCredits=2000,proxyEventCredits=2000,MsgIdx=74)
   m_EventCreditMap(3)=(EventType=FlagPickupEvent,eventCredits=500,proxyEventCredits=500,MsgIdx=75)
   m_EventCreditMap(4)=(EventType=FlagReturnEvent,eventCredits=500,proxyEventCredits=500)
   m_EventCreditMap(5)=(EventType=SuicideEvent,eventCredits=-200,proxyEventCredits=-200)
   m_EventCreditMap(6)=(EventType=TeamKillCredit,eventCredits=-400,proxyEventCredits=-400)
   m_fDesiredZoomFOV=40.000000
   m_fDesiredMagnifiedZoomFOV=20.000000
   m_fZoomRate=300.000000
   m_fLastHitEnemyTime=-1000.000000
   m_fSkiFollowthroughTime=0.500000
   m_fMinActiveSkiTimeToEnableFollowthough=0.200000
   m_VehicleSeatIndex=-1
   m_CameraShakes(0)=(Shake=CameraShake'TribesGame.Default__TrPlayerController:SmallShake',ShakeName="SmallShake")
   m_CameraShakes(1)=(Shake=CameraShake'TribesGame.Default__TrPlayerController:MediumShake',ShakeName="MediumShake")
   m_CameraShakes(2)=(Shake=CameraShake'TribesGame.Default__TrPlayerController:LargeShake',ShakeName="LargeShake")
   m_CameraShakes(3)=(Shake=CameraShake'TribesGame.Default__TrPlayerController:Zinged',ShakeName="Zinged")
   m_CameraShakes(4)=(Shake=CameraShake'TribesGame.Default__TrPlayerController:ConcussionShake',ShakeName="ConcussionShake")
   m_fSpeedCameraSpeedSqared=640000.000000
   m_DefaultPPSettings=(bOverride_EnableBloom=True,bOverride_EnableDOF=True,bOverride_EnableMotionBlur=True,bOverride_EnableSceneEffect=True,bOverride_AllowAmbientOcclusion=True,bOverride_OverrideRimShaderColor=True,bOverride_Bloom_Scale=True,bOverride_Bloom_Threshold=True,bOverride_Bloom_Tint=True,bOverride_Bloom_ScreenBlendThreshold=True,bOverride_Bloom_InterpolationDuration=True,bOverride_DOF_FalloffExponent=True,bOverride_DOF_BlurKernelSize=True,bOverride_DOF_BlurBloomKernelSize=True,bOverride_DOF_MaxNearBlurAmount=True,bOverride_DOF_MaxFarBlurAmount=True,bOverride_DOF_ModulateBlurColor=True,bOverride_DOF_FocusType=True,bOverride_DOF_FocusInnerRadius=True,bOverride_DOF_FocusDistance=True,bOverride_DOF_FocusPosition=True,bOverride_DOF_InterpolationDuration=True,bOverride_Scene_Desaturation=True,bOverride_Scene_HighLights=True,bOverride_Scene_MidTones=True,bOverride_Scene_Shadows=True,bOverride_Scene_InterpolationDuration=True,bOverride_RimShader_Color=True,bOverride_RimShader_InterpolationDuration=True,bEnableBloom=True,bEnableMotionBlur=True,bEnableSceneEffect=True,bAllowAmbientOcclusion=True,Bloom_Scale=1.000000,Bloom_Threshold=1.000000,Bloom_Tint=(B=255,G=255,R=255,A=0),Bloom_ScreenBlendThreshold=10.000000,Bloom_InterpolationDuration=1.000000,DOF_BlurBloomKernelSize=16.000000,DOF_FalloffExponent=4.000000,DOF_BlurKernelSize=16.000000,DOF_MaxNearBlurAmount=1.000000,DOF_MaxFarBlurAmount=1.000000,DOF_ModulateBlurColor=(B=255,G=255,R=255,A=255),DOF_FocusInnerRadius=2000.000000,DOF_InterpolationDuration=1.000000,MotionBlur_MaxVelocity=1.000000,MotionBlur_Amount=0.500000,MotionBlur_FullMotionBlur=True,MotionBlur_CameraRotationThreshold=45.000000,MotionBlur_CameraTranslationThreshold=10000.000000,MotionBlur_InterpolationDuration=1.000000,Scene_Colorize=(X=1.000000,Y=1.000000,Z=1.000000),Scene_TonemapperScale=1.000000,Scene_HighLights=(X=1.000000,Y=1.000000,Z=1.000000),Scene_MidTones=(X=1.000000,Y=1.000000,Z=1.000000),Scene_InterpolationDuration=1.000000,RimShader_Color=(R=0.470440,G=0.585973,B=0.827726,A=1.000000),RimShader_InterpolationDuration=1.000000)
   m_RoundEndedPPSettings=(bOverride_EnableBloom=True,bOverride_EnableDOF=True,bOverride_EnableMotionBlur=True,bOverride_EnableSceneEffect=True,bOverride_AllowAmbientOcclusion=True,bOverride_OverrideRimShaderColor=True,bOverride_Bloom_Scale=True,bOverride_Bloom_Threshold=True,bOverride_Bloom_Tint=True,bOverride_Bloom_ScreenBlendThreshold=True,bOverride_Bloom_InterpolationDuration=True,bOverride_DOF_FalloffExponent=True,bOverride_DOF_BlurKernelSize=True,bOverride_DOF_BlurBloomKernelSize=True,bOverride_DOF_MaxNearBlurAmount=True,bOverride_DOF_MaxFarBlurAmount=True,bOverride_DOF_ModulateBlurColor=True,bOverride_DOF_FocusType=True,bOverride_DOF_FocusInnerRadius=True,bOverride_DOF_FocusDistance=True,bOverride_DOF_FocusPosition=True,bOverride_DOF_InterpolationDuration=True,bOverride_Scene_Desaturation=True,bOverride_Scene_HighLights=True,bOverride_Scene_MidTones=True,bOverride_Scene_Shadows=True,bOverride_Scene_InterpolationDuration=True,bOverride_RimShader_Color=True,bOverride_RimShader_InterpolationDuration=True,bEnableBloom=True,bEnableMotionBlur=True,bEnableSceneEffect=True,bAllowAmbientOcclusion=True,Bloom_Scale=1.000000,Bloom_Threshold=1.000000,Bloom_Tint=(B=255,G=255,R=255,A=0),Bloom_ScreenBlendThreshold=10.000000,Bloom_InterpolationDuration=1.000000,DOF_BlurBloomKernelSize=16.000000,DOF_FalloffExponent=0.500000,DOF_BlurKernelSize=16.000000,DOF_MaxNearBlurAmount=1.000000,DOF_MinBlurAmount=0.400000,DOF_MaxFarBlurAmount=1.000000,DOF_ModulateBlurColor=(B=255,G=255,R=255,A=255),DOF_FocusInnerRadius=400.000000,DOF_FocusDistance=200.000000,DOF_InterpolationDuration=1.000000,MotionBlur_MaxVelocity=1.000000,MotionBlur_Amount=0.500000,MotionBlur_FullMotionBlur=True,MotionBlur_CameraRotationThreshold=45.000000,MotionBlur_CameraTranslationThreshold=10000.000000,MotionBlur_InterpolationDuration=1.000000,Scene_Desaturation=0.100000,Scene_Colorize=(X=1.000000,Y=1.000000,Z=1.000000),Scene_TonemapperScale=1.000000,Scene_HighLights=(X=0.800000,Y=0.800000,Z=0.800000),Scene_MidTones=(X=1.500000,Y=1.500000,Z=1.500000),Scene_Shadows=(X=0.100000,Y=0.100000,Z=0.100000),Scene_InterpolationDuration=1.000000,RimShader_Color=(R=0.470440,G=0.585973,B=0.827726,A=1.000000),RimShader_InterpolationDuration=1.000000)
   m_RoundEndedPPInterpSpeed=0.100000
   m_RoundEndedVZeroSpeed=100.000000
   m_HelpTextManagerClass=Class'TribesGame.TrHelpTextManager'
   m_fDistanceCheckInterval=5.000000
   m_fHideSkiHelpTextDistanceThresholdSq=40000.000000
   m_fHideJetpackHelpTextDistanceThresholdSq=80000.000000
   m_fSpeedCheckInterval=0.100000
   s_fNewPlayerAssistMitigateCauseDamageMultiplier=1.400000
   s_nMaxNewPlayerAssistPoints=50
   m_fMaxBroadcastSpamCount=4
   m_fMessageSpamTime=2.000000
   m_fLockoutFromSpamTime=10.000000
   m_fUserSuicideTimePenalty=5.000000
   m_fDeathCameraOuterScale=50.000000
   m_fDeathCameraInnerScale=9.000000
   m_fDeathCameraInterpSpeed=4.000000
   m_vDeathCamOffset=(X=20.000000,Y=0.000000,Z=10.000000)
   LoadingScreenTimeout=60.000000
   m_DamageNeededForCredit=20
   m_TeamAssistCredit=50
   m_TeamRabbitAssistCredit=10
   m_nMaxVGSSoundChannels=5
   fSniperRespawnDelay=5.000000
   CameraShakeShortWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPlayerController:ForceFeedbackWaveform7'
   CameraShakeLongWaveForm=ForceFeedbackWaveform'TribesGame.Default__TrPlayerController:ForceFeedbackWaveform8'
   SavedMoveClass=Class'TribesGame.TrSavedMove'
   CheatClass=Class'TribesGame.TrCheatManager'
   InputClass=Class'TribesGame.TrPlayerInput'
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'UTGame.Default__UTPlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'UTGame.Default__UTPlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   ForceFeedbackManagerClassName="WinDrv.XnaForceFeedbackManager"
   MinRespawnDelay=5.000000
   bNotifyFallingHitWall=True
   MinHitWall=1.100000
   Components(0)=CollisionCylinder
   Components(1)=LowHealthLoop
   Components(2)=RechargeHealth
   Components(3)=CreditsSound
   CollisionComponent=CollisionCylinder
   Name="Default__TrPlayerController"
   ObjectArchetype=UTPlayerController'UTGame.Default__UTPlayerController'
}
