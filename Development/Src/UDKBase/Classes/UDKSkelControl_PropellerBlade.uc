/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKSkelControl_PropellerBlade extends SkelControlSingleBone
	hidecategories(Translation, Adjustment)
	native(Animation);

var(Manta)  float		MaxRotationsPerSecond;
var(Manta)	float		SpinUpTime;
var(Manta)	bool		bCounterClockwise;
var			float		RotationsPerSecond, DesiredRotationsPerSecond;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MaxRotationsPerSecond=20.000000
   SpinUpTime=1.200000
   bApplyRotation=True
   bAddRotation=True
   BoneRotationSpace=BCS_ActorSpace
   bIgnoreWhenNotRendered=True
   Name="Default__UDKSkelControl_PropellerBlade"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
