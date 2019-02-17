class TrMusicManager extends Info
	config(Game);

/** Owner of this MusicManager */
var TrPlayerController m_PlayerOwner;	

/** Maximum volume for music audiocomponents (max value for VolumeMultiplier). */
var globalconfig float m_fMusicVolume;

/** Maximum volume for stinger audiocomponents (max value for VolumeMultiplier). */
var config float m_fStingerVolumeMultiplier;

enum ETgMusicState
{
	MUSICSTATE_BattleLow,
	MUSICSTATE_BattleMed,
    MUSICSTATE_BattleHigh,
    MUSICSTATE_FlagPossession,
    MUSICSTATE_DeathDirge,
    MUSICSTATE_TeamWonMatch,
    MUSICSTATE_TeamLostMatch,
    MUSICSTATE_NoMusic,
	MUSICSTATE_Ambient,
};

/** Current music state (reflects which track is active). */
var ETgMusicState m_CurrentState;

/** Pending music state. */
var protected ETgMusicState m_PendingState;	

/** Track being ramped up, rather than faded out */
var AudioComponent m_CurrentTrack;	

/** All the music tracks for this level. */
var AudioComponent m_MusicTracks[9];

/** Local version of CTF scores, so that we can detect when we receive */
var float m_CTFTeamScores[2];

event PostBeginPlay()
{
	Super.PostBeginPlay();

    m_PlayerOwner = TrPlayerController(Owner);
    
    // start music on a short timer so we avoid the long initial tick that can make the music skip
	SetTimer(1.0, false, 'StartMusic');
}

function AudioComponent CreateNewTrack(SoundCue MusicCue)
{
	local AudioComponent AC;

	AC = CreateAudioComponent( MusicCue, false, true );

	// AC will be none if -nosound option used
	if ( AC != None )
	{
		AC.bAllowSpatialization = false;
		AC.bShouldRemainActiveIfDropped = true;
        AC.VolumeMultiplier = m_fMusicVolume;
	}
	return AC;
}

/** StartMusic()
* Initialize MusicManager and start intro track.
*/
function StartMusic()
{
    SetStateBasedOnGameState();
	if( m_CurrentTrack != None )
	{
		m_CurrentTrack.Play();
	}
}

/** Looks to the game type and rules to see what the appropriate state should be. */
function SetStateBasedOnGameState()
{
    local TrPlayerReplicationInfo LocalPRI;
    local class<GameInfo> GameClass;
    local float Score;
    local float GoalScorePct;

    GameClass = WorldInfo.GetGameClass();
    LocalPRI = TrPlayerReplicationInfo(m_PlayerOwner.PlayerReplicationInfo);

	// No team
	if( LocalPRI.Team == none )
	{
		if( GameClass == class'TrGame_TrArena' )
		{
			SetPendingState(MUSICSTATE_Ambient);
		}
		else
		{
			SetPendingState(MUSICSTATE_BattleLow);
		}
		return;
	}

    // If for some reason the goal score for the match is not a 'real score' then just play the low music.
    if( WorldInfo.GRI != none && WorldInfo.GRI.GoalScore < 1 )
    {
        SetPendingState(MUSICSTATE_BattleLow);
        return;
    }

	if( GameClass == class'TrGame_TrArena' )
	{
		if( TrGameReplicationInfo(WorldInfo.GRI).bWarmupRound )
		{
			SetPendingState(MUSICSTATE_Ambient);
		}
		else if( LocalPRI.Team.Score > 5 )
		{
			SetPendingState(MUSICSTATE_BattleLow);
		}
		else if( LocalPRI.Team.Score > 0 )
		{
			SetPendingState(MUSICSTATE_BattleMed);
		}
		else
		{
			SetPendingState(MUSICSTATE_BattleHigh);
		}
	}
	else
	{
		if( GameClass == class'TrGame_TRTeamRabbit' ) 
		{
			Score = FMin(WorldInfo.GRI.Teams[0].Score, WorldInfo.GRI.Teams[1].Score);
			GoalScorePct = 1.0 - (Score / float(WorldInfo.GRI.GoalScore));
		}
		else
		{
			if( GameClass == class'TrGame_TRCTF' )
			{
				Score = LocalPRI.Team.Score;
			}
			else if( GameClass == class'TrGame_TRRabbit' )
			{
				Score = LocalPRI.Score;
			}
			else if( GameClass == class'TrGame_TRTDM' )
			{
				Score = LocalPRI.Team.Score;
			}
			GoalScorePct = 1.0 - (float(WorldInfo.GRI.GoalScore) - Score) / float(WorldInfo.GRI.GoalScore);
		}

		if( GoalScorePct < 0.3333f )
		{
			SetPendingState(MUSICSTATE_BattleLow);
		}
		else if( GoalScorePct <= 0.6666f )
		{
			SetPendingState(MUSICSTATE_BattleMed);
		}
		else
		{
			SetPendingState(MUSICSTATE_BattleHigh);
		}
	}
}

