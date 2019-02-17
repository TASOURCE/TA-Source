/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class RB_PrismaticSetup extends RB_ConstraintSetup
	native(Physics);

defaultproperties
{
   bSwingLimited=True
   bTwistLimited=True
   LinearXSetup=(bLimited=0)
   Name="Default__RB_PrismaticSetup"
   ObjectArchetype=RB_ConstraintSetup'Engine.Default__RB_ConstraintSetup'
}
