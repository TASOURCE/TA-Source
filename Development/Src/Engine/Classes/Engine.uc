//=============================================================================
// Engine: The base class of the global application object classes.
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class Engine extends Subsystem
	native(GameEngine)
	abstract
	config(Engine)
	transient;

// Fonts.
var private Font	TinyFont;
var globalconfig string TinyFontName;

var private Font	SmallFont;
var globalconfig string SmallFontName;

var private Font	MediumFont;
var globalconfig string MediumFontName;

var private Font	LargeFont;
var globalconfig string LargeFontName;

var private Font	SubtitleFont;
var globalconfig string SubtitleFontName;

/** Any additional fonts that script may use without hard-referencing the font. */
var private array<Font>			AdditionalFonts;
var globalconfig array<string>	AdditionalFontNames;

/** The class to use for the game console. */
var class<Console> ConsoleClass;
var globalconfig string ConsoleClassName;

/** The class to use for the game viewport client. */
var class<GameViewportClient> GameViewportClientClass;
var globalconfig string GameViewportClientClassName;

/** The class to use for managing the global data stores */
var	class<DataStoreClient> DataStoreClientClass;
var	globalconfig string DataStoreClientClassName;

/** The class to use for local players. */
var class<LocalPlayer> LocalPlayerClass;
var config string LocalPlayerClassName;

/** The material used when no material is explicitly applied. */
var Material	DefaultMaterial;
var globalconfig string DefaultMaterialName;

/** The decal material used for fallback case of decals */
var Material	DefaultDecalMaterial;
var globalconfig string DefaultDecalMaterialName;

/** A global default texture. */
var Texture	DefaultTexture;
var globalconfig string DefaultTextureName;

/** The material used to render wireframe meshes. */
var Material	WireframeMaterial;
var globalconfig string WireframeMaterialName;

/** A textured material with an instance parameter for the texture. */
var Material EmissiveTexturedMaterial;
var globalconfig string EmissiveTexturedMaterialName;

/** A translucent material used to render things in geometry mode. */
var Material	GeomMaterial;
var globalconfig string GeomMaterialName;

/** The default fog volume material */
var Material	DefaultFogVolumeMaterial;
var globalconfig string DefaultFogVolumeMaterialName;

/** Material used for drawing a tick mark. */
var Material	TickMaterial;
var globalconfig string TickMaterialName;

/** Material used for drawing a cross mark. */
var Material	CrossMaterial;
var globalconfig string CrossMaterialName;

/** Material used for visualizing level membership in lit viewport modes. */
var Material	LevelColorationLitMaterial;
var globalconfig string LevelColorationLitMaterialName;

/** Material used for visualizing level membership in unlit viewport modes. */
var Material	LevelColorationUnlitMaterial;
var globalconfig string LevelColorationUnlitMaterialName;

/** Material used for visualizing lighting only w/ lightmap texel density. */
var Material	LightingTexelDensityMaterial;
var globalconfig string LightingTexelDensityName;

/** Material used for visualizing level membership in lit viewport modes. Uses shading to show axis directions. */
var Material	ShadedLevelColorationLitMaterial;
var globalconfig string ShadedLevelColorationLitMaterialName;

/** Material used for visualizing level membership in unlit viewport modes.  Uses shading to show axis directions. */
var Material	ShadedLevelColorationUnlitMaterial;
var globalconfig string ShadedLevelColorationUnlitMaterialName;

/** Material used to indicate that the associated BSP surface should be removed. */
var Material	RemoveSurfaceMaterial;
var globalconfig string RemoveSurfaceMaterialName;

/** Material that renders vertex colour as emissive. */
var Material	VertexColorMaterial;
var globalconfig string VertexColorMaterialName;

/** Material for visualizing vertex colors on meshes in the scene (color only, no alpha) */
var Material	VertexColorViewModeMaterial_ColorOnly;
var globalconfig string VertexColorViewModeMaterialName_ColorOnly;

/** Material for visualizing vertex colors on meshes in the scene (alpha channel as color) */
var Material	VertexColorViewModeMaterial_AlphaAsColor;
var globalconfig string VertexColorViewModeMaterialName_AlphaAsColor;

/** Material for visualizing vertex colors on meshes in the scene (red only) */
var Material	VertexColorViewModeMaterial_RedOnly;
var globalconfig string VertexColorViewModeMaterialName_RedOnly;

/** Material for visualizing vertex colors on meshes in the scene (green only) */
var Material	VertexColorViewModeMaterial_GreenOnly;
var globalconfig string VertexColorViewModeMaterialName_GreenOnly;

/** Material for visualizing vertex colors on meshes in the scene (blue only) */
var Material	VertexColorViewModeMaterial_BlueOnly;
var globalconfig string VertexColorViewModeMaterialName_BlueOnly;

/** Material used to render game stat heatmaps. */
var Material	HeatmapMaterial;
var globalconfig string HeatmapMaterialName;

/** Material used to render bone weights on skel meshes */
var Material BoneWeightMaterial;
var globalconfig string BoneWeightMaterialName;

/** Material used to render tangents on skel meshes */
var Material TangentColorMaterial;
var globalconfig string TangentColorMaterialName;

/** Material used to render the low detail version of procedural buildings */
var Material ProcBuildingSimpleMaterial;
var globalconfig string ProcBuildingSimpleMaterialName;

/** Mesh used when we need a quad */
var StaticMesh BuildingQuadStaticMesh;
var globalconfig string BuildingQuadStaticMeshName;


/** Roughly how many texels per world unit when generating a building LOD color texture */
var globalconfig float ProcBuildingLODColorTexelsPerWorldUnit;

