/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class AnimNotify_ClothingMaxDistanceScale extends AnimNotify
	native(Anim);

/** The Particle system to play **/
var() float	StartScale;
var() float EndScale;


var() EMaxDistanceScaleMode	ScaleMode;

var   float	Duration;

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

cpptext
{
	// AnimNotify interface.
	virtual void Notify( class UAnimNodeSequence* NodeSeq );
	virtual void NotifyEnd( class UAnimNodeSequence* NodeSeq, FLOAT AnimCurrentTime );
	
	/**
	 *	Called by the AnimSet viewer when the 'parent' FAnimNotifyEvent is edited.
	 *
	 *	@param	NodeSeq			The AnimNodeSequence this notify is associated with.
	 *	@param	OwnerEvent		The FAnimNotifyEvent that 'owns' this AnimNotify.
	 */
	virtual void AnimNotifyEventChanged(class UAnimNodeSequence* NodeSeq, FAnimNotifyEvent* OwnerEvent);

}


defaultproperties
{
   StartScale=1.000000
   EndScale=1.000000
   NotifyColor=(B=200,G=255,R=200,A=255)
   Name="Default__AnimNotify_ClothingMaxDistanceScale"
   ObjectArchetype=AnimNotify'Engine.Default__AnimNotify'
}