function Tick(float DeltaTime)
{
    // Do not switch away from death music if owner is dead unless it is match over music.
    if( m_CurrentState == MUSICSTATE_DeathDirge && m_PlayerOwner.IsDead() &&
        (m_PendingState != MUSICSTATE_TeamWonMatch && m_PendingState != MUSICSTATE_TeamLostMatch) )
    {
        return;
    }

    if( m_PendingState != m_CurrentState )
    {
        SetCurrentState(m_PendingState);
    }
}

/* MusicEvent()
Music Manager interface for musical events.
@param NewEventIndex:  see list below
0 - Local player died.
1 - Local player restarted.
2 - Local player has the flag.
3 - A player has scored the flag.
4 - Local player has won the match.
5 - Local player has lost the match.
6 - Friendly flag picked up from base.
7 - Friendly flag picked up from dropped.
8 - Friendly flag captured.
9 - Friendly flag returned.
10 - Friendly flag dropped.
11 - Enemy flag picked up from base.
12 - Enemy flag picked up from dropped.
13 - Enemy flag captured.
14 - Enemy flag returned.
15 - Enemy flag dropped.
16 - Rabbit flag score.
17 - Rabbit kill score.
18 - Team Rabbit friendly pickup.
19 - Team Rabbit enemy pickup.
*/
function MusicEvent(int NewEventIndex)
{
    local TrMapInfo TrMI;
    local SoundCue StingerCue;
    local AudioComponent StingerTrack;

    //`log("*******************Music Event!"@NewEventIndex);
    
    TrMI = TrMapInfo(WorldInfo.GetMapInfo());
    if( TrMI == None || TrMI.m_MapMusicInfo == none )
    {
        return;
    }
    
    switch( NewEventIndex )
    {
    case 0: SetPendingState(MUSICSTATE_DeathDirge); break;
    case 1: SetStateBasedOnGameState(); break;
    case 2: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.EnemyFlagPickedUpFromBase;
			SetPendingState(MUSICSTATE_FlagPossession);
			break;
    case 3: PlayerScoredFlag(); break;
    case 4: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.PlayerWon; 
            SetPendingState(MUSICSTATE_TeamWonMatch);
            break;
    case 5: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.PlayerLost; 
            SetPendingState(MUSICSTATE_TeamLostMatch);
            break;
    case 6: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.FriendlyFlagPickedUpFromBase; break;
    case 7: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.FriendlyFlagPickedUpFromDropped; break;
    case 8: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.FriendlyFlagCaptured; SetStateBasedOnGameState(); break;
    case 9: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.FriendlyFlagReturned; break;
    case 10: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.FriendlyFlagDropped; break;
    case 11: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.EnemyFlagPickedUpFromBase; break;
    case 12: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.EnemyFlagPickedUpFromDropped; break;
    case 13: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.EnemyFlagCaptured; SetStateBasedOnGameState(); break;
    case 14: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.EnemyFlagReturned; break;
    case 15: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.EnemyFlagDropped; SetStateBasedOnGameState(); break;
    case 16: SetStateBasedOnGameState(); break; 
    case 17: SetStateBasedOnGameState(); break; 
	case 18: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.TeamRabbitFriendlyPickedUpFlag; break;
	case 19: StingerCue = TrMI.m_MapMusicInfo.m_MapStingers.TeamRabbitEnemyPickedUpFlag; break;
    }

    // Play a stinger if we populated one from the event.
    if( StingerCue != None )
    {
        StingerTrack = CreateNewTrack(StingerCue);
        if( StingerTrack != None )
        {
            StingerTrack.bAutoDestroy = true;
		    StingerTrack.VolumeMultiplier = m_fStingerVolumeMultiplier;
		    StingerTrack.Play();
        }
    }
}

