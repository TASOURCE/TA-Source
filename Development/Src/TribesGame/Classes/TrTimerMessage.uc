/** this plays the "X minutes/seconds remaining" announcements */
//
//	switch 0 - 5 minuntes 
//	switch 1 - 1 minute
//	switch 2 - 30 seconds
//
class TrTimerMessage extends UTLocalMessage
	abstract;

var SoundCue m_sFiveMinuteWarningDS;
var SoundCue m_sOneMinuteWarningDS;
var SoundCue m_sFiveMinuteWarningBE;
var SoundCue m_sOneMinuteWarningBE;

var	localized string TimerMessage[3];

static function string GetString( optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1,
					optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	return default.TimerMessage[Switch];
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local SoundCue sound;
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(P);

	switch (Switch)
	{
	case 0: 
		if (P.GetTeamNum()==0)
			sound = Default.m_sFiveMinuteWarningBE;
		else
			sound = Default.m_sFiveMinuteWarningDS;
		break;
	case 1: 
		if (P.GetTeamNum()==0)
			sound = Default.m_sOneMinuteWarningBE;
		else
			sound = Default.m_sOneMinuteWarningDS;
		break;
	}

	if (sound!=None)
		TrPC.PlayAnnouncerSound(sound, false);

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

defaultproperties
{
   TimerMessage(0)="5 minutes remain"
   TimerMessage(1)="1 minute remains"
   TimerMessage(2)="30 seconds remains"
   MessageArea=2
   bIsUnique=True
   bIsConsoleMessage=False
   FontSize=1
   Name="Default__TrTimerMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
