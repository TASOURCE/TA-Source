/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKSkelControl_DamageHinge extends UDKSkelControl_Damage
	hidecategories(Translation, Rotation, Adjustments)
	native(Animation);

/** The Maximum size of the angle this hinge can open to in Degrees */
var(Hinge) float MaxAngle;

/** Which axis this hinge opens around */
var(Hinge) EAxis PivotAxis;

/** The angular velocity that is used to calculate the angle of the hinge will be multipled by this value.  
  * NOTE: This should be negative
  */
var(Hinge) float AVModifier;

/** The current angle of the hinge */
var transient float CurrentAngle;

/** How stiff is the spring */
var float SpringStiffness;


// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   MaxAngle=45.000000
   PivotAxis=AXIS_Y
   AVModifier=-1.500000
   SpringStiffness=-0.035000
   bApplyRotation=True
   BoneRotationSpace=BCS_ActorSpace
   Name="Default__UDKSkelControl_DamageHinge"
   ObjectArchetype=UDKSkelControl_Damage'UDKBase.Default__UDKSkelControl_Damage'
}