protected function SetPendingState(ETgMusicState NewState)
{
    m_PendingState = NewState;
}

protected function SetCurrentState(ETgMusicState NewState)
{
    local TrMapInfo TrMI;
    local AudioComponent NewTrack;

    TrMI = TrMapInfo(WorldInfo.GetMapInfo());

    if (TrMI != None && TrMI.m_MapMusicInfo != None)
    {
        switch(NewState)
        {
        case MUSICSTATE_BattleLow:    
            if( m_MusicTracks[MUSICSTATE_BattleLow] == None )
            {
				if( (m_CurrentTrack != None) && (m_CurrentTrack.SoundCue == TrMI.m_MapMusicInfo.m_MapMusic.BattleMusicLow) )
				{
					m_MusicTracks[MUSICSTATE_BattleLow] = m_CurrentTrack;
				}
				else
				{
					m_MusicTracks[MUSICSTATE_BattleLow] = CreateNewTrack(TrMI.m_MapMusicInfo.m_MapMusic.BattleMusicLow);
				}
            }
            NewTrack = m_MusicTracks[MUSICSTATE_BattleLow];
            break;
        case MUSICSTATE_BattleMed:    
            if( m_MusicTracks[MUSICSTATE_BattleMed] == None )
            {
				if( (m_CurrentTrack != None) && (m_CurrentTrack.SoundCue == TrMI.m_MapMusicInfo.m_MapMusic.BattleMusicMed) )
				{
					m_MusicTracks[MUSICSTATE_BattleMed] = m_CurrentTrack;
				}
				else
				{
					m_MusicTracks[MUSICSTATE_BattleMed] = CreateNewTrack(TrMI.m_MapMusicInfo.m_MapMusic.BattleMusicMed);
				}
            }
            NewTrack = m_MusicTracks[MUSICSTATE_BattleMed]; 
            break;
        case MUSICSTATE_BattleHigh:    
            if( m_MusicTracks[MUSICSTATE_BattleHigh] == None )
            {
				if( (m_CurrentTrack != None) && (m_CurrentTrack.SoundCue == TrMI.m_MapMusicInfo.m_MapMusic.BattleMusicHigh) )
				{
					m_MusicTracks[MUSICSTATE_BattleHigh] = m_CurrentTrack;
				}
				else
				{
					m_MusicTracks[MUSICSTATE_BattleHigh] = CreateNewTrack(TrMI.m_MapMusicInfo.m_MapMusic.BattleMusicHigh);
				}
            }
            NewTrack = m_MusicTracks[MUSICSTATE_BattleHigh];
            break;
        case MUSICSTATE_FlagPossession:    
            if( m_MusicTracks[MUSICSTATE_FlagPossession] == None )
            {
				if( (m_CurrentTrack != None) && (m_CurrentTrack.SoundCue == TrMI.m_MapMusicInfo.m_MapMusic.FlagPossession) )
				{
					m_MusicTracks[MUSICSTATE_FlagPossession] = m_CurrentTrack;
				}
				else
				{
					m_MusicTracks[MUSICSTATE_FlagPossession] = CreateNewTrack(TrMI.m_MapMusicInfo.m_MapMusic.FlagPossession);
				}
            }
            NewTrack = m_MusicTracks[MUSICSTATE_FlagPossession];
            break;
        case MUSICSTATE_DeathDirge:    
            if( m_MusicTracks[MUSICSTATE_DeathDirge] == None )
            {
				if( (m_CurrentTrack != None) && (m_CurrentTrack.SoundCue == TrMI.m_MapMusicInfo.m_MapMusic.DeathDirge) )
				{
					m_MusicTracks[MUSICSTATE_DeathDirge] = m_CurrentTrack;
				}
				else
				{
					m_MusicTracks[MUSICSTATE_DeathDirge] = CreateNewTrack(TrMI.m_MapMusicInfo.m_MapMusic.DeathDirge);
				}
            }
            NewTrack = m_MusicTracks[MUSICSTATE_DeathDirge];
            break;
        case MUSICSTATE_TeamWonMatch:    
            if( m_MusicTracks[MUSICSTATE_TeamWonMatch] == None )
            {
				if( (m_CurrentTrack != None) && (m_CurrentTrack.SoundCue == TrMI.m_MapMusicInfo.m_MapMusic.TeamWon) )
				{
					m_MusicTracks[MUSICSTATE_TeamWonMatch] = m_CurrentTrack;
				}
				else
				{
					m_MusicTracks[MUSICSTATE_TeamWonMatch] = CreateNewTrack(TrMI.m_MapMusicInfo.m_MapMusic.TeamWon);
				}
            }
            NewTrack = m_MusicTracks[MUSICSTATE_TeamWonMatch];
            break;
        case MUSICSTATE_TeamLostMatch:    
            if( m_MusicTracks[MUSICSTATE_TeamLostMatch] == None )
            {
				if( (m_CurrentTrack != None) && (m_CurrentTrack.SoundCue == TrMI.m_MapMusicInfo.m_MapMusic.TeamLost) )
				{
					m_MusicTracks[MUSICSTATE_TeamLostMatch] = m_CurrentTrack;
				}
				else
				{
					m_MusicTracks[MUSICSTATE_TeamLostMatch] = CreateNewTrack(TrMI.m_MapMusicInfo.m_MapMusic.TeamLost);
				}
            }
            NewTrack = m_MusicTracks[MUSICSTATE_TeamLostMatch];
            break;
        case MUSICSTATE_Ambient:
			if( m_MusicTracks[MUSICSTATE_Ambient] == None )
            {
				if( (m_CurrentTrack != None) && (m_CurrentTrack.SoundCue == TrMI.m_MapMusicInfo.m_MapMusic.AmbientMusic) )
				{
					m_MusicTracks[MUSICSTATE_Ambient] = m_CurrentTrack;
				}
				else
				{
					m_MusicTracks[MUSICSTATE_Ambient] = CreateNewTrack(TrMI.m_MapMusicInfo.m_MapMusic.AmbientMusic);
				}
            }
            NewTrack = m_MusicTracks[MUSICSTATE_Ambient];
        	break;
        }

        // Fade out the old track, fade in the new.
        if( m_CurrentTrack != None )
        {
	        m_CurrentTrack.FadeOut(1.0, 0.0);
		}

		m_CurrentTrack = NewTrack;
		if( m_CurrentTrack != None )
		{
			if( NewState == MUSICSTATE_FlagPossession )
			{
				// Don't fade in flag possession music.
				m_CurrentTrack.Play();
			}
			else
			{
				m_CurrentTrack.FadeIn(0.2, 1.0);
			}
        }
		m_CurrentState = NewState;
    }
}

function PlayerScoredFlag()
{
	if( WorldInfo.GRI.Winner == none && !WorldInfo.GRI.bMatchIsOver )
	{
		// Only change music if the match is not over.
		SetStateBasedOnGameState();
	}
}

defaultproperties
{
   m_fMusicVolume=0.400000
   m_fStingerVolumeMultiplier=1.100000
   m_CurrentState=MUSICSTATE_NoMusic
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   CollisionType=COLLIDE_CustomDefault
   Name="Default__TrMusicManager"
   ObjectArchetype=Info'Engine.Default__Info'
}