/** Roughly how many texels per world unit when generating a building LOD lighting texture */
var globalconfig float ProcBuildingLODLightingTexelsPerWorldUnit;

/** Maximum size of a building LOD color texture */
var globalconfig int MaxProcBuildingLODColorTextureSize;

/** Maximum size of a building LOD lighting texture */
var globalconfig int MaxProcBuildingLODLightingTextureSize;

/** Whether to crop building LOD textures to rectangular textures to reduce wasted memory */
var globalconfig bool UseProcBuildingLODTextureCropping;

/** Whether to force use of power-of-two LOD textures (uses more memory, but may have better performance) */
var globalconfig bool ForcePowerOfTwoProcBuildingLODTextures;


/** True if we should combine light/shadow maps together if they're very similar to one another */
var globalconfig bool bCombineSimilarMappings;

/** Maximum root mean square deviation of the image difference allowed for mappings to be combined.  Requires bCombineSimilarLightAndShadowMappings to be enabled. */
var globalconfig float MaxRMSDForCombiningMappings;

/** Size of the texture generated by ImageReflectionSceneCapture actors. */
var globalconfig int ImageReflectionTextureSize;

var globalconfig LinearColor LightingOnlyBrightness;

/** The colors used to render light complexity. */
var globalconfig array<color> LightComplexityColors;

/** The colors used to render shader complexity. */
var globalconfig array<LinearColor> ShaderComplexityColors;

/**
* Complexity limits for the various complexity viewmode combinations.
* These limits are used to map instruction counts to ShaderComplexityColors.
*/
var globalconfig float MaxPixelShaderAdditiveComplexityCount;

/** Range for the texture density viewmode. */
var globalconfig float MinTextureDensity;
var globalconfig float IdealTextureDensity;
var globalconfig float MaxTextureDensity;

/** Range for the lightmap density viewmode. */
/** Minimum lightmap density value for coloring. */
var globalconfig float MinLightMapDensity;
/** Ideal lightmap density value for coloring. */
var globalconfig float IdealLightMapDensity;
/** Maximum lightmap density value for coloring. */
var globalconfig float MaxLightMapDensity;
/** If TRUE, then render grayscale density. */
var globalconfig bool bRenderLightMapDensityGrayscale;
/** The scale factor when rendering grayscale density. */
var globalconfig float RenderLightMapDensityGrayscaleScale;
/** The scale factor when rendering color density. */
var globalconfig float RenderLightMapDensityColorScale;
/** The color to render vertex mapped objects in for LightMap Density view mode. */
var globalconfig linearcolor LightMapDensityVertexMappedColor;
/** The color to render selected objects in for LightMap Density view mode. */
var globalconfig linearcolor LightMapDensitySelectedColor;

struct native StatColorMapEntry
{
	var globalconfig float	In;
	var globalconfig color	Out;
};

struct native StatColorMapping
{
	var globalconfig string	StatName;
	var globalconfig array<StatColorMapEntry> ColorMap;
	var globalconfig bool DisableBlend;
};

var globalconfig array<StatColorMapping>	StatColorMappings;

/** A material used to render the sides of the builder brush/volumes/etc. */
var Material	EditorBrushMaterial;
var globalconfig string EditorBrushMaterialName;

/** PhysicalMaterial to use if none is defined for a particular object. */
var	PhysicalMaterial	DefaultPhysMaterial;
var globalconfig string DefaultPhysMaterialName;

/** Optional damage mapping for Apex destructbile actors */
var	ApexDestructibleDamageParameters    ApexDamageParams;
var globalconfig string	                ApexDamageParamsName;


/** The material used when terrain compilation is too complex. */
var Material	TerrainErrorMaterial;
var globalconfig string TerrainErrorMaterialName;
var globalconfig int TerrainMaterialMaxTextureCount;

/** This is the number of frames that are used between terrain tessellation re-calculations */
var globalconfig int TerrainTessellationCheckCount;
/**
 *	The radius from the view origin that terrain tessellation checks should be performed.
 *	If 0.0, every component will be checked for tessellation changes each frame.
 */
var globalconfig float TerrainTessellationCheckDistance;

/** OnlineSubsystem class to use for netplay */
var	class<OnlineSubsystem> OnlineSubsystemClass;
var globalconfig string DefaultOnlineSubsystemName;

/** Default engine post process chain used for the game and main editor view if none is specified in the WorldInfo  */
var private{private} PostProcessChain DefaultPostProcess;
var private{private} config string DefaultPostProcessName;

/** post process chain used for skeletal mesh thumbnails */
var PostProcessChain ThumbnailSkeletalMeshPostProcess;
var config string ThumbnailSkeletalMeshPostProcessName;

/** post process chain used for particle system thumbnails */
var PostProcessChain ThumbnailParticleSystemPostProcess;
var config string ThumbnailParticleSystemPostProcessName;

/** post process chain used for material thumbnails */
var PostProcessChain ThumbnailMaterialPostProcess;
var config string ThumbnailMaterialPostProcessName;

/** post process chain used for rendering the UI */
var PostProcessChain DefaultUIScenePostProcess;
var config string DefaultUIScenePostProcessName;

/** Material used for drawing meshes when their collision is missing. */
var Material	DefaultUICaretMaterial;
var globalconfig string DefaultUICaretMaterialName;

/** Material used for visualizing the reflection scene captures on a surface */
var Material	SceneCaptureReflectActorMaterial;
var globalconfig string SceneCaptureReflectActorMaterialName;

/** Material used for visualizing the cube map scene captures on a mesh */
var Material	SceneCaptureCubeActorMaterial;
var globalconfig string SceneCaptureCubeActorMaterialName;

