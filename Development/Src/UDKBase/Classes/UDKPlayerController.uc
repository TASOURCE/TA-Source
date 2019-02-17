/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKPlayerController extends GamePlayerController
	native;

/** plays camera animations (mostly used for viewshakes) */
var CameraAnimInst CameraAnimPlayer;

/** The effect to play on the camera **/
var UDKEmitCameraEffect CameraEffect;

/** indicates whether this player is a dedicated server spectator (so disable rendering and don't allow it to participate at all) */
var bool bDedicatedServerSpectator;

/** makes playercontroller hear much better (used to magnify hit sounds caused by player) */
var					bool	bAcuteHearing;			

/** current offsets applied to the camera due to camera anims, etc */
var vector ShakeOffset; // current magnitude to offset camera position from shake
var rotator ShakeRot; // current magnitude to offset camera rotation from shake

/** stores post processing settings applied by the camera animation
 * applied additively to the default post processing whenever a camera anim is playing
 */
var PostProcessSettings CamOverridePostProcess;

/** additional post processing settings modifier that can be applied
 * @note: defaultproperties for this are hardcoded to zeroes in C++
 */
var PostProcessSettings PostProcessModifier;

/** Actors which may be hidden dynamically when rendering (by adding to PlayerController.HiddenActors array) */
var array<Actor> PotentiallyHiddenActors;

/** If true, player is on a console (used by C++) */
var bool bConsolePlayer;

/** Custom scaling for vehicle check radius.  Used by UTConsolePlayerController for example */
var	float	VehicleCheckRadiusScaling;

var float PulseTimer;
var bool bPulseTeamColor;

/** if true, rotate smoothly to desiredrotation */
var bool bUsePhysicsRotation;

struct native ObjectiveAnnouncementInfo
{
	/** the default announcement sound to play (can be None) */
	var() SoundNodeWave AnnouncementSound;
	/** text displayed onscreen for this announcement */
	var() localized string AnnouncementText;
};

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * Sets the current gamma value.
 *
 * @param New Gamma Value, must be between 0.0 and 1.0
 */
native function SetGamma(float GammaValue);

/**
 * Sets whether or not hardware physics are enabled.
 *
 * @param bEnabled	Whether to enable the physics or not.
 */
native function SetHardwarePhysicsEnabled(bool bEnabled);

/** @return Whether or not the user has a keyboard plugged-in. */
native simulated function bool IsKeyboardAvailable() const;

/** @return Whether or not the user has a mouse plugged-in. */
native simulated function bool IsMouseAvailable() const;

/** @param CamEmitter Clear the CameraEffect if it is the one passed in */
function RemoveCameraEffect( UDKEmitCameraEffect CamEmitter )
{
	if (CameraEffect == CamEmitter)
	{
		CameraEffect = None;
	}
}

/** Spawn ClientSide Camera Effects **/
unreliable client function ClientSpawnCameraEffect(class<UDKEmitCameraEffect> CameraEffectClass)
{
	local vector CamLoc;
	local rotator CamRot;

	if (CameraEffectClass != None && CameraEffect == None)
	{
		CameraEffect = Spawn(CameraEffectClass, self);
		if (CameraEffect != None)
		{
			GetPlayerViewPoint(CamLoc, CamRot);
			CameraEffect.RegisterCamera(self);
			CameraEffect.UpdateLocation(CamLoc, CamRot, FOVAngle);
		}
	}
}

function ClearCameraEffect()
{
	if( CameraEffect != None )
	{
		CameraEffect.Destroy();
		CameraEffect = none;
	}
}

/**
 * This will find the best AdhesionFriction target based on the params passed in.
 **/
native function Pawn GetTargetAdhesionFrictionTarget( FLOAT MaxDistance, const out vector CamLoc, const out Rotator CamRot );

/** @returns whether the controller is active **/
native simulated function bool IsControllerTiltActive() const;

native simulated function SetControllerTiltDesiredIfAvailable( bool bActive );

native simulated function SetControllerTiltActive( bool bActive );

native simulated function SetOnlyUseControllerTiltInput( bool bActive );

native simulated function SetUseTiltForwardAndBack( bool bActive );

defaultproperties
{
   CamOverridePostProcess=(bOverride_EnableBloom=True,bOverride_EnableDOF=True,bOverride_EnableMotionBlur=True,bOverride_EnableSceneEffect=True,bOverride_AllowAmbientOcclusion=True,bOverride_OverrideRimShaderColor=True,bOverride_Bloom_Scale=True,bOverride_Bloom_Threshold=True,bOverride_Bloom_Tint=True,bOverride_Bloom_ScreenBlendThreshold=True,bOverride_Bloom_InterpolationDuration=True,bOverride_DOF_FalloffExponent=True,bOverride_DOF_BlurKernelSize=True,bOverride_DOF_BlurBloomKernelSize=True,bOverride_DOF_MaxNearBlurAmount=True,bOverride_DOF_MaxFarBlurAmount=True,bOverride_DOF_ModulateBlurColor=True,bOverride_DOF_FocusType=True,bOverride_DOF_FocusInnerRadius=True,bOverride_DOF_FocusDistance=True,bOverride_DOF_FocusPosition=True,bOverride_DOF_InterpolationDuration=True,bOverride_Scene_Desaturation=True,bOverride_Scene_HighLights=True,bOverride_Scene_MidTones=True,bOverride_Scene_Shadows=True,bOverride_Scene_InterpolationDuration=True,bOverride_RimShader_Color=True,bOverride_RimShader_InterpolationDuration=True,bEnableBloom=True,bEnableMotionBlur=True,bEnableSceneEffect=True,bAllowAmbientOcclusion=True,Bloom_Scale=1.000000,Bloom_Threshold=1.000000,Bloom_Tint=(B=255,G=255,R=255,A=0),Bloom_ScreenBlendThreshold=10.000000,Bloom_InterpolationDuration=1.000000,DOF_BlurBloomKernelSize=16.000000,DOF_FalloffExponent=4.000000,DOF_BlurKernelSize=16.000000,DOF_MaxNearBlurAmount=1.000000,DOF_MaxFarBlurAmount=1.000000,DOF_ModulateBlurColor=(B=255,G=255,R=255,A=255),DOF_FocusInnerRadius=2000.000000,DOF_InterpolationDuration=1.000000,MotionBlur_MaxVelocity=1.000000,MotionBlur_Amount=0.500000,MotionBlur_FullMotionBlur=True,MotionBlur_CameraRotationThreshold=45.000000,MotionBlur_CameraTranslationThreshold=10000.000000,MotionBlur_InterpolationDuration=1.000000,Scene_Colorize=(X=1.000000,Y=1.000000,Z=1.000000),Scene_TonemapperScale=1.000000,Scene_HighLights=(X=1.000000,Y=1.000000,Z=1.000000),Scene_MidTones=(X=1.000000,Y=1.000000,Z=1.000000),Scene_InterpolationDuration=1.000000,RimShader_Color=(R=0.470440,G=0.585973,B=0.827726,A=1.000000),RimShader_InterpolationDuration=1.000000)
   Begin Object Class=CylinderComponent Name=CollisionCylinder Archetype=CylinderComponent'GameFramework.Default__GamePlayerController:CollisionCylinder'
      ReplacementPrimitive=None
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'GameFramework.Default__GamePlayerController:CollisionCylinder'
   End Object
   CylinderComponent=CollisionCylinder
   Components(0)=CollisionCylinder
   CollisionComponent=CollisionCylinder
   Name="Default__UDKPlayerController"
   ObjectArchetype=GamePlayerController'GameFramework.Default__GamePlayerController'
}
