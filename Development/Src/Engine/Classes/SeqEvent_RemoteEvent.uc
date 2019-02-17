/**
 * Activated by the ActivateRemoteEvent action.
 * Originator: current WorldInfo
 * Instigator: the actor that is assigned [in editor] as the ActivateRemoteEvent action's Instigator
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_RemoteEvent extends SequenceEvent
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Name of this event for remote activation */
var() Name EventName;

/** For use in Kismet, to indicate if this variable is ok. Updated in UpdateStatus. */
var transient bool bStatusIsOk;


static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
protected:
	FString GetDisplayTitle() const;
public:
	virtual void DrawExtraInfo(FCanvas* Canvas, const FVector& BoxCenter);
	virtual void UpdateStatus();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   EventName="DefaultEvent"
   MaxTriggerCount=0
   bPlayerOnly=False
   ObjName="Remote Event"
   Name="Default__SeqEvent_RemoteEvent"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
