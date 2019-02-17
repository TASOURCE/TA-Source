/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify_Footstep extends AnimNotify
	native(Anim);

var() int FootDown;  // 0=left 1=right.

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
	virtual FString GetEditorComment() { return (FootDown == 0) ? TEXT("Left Footstep") : TEXT("Right Footstep"); }

}


defaultproperties
{
   Name="Default__AnimNotify_Footstep"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
