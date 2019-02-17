//
//      Announce an objective upgrade
//
class TrUpgradeMessage extends UTLocalMessage;

var SoundCue UpgradeSound;

var localized string ObjectiveUpgraded;

static function string GetString( optional int Switch, optional bool bPRI1HUD, optional PlayerReplicationInfo RelatedPRI_1,
					optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject )
{
	local TrGameObjective TrGO;
	local string playerName;
	local string finalMessage;

	TrGO = TrGameObjective(OptionalObject);

	switch (Switch)
	{
	default:
		if (RelatedPRI_1 != none)
		{
			playerName = RelatedPRI_1.PlayerName;
		}

		finalMessage = default.ObjectiveUpgraded;
		finalMessage = Repl(finalMessage, "[NAME]", playerName, true);
		if (TrGO != none)
		{
			finalMessage = Repl(finalMessage, "[OBJNAME]", TrGO.m_sScreenName, true);
			finalMessage = Repl(finalMessage, "[LEVEL]", ""$Switch, true);
		}
		return finalMessage;
	}
}

static simulated function ClientReceive(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1,
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	local TrGameObjective TrGO;
	local TrHUD HUD;

	switch (Switch)
	{
	default:
		TrGO = TrGameObjective(OptionalObject);
		if (TrGO != none && TrGO.GetTeamNum() == P.GetTeamNum())
		{
			Super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
			
			HUD = TrHUD(P.myHUD);
			if ( (HUD != None) && HUD.bIsSplitScreen )
			{
				return;
			}

			P.PlaySound(default.UpgradeSound, true);
		}
		break;
	}
}

defaultproperties
{
   ObjectiveUpgraded="[NAME] upgraded [OBJNAME] to [LEVEL]"
   MessageArea=4
   AnnouncementPriority=1
   Lifetime=10.000000
   Name="Default__TrUpgradeMessage"
   ObjectArchetype=UTLocalMessage'UTGame.Default__UTLocalMessage'
}
