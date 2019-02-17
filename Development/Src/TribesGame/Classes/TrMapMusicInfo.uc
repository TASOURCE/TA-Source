class TrMapMusicInfo extends UDKMapMusicInfo
    hidecategories(UDKMapMusicInfo);

struct TrMapStingers
{
    var() SoundCue PlayerWon;
    var() SoundCue PlayerLost;
    var() SoundCue FriendlyFlagPickedUpFromBase;
    var() SoundCue FriendlyFlagPickedUpFromDropped;
    var() SoundCue FriendlyFlagCaptured;
    var() SoundCue FriendlyFlagReturned;
    var() SoundCue FriendlyFlagDropped;
    var() SoundCue EnemyFlagPickedUpFromBase;
    var() SoundCue EnemyFlagPickedUpFromDropped;
    var() SoundCue EnemyFlagCaptured;
    var() SoundCue EnemyFlagReturned;
    var() SoundCue EnemyFlagDropped;
	var() SoundCue TeamRabbitEnemyPickedUpFlag;
	var() SoundCue TeamRabbitFriendlyPickedUpFlag;

    structdefaultproperties
    {
        FriendlyFlagPickedUpFromBase=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagPickedUp'
        FriendlyFlagPickedUpFromDropped=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagPickedUp'
        FriendlyFlagCaptured=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagCaptured'
        FriendlyFlagReturned=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagReturned'
        FriendlyFlagDropped=None
        EnemyFlagPickedUpFromBase=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagPickedUp'
        EnemyFlagPickedUpFromDropped=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagPickedUp'
        EnemyFlagCaptured=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagCaptured'
        EnemyFlagReturned=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagReturned'
        EnemyFlagDropped=None
		PlayerWon=None
		PlayerLost=None
		TeamRabbitEnemyPickedUpFlag=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagReturned'
		TeamRabbitFriendlyPickedUpFlag=SoundCue'AUD_MUS_CTF.Stingers.A_CUE_UI_CTF_FlagPickedUp'
    }
};

struct TrMapMusic
{
    var() SoundCue BattleMusicLow;
    var() SoundCue BattleMusicMed;
    var() SoundCue BattleMusicHigh;
    var() SoundCue FlagPossession;
    var() SoundCue DeathDirge;
    var() SoundCue TeamWon;
    var() SoundCue TeamLost;
	var() SoundCue AmbientMusic;
};

/** Music for the map. */
var() TrMapMusic m_MapMusic;

/** Stingers for the map **/
var() TrMapStingers m_MapStingers;

defaultproperties
{
   Name="Default__TrMapMusicInfo"
   ObjectArchetype=UDKMapMusicInfo'UDKBase.Default__UDKMapMusicInfo'
}
