//
//  0 - blood eagle generator destroyed
//  1 - diamond sword generator destroyed
//  2 - blood eagle generator restored
//  3 - diamond sword generator restored
//

class TrGeneratorMessage extends UTLocalMessage
	abstract;

var SoundCue BloodEagleSounds[3];
var SoundCue DiamondSwordSounds[3];

var	localized string OurGeneratorDestroyed;
var localized string EnemyGeneratorDestroyed;
var localized string OurGeneratorRestored;

//
//  switch is "localized" for this player... 0 for my gen destroy, 1 for enemy gen destroy, 2 for my gen restored
//
static function string GetString( optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1,
					optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	switch (Switch)
	{
	case 0: return default.OurGeneratorDestroyed;
	case 1: return default.EnemyGeneratorDestroyed;
	case 2: return default.OurGeneratorRestored;
	}

	return "";
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{   
	local int messageIndex;
	local TrPlayerController TrPC;

	TrPC = TrPlayerController(P);

	messageIndex=-1;

	switch(Switch)
	{
	case 0: // blood eagle generator down
		if (P.GetTeamNum()==0)
			messageIndex = 0;
		else
			messageIndex = 1;
		break;

	case 1: // diamond sword generator down
		if (P.GetTeamNum()==1)
			messageIndex = 0;
		else
			messageIndex = 1;
		break;

	case 2: // blood eagle generator up
	case 3: // diamond sword generator up
		// only care if it is my team
		if (P.GetTeamNum()==(Switch % 2))
		{
			messageIndex=2;
		}
		break;
	}

		// Don't play team-centric announcements if spectating.
	if( P.GetTeamNum() != 255 )
	{
		if (messageIndex!=-1)
		{
			if (P.GetTeamNum()==0)
				TrPC.PlayAnnouncerSound(default.BloodEagleSounds[messageIndex], false);
			else
				TrPC.PlayAnnouncerSound(default.DiamondSwordSounds[messageIndex], false);

			Super.ClientReceive(P, messageIndex, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		}
	}
}

defaultproperties
{
   OurGeneratorDestroyed="Our generator is down"
   EnemyGeneratorDestroyed="Enemy generator is down"
   OurGeneratorRestored="Our generator is back online"
   MessageArea=2
   bIsUnique=True
   bIsConsoleMessage=False
   FontSize=2
   Name="Default__TrGeneratorMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
