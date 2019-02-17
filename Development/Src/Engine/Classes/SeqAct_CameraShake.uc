/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_CameraShake extends SequenceAction
	native(Sequence);

/** Parameters that define the shake. */
var() protectedwrite export editinline CameraShake Shake;

/** For easy overall scaling without tweaking the individual parameters. For oscillating shakes, scales amplitude only.  */
var() protectedwrite float      ShakeScale;
/** Whether or not to do do controller vibration.  Code shakes only for now. */
var() protectedwrite bool       bDoControllerVibration;

/** A radial shake shakes the camera for all nearby players. If FALSE, shake only the cameras of specified players. */
var() protectedwrite bool		bRadialShake;
/** Radius inside which the shake is full magnitude.  For radial shakes only. */
var() protectedwrite float		RadialShake_InnerRadius<ClampMin=0.0 | editcondition=bRadialShake>;
/** Radius at which the shake reaches 0 magnitude.  For radial shakes only. */
var() protectedwrite float		RadialShake_OuterRadius<ClampMin=0.0 | editcondition=bRadialShake>;
/** Falloff exponent, defines falloff between inner and outer radii.  For CST_Radial shakes only. */
var() protectedwrite float		RadialShake_Falloff<ClampMin=0.0 | editcondition=bRadialShake>;
/** If true, camera shake is rotated to be relative to the shake epicenter before application (e.g. a shake that moves -X will always move away from the shake's origin).  Only valid for Radial shakes.  Overrides PlaySpace. */
var() protectedwrite bool		bOrientTowardRadialEpicenter<editcondition=bRadialShake>;

/** Defined how to orient the shaking offsets before applying to the camera.  CameraLocal is normal.  Is UserDefined, rotation of the LocationActor is used.  Ignored for Radial Shakes */
var() protectedwrite ECameraAnimPlaySpace PlaySpace;

var Actor		LocationActor;

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 1;
}

defaultproperties
{
   Begin Object Class=CameraShake Name=Shake0
      OscillationDuration=1.000000
      RotOscillation=(Pitch=(Amplitude=150.000000,Frequency=40.000000),Yaw=(Amplitude=75.000000,Frequency=30.000000),Roll=(Amplitude=150.000000,Frequency=60.000000))
      Name="Shake0"
      ObjectArchetype=CameraShake'Engine.Default__CameraShake'
   End Object
   Shake=CameraShake'Engine.Default__SeqAct_CameraShake:Shake0'
   ShakeScale=1.000000
   bDoControllerVibration=True
   RadialShake_InnerRadius=128.000000
   RadialShake_OuterRadius=512.000000
   RadialShake_Falloff=2.000000
   InputLinks(0)=(LinkDesc="Start")
   InputLinks(1)=(LinkDesc="Stop")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Location",PropertyName="LocationActor")
   ObjName="Camera Shake"
   ObjCategory="Camera"
   Name="Default__SeqAct_CameraShake"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
