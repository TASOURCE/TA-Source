/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class Landscape extends Info
	dependson(LightComponent)
	native(Terrain)
	showcategories(Movement,Collision);

/** Combined material used to render the landscape */
var() Material	LandscapeMaterial;

/** Max LOD level to use when rendering */
var() int MaxLODLevel;


/** Layers that can be painted on the landscape */
var deprecated array<Name> LayerNames;

/** Structure storing Layer Data */
struct native LandscapeLayerInfo
{
	var() Name LayerName;
	// Used to erosion caculation, should be changed for Physical Material?
	var() float Hardness;
	var bool bNoWeightBlend;
	var editoronly MaterialInstanceConstant ThumbnailMIC;

	structcpptext
	{
		// tor
		FLandscapeLayerInfo()
		{
			LayerName = NAME_None;
			Hardness = 0.5f;
			bNoWeightBlend = FALSE;
		}
		FLandscapeLayerInfo(FName Name)
		{
			LayerName = Name;
			Hardness = 0.5f;
			bNoWeightBlend = FALSE;
		}
		FLandscapeLayerInfo(FName Name, FLOAT InHardness, UBOOL NoBlending)
		{
			LayerName = Name;
			Hardness = InHardness;
			bNoWeightBlend = NoBlending;
		}
	}
};

var() array<LandscapeLayerInfo> LayerInfos;

/** Map of material instance constants used to for the components. Key is generated with ULandscapeComponent::GetLayerAllocationKey() */
var const native map{FString ,class UMaterialInstanceConstant*} MaterialInstanceConstantMap;

/** The Lightmass settings for this object. */
var(Lightmass) LightmassPrimitiveSettings	LightmassSettings <ScriptOrder=true>;

/**
 *	The resolution to cache lighting at, in texels/patch.
 *	A separate shadow-map is used for each terrain component, which is up to
 *	(MaxComponentSize * StaticLightingResolution + 1) pixels on a side.
 *	Must be a power of two, 1 <= StaticLightingResolution <= MaxTesselationLevel.
 */
var(Lighting) int				StaticLightingResolution;

/**
 * Allows artists to adjust the distance where textures using UV 0 are streamed in/out.
 * 1.0 is the default, whereas a higher value increases the streamed-in resolution.
 */
var() const float	StreamingDistanceMultiplier;

/** The array of LandscapeComponent that are used by the landscape */
var const array<LandscapeComponent>	LandscapeComponents;

/** Array of LandscapeHeightfieldCollisionComponent */
var const array<LandscapeHeightfieldCollisionComponent>	CollisionComponents;

/** Map of the SectionBaseX/Y component offets (in heightmap space) to the component. Valid in editor only. */
var const native map{QWORD,class ULandscapeComponent*} XYtoComponentMap;

/** Map of the SectionBaseX/Y component offets (in heightmap space) to the collison components. Valid in editor only. */
var const native map{QWORD,class ULandscapeHeightfieldCollisionComponent*} XYtoCollisionComponentMap;

/** Structure storing channel usage for weightmap textures */
struct native LandscapeWeightmapUsage
{
	var LandscapeComponent ChannelUsage[4];

	structcpptext
	{
		// tor
		FLandscapeWeightmapUsage()
		{
			ChannelUsage[0] = NULL;
			ChannelUsage[1] = NULL;
			ChannelUsage[2] = NULL;
			ChannelUsage[3] = NULL;
		}

		// Serializer
		friend FArchive& operator<<( FArchive& Ar, FLandscapeWeightmapUsage& U );

		INT FreeChannelCount() const
		{
			return	((ChannelUsage[0] == NULL) ? 1 : 0) + 
					((ChannelUsage[1] == NULL) ? 1 : 0) + 
					((ChannelUsage[2] == NULL) ? 1 : 0) + 
					((ChannelUsage[3] == NULL) ? 1 : 0);
		}
	}
};

/** Map of weightmap usage */
var const native map{UTexture2D*,struct FLandscapeWeightmapUsage} WeightmapUsageMap;


var const native pointer DataInterface{struct FLandscapeDataInterface};

/** Data set at creation time */
var const int ComponentSizeQuads;		// Total number of quads in each component
var const int SubsectionSizeQuads;		// Number of quads for a subsection of a component. SubsectionSizeQuads+1 must be a power of two.
var const int NumSubsections;			// Number of subsections in X and Y axis

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
	// Make a key for XYtoComponentMap
	static QWORD MakeKey( INT X, INT Y ) { return ((QWORD)(*(DWORD*)(&X)) << 32) | (*(DWORD*)(&Y) & 0xffffffff); }
	static void UnpackKey( QWORD Key, INT& OutX, INT& OutY ) { *(DWORD*)(&OutX) = (Key >> 32); *(DWORD*)(&OutY) = Key&0xffffffff; }

	// AActor interface
	virtual UBOOL ShouldTrace(UPrimitiveComponent* Primitive,AActor *SourceActor, DWORD TraceFlags);
	virtual void UpdateComponentsInternal(UBOOL bCollisionUpdate = FALSE);
	virtual void ClearComponents();
	virtual void InitRBPhys();
#if WITH_EDITOR
	virtual void InitRBPhysEditor();

	// ALandscape interface
	UBOOL ImportFromOldTerrain(class ATerrain* OldTerrain);
	void Import(INT VertsX, INT VertsY, INT ComponentSizeQuads, INT NumSubsections, INT SubsectionSizeQuads, WORD* HeightData, TArray<FLandscapeLayerInfo> ImportLayerInfos, BYTE* AlphaDataPointers[] );
	struct FLandscapeDataInterface* GetDataInterface();
	void GetComponentsInRegion(INT X1, INT Y1, INT X2, INT Y2, TSet<ULandscapeComponent*>& OutComponents);
	UBOOL GetLandscapeExtent(INT& MinX, INT& MinY, INT& MaxX, INT& MaxY);
	void Export(TArray<FString>& Filenames);

	// UObject interface
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void PostEditChangeChainProperty(FPropertyChangedChainEvent& PropertyChangedEvent);
	virtual void PostEditMove(UBOOL bFinished);
#endif
	virtual void Serialize(FArchive& Ar);
	virtual void BeginDestroy();
	virtual void PostLoad();

}


defaultproperties
{
   MaxLODLevel=-1
   LightmassSettings=(EmissiveLightFalloffExponent=2.000000,EmissiveBoost=1.000000,DiffuseBoost=1.000000,SpecularBoost=1.000000,FullyOccludedSamplesFraction=1.000000)
   StaticLightingResolution=1
   StreamingDistanceMultiplier=1.000000
   Begin Object Class=SpriteComponent Name=Sprite Archetype=SpriteComponent'Engine.Default__Info:Sprite'
      Sprite=Texture2D'EditorResources.S_Terrain'
      ReplacementPrimitive=None
      HiddenGame=True
      AlwaysLoadOnClient=False
      AlwaysLoadOnServer=False
      Name="Sprite"
      ObjectArchetype=SpriteComponent'Engine.Default__Info:Sprite'
   End Object
   Components(0)=Sprite
   DrawScale3D=(X=128.000000,Y=128.000000,Z=256.000000)
   CollisionType=COLLIDE_CustomDefault
   bStatic=True
   bHidden=False
   bNoDelete=True
   bWorldGeometry=True
   bMovable=False
   bCollideActors=True
   bBlockActors=True
   bEdShouldSnap=True
   bLockLocation=True
   Name="Default__Landscape"
   ObjectArchetype=Info'Engine.Default__Info'
}
