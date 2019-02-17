class TrTDMScoreMessage extends UTLocalMessage;

static function byte AnnouncementLevel(byte MessageIndex)
{
	return 1;
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local UTHUD HUD;

	Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);

	HUD = UTHUD(P.myHUD);
	if ( (HUD != None) && HUD.bIsSplitScreen && !HUD.bIsFirstPlayer )
	{
		return;
	}

    // TODO: Configure TDM messages/music.
    /*
	switch( Switch )
    {
        case 0:
        case 1:
		    TrPlayerController(P).TrClientMusicEvent(16);
        break;
    } 
    */
}

defaultproperties
{
   AnnouncementPriority=11
   FontSize=2
   Name="Default__TrTDMScoreMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
