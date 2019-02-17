/**
 * Tribes Stats Interface to native manager.
 * 
 * WILL REWRITE USING GENERICS IN NEXT ITERATION - Getting in the straight port first
 */
class TrStatsInterface extends Object
    native;

/** Save off the subsytem pointer */
native function Initialize(OnlineSubsystem Sub);

/** Data for DB and summaries */
native function AddKill(TrPlayerController PC);
native function AddDeath(TrPlayerController PC);
native function AddAssist(TrPlayerController PC);
native function AddAccolade(TrPlayerController PC, int Id, int ActivityId);
native function AddCredits(TrPlayerController PC, int Val, bool bSpent, bool bFree);
native function UpdateTimePlayed(TrPlayerController PC, int TimeUsed);
native function UpdateWeapon(TrPlayerController PC, int WeaponId, int ActivityId, int ShotsFired, int TimeUsed);
native function UpdateDamage(TrPlayerController PC, int WeaponId, int Amount, int Dist, bool bKill, bool bVehicle);

/** Used for marking and backtracing new and disconnected/rejoining players */
native function SetIdentification(TrPlayerController PC);
native function SetActiveClass(TrPlayerController PC, int ClassId);

/** Volatile award stats for summary - may move to Id based*/
native function AddRepair(TrPlayerController PC);
native function AddFlagCap(TrPlayerController PC);
native function AddFlagGrab(TrPlayerController PC);
native function AddFlagReturn(TrPlayerController PC);
native function AddMidairKill(TrPlayerController PC);
native function AddVehicleKill(TrPlayerController PC);
native function SetXP(TrPlayerController PC, int Val);
native function SetTeam(TrPlayerController PC, int TeamNum);
native function AddVehicleDestruction(TrPlayerController PC);
native function SetSpeedSkied(TrPlayerController PC, int Val);
native function AddDeployableDestruction(TrPlayerController PC);
native function AddCreditsSpent(TrPlayerController PC, int Val);
native function SetDistanceKill(TrPlayerController PC, int Val);
native function SetSpeedFlagCap(TrPlayerController PC, int Val);
native function AddCreditsEarned(TrPlayerController PC, int Val);
native function AddDistanceSkied(TrPlayerController PC, int Val);
native function SetSpeedFlagGrab(TrPlayerController PC, int Val);
native function SetDistanceHeadshot(TrPlayerController PC, int Val);

native function FallingDeath(TrPlayerController PC);
native function SkiDistance(TrPlayerController PC, int Distance);
native function BeltKill(TrPlayerController PC);
native function CallIn(TrPlayerController PC);
native function CallInKill(TrPlayerController PC);
native function RegeneratedToFull(TrPlayerController PC);
native function FlagGrabSpeed(TrPlayerController PC, int Speed);
native function VehicleKill(TrPlayerController PC);
native function InvStationVisited(TrPlayerController PC);
native function SkiSpeed(TrPlayerController PC, int Speed);
native function BaseUpgrade(TrPlayerController PC);

/** Motion map stats - Not currently used */
 native function TrackPlayerMovement(TrPlayerController PC, int Timestamp);

/** Specific matchwide stats */
native function AddVehicleSpawn();
native function AddGeneratorDestruction();

/** Packages the DB match data and creates a summary for all players */
native function WriteMatchStats();

/** Packages the DB player data and creates a summary for each player */
native function WritePlayerStats(array<PlayerReplicationInfo> PRIArray);

native function GameEnd();

/** Sends the packaged data to the database */
native function Flush();

defaultproperties
{
   Name="Default__TrStatsInterface"
   ObjectArchetype=Object'Core.Default__Object'
}
