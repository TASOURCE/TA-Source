/**
 * Activated once a sequence is activated by another operation.
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqEvent_SequenceActivated extends SequenceEvent
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

/** Text label to use on the sequence input link */
var() string InputLabel;

cpptext
{
protected:
	FString GetDisplayTitle() const;
public:
	virtual void OnCreated();
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	UBOOL CheckActivateSimple();

}


defaultproperties
{
   InputLabel="In"
   MaxTriggerCount=0
   bPlayerOnly=False
   ObjName="Sequence Activated"
   Name="Default__SeqEvent_SequenceActivated"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