/** Texture used to get random opacity values per-pixel for screen-door fading */
var Texture2D ScreenDoorNoiseTexture;
var globalconfig string ScreenDoorNoiseTextureName;

/** Texture used to get random angles per-pixel by the Branching PCF implementation */
var Texture2D RandomAngleTexture;
var globalconfig string RandomAngleTextureName;

/** Texture used to get random normals per-pixel */
var Texture2D RandomNormalTexture;
var globalconfig string RandomNormalTextureName;

/** Texture used to get random rotation per-pixel */
var Texture2D RandomMirrorDiscTexture;
var globalconfig string RandomMirrorDiscTextureName;

/** Texture used as a placeholder for terrain weight-maps to give the material the correct texture format. */
var Texture	WeightMapPlaceholderTexture;
var globalconfig string WeightMapPlaceholderTextureName;

/** Texture used to display LightMapDensity */
var Texture2D LightMapDensityTexture;
var globalconfig string LightMapDensityTextureName;

/** Texture used to display LightMapDensity */
var Texture2D LightMapDensityNormal;
var globalconfig string LightMapDensityNormalName;

/** White noise sound */
var SoundNodeWave DefaultSound;
var globalconfig string DefaultSoundName;

/** Time in seconds (game time) we should wait between purging object references to objects that are pending kill */
var(Settings) config float TimeBetweenPurgingPendingKillObjects;

// Variables.

/** Abstract interface to platform-specific subsystems */
var const client							Client;

/** Viewports for all players in all game instances (all PIE windows, for example) */
var init array<LocalPlayer>					GamePlayers;

/** the viewport representing the current game instance */
var const GameViewportClient				GameViewport;

/** Array of deferred command strings/ execs that get executed at the end of the frame */
var init array<string>	DeferredCommands;

var int TickCycles, GameCycles, ClientCycles;
var transient bool bUseSound;

/** Whether to allow background level streaming. */
var(Settings) config bool bUseBackgroundLevelStreaming;

/** Flag for completely disabling subtitles for localized sounds. */
var(Settings) config bool bSubtitlesEnabled;

/** Flag for forcibly disabling subtitles even if you try to turn them back on they will be off */
var(Settings) config bool bSubtitlesForcedOff;

/** Whether to enable framerate smoothing.																		*/
var config	bool			bSmoothFrameRate;
/** Maximum framerate to smooth. Code will try to not go over via waiting.										*/
var config	float			MaxSmoothedFrameRate;
/** Minimum framerate smoothing will kick in.																	*/
var config	float			MinSmoothedFrameRate;

/**
 *	Whether or not to use the TickFrequency code path (c.f. AActor::Tick()
 */
var globalconfig bool HACK_UseTickFrequency;

/** Enable experimental DMC feature */
var globalconfig bool HACK_EnableDMC;

/**
 * Whether or not the simple lightmaps should be generated during lighting rebuilds.
 */
var globalconfig bool bShouldGenerateSimpleLightmaps;

/**
 *	Flag for forcing terrain to be 'static' (MinTessellationLevel = MaxTesselationLevel)
 *	Game time only...
 */
var(Settings) config bool bForceStaticTerrain;

/** Entry point for RemoteControl, the in-game UI for the exec system. */
var native pointer				RemoteControlExec{class FRemoteControlExec};

/** Pointer to a support class to handle mobile material emulation (created on demand) */
var native pointer				MobileMaterialEmulator{class FMobileMaterialEmulator};

// Color preferences.
var(Colors) color
	C_WorldBox,
	C_BrushWire,
	C_AddWire,
	C_SubtractWire,
	C_SemiSolidWire,
	C_NonSolidWire,
	C_WireBackground,
	C_ScaleBoxHi,
	C_VolumeCollision,
	C_BSPCollision,
	C_OrthoBackground,
	C_Volume,
	C_BrushShape;

/** Fudge factor for tweaking the distance based miplevel determination */
var(Settings)	float			StreamingDistanceFactor;

/** Class name of the scout to use for path building */
var const config string ScoutClassName;

/**
 * A transition type.
 */
enum ETransitionType
{
	TT_None,
	TT_Paused,
	TT_Loading,
	TT_Saving,
	TT_Connecting,
	TT_Precaching
};

/** The current transition type. */
var ETransitionType TransitionType;

/** The current transition description text. */
var string TransitionDescription;

/** The gametype for the destination map */
var string TransitionGameType;

/** Level of detail range control for meshes */
var config		float					MeshLODRange;
/** Force to CPU skinning only for skeletal mesh rendering */
var	config		bool					bForceCPUSkinning;
/** Whether to use post processing effects or not */
var	config		bool					bUsePostProcessEffects;
/** whether to send Kismet warning messages to the screen (via PlayerController::ClientMessage()) */
var config bool bOnScreenKismetWarnings;
/** whether kismet logging is enabled. */
var config bool bEnableKismetLogging;
/** whether mature language is allowed **/
var config bool bAllowMatureLanguage;
/** camera rotation (deg) beyond which occlusion queries are ignored from previous frame (because they are likely not valid) */
var config float CameraRotationThreshold;
/** camera movement beyond which occlusion queries are ignored from previous frame (because they are likely not valid) */
var config float CameraTranslationThreshold;
/** The amount of time a primitive is considered to be probably visible after it was last actually visible. */
var config float PrimitiveProbablyVisibleTime;
/** The percent of previously unoccluded primitives which are requeried every frame. */
var config float PercentUnoccludedRequeries;
/** Max screen pixel fraction where retesting when unoccluded is worth the GPU time. */
var config float MaxOcclusionPixelsFraction;

