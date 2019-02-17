class TrHUDTeam extends TrHud;

var int m_nLastMessageCode;

/** 
  * Support for displaying CTF flag status messages
  */
simulated function Timer()
{
	local UTPlayerReplicationInfo PawnOwnerPRI;
	local int messageCode;

	Super.Timer();

	messageCode = -1;

	if ( Pawn(PlayerOwner.ViewTarget) == None )
		return;

	PawnOwnerPRI = UTPlayerReplicationInfo(Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo);

	if ( (PawnOwnerPRI == None)
		|| (PlayerOwner.IsSpectating() && UTPlayerOwner.bBehindView) )
		return;

	if ( (UTGRI != None) && (PawnOwnerPRI.Team != None)
		&& UTGRI.FlagIsHeldEnemy(PawnOwnerPRI.Team.TeamIndex) )
	{
		if ( PawnOwnerPRI.bHasFlag )
		{
			messageCode = CTF_YouAndEnemyHaveTheFlag;
		}
		else
		{
			messageCode = CTF_EnemyHasTheFlag;
		}
	}
	else if ( PawnOwnerPRI.bHasFlag )
	{
		messageCode = CTF_YouHaveTheFlag;
	}

	if (messageCode!=m_nLastMessageCode && messageCode!=-1)
	{
		PlayerOwner.ReceiveLocalizedMessage( class'TrCTFHUDMessage', messageCode );
	}

	m_nLastMessageCode = messageCode;
}

defaultproperties
{
   m_nLastMessageCode=-1
   MinimapHUDClass=Class'TribesGame.GfxTrHudTeam'
   Name="Default__TrHUDTeam"
   ObjectArchetype=TrHUD'TribesGame.Default__TrHUD'
}
