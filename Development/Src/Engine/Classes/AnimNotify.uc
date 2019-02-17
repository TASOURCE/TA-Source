/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify extends Object
	native(Anim)
	abstract
	editinlinenew
	hidecategories(Object)
	collapsecategories;

/** Color of Notify in editor */
var editoronly Color NotifyColor;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

simulated function bool FindNextNotifyOfClass(AnimNodeSequence AnimSeqInstigator, class<AnimNotify> NotifyClass, out AnimNotifyEvent OutEvent)
{
	local AnimSequence Seq;
	local int i;
	local bool bFoundThis;

	if(AnimSeqInstigator.AnimSeq != None)
	{
		// we look through the notifies to find the end that corresponds to this start
		Seq = AnimSeqInstigator.AnimSeq;
		for(i=0; i<Seq.Notifies.length; i++)
		{
			// Found us - remember the time
			if(Seq.Notifies[i].Notify == self)
			{
				bFoundThis = TRUE;
			}

			// First notify of desired class after this 'start'
			if(bFoundThis && ClassIsChildOf(Seq.Notifies[i].Notify.Class, NotifyClass))
			{
				// Copy info from event
				OutEvent = Seq.Notifies[i];
				// and set bool
				return TRUE;
			}
		}
	}
	
	return false;
}

cpptext
{
	// AnimNotify interface.
	virtual void Notify( class UAnimNodeSequence* NodeSeq ) {}
	virtual void NotifyTick( class UAnimNodeSequence* NodeSeq, FLOAT AnimCurrentTime, FLOAT AnimTimeStep, FLOAT InTotalDuration ) {}
	virtual void NotifyEnd( class UAnimNodeSequence* NodeSeq, FLOAT AnimCurrentTime ) {}

	virtual FString GetEditorComment() { return TEXT(""); }
	virtual FColor GetEditorColor() { return NotifyColor; }

	/**
	 *	Called by the AnimSet viewer when the 'parent' FAnimNotifyEvent is edited.
	 *
	 *	@param	NodeSeq			The AnimNodeSequence this notify is associated with.
	 *	@param	OwnerEvent		The FAnimNotifyEvent that 'owns' this AnimNotify.
	 */
	virtual void AnimNotifyEventChanged(class UAnimNodeSequence* NodeSeq, FAnimNotifyEvent* OwnerEvent) {}

}


defaultproperties
{
   NotifyColor=(B=200,G=200,R=255,A=255)
   Name="Default__AnimNotify"
   ObjectArchetype=Object'Core.Default__Object'
}