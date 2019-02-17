/**
 * Controller that rotates a single bone to 'look at' a given target.
 * Extends engine functionality to add per-axis rotation limits.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKSkelControl_LookAt extends SkelControlLookat
	native(Animation);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** If TRUE, apply limits to specified axis.  Ignore limits otherwise. */
var() protected bool bLimitYaw;
var() protected bool bLimitPitch;
var() protected bool bLimitRoll;

/** Angular limits for pitch, roll, yaw, in degrees */
var() protected float YawLimit;
var() protected float PitchLimit;
var() protected float RollLimit;

/** If TRUE, draw cone representing per-axis limits. */
var() protected bool bShowPerAxisLimits;

defaultproperties
{
   Name="Default__UDKSkelControl_LookAt"
   ObjectArchetype=SkelControlLookAt'Engine.Default__SkelControlLookAt'
}