/** Terrain collision viewing - If TRUE, overlay collion level else render it and overlay terrain. */
var config bool bRenderTerrainCollisionAsOverlay;

/** Do not use Ageia PhysX hardware */
var globalconfig bool bDisablePhysXHardwareSupport;

/** Whether to pause the game if focus is lost. */
var config bool bPauseOnLossOfFocus;

/** The most vertices a fluid surface can have.  The number of verts is clamped to avoid running out of memory and exposing driver bugs. */
var config int MaxFluidNumVerts;

/**
 *	Time limit (in milliseconds) for a fluid simulation update, to avoid spiraling into a bad
 *	feedback-loop with slower and slower framerate. This value is doubled in debug builds.
 */
var config float FluidSimulationTimeLimit;

/**
 *	The maximum allowed size to a ParticleEmitterInstance::Resize call.
 *	If larger, the function will return without resizing.
 */
var config int MaxParticleResize;
/**
*	If the resize request is larger than this, spew out a warning to the log
*/
var config int MaxParticleResizeWarn;
/**
 *	If TRUE, then perform particle size checks in non FINAL_RELEASE builds.
 */
var globalconfig bool bCheckParticleRenderSize;
/** The maximum amount of memory any single emitter is allowed to take for its vertices */
var config int MaxParticleVertexMemory;
var transient int MaxParticleSpriteCount;
var transient int MaxParticleSubUVCount;

/** The number of times to attempt the Begin*UP call before assuming the GPU is hosed	*/
var config int BeginUPTryCount;

/** Info about one note dropped in the map during PIE. */
struct native DropNoteInfo
{
	/** Location to create Note actor in edited level. */
	var vector	Location;
	/** Rotation to create Note actor in edited level. */
	var rotator	Rotation;
	/** Text to assign to Note actor in edited level. */
	var string	Comment;
};

/**  */
var transient array<DropNoteInfo>	PendingDroppedNotes;

/** Overridable class for cover mesh rendering in-game, used to get around the editoronly restrictions needed by the base CoverMeshComponent */
var globalconfig string DynamicCoverMeshComponentName;

/**
 * By default, each frame's initial scene color clear is disabled.
 * This flag can be toggled at runtime to enable clearing for development.
 */
var globalconfig const bool			bEnableColorClear;

/** Number of times to tick each client per second */
var globalconfig float				NetClientTicksPerSecond;

/**
 *	The largest step-size allowed for lens flare occlusion results
 *	before using the incremental step method.
 */
var globalconfig float				MaxTrackedOcclusionIncrement;
/**
 *	The incremental step size for the above.
 */
var globalconfig float				TrackedOcclusionStepSize;

/** Keeps track whether actors moved via PostEditMove and therefore constraint syncup should be performed. */
var transient bool bAreConstraintsDirty;

/** TRUE if the engine needs to perform a delayed global component reattach (really just for editor) */
var transient bool bHasPendingGlobalReattach;

/** If TRUE, the engine will attempt to emulate mobile rendering on PC when using D3D.  Mostly, this means disabling gamma correction. */
var transient bool bEmulateMobileRendering;

/** Default color of selected objects in the level viewport (additive) */
var globalconfig LinearColor DefaultSelectedMaterialColor;

/** Default color of hovered objects in the level viewport (additive) */
var globalconfig LinearColor DefaultHoveredMaterialColor;

/** Color of selected objects in the level viewport (additive) */
var transient LinearColor SelectedMaterialColor;

/** Color of unselected objects in the level viewport (additive) */
var transient LinearColor UnselectedMaterialColor;

/** If TRUE, then disable OnScreenDebug messages. Can be toggled in real-time. */
var globalconfig	bool	bEnableOnScreenDebugMessages;
/** If TRUE, then disable the display of OnScreenDebug messages (used when running) */
var transient		bool	bEnableOnScreenDebugMessagesDisplay;

/** If TRUE, then skip drawing map warnings on screen even in non FINAL_RELEASE builds */
var globalconfig	bool	bSuppressMapWarnings;

/** If DevAbsorbFuncs logging is unsuppressed and _DEBUG is defined in native, functions listed in this array will not throw a warning when they are absorbed for not being simulated on clients.  Useful for functions like Tick, where this behaviour is intentional */
var globalconfig    array<name>     IgnoreSimulatedFuncWarnings;

/** if set, cook game classes into standalone packages (as defined in [Cooker.MPGameContentCookStandalone]) and load the appropriate
 * one at game time depending on the gametype specified on the URL
 * (the game class should then not be referenced in the maps themselves)
 */
var globalconfig bool bCookSeparateSharedMPGameContent;

/** determines whether AI logging should be processed or not */
var globalconfig bool bDisableAILogging;

/** Semaphore to control screen saver inhibitor thread access. */
var private{private} transient int ScreenSaverInhibitorSemaphore;

/** Thread preventing screen saver from kicking. Suspend most of the time. */
var private{private} transient pointer ScreenSaverInhibitor{FRunnableThread};

/** A global translation context handles simple translation scenarios. e.g. <Strings:A.B.C> */
var TranslationContext GlobalTranslationContext;

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
// (cpptext)
// (cpptext)

/** @return the GIsEditor flag setting */
native static final function bool IsEditor();

/** @return the GIsGame flag is setting */
native static final function bool IsGame();

/**
 * Returns a pointer to the current world.
 */
native static final function WorldInfo GetCurrentWorldInfo();

/**
 * Returns version info from the engine
 */
native static final function string GetBuildDate();

/**
 * Returns the engine's default tiny font
 */
native static final function Font GetTinyFont();

/**
 * Returns the engine's default small font
 */
native static final function Font GetSmallFont();

