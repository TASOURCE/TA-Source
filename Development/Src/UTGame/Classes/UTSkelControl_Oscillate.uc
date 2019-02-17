/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class UTSkelControl_Oscillate extends SkelControlSingleBone
	hidecategories(Rotation);

/** maximum amount to move the bone */
var() vector MaxDelta;
/** the amount of time it takes to go from the starting position (no delta) to MaxDelta */
var() float Period;
/** current time of the oscillation (-Period <= CurrentTime <= Period) */
var() float CurrentTime;
/** indicates which direction we're oscillating in */
var bool bReverseDirection;

event TickSkelControl(float DeltaTime, SkeletalMeshComponent SkelComp)
{
	if (bReverseDirection)
	{
		CurrentTime -= DeltaTime;
		if (CurrentTime <= -Period)
		{
			CurrentTime = -Period - (CurrentTime + Period);
			bReverseDirection = FALSE;
		}
	}
	else
	{
		CurrentTime += DeltaTime;
		if (CurrentTime >= Period)
		{
			CurrentTime = Period - (CurrentTime - Period);
			bReverseDirection = TRUE;
		}
	}

	BoneTranslation = MaxDelta * (CurrentTime / Period);
}

defaultproperties
{
   Period=0.500000
   bApplyTranslation=True
   bAddTranslation=True
   bIgnoreWhenNotRendered=True
   bShouldTickInScript=True
   Name="Default__UTSkelControl_Oscillate"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
