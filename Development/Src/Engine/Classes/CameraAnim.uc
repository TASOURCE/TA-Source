/**
 *	CameraAnim: defines a pre-packaged animation to be played on a camera.
 * 	Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class CameraAnim extends Object
	notplaceable
	native(Camera);

/** The InterpGroup that holds our actual interpolation data. */
var InterpGroup		CameraInterpGroup;

/** Length, in seconds. */
var const float		AnimLength;

/** AABB in local space. */
var const box		BoundingBox;

/** The "base" postprocess settings to use, to support non-animating settings. */
var const PostProcessSettings	BasePPSettings;
var const float					BasePPSettingsAlpha;

/** The */
var const float		BaseFOV;


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
protected:
	void CalcLocalAABB();

public:
	/** Overridden to calculate the bbox at save time. */
	virtual void PreSave();
	virtual void PostLoad();

	UBOOL CreateFromInterpGroup(class UInterpGroup* SrcGroup, class USeqAct_Interp* Interp);
	FBox GetAABB(FVector const& BaseLoc, FRotator const& BaseRot, FLOAT Scale) const;

}


defaultproperties
{
   AnimLength=3.000000
   BasePPSettings=(bEnableBloom=True,bEnableMotionBlur=True,bEnableSceneEffect=True,bAllowAmbientOcclusion=True,Bloom_Scale=1.000000,Bloom_Threshold=1.000000,Bloom_Tint=(B=255,G=255,R=255,A=0),Bloom_ScreenBlendThreshold=10.000000,Bloom_InterpolationDuration=1.000000,DOF_BlurBloomKernelSize=16.000000,DOF_FalloffExponent=4.000000,DOF_BlurKernelSize=16.000000,DOF_MaxNearBlurAmount=1.000000,DOF_MaxFarBlurAmount=1.000000,DOF_ModulateBlurColor=(B=255,G=255,R=255,A=255),DOF_FocusInnerRadius=2000.000000,DOF_InterpolationDuration=1.000000,MotionBlur_MaxVelocity=1.000000,MotionBlur_Amount=0.500000,MotionBlur_FullMotionBlur=True,MotionBlur_CameraRotationThreshold=45.000000,MotionBlur_CameraTranslationThreshold=10000.000000,MotionBlur_InterpolationDuration=1.000000,Scene_Colorize=(X=1.000000,Y=1.000000,Z=1.000000),Scene_TonemapperScale=1.000000,Scene_HighLights=(X=1.000000,Y=1.000000,Z=1.000000),Scene_MidTones=(X=1.000000,Y=1.000000,Z=1.000000),Scene_InterpolationDuration=1.000000,RimShader_Color=(R=0.470440,G=0.585973,B=0.827726,A=1.000000),RimShader_InterpolationDuration=1.000000)
   BasePPSettingsAlpha=1.000000
   BaseFOV=90.000000
   Name="Default__CameraAnim"
   ObjectArchetype=Object'Core.Default__Object'
}
