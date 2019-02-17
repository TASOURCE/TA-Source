/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTSeqAct_PlayAnnouncement extends SequenceAction
	PerObjectLocalized;

var() ObjectiveAnnouncementInfo Announcement;

event Activated()
{
	local WorldInfo WI;

	WI = GetWorldInfo();
	WI.BroadcastLocalizedMessage(class'UTKismetAnnouncement', 0, None, None, self);
}

defaultproperties
{
   bCallHandler=False
   ObjName="Play Announcement"
   ObjCategory="Voice/Announcements"
   Name="Default__UTSeqAct_PlayAnnouncement"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
