/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_ActivateRemoteEvent extends SequenceAction
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
// (cpptext)

/** Instigator to use in the event */
var() Actor Instigator;

/** Name of the event to activate */
var() Name EventName;

/** For use in Kismet, to indicate if this variable is ok. Updated in UpdateStatus. */
var transient bool bStatusIsOk;

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 2;
}

cpptext
{
protected:
	FString GetDisplayTitle() const;
public:
	void Activated();
	virtual void DrawExtraInfo(FCanvas* Canvas, const FVector& BoxCenter);
	virtual void UpdateStatus();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

}


defaultproperties
{
   EventName="DefaultEvent"
   VariableLinks(0)=(LinkDesc="Instigator",PropertyName="Instigator")
   ObjName="Activate Remote Event"
   ObjCategory="Event"
   Name="Default__SeqAct_ActivateRemoteEvent"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
