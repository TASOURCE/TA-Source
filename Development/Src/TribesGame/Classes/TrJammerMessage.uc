//	0 - Jamming via other
//	1 - Jamming for other
//  2 - Jammed by enemy drop jammer
//  3 - Jamming via friendly drop jammer
//  4 - Jammed by enemy jammer pack
class TrJammerMessage extends UTLocalMessage;

var localized string JammingViaOther; // When the local pawn is jamming because he is near a friendly using their jammer pack
var localized string JammingForOther; // When the local pawn is using their jammer pack and caused a friendly to also jam
var localized string JammedByEnemyDropJammer;   // When the local pawn is being jammed via an enemy.
var localized string JammingViaOtherDropJammer; // When the local pawn is jamming because he is near a friendly drop jammer.
var localized string JammedByEnemyJammerPack; // When the local pawn is jammed by an enemy jammer pack.

static function string GetString(
	optional int Switch,
	optional bool bPRI1HUD,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local string playerName;
	local string finalMessage;

	playerName="";
	if (RelatedPRI_1!=None)
	{
		playerName = RelatedPRI_1.PlayerName;
	}

	switch (Switch)
	{
		case 0: finalMessage = Default.JammingViaOther; break;
		case 1: finalMessage = Default.JammingForOther; break;
		case 2: finalMessage = Default.JammedByEnemyDropJammer; break;
		case 3: finalMessage = Default.JammingViaOtherDropJammer; break;
		case 4: finalMessage = Default.JammedByEnemyJammerPack; break;
	}

	finalMessage = Repl(finalMessage, "[NAME]", playerName, true);

	return finalMessage;
}

defaultproperties
{
   JammingViaOther="Jamming via [NAME]"
   JammingForOther="Jamming for [NAME]"
   JammedByEnemyDropJammer="Jammed by enemy drop jammer"
   JammingViaOtherDropJammer="Jamming via friendly drop jammer"
   JammedByEnemyJammerPack="Jammed by enemy jammer pack"
   MessageArea=2
   AnnouncementPriority=2
   Name="Default__TrJammerMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
