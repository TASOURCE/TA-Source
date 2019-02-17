/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKSkelControl_DamageSpring extends UDKSkelControl_Damage
	native(Animation);

/** The Maximum size of the angle this spring can open to in Degrees */
var(Spring) rotator MaxAngle;

/** The Minmum size of the angle this spring can open to in Degrees */
var(Spring) rotator MinAngle;

/** How fast does it return to normal */
var(Spring) float Falloff;

/** How stiff is the spring */
var(Spring) float SpringStiffness;

var(Spring) float AVModifier;

/** The current angle of the hinge */
var transient rotator CurrentAngle;

/** % of movement decided randomly */
var float RandomPortion;

// to add momentum from breaking due to a damage hit
var vector LastHitMomentum;
var float LastHitTime;
var float MomentumPortion;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   Falloff=0.975000
   SpringStiffness=-0.035000
   AVModifier=1.000000
   RandomPortion=0.200000
   MomentumPortion=0.750000
   bControlStrFollowsHealth=True
   ActivationThreshold=1.000000
   bApplyRotation=True
   BoneRotationSpace=BCS_ActorSpace
   Name="Default__UDKSkelControl_DamageSpring"
   ObjectArchetype=UDKSkelControl_Damage'UDKBase.Default__UDKSkelControl_Damage'
}