/**
 * Returns the engine's default medium font
 */
native static final function Font GetMediumFont();

/**
 * Returns the engine's default large font
 */
native static final function Font GetLargeFont();

/**
 * Returns the engine's default subtitle font
 */
native static final function Font GetSubtitleFont();

/**
 * Returns the specified additional font.
 *
 * @param	AdditionalFontIndex		Index into the AddtionalFonts array.
 */
native static final function Font GetAdditionalFont(int AdditionalFontIndex);

/** @return whether we're currently running in splitscreen (more than one local player) */
native static final function bool IsSplitScreen();

/** @return the audio device (will be None if sound is disabled) */
native static final function AudioDevice GetAudioDevice();

/** @return Returns the name of the last movie that was played. */
native static final function string GetLastMovieName();


/**
 * Play one of the LoadMap loading movies as configured by ini file
 *
 * @return TRUE if a movie was played
 */
native static final function bool PlayLoadMapMovie();

/**
 * Stops the current movie
 *
 * @param bDelayStopUntilGameHasRendered If TRUE, the engine will delay stopping the movie until after the game has rendered at least one frame
 */
native static final function StopMovie(bool bDelayStopUntilGameHasRendered);

/**
 * Removes all overlays from displaying
 */
native static final function RemoveAllOverlays();

/**
 * Adds a text overlay to the movie
 *
 * @param Font Font to use to display (must be in the root set so this will work during loads)
 * @param Text Text to display
 * @param X X location in resolution-independent coordinates (ignored if centered)
 * @param Y Y location in resolution-independent coordinates
 * @param ScaleX Text horizontal scale
 * @param ScaleY Text vertical scale
 * @param bIsCentered TRUE if the text should be centered
 */
native static final function AddOverlay( Font Font, string Text, float X, float Y, float ScaleX, float ScaleY, bool bIsCentered );

/**
 * Adds a wrapped text overlay to the movie
 *
 * @param Font Font to use to display (must be in the root set so this will work during loads)
 * @param Text Text to display
 * @param X X location in resolution-independent coordinates (ignored if centered)
 * @param Y Y location in resolution-independent coordinates
 * @param ScaleX Text horizontal scale
 * @param ScaleY Text vertical scale
 * @param WrapWidth Number of pixels before text should wrap
 */
native static final function AddOverlayWrapped( Font Font, string Text, float X, float Y, float ScaleX, float ScaleY, float WrapWidth );

/**
 * returns GEngine
 */
native static final function Engine GetEngine();

/**
 * Returns the post process chain to be used with the world.
 */
native static final function PostProcessChain GetWorldPostProcessChain();

/** adds a world location as a secondary view location for purposes of texture streaming
 * lasts one frame
 * @param InLoc - location to add to texture streaming for this frame
 */
native final function AddTextureStreamingSlaveLoc(vector InLoc);

/**
 * Serializes an object to a file (object pointers to non-always loaded objects are not supported)
 *
 * @param Obj The object to serialize
 * @param Pathname The path to the file to save
 * @param bIsSaveGame If TRUE, FILEWRITE_SaveGame will be used to create the file writer
 * @param Version A version number to save with the archive, so that we can safely fail when loading old versioned files
 *
 * @return TRUE if successful
 */
native static final function bool BasicSaveObject(Object Obj, string Pathname, bool bIsSaveGame, int Version);

/**
 * Loads an object from a file (saved with the BasicSaveObject function). It should already be
 * allocated just like the original object was allocated
 *
 * @param Obj The object to serialize
 * @param Pathname The path to the file to read and create the object from
 * @param bIsSaveGame If TRUE, FILEREAD_SaveGame will be used to create the file reader
 * @param Version A version number to match with the version saved in the archive, so that we can safely fail when loading old versioned files
 *
 * @return TRUE if successful
 */
native static final function bool BasicLoadObject(Object Obj, string Pathname, bool bIsSaveGame, int Version);

