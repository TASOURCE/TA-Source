/**
 *	Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *	AnimNodeSequence which changes its animation based on the weapon anim type.
 */

class UDKAnimNodeSeqWeap extends UDKAnimNodeSequence
	native(Animation);

var()	name	DefaultAnim;
var()	name	DualPistolAnim;
var()	name	SinglePistolAnim;
var()	name	ShoulderRocketAnim;
var()	name	StingerAnim;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Name="Default__UDKAnimNodeSeqWeap"
   ObjectArchetype=UDKAnimNodeSequence'UDKBase.Default__UDKAnimNodeSequence'
}
