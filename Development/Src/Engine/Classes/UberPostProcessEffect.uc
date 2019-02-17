/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 *
 * Uber post process effect
 *
 */
class UberPostProcessEffect extends DOFBloomMotionBlurEffect
	native;

/** */
var(Scene) vector SceneShadows<DisplayName=Shadows>;
/** */
var(Scene) vector SceneHighLights<DisplayName=HighLights>;
/** */
var(Scene) vector SceneMidTones<DisplayName=MidTones>;
/** */
var(Scene) float  SceneDesaturation<DisplayName=Desaturation>;
/** */
var(Scene) vector  SceneColorize<DisplayName=Colorize>;

/** Allows to specify the tone mapper function which maps HDR colors into the LDR color range. */
var(Tonemapper) enum ETonemapperType
{
	Tonemapper_Off<DisplayName=Off>, 
	Tonemapper_Filmic<DisplayName=Filmic>, 
	Tonemapper_Customizable<DisplayName=Customizable>, 
} TonemapperType;

/**
 * This tonemapper property allows to specify the HDR brightness value that is mapping to the maximum LDR value. Brighter values will be
 * mapped to white (good values are in the range 2 to 16). Only affects the "Customizable" tonemapper.
 */
var(Tonemapper) float TonemapperRange;

/**
 * This tonemapper property allows to adjust the mapping of the darker colors (tonemapper toe). 
 * As the adjustment is independent per color channel it can introduce slight shifts color and saturation changes.
 * Only affects the "Customizable" tonemapper.
 * 0=linear .. 1=crushed darks (more filmic) 
 */
var(Tonemapper) float TonemapperToeFactor<DisplayName=ToeFactor>;

/**
 * Scale the input for the tonemapper. Only used if a tonemapper is specified.
 * >=0, 0:black, 1(default), >1 brighter
 */
var(Tonemapper) float TonemapperScale;

/**
 * The radius of the soft edge for motion blur. A value bigger than 0 enables the soft edge motion blur. The method improves motion blur
 * by blurring the silhuette of moving objects. The method works in screen space. Therefore the performance of the method only depends
 * on screen size, not on the object/vertex/triangle count.
 */
var(MotionBlur) float MotionBlurSoftEdgeKernelSize<DisplayName=SoftEdgeKernelSize>;

/** Whether the image grain (noise) is enabled, to fight 8 bit quantization artifacts and to simulate film grain (scaled by SceneImageGrainScale) */
var(Scene) bool bEnableImageGrain;

/** Image grain scale, only affects the darks, >=0, 0:none, 1(strong) should be less than 1 */
var(Scene) float SceneImageGrainScale;

/** 
 * To adjust the bloom to get an extra inner, more sharp glow.
 * 0=off
 * If this feature is used, it might costs additional performance depending on the bloom radius.
 * However in some cases it might get faster as the bigger radius is done in lower resolution.
 * The actual weight is computed as the ratio between all bloom weights.
 */
var(Bloom, Shape) float BloomWeightSmall<DisplayName=Weight Small>;

/** 
 * To adjust the bloom shape to reduce the extra inner and outer weight.
 * Should be bigger than 0.
 * However in some cases it might get faster as the bigger radius is done in lower resolution.
 * The actual weight is computed as the ratio between all bloom weights.
 */
var(Bloom, Shape) float BloomWeightMedium<DisplayName=Weight Medium>;

/**
 * To adjust the bloom to get an extra outer, more wide spread glow.
 * 0=off
 * If this feature is used, it might costs additional performance depending on the bloom radius.
 * However in some cases it might get faster as the bigger radius is done in lower resolution.
 * The actual weight is computed as the ratio between all bloom weights.
 */
var(Bloom, Shape) float BloomWeightLarge<DisplayName=Weight Large>;


/**
 * Scales the small kernel size. A good number is in the range from 0.1 to 0.5.
 * This property is only used if BloomWeightSmall specifies some weight.
 */
var(Bloom, Shape) float BloomSizeScaleSmall<DisplayName=Size Multiplier Small>;
/**
 * Scales the medium kernel size. A good number is in the range from 0.5 to 1.5.
 */
var(Bloom, Shape) float BloomSizeScaleMedium<DisplayName=Size Multiplier Medium>;
/**
 * Scales the large kernel size. A good number is in the range from 2 to 4.
 * This property is only used if BloomWeightLarge specifies some weight.
 */
var(Bloom, Shape) float BloomSizeScaleLarge<DisplayName=Size Multiplier Large>;

var deprecated bool bEnableHDRTonemapper;
var deprecated float SceneHDRTonemapperScale;


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

//
// The UberPostProcessingEffect performs DOF, Bloom, Material (Sharpen/Desaturate) and Tone Mapping
//
// For the DOF and Bloom parameters see DOFAndBloomEffect.uc.  The Material parameters are used as
// follows:
//
// Color0 = ((InputColor - SceneShadows) / SceneHighLights) ^ SceneMidTones
// Color1 = Luminance(Color0)
//
// OutputColor = Color0 * (1 - SceneDesaturation) + Color1 * SceneDesaturation
// OutputColor *= Colorize

cpptext
{
	// UPostProcessEffect interface

	/**
	 * Creates a proxy to represent the render info for a post process effect
	 * @param WorldSettings - The world's post process settings for the view.
	 * @return The proxy object.
	 */
	virtual class FPostProcessSceneProxy* CreateSceneProxy(const FPostProcessSettings* WorldSettings);

	// UObject interface

	/**
	* Called after this instance has been serialized.  UberPostProcessEffect should only
	* ever exists in the SDPG_PostProcess scene
	*/
	virtual void PostLoad();
	
	/**
	 * Called when properties change.  UberPostProcessEffect should only
	 * ever exists in the SDPG_PostProcess scene
	 */
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);

	/**
	* Tells the SceneRenderer is this effect includes the uber post process.
	*/
	virtual UBOOL IncludesUberpostprocess() const
	{
		return TRUE;
	}

}


defaultproperties
{
   SceneShadows=(X=0.000000,Y=0.000000,Z=-0.003000)
   SceneHighLights=(X=0.800000,Y=0.800000,Z=0.800000)
   SceneMidTones=(X=1.300000,Y=1.300000,Z=1.300000)
   SceneDesaturation=0.400000
   SceneColorize=(X=1.000000,Y=1.000000,Z=1.000000)
   TonemapperRange=8.000000
   TonemapperToeFactor=1.000000
   TonemapperScale=1.000000
   SceneImageGrainScale=0.020000
   BloomWeightMedium=1.000000
   BloomSizeScaleSmall=0.250000
   BloomSizeScaleMedium=1.000000
   BloomSizeScaleLarge=3.000000
   SceneHDRTonemapperScale=1.000000
   Name="Default__UberPostProcessEffect"
   ObjectArchetype=DOFBloomMotionBlurEffect'Engine.Default__DOFBloomMotionBlurEffect'
}