cpptext
{
	// Constructors.
	UEngine();
	void StaticConstructor();

	// UObject interface.
	virtual void FinishDestroy();

	// UEngine interface.
	virtual void Init();

	/**
	 * Called at shutdown, just before the exit purge.
	 */
	virtual void PreExit() {}

	virtual UBOOL Exec( const TCHAR* Cmd, FOutputDevice& Out=*GLog );
	virtual void Tick( FLOAT DeltaSeconds ) PURE_VIRTUAL(UEngine::Tick,);
	virtual void SetClientTravel( const TCHAR* NextURL, ETravelType TravelType ) PURE_VIRTUAL(UEngine::SetClientTravel,);
	virtual FLOAT GetMaxTickRate( FLOAT /*DeltaTime*/, UBOOL bAllowFrameRateSmoothing = TRUE );
	virtual void SetProgress( EProgressMessageType MessageType, const FString& Title, const FString& Message );

	/**
	 * Pauses / unpauses the game-play when focus of the game's window gets lost / gained.
	 * @param EnablePause TRUE to pause; FALSE to unpause the game
	 */
	virtual void OnLostFocusPause( UBOOL EnablePause );

#if DO_CHARTING
	/**
	 * Ticks the FPS chart.
	 *
	 * @param DeltaSeconds	Time in seconds passed since last tick.
	 */
	virtual void TickFPSChart( FLOAT DeltaSeconds );

	/**
	 * Ticks the Memory chart.
	 *
	 * @param DeltaSeconds	Time in seconds passed since last tick.
	 */
	virtual void TickMemoryChart( FLOAT DeltaSeconds );

	/**
	 * Resets the FPS chart data.
	 */
	virtual void ResetFPSChart();

	/**
	 * Dumps the FPS chart information to the passed in archive.
	 *
	 * @param	bForceDump	Whether to dump even if FPS chart info is not enabled.
	 */
	virtual void DumpFPSChart( UBOOL bForceDump = FALSE );

	/** Dumps info on DistanceFactor used for rendering SkeletalMeshComponents during the game. */
	virtual void DumpDistanceFactorChart();

	/**
 	 * Resets the Memory chart data.
	 */
	virtual void ResetMemoryChart();

	/**
	 * Dumps the Memory chart information to various places.
	 *
	 * @param	bForceDump	Whether to dump even if no info has been captured yet (will force an update in that case).
	 */
	virtual void DumpMemoryChart( UBOOL bForceDump = FALSE );


private:
	/**
	 * Dumps the FPS chart information to HTML.
	 */
	virtual void DumpFPSChartToHTML( FLOAT TotalTime, FLOAT DeltaTime, INT NumFrames, UBOOL bOutputToGlobalLog );

	/**
	 * Dumps the FPS chart information to the log.
	 */
	virtual void DumpFPSChartToLog( FLOAT TotalTime, FLOAT DeltaTime, INT NumFrames );

	/**
	 * Dumps the FPS chart information to the special stats log file.
	 */
	virtual void DumpFPSChartToStatsLog( FLOAT TotalTime, FLOAT DeltaTime, INT NumFrames );

	/**
	 * Dumps the Memory chart information to HTML.
	 */
	virtual void DumpMemoryChartToHTML( FLOAT TotalTime, FLOAT DeltaTime, INT NumFrames, UBOOL bOutputToGlobalLog );

	/**
	 * Dumps the Memory chart information to the log.
	 */
	virtual void DumpMemoryChartToLog( FLOAT TotalTime, FLOAT DeltaTime, INT NumFrames );

	/**
	 * Dumps the Memory chart information to the special stats log file.
	 */
	virtual void DumpMemoryChartToStatsLog( FLOAT TotalTime, FLOAT DeltaTime, INT NumFrames );

#endif // DO_CHARTING

public:

	/**
	 * Spawns any registered server actors
	 */
	virtual void SpawnServerActors(void)
	{
	}

	/**
	 * Loads all Engine object references from their corresponding config entries.
	 */
	void InitializeObjectReferences();

	/**
	 * Construct a UNetDriver object based on an .ini setting
	 *
	 * @return The created NetDriver object, or NULL if it fails
	 */
	virtual class UNetDriver* ConstructNetDriver()
	{
		return NULL;
	}

	/**
	 * Clean up the GameViewport
	 */
	void CleanupGameViewport();

	/** Get some viewport. Will be GameViewport in game, and one of the editor viewport windows in editor. */
	virtual FViewport* GetAViewport();

	/**
	 * Allows the editor to accept or reject the drawing of wireframe brush shapes based on mode and tool.
	 */
	virtual UBOOL ShouldDrawBrushWireframe( class AActor* InActor ) { return TRUE; }

	/**
	 * Issued by code requesting that decals be reattached.
	 */
	virtual void IssueDecalUpdateRequest() {}

	/**
	 * Returns whether or not the map build in progressed was cancelled by the user.
	 */
	virtual UBOOL GetMapBuildCancelled() const
	{
		return FALSE;
	}

	/**
	 * Sets the flag that states whether or not the map build was cancelled.
	 *
	 * @param InCancelled	New state for the cancelled flag.
	 */
	virtual void SetMapBuildCancelled( UBOOL InCancelled )
	{
		// Intentionally empty.
	}

	/**
	 * Computes a color to use for property coloration for the given object.
	 *
	 * @param	Object		The object for which to compute a property color.
	 * @param	OutColor	[out] The returned color.
	 * @return				TRUE if a color was successfully set on OutColor, FALSE otherwise.
	 */
	virtual UBOOL GetPropertyColorationColor(class UObject* Object, FColor& OutColor);

	/** Uses StatColorMappings to find a color for this stat's value. */
	UBOOL GetStatValueColoration(const FString& StatName, FLOAT Value, FColor& OutColor);

	/**
	 * @return TRUE if selection of translucent objects in perspective viewports is allowed
	 */
	virtual UBOOL AllowSelectTranslucent() const
	{
		// The editor may override this to disallow translucent selection based on user preferences
		return TRUE;
	}

	/**
	 * @return TRUE if only editor-visible levels should be loaded in Play-In-Editor sessions
	 */
	virtual UBOOL OnlyLoadEditorVisibleLevelsInPIE() const
	{
		// The editor may override this to apply the user's preference state
		return TRUE;
	}
    
    //$$ JCR - START
	/**
	 * Enables or disables background music
	 *
	 * @param bEnable	If TRUE returns volume to its original value, if FALSE disable it.
	 */
	virtual void ToggleBGM(UBOOL bEnable) {}
    //$$ JCR - END

	/**
	 * Enables or disables the ScreenSaver (PC only)
	 *
	 * @param bEnable	If TRUE the enable the screen saver, if FALSE disable it.
	 */
	void EnableScreenSaver( UBOOL bEnable );

protected:
	/**
	 * Handles freezing/unfreezing of rendering
	 */
	virtual void ProcessToggleFreezeCommand()
	{
		// Intentionally empty.
	}

	/**
	 * Handles frezing/unfreezing of streaming
	 */
	 virtual void ProcessToggleFreezeStreamingCommand()
	 {
		// Intentionally empty.
	 }

	 /**
	  * Updates all physics constraint actor joint locations.
	  */
	 virtual void UpdateConstraintActors();

}


