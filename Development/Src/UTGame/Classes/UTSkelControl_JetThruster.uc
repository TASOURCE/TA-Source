/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTSkelControl_JetThruster extends SkelControlSingleBone
	hidecategories(Translation, Rotation, Adjustment);

var(Thruster) float MaxForwardVelocity;
var(Thruster) float BlendRate;

var transient float DesiredStrength;

event TickSkelControl(float DeltaTime, SkeletalMeshComponent SkelComp)
{
	local UDKVehicle OwnerVehicle;
	local float NewDesiredStrength, DPV, Thrust;

	OwnerVehicle = UDKVehicle(SkelComp.Owner);
	
	if (OwnerVehicle != None && SkelComp.LastRenderTime > OwnerVehicle.WorldInfo.TimeSeconds - 0.2f)
	{
		if ( OwnerVehicle.bDriving )
		{
			DPV = OwnerVehicle.Velocity dot vector(OwnerVehicle.Rotation);
			if ( DPV > 0.0 )
			{
				Thrust = FClamp(VSize2D(OwnerVehicle.Velocity), 0.0, MaxForwardVelocity);
				NewDesiredStrength = 1.0 - Thrust/MaxForwardVelocity;
			}
			else
			{
				NewDesiredStrength = 1.0;
			}
		}
		else
		{
			NewDesiredStrength = 1.0;
		}

		if (NewDesiredStrength != DesiredStrength)
		{
			BlendTimeToGo += ( NewDesiredStrength - DesiredStrength ) * BlendRate;
			BlendTimeToGo = FClamp(BlendTimeToGo, 0.0, BlendRate);
			StrengthTarget = NewDesiredStrength;
		}
	}
}

defaultproperties
{
   MaxForwardVelocity=1500.000000
   BlendRate=0.300000
   bIgnoreWhenNotRendered=True
   bShouldTickInScript=True
   Name="Default__UTSkelControl_JetThruster"
   ObjectArchetype=SkelControlSingleBone'Engine.Default__SkelControlSingleBone'
}
