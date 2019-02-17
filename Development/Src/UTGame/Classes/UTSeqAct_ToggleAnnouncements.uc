/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTSeqAct_ToggleAnnouncements extends SequenceAction;

event Activated()
{
	local UTGameReplicationInfo GRI;

	GRI = UTGameReplicationInfo(GetWorldInfo().GRI);
	if (GRI != None)
	{
		if (InputLinks[0].bHasImpulse)
		{
			GRI.bAnnouncementsDisabled = false;
		}
		else if (InputLinks[1].bHasImpulse)
		{
			GRI.bAnnouncementsDisabled = true;
		}
	}
}

defaultproperties
{
   bCallHandler=False
   InputLinks(0)=(LinkDesc="Enable")
   InputLinks(1)=(LinkDesc="Disable")
   ObjName="Toggle Announcements"
   ObjCategory="Voice/Announcements"
   Name="Default__UTSeqAct_ToggleAnnouncements"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
