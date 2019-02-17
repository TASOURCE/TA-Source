class TrVictimMessage extends UTLocalMessage;

var(Message) localized string YouWereKilledBy;

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if (RelatedPRI_1 == None)
	{
		return "";
	}

	return default.YouWereKilledBy;
}

defaultproperties
{
   YouWereKilledBy="You were killed by"
   MessageArea=3
   bIsUnique=True
   Lifetime=6.000000
   DrawColor=(B=0,G=0,R=255,A=255)
   FontSize=2
   Name="Default__TrVictimMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
