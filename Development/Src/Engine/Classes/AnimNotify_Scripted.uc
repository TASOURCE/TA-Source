/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify_Scripted extends AnimNotify
	native(Anim)
	abstract;

event Notify( Actor Owner, AnimNodeSequence AnimSeqInstigator );
event NotifyEnd( Actor Owner, AnimNodeSequence AnimSeqInstigator );

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// AnimNotify interface.
	virtual void Notify( class UAnimNodeSequence* NodeSeq );
	virtual void NotifyEnd( class UAnimNodeSequence* NodeSeq, FLOAT AnimCurrentTime );

}


defaultproperties
{
   Name="Default__AnimNotify_Scripted"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
