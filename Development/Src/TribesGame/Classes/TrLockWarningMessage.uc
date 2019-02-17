class TrLockWarningMessage extends UTLocalMessage;

var(Message) localized string MissileLockOnString;
var(Message) localized string RadarLockString;

var color RedColor;
var color YellowColor;

static function byte AnnouncementLevel(byte MessageIndex)
{
	return 2;
}

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	switch (Switch)
	{
		case 1:
			return Default.MissileLockOnString;
			break;
		case 4:
			return default.RadarLockString;
			break;
	}
	return "";
}

static function color GetColor(
    optional int Switch,
    optional PlayerReplicationInfo RelatedPRI_1,
    optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
    )
{
	return Default.RedColor;
}

defaultproperties
{
   RedColor=(B=0,G=0,R=255,A=255)
   YellowColor=(B=0,G=255,R=255,A=255)
   MessageArea=2
   bIsPartiallyUnique=True
   Lifetime=2.500000
   DrawColor=(B=255,G=160,R=0,A=255)
   FontSize=1
   Name="Default__TrLockWarningMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
