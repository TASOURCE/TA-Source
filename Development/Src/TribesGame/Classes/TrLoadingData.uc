class TrLoadingData extends Object within GFxTrMenuMoviePlayer
    native;

var string Tip;
var string Rules;
var string MapURL;
var string MapName;
var string GameType;
var localized string RulesForCTF;
var localized string RulesForTDM;
var localized string RulesForRabbit;
var localized string RulesForArena;
var localized string RulesForDaD;
var localized string RulesForCaH;
var localized string RulesForBlitz;

var	localized array<string> CTFTips;
var	localized array<string> TDMTips;
var	localized array<string> RabbitTips;
var	localized array<string> ArenaTips;
var	localized array<string> GenericTips;
var localized array<string> CaHTips;

native function string GetRandomTip(int GameIndex);

/** Eventually have this grab the strings from the database */
function Initialize()
{
}

function SetDataFields()
{
    //local array<string> tempArray;

    MapName = "NEXT MAP";
    GameType = "GET READY";
    Rules = "";
    Tip = GetRandomTip(0);

    if (MapURL != "")
    {
		if (InStr(MapURL, "TrCTFBlitz") >= 0)
        {
            Tip = GetRandomTip(0);
            Rules = RulesForBlitz;
            GameType = "CAPTURE THE FLAG BLITZ";
        }
        else if (InStr(MapURL, "TrCTF") >= 0)
        {
            Tip = GetRandomTip(0);
            Rules = RulesForCTF;
            GameType = "CAPTURE THE FLAG";
        }
        else if (InStr(MapURL, "TrTeamRabbit") >= 0)
        {
            Tip = GetRandomTip(1);
            Rules = RulesForTDM;
            GameType = "TEAM DEATHMATCH";
        }
        else if (InStr(MapURL, "TrRabbit") >= 0)
        {
            Tip = GetRandomTip(2);
            Rules = RulesForRabbit;
            GameType = "RABBIT";
        }
		else if (InStr(MapURL, "TrArena") >= 0)
		{
			Tip = GetRandomTip(3);
            Rules = RulesForArena;
            GameType = "ARENA";
		}   
		else if (InStr(MapURL, "TrDaD") >= 0)
		{
			Tip = GetRandomTip(3);
            Rules = RulesForDaD;
            GameType = "DEFEND AND DESTROY";
		} 
		else if (InStr(MapURL, "TrCaH") >= 0)
		{
			Tip = GetRandomTip(3);
            Rules = RulesForCaH;
            GameType = "CAPTURE AND HOLD";
		} 
    }

    if(NextMapName != "")
    {
        MapName = Caps(NextMapName);
    }

    Outer.ASC_SetMapLoadText(Strings.NextMap, MapName, Strings.GameType, GameType, Strings.GameRules, Rules, Strings.GameTip, Tip);
}

defaultproperties
{
   RulesForCTF="· Prevent enemy from capturing your flag.\n· Take enemy flag back to your stand to\n  capture.\n· To capture, your flag must be at its stand. \n· Five captures to win."
   RulesForTDM="· Eliminate the opposing team's forces.\n· First player death spawns a flag.\n· Team holding the flag gets double points for\n  kills."
   RulesForRabbit="· Grab the flag to score a point.\n· Hold onto the flag to gain more points.\n· Kill enemy players to score.\n· Game to 30 points."
   RulesForArena="· Eliminate the opposing team's forces.\n· The team that wins two rounds wins the match.\n· Each team has 25 respawns. \n· After team respawns are depleted, players get one more life."
   RulesForCaH="· Capture and hold the various Control Points.\n· A Control Point is captured by touching a point's switch.\n· Once a Control Point has been held for 5 seconds, the owning team gains a score.\n· Held Control Points generate a score every 5 seconds.\n· The team that reaches the goal score wins."
   RulesForBlitz="· Flag positions rotate after each capture.\n· Prevent enemy from capturing your flag.\n· Take enemy flag back to your stand to\n  capture.\n· To capture, your flag must be at its stand. \n· Five captures to win."
   CTFTips(0)="Generators provide power to base defenses and vehicle pads, as well as player deployables like force fields, light turrets, and sensor jammers."
   CTFTips(1)="Repair tool stations can be found inside bases and around generators, and may be used by any class to swap your current weapon with a Repair Tool by pressing (default: G)."
   CTFTips(2)="Repairing base defenses and your Generator will reward you with credits, in addition to helping your team."
   CTFTips(3)="Base Assets such as the Base Turrets or Generator may be upgraded by spending credits you earn during a match by pressing (default: G). Upgraded turrets shoot faster and can take more damage."
   CTFTips(4)="Base Radar Stations will spot and mark all enemies within range, even those outside of your line of sight."
   CTFTips(5)="Vehicles may be purchased at any time by using credits you earn in a match, though your team’s Generator must be online for you to access the vehicle station."
   CTFTips(6)="Armored Targets such as Vehicles and Base Turrets can only be damaged with explosive weaponry."
   TDMTips(0)="While holding an enemy flag you will not regenerate health. You can throw the flag by pressing (default Z)."
   RabbitTips(0)="While holding the flag you will not regenerate health - in Rabbit, you cannot throw the flag."
   ArenaTips(0)="Spot enemies (default: Left Alt) to help identify targets for your teammates."
   ArenaTips(1)="In Arena mode, deployables are destroyed when the owning player dies."
   ArenaTips(2)="When you spawn in Arena mode, you are invulnerable until you fire your first shot or 5 seconds has passed, whichever comes first."
   GenericTips(0)="XP can be used to unlock new Classes, Weapons, Perks, and Upgrades."
   GenericTips(1)="Purchase a booster to double the rate at which you gain XP."
   GenericTips(2)="You can leave a match early and still earn XP for the amount of time you played. You will be awarded when the match ends."
   GenericTips(3)="Call-Ins such as Orbital Strike or Supply Drop may be purchased any time by using credits you earn in a match."
   GenericTips(4)="All classes have a melee weapon which you can use by pressing (default: E)."
   GenericTips(5)="Press (default V) to access a set of quick voice commands for communication with your team."
   GenericTips(6)="While holding an enemy flag you will not regenerate health. You can throw the flag by pressing (default Z)."
   GenericTips(7)="You earn credits in a match by scoring kills, repairing defenses, returning or grabbing flags, and being awarded accolades."
   GenericTips(8)="Player deployables are powered by the Generator. If it is down your team’s deployables will be offline until the generator is operational once again."
   GenericTips(9)="You can change your zoom level by using the middle-mouse wheel."
   CaHTips(0)="Damaged defenses will return up to half-health when a point is successfully held by a team."
   Name="Default__TrLoadingData"
   ObjectArchetype=Object'Core.Default__Object'
}
