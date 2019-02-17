//
//	From UTDeathMessage
//

class TrDeathMessage extends UTLocalMessage
	config(game);

var(Message) localized string KilledString, SomeoneString;
var config bool bNoConsoleDeathMessages;

static function color GetConsoleColor( PlayerReplicationInfo RelatedPRI_1 )
{
    return class'HUD'.Default.GreenColor;
}

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local string KillerName, VictimName;
	//local class<TrDmgType_Base> KillDamageType;

	//KillDamageType = (Class<TrDmgType_Base>(OptionalObject) != None) ? Class<TrDmgType_Base>(OptionalObject) : class'TrDmgType_Base';

	if (RelatedPRI_1 == None)
		KillerName = Default.SomeoneString;
	else
		KillerName = RelatedPRI_1.PlayerName;

	if (RelatedPRI_2 == None)
		VictimName = Default.SomeoneString;
	else
		VictimName = RelatedPRI_2.PlayerName;

	if ( Switch == 1 )
	{
		// suicide
		return KillerName$","$VictimName;
		/*
		return class'TrGame'.Static.ParseKillMessage(
			KillerName,
			VictimName,
			KillDamageType.Static.SuicideMessage(RelatedPRI_2) );
		*/
	}

	// suicide
	return KillerName$","$VictimName;

	/*
	return class'TrGame'.Static.ParseKillMessage(
		KillerName,
		VictimName,
		KillDamageType.Static.DeathMessage(RelatedPRI_1, RelatedPRI_2) );
	*/
}

static function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	if ( Switch == 1 )
	{
		if ( RelatedPRI_2 == P.PlayerReplicationInfo )
		{
			UTPlayerController(P).ClientMusicEvent(2);
			UTPlayerReplicationInfo(RelatedPRI_2).MultiKillLevel = 0;
		}
		if ( !Default.bNoConsoleDeathMessages )
		{
			Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		}
		return;
	}
	if ( (RelatedPRI_1 == P.PlayerReplicationInfo)
		|| ((P.PlayerReplicationInfo != None) && P.PlayerReplicationInfo.bIsSpectator && (Pawn(P.ViewTarget) != None) && (Pawn(P.ViewTarget).PlayerReplicationInfo == RelatedPRI_1)) )
	{
		UTPlayerController(P).ClientMusicEvent(1);
		// Interdict and send the child message instead.
		if ( P.myHud != None )
			P.myHUD.LocalizedMessage(
				class'TrKillerMessage',
				RelatedPRI_1,
				RelatedPRI_2,
				class'TrKillerMessage'.static.GetString(Switch, RelatedPRI_1 == P.PlayerReplicationInfo, RelatedPRI_1, RelatedPRI_2, OptionalObject),
				1,
				class'TrKillerMessage'.static.GetPos(Switch, P.myHUD),
				class'TrKillerMessage'.static.GetLifeTime(Switch),
				class'TrKillerMessage'.static.GetFontSize(Switch, RelatedPRI_1, RelatedPRI_2, P.PlayerReplicationInfo),
				class'TrKillerMessage'.static.GetColor(Switch, RelatedPRI_1, RelatedPRI_2),
				OptionalObject );

		if ( !Default.bNoConsoleDeathMessages )
		{
			Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		}
	}
	else if (RelatedPRI_2 == P.PlayerReplicationInfo)
	{
		UTPlayerController(P).ClientMusicEvent(2);
		if ( P.myHud != None )
			P.myHUD.LocalizedMessage(
				class'TrVictimMessage',
				RelatedPRI_1,
				RelatedPRI_2,
				class'TrVictimMessage'.static.GetString(Switch, true, RelatedPRI_1, RelatedPRI_2, OptionalObject),
				2,
				class'TrVictimMessage'.static.GetPos(Switch, P.myHUD),
				class'TrVictimMessage'.static.GetLifeTime(Switch),
				class'TrVictimMessage'.static.GetFontSize(Switch, RelatedPRI_1, RelatedPRI_2, P.PlayerReplicationInfo),
				class'TrVictimMessage'.static.GetColor(Switch, RelatedPRI_1, RelatedPRI_2),
				OptionalObject );

		UTPlayerReplicationInfo(RelatedPRI_2).MultiKillLevel = 0;
		if ( !Default.bNoConsoleDeathMessages )
		{
			Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		}
	}
	else if ( !Default.bNoConsoleDeathMessages )
	{
		Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	}
}

defaultproperties
{
   MessageArea=1
   bIsSpecial=False
   DrawColor=(B=0,G=0,R=255,A=255)
   Name="Default__TrDeathMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
