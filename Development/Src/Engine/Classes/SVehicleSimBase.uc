/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SVehicleSimBase extends ActorComponent
	native(Physics);

// Wheel params
// For more information, see https://udn.epicgames.com/Three/VehicleGuide

var()	float				WheelSuspensionStiffness;
var()	float				WheelSuspensionDamping;
var()	float				WheelSuspensionBias;

var()	float				WheelLongExtremumSlip;
var()	float				WheelLongExtremumValue;
var()	float				WheelLongAsymptoteSlip;
var()	float				WheelLongAsymptoteValue;

var()	float				WheelLatExtremumSlip;
var()	float				WheelLatExtremumValue;
var()	float				WheelLatAsymptoteSlip;
var()	float				WheelLatAsymptoteValue;

var()	float				WheelInertia;

var()   bool                bWheelSpeedOverride; // Allows you to set the axle speed directly

/** Friction model that clamps the frictional force applied by the wheels. Should be more realistic. */
var()	bool				bClampedFrictionModel;

var()	bool				bAutoDrive;
var()	float				AutoDriveSteer;

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
	virtual void ProcessCarInput(ASVehicle* Vehicle) {}
	virtual void UpdateVehicle(ASVehicle* Vehicle, FLOAT DeltaTime) {}

#if WITH_NOVODEX
	virtual void SetNxWheelShapeParams(class NxWheelShape* WheelShape, class USVehicleWheel* VW, FLOAT LongGripScale=1.f, FLOAT LatGripScale=1.f);
	virtual void SetNxWheelShapeTireForceFunctions(class NxWheelShape* WheelShape, class USVehicleWheel* VW, FLOAT LongGripScale=1.f, FLOAT LatGripScale=1.f);
#endif

	/** Returns a float representative of the vehcile's engine output. */
	virtual FLOAT GetEngineOutput(ASVehicle* Vehicle) { return 0.0f; }

}


defaultproperties
{
   WheelLongExtremumSlip=0.100000
   WheelLongExtremumValue=1.000000
   WheelLongAsymptoteSlip=2.000000
   WheelLongAsymptoteValue=0.600000
   WheelLatExtremumSlip=0.350000
   WheelLatExtremumValue=0.850000
   WheelLatAsymptoteSlip=1.400000
   WheelLatAsymptoteValue=0.700000
   WheelInertia=1.000000
   Name="Default__SVehicleSimBase"
   ObjectArchetype=ActorComponent'Engine.Default__ActorComponent'
}
