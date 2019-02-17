class TrKillerMessage extends UTLocalMessage;

var(Message) localized string YouKilled;
var(Message) localized string KillCreditFor;

static function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if ( Switch == 2 )
	{
		// Interdict and send the child message instead.
		if ( P.myHud != None )
			P.myHUD.LocalizedMessage(
				class'TrKillerMessage',
				RelatedPRI_1,
				RelatedPRI_2,
				GetString(Switch, RelatedPRI_1 == P.PlayerReplicationInfo, RelatedPRI_1, RelatedPRI_2, OptionalObject),
				1,
				class'TrKillerMessage'.static.GetPos(Switch, P.myHUD),
				class'TrKillerMessage'.static.GetLifeTime(Switch),
				class'TrKillerMessage'.static.GetFontSize(Switch, RelatedPRI_1, RelatedPRI_2, P.PlayerReplicationInfo),
				class'TrKillerMessage'.static.GetColor(Switch, RelatedPRI_1, RelatedPRI_2),
				OptionalObject );
	}
}

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	switch( switch )
	{
	case 0:
		if (RelatedPRI_1 != None && 
			RelatedPRI_2.PlayerName != "" &&
			bPRI1HUD && 
			((RelatedPRI_1.Team == None) || (RelatedPRI_1.Team != RelatedPRI_2.Team)))
			return default.YouKilled;
	case 2: 
		if (RelatedPRI_1 != None && 
			RelatedPRI_2.PlayerName != "" &&
			bPRI1HUD && 
			((RelatedPRI_1.Team == None) || (RelatedPRI_1.Team != RelatedPRI_2.Team)))
			return default.KillCreditFor;
	}

	return "";
}

defaultproperties
{
   YouKilled="You killed"
   KillCreditFor="Kill credit for"
   MessageArea=3
   bIsUnique=True
   FontSize=2
   Name="Default__TrKillerMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
