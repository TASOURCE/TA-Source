/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class RB_SkelJointSetup extends RB_ConstraintSetup
	native(Physics);

defaultproperties
{
   bSwingLimited=True
   bTwistLimited=True
   Swing1LimitAngle=45.000000
   Swing2LimitAngle=45.000000
   TwistLimitAngle=15.000000
   Name="Default__RB_SkelJointSetup"
   ObjectArchetype=RB_ConstraintSetup'Engine.Default__RB_ConstraintSetup'
}