defaultproperties
{
   TinyFontName="EngineFonts.TinyFont"
   SmallFontName="EngineFonts.SmallFont"
   MediumFontName="EngineFonts.SmallFont"
   LargeFontName="EngineFonts.SmallFont"
   SubtitleFontName="EngineFonts.SmallFont"
   ConsoleClassName="UTGame.UTConsole"
   GameViewportClientClassName="TribesGame.TrGameViewportClient"
   DataStoreClientClassName="Engine.DataStoreClient"
   LocalPlayerClassName="Engine.LocalPlayer"
   DefaultMaterialName="EngineMaterials.DefaultMaterial"
   DefaultDecalMaterialName="EngineMaterials.DefaultDecalMaterial"
   DefaultTextureName="EngineMaterials.DefaultDiffuse"
   WireframeMaterialName="EngineDebugMaterials.WireframeMaterial"
   EmissiveTexturedMaterialName="EngineMaterials.EmissiveTexturedMaterial"
   GeomMaterialName="EngineDebugMaterials.GeomMaterial"
   DefaultFogVolumeMaterialName="EngineMaterials.FogVolumeMaterial"
   TickMaterialName="EditorMaterials.Tick_Mat"
   CrossMaterialName="EditorMaterials.Cross_Mat"
   LevelColorationLitMaterialName="EngineDebugMaterials.LevelColorationLitMaterial"
   LevelColorationUnlitMaterialName="EngineDebugMaterials.LevelColorationUnlitMaterial"
   LightingTexelDensityName="EngineDebugMaterials.MAT_LevelColorationLitLightmapUVs"
   ShadedLevelColorationLitMaterialName="EngineDebugMaterials.ShadedLevelColorationLitMaterial"
   ShadedLevelColorationUnlitMaterialName="EngineDebugMaterials.ShadedLevelColorationUnlitMaterial"
   RemoveSurfaceMaterialName="EngineMaterials.RemoveSurfaceMaterial"
   VertexColorMaterialName="EngineDebugMaterials.VertexColorMaterial"
   VertexColorViewModeMaterialName_ColorOnly="EngineDebugMaterials.VertexColorViewMode_ColorOnly"
   VertexColorViewModeMaterialName_AlphaAsColor="EngineDebugMaterials.VertexColorViewMode_AlphaAsColor"
   VertexColorViewModeMaterialName_RedOnly="EngineDebugMaterials.VertexColorViewMode_RedOnly"
   VertexColorViewModeMaterialName_GreenOnly="EngineDebugMaterials.VertexColorViewMode_GreenOnly"
   VertexColorViewModeMaterialName_BlueOnly="EngineDebugMaterials.VertexColorViewMode_BlueOnly"
   HeatmapMaterialName="EngineDebugMaterials.HeatmapMaterial"
   BoneWeightMaterialName="EngineDebugMaterials.BoneWeightMaterial"
   TangentColorMaterialName="EngineDebugMaterials.TangentColorMaterial"
   ProcBuildingSimpleMaterialName="EngineBuildings.ProcBuildingSimpleMaterial"
   BuildingQuadStaticMeshName="EngineBuildings.BuildingQuadMesh"
   ProcBuildingLODColorTexelsPerWorldUnit=0.075000
   ProcBuildingLODLightingTexelsPerWorldUnit=0.015000
   MaxProcBuildingLODColorTextureSize=1024
   MaxProcBuildingLODLightingTextureSize=256
   UseProcBuildingLODTextureCropping=True
   ForcePowerOfTwoProcBuildingLODTextures=True
   bCombineSimilarMappings=True
   bRenderLightMapDensityGrayscale=True
   bUseBackgroundLevelStreaming=True
   bSubtitlesEnabled=True
   bSmoothFrameRate=True
   bShouldGenerateSimpleLightmaps=True
   bOnScreenKismetWarnings=True
   bDisablePhysXHardwareSupport=True
   bCheckParticleRenderSize=True
   bEnableColorClear=True
   bEnableOnScreenDebugMessages=True
   MaxRMSDForCombiningMappings=6.000000
   ImageReflectionTextureSize=1024
   LightingOnlyBrightness=(R=0.300000,G=0.300000,B=0.300000,A=1.000000)
   LightComplexityColors(0)=(B=0,G=0,R=0,A=1)
   LightComplexityColors(1)=(B=0,G=255,R=0,A=1)
   LightComplexityColors(2)=(B=0,G=191,R=63,A=1)
   LightComplexityColors(3)=(B=0,G=127,R=127,A=1)
   LightComplexityColors(4)=(B=0,G=63,R=191,A=1)
   LightComplexityColors(5)=(B=0,G=0,R=255,A=1)
   ShaderComplexityColors(0)=(R=0.000000,G=1.000000,B=0.127000,A=1.000000)
   ShaderComplexityColors(1)=(R=0.000000,G=1.000000,B=0.000000,A=1.000000)
   ShaderComplexityColors(2)=(R=0.046000,G=0.520000,B=0.000000,A=1.000000)
   ShaderComplexityColors(3)=(R=0.215000,G=0.215000,B=0.000000,A=1.000000)
   ShaderComplexityColors(4)=(R=0.520000,G=0.046000,B=0.000000,A=1.000000)
   ShaderComplexityColors(5)=(R=0.700000,G=0.000000,B=0.000000,A=1.000000)
   ShaderComplexityColors(6)=(R=1.000000,G=0.000000,B=0.000000,A=1.000000)
   ShaderComplexityColors(7)=(R=1.000000,G=0.000000,B=0.500000,A=1.000000)
   ShaderComplexityColors(8)=(R=1.000000,G=0.900000,B=0.900000,A=1.000000)
   MaxPixelShaderAdditiveComplexityCount=900.000000
   IdealTextureDensity=13.000000
   MaxTextureDensity=55.000000
   IdealLightMapDensity=1.000000
   MaxLightMapDensity=3.000000
   RenderLightMapDensityGrayscaleScale=1.000000
   RenderLightMapDensityColorScale=1.000000
   LightMapDensityVertexMappedColor=(R=0.650000,G=0.650000,B=0.250000,A=1.000000)
   LightMapDensitySelectedColor=(R=1.000000,G=0.200000,B=1.000000,A=1.000000)
   StatColorMappings(0)=(StatName="AverageFPS",ColorMap=((In=15.000000,Out=(B=0,G=0,R=255,A=0)),(In=30.000000,Out=(B=0,G=255,R=255,A=0)),(In=45.000000,Out=(B=0,G=255,R=0,A=0))))
   StatColorMappings(1)=(StatName="Frametime",ColorMap=((In=1.000000,Out=(B=0,G=255,R=0,A=0)),(In=25.000000,Out=(B=0,G=255,R=0,A=0)),(In=29.000000,Out=(B=0,G=255,R=255,A=0)),(In=33.000000,Out=(B=0,G=0,R=255,A=0))))
   StatColorMappings(2)=(StatName="Streaming fudge factor",ColorMap=((Out=(B=0,G=255,R=0,A=0)),(In=1.000000,Out=(B=0,G=255,R=0,A=0)),(In=2.500000,Out=(B=0,G=255,R=255,A=0)),(In=5.000000,Out=(B=0,G=0,R=255,A=0)),(In=10.000000,Out=(B=0,G=0,R=255,A=0))))
   EditorBrushMaterialName="EngineMaterials.EditorBrushMaterial"
   DefaultPhysMaterialName="EngineMaterials.DefaultPhysicalMaterial"
   TerrainErrorMaterialName="EngineDebugMaterials.MaterialError_Mat"
   TerrainMaterialMaxTextureCount=16
   TerrainTessellationCheckCount=6
   TerrainTessellationCheckDistance=4096.000000
   DefaultPostProcessName="PostProcess.TrPostProcess_PC"
   ThumbnailSkeletalMeshPostProcessName="EngineMaterials.DefaultThumbnailPostProcess"
   ThumbnailParticleSystemPostProcessName="EngineMaterials.DefaultThumbnailPostProcess"
   ThumbnailMaterialPostProcessName="EngineMaterials.DefaultThumbnailPostProcess"
   DefaultUIScenePostProcessName="EngineMaterials.DefaultUIPostProcess"
   DefaultUICaretMaterialName="EngineMaterials.BlinkingCaret"
   SceneCaptureReflectActorMaterialName="EngineMaterials.ScreenMaterial"
   SceneCaptureCubeActorMaterialName="EngineMaterials.CubeMaterial"
   ScreenDoorNoiseTextureName="EngineMaterials.ScreenDoorNoiseTexture"
   RandomAngleTextureName="EngineMaterials.RandomAngles"
   RandomNormalTextureName="EngineMaterials.RandomNormal2"
   RandomMirrorDiscTextureName="EngineMaterials.RandomMirrorDisc"
   WeightMapPlaceholderTextureName="EngineMaterials.WeightMapPlaceholderTexture"
   LightMapDensityTextureName="EngineMaterials.DefaultWhiteGrid"
   LightMapDensityNormalName="EngineMaterials.DefaultNormal"
   DefaultSoundName="EngineSounds.WhiteNoise"
   TimeBetweenPurgingPendingKillObjects=30.000000
   MaxSmoothedFrameRate=62.000000
   MinSmoothedFrameRate=22.000000
   C_WorldBox=(B=40,G=0,R=0,A=255)
   C_BrushWire=(B=0,G=0,R=192,A=255)
   C_AddWire=(B=255,G=127,R=127,A=255)
   C_SubtractWire=(B=63,G=192,R=255,A=255)
   C_SemiSolidWire=(B=0,G=255,R=127,A=255)
   C_NonSolidWire=(B=32,G=192,R=63,A=255)
   C_WireBackground=(B=0,G=0,R=0,A=255)
   C_ScaleBoxHi=(B=157,G=149,R=223,A=255)
   C_VolumeCollision=(B=157,G=223,R=149,A=255)
   C_BSPCollision=(B=223,G=157,R=149,A=255)
   C_OrthoBackground=(B=163,G=163,R=163,A=255)
   C_Volume=(B=255,G=196,R=255,A=255)
   C_BrushShape=(B=128,G=255,R=128,A=255)
   ScoutClassName="UTGame.UTScout"
   CameraRotationThreshold=45.000000
   CameraTranslationThreshold=10000.000000
   PrimitiveProbablyVisibleTime=8.000000
   PercentUnoccludedRequeries=0.125000
   MaxOcclusionPixelsFraction=0.001000
   MaxFluidNumVerts=1048576
   FluidSimulationTimeLimit=30.000000
   MaxParticleResize=1024
   MaxParticleResizeWarn=10240
   MaxParticleVertexMemory=131972
   BeginUPTryCount=200000
   NetClientTicksPerSecond=200.000000
   MaxTrackedOcclusionIncrement=0.100000
   TrackedOcclusionStepSize=0.100000
   DefaultSelectedMaterialColor=(R=0.040000,G=0.020000,B=0.240000,A=1.000000)
   DefaultHoveredMaterialColor=(R=0.020000,G=0.020000,B=0.020000,A=1.000000)
   IgnoreSimulatedFuncWarnings(0)="Tick"
   Name="Default__Engine"
   ObjectArchetype=Subsystem'Core.Default__Subsystem'
}
