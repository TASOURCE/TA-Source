class TrAnnouncer extends Info;

/** List of announcements we want to play. */
var array<SoundCue> m_QueuedAnnouncements;

/** Currently playing AudioComponent */
var AudioComponent m_CurrentAnnouncementAudioComponent;

/** Owning controller. */
var TrPlayerController m_PlayerOwner;

function Destroyed()
{
	Super.Destroyed();

	if (m_CurrentAnnouncementAudioComponent != none)
	{
		if (m_PlayerOwner != none)
		{
			m_PlayerOwner.DetachComponent(m_CurrentAnnouncementAudioComponent);
		}
		m_CurrentAnnouncementAudioComponent = none;
	}
}

function PostBeginPlay()
{
	Super.PostBeginPlay();

	m_PlayerOwner = TrPlayerController(Owner);
}

function PlayAnnouncement(SoundCue AnnouncementCue, bool bPlayRightNow)
{
	if( m_CurrentAnnouncementAudioComponent == none )
	{
		m_CurrentAnnouncementAudioComponent = m_PlayerOwner.CreateAudioComponent(AnnouncementCue, false, false);
		m_CurrentAnnouncementAudioComponent.bAllowSpatialization = false;
		m_CurrentAnnouncementAudioComponent.OnAudioFinished = AnnouncementFinished;
		m_CurrentAnnouncementAudioComponent.bAutoDestroy = true;
		m_CurrentAnnouncementAudioComponent.Play();
	}
	else
	{
		if( m_CurrentAnnouncementAudioComponent.IsPlaying() )
		{
			if( bPlayRightNow )
			{
				m_CurrentAnnouncementAudioComponent.FadeOut(0.1, 0.0);
			}

			// Queue up the announcement.
			m_QueuedAnnouncements.AddItem(AnnouncementCue);
		}
		else
		{
			m_CurrentAnnouncementAudioComponent.SoundCue = AnnouncementCue;
			m_CurrentAnnouncementAudioComponent.Play();
		}
	}
}

function AnnouncementFinished(AudioComponent AC)
{
	if( m_QueuedAnnouncements.Length > 0 )
	{
		//m_CurrentAnnouncementAudioComponent.Stop();
		PlayAnnouncement(m_QueuedAnnouncements[0], true);
		m_QueuedAnnouncements.Remove(0,1);
	}
}

