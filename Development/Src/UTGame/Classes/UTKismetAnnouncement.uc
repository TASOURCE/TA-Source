/** message class for announcements played through "Play Announcement" Kismet action
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTKismetAnnouncement extends UTObjectiveSpecificMessage;

static function ObjectiveAnnouncementInfo GetObjectiveAnnouncement(byte MessageIndex, Object Objective, PlayerController PC)
{
	local UTSeqAct_PlayAnnouncement Action;
	local ObjectiveAnnouncementInfo EmptyAnnouncement;

	Action = UTSeqAct_PlayAnnouncement(Objective);
	return (Action != None) ? Action.Announcement : EmptyAnnouncement;
}

static function byte AnnouncementLevel(byte MessageIndex)
{
	return 1;
}

defaultproperties
{
   Lifetime=2.500000
   DrawColor=(B=255,G=160,R=0,A=255)
   FontSize=2
   Name="Default__UTKismetAnnouncement"
   ObjectArchetype=UTObjectiveSpecificMessage'UTGame.Default__UTObjectiveSpecificMessage'
}
