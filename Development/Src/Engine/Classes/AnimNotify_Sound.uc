/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify_Sound extends AnimNotify
	native(Anim);

var()	SoundCue	SoundCue;
var()	bool		bFollowActor;
var()	Name		BoneName;
var()	bool		bIgnoreIfActorHidden;

/** This is the percent to play this Sound.  Defaults to 100% (aka 1.0f) **/
var()   float       PercentToPlay;
var()   float		VolumeMultiplier;
var()	float		PitchMultiplier;

// (cpptext)
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

	virtual FString GetEditorComment() { return TEXT("Snd"); }

}


defaultproperties
{
   bFollowActor=True
   PercentToPlay=1.000000
   VolumeMultiplier=1.000000
   PitchMultiplier=1.000000
   NotifyColor=(B=255,G=200,R=200,A=255)
   Name="Default__AnimNotify_Sound"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