/*
function PlayNextAnnouncement()
{
	local UTQueuedAnnouncement PlayedAnnouncement;

	PlayingAnnouncementClass = None;

	if ( Queue != None )
	{
		PlayedAnnouncement = Queue;
		Queue = PlayedAnnouncement.nextAnnouncement;
		PlayAnnouncementNow(PlayedAnnouncement.AnnouncementClass, PlayedAnnouncement.MessageIndex, PlayedAnnouncement.PRI, PlayedAnnouncement.OptionalObject);
		PlayingAnnouncementClass = PlayedAnnouncement.AnnouncementClass;
		PlayingAnnouncementIndex = PlayedAnnouncement.MessageIndex;
		PlayedAnnouncement.Destroy();
	}
}

function PlayAnnouncementNow(class<UTLocalMessage> InMessageClass, int MessageIndex, optional PlayerReplicationInfo PRI, optional Object OptionalObject)
{
	local SoundNodeWave ASound;
	local bool bUsingVoiceCue;

	ASound = InMessageClass.Static.AnnouncementSound(MessageIndex, OptionalObject, PlayerOwner);

	if ( ASound != None )
	{
		if (CurrentAnnouncementComponent != none)
		{
			if (PlayerOwner != none)
			{
				PlayerOwner.DetachComponent(CurrentAnnouncementComponent);
			}
			CurrentAnnouncementComponent = none;
		}

		//@FIXME: part of playsound pool?
		// if we are a UTVoice when we want to use the special UTVoiceSoundCue which is in the correct SoundClass (i.e. effects)
		if ( ClassIsChildOf( InMessageClass, class'UTVoice' ) || ClassIsChildOf( InMessageClass, class'UTScriptedVoiceMessage' ) )
		{
			CurrentAnnouncementComponent = PlayerOwner.CreateAudioComponent(UTVoiceSoundCue, false, false);
			bUsingVoiceCue = TRUE;
		}
		else
		{
			CurrentAnnouncementComponent = PlayerOwner.CreateAudioComponent(AnnouncerSoundCue, false, false);
			bUsingVoiceCue = FALSE;
		}

		// CurrentAnnouncementComponent will be none if -nosound option used
		if ( CurrentAnnouncementComponent != None )
		{
			CurrentAnnouncementComponent.SetWaveParameter('Announcement', ASound);
			if( bUsingVoiceCue )
			{
				UTVoiceSoundCue.Duration = ASound.Duration;
				UTVoiceSoundCue.VolumeMultiplier = InMessageClass.Default.AnnouncementVolume;
			}
			else
			{
				AnnouncerSoundCue.Duration = ASound.Duration;
				AnnouncerSoundCue.VolumeMultiplier = InMessageClass.Default.AnnouncementVolume;
			}
			CurrentAnnouncementComponent.bAutoDestroy = true;
			CurrentAnnouncementComponent.bShouldRemainActiveIfDropped = true;
			CurrentAnnouncementComponent.bAllowSpatialization = false;
			CurrentAnnouncementComponent.bAlwaysPlay = TRUE;
			CurrentAnnouncementComponent.Play();
		}
		PlayingAnnouncementClass = InMessageClass;
		PlayingAnnouncementIndex = MessageIndex;

		// NOTE: Audio always plays back in real-time, so we'll scale our duration by the world's time dilation
		SetTimer(ASound.Duration * WorldInfo.TimeDilation + 0.05, false,'AnnouncementFinished');

		if ( InMessageClass.default.bShowPortrait 
			&& (UTHUD(PlayerOwner.MyHUD) != None) 
			&& (UTPlayerReplicationInfo(PRI) != None) 
			&& (PRI != PlayerOwner.PlayerReplicationInfo) )
		{
			UTHUD(PlayerOwner.MyHUD).ShowPortrait(UTPlayerReplicationInfo(PRI), ASound.Duration+0.5, ClassIsChildOf(InMessageClass, class'UTScriptedVoiceMessage'));
		}
	}
	else
	{
		//`log("NO SOUND FOR "$InMessageClass@MessageIndex@OptionalObject@OptionalObject.name);
		PlayNextAnnouncement();
	}
}

function AnnouncementFinished(AudioComponent AC)
{
	if ((PlayerOwner != none) && (CurrentAnnouncementComponent != none))
	{
		PlayerOwner.DetachComponent(CurrentAnnouncementComponent);
	}
	CurrentAnnouncementComponent = None;
	PlayingAnnouncementClass = None;
	PlayNextAnnouncement();
}

function PlayAnnouncement(class<UTLocalMessage> InMessageClass, int MessageIndex, optional PlayerReplicationInfo PRI,  optional Object OptionalObject)
{
	if ( InMessageClass.Static.AnnouncementLevel(MessageIndex) > AnnouncerLevel )
	{
		return;
	}

	if ( (CurrentAnnouncementComponent == None) || CurrentAnnouncementComponent.bFinished )
	{
		PlayingAnnouncementClass = None;
		CurrentAnnouncementComponent = None;
	}

	if ( PlayingAnnouncementClass == None )
	{
		if ( (InMessageClass.default.AnnouncementDelay == 0.0) || ((PRI != None) && !PRI.bBot) )
		{
			// play immediately
			PlayAnnouncementNow(InMessageClass, MessageIndex, PRI, OptionalObject);
			return;
		}
		else
		{
			// NOTE: Audio always plays back in real-time, so we'll scale our delay by the world's time dilation
			SetTimer(InMessageClass.default.AnnouncementDelay * WorldInfo.TimeDilation, false,'AnnouncementFinished');
		}
	}

	if ( InMessageClass.static.AddAnnouncement(self, MessageIndex, PRI, OptionalObject) )
	{
		if ( CurrentAnnouncementComponent != None )
		{
			CurrentAnnouncementComponent.Stop();
			if (PlayerOwner != none)
			{
				PlayerOwner.DetachComponent(CurrentAnnouncementComponent);
			}
			CurrentAnnouncementComponent = None;
		}
		PlayNextAnnouncement();
	}
}
*/

defaultproperties
{
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
   Name="Default__TrAnnouncer"
   ObjectArchetype=Info'Engine.Default__Info'
}
