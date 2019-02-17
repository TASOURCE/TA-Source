/**
 * Simple action that records the amount of time elapsed
 * between activating the first link "Start" and the second
 * link "Stop".
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Timer extends SequenceAction
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
// (cpptext)

/** World time at point of activation */
var transient float ActivationTime;

/** Amount of time this timer has been active */
var() float Time;

cpptext
{
	void Activated()
	{
		// reset the activation time
		Time = 0.f;
		ActivationTime = GWorld != NULL ? GWorld->GetTimeSeconds() : 0.f;
	}

	UBOOL UpdateOp(FLOAT DeltaTime)
	{
		// check for stop
		if (InputLinks(1).bHasImpulse)
		{
			// record the exact duration
			Time = GWorld != NULL ? GWorld->GetTimeSeconds() - ActivationTime : 0.f;
			// finish the op
			return TRUE;
		}
		else
		{
			// update the current time
			Time += DeltaTime;
			// and force any attached variables to get the new value
			PopulateLinkedVariableValues();
		}
		return FALSE;
	}

}


defaultproperties
{
   bLatentExecution=True
   InputLinks(0)=(LinkDesc="Start")
   InputLinks(1)=(LinkDesc="Stop")
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Time",PropertyName="Time")
   ObjName="Timer"
   ObjCategory="Misc"
   Name="Default__SeqAct_Timer"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
