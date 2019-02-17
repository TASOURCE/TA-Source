/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify_Kismet extends AnimNotify
	native(Anim);

var() name NotifyName;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	// AnimNotify interface.
	virtual void Notify( class UAnimNodeSequence* NodeSeq );

}


defaultproperties
{
   Name="Default__AnimNotify_Kismet"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
