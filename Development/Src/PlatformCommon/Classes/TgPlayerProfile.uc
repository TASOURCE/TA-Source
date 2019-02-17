class TgPlayerProfile extends OnlinePlayerStorage
	native;

struct native PropertyPair
{
    var int PropertyId;
    var int Value;
};

struct native AccoladeStruct
{
    var int AccoladeId;
    var int ActivityId;
    var int Type;
    var int Value;
};

struct native BadgeStruct
{
    var int BadgeId;
    var int ActivityId;
    var int Icon;
    var int Tier;
    var int Progress;
    var int MaxValue;
    var int Category;
    var init string Title;
    var init string Description;
};

var int    Rank;
var int    Kills;
var int    Deaths;
var int    Assists;
var int    XPLevel;
var int    HZPoints;
var int    XPPoints;
var int    AssistPoints;
var int    AverageScore;
var int    BoostHoursRemaining;
var int    InfoMask;
var int    TimePlayed;
var int    TotalAccolades;
var int    FastestSki;

var int    FlagGrabs;
var int    FlagCaps;
var int    GensDestroyed;
var int    ObjsDestroyed;

var bool   bVIP;
var bool   bBoost;

var int         PlayerId;
var init string PlayerName;
var array<BadgeStruct> Badges;
var array<BadgeStruct> TopBadges;
var array<PropertyPair> ClassTimePlayed;
var array<AccoladeStruct> Accolades;

defaultproperties
{
   Name="Default__TgPlayerProfile"
   ObjectArchetype=OnlinePlayerStorage'Engine.Default__OnlinePlayerStorage'
}
