/*=============================================================================
	Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
=============================================================================*/
 
class SpeedTree extends Object
	native(SpeedTree);
	
/** If TRUE, this tree was imported with the Speedtree 4 integration. */
var private{private} const bool bLegacySpeedTree;

/** Helper object to allow SpeedTree to be script exposed.										*/
var duplicatetransient native const pointer	SRH{class FSpeedTreeResourceHelper};

// Editor-accesible variables

/** The probability of a shadow ray being blocked by the leaf material. */
var(Lighting) float LeafStaticShadowOpacity;

/** Branch 1 material.																			*/
var(Material) MaterialInterface		Branch1Material;
/** Branch 2 material.																			*/
var(Material) MaterialInterface		Branch2Material;
/** Frond material.																				*/
var(Material) MaterialInterface		FrondMaterial;
/** Leaf card material.																			*/
var(Material) MaterialInterface		LeafCardMaterial;
/** Leaf mesh material.																			*/
var(Material) MaterialInterface		LeafMeshMaterial;
/** Billboard material.																			*/
var(Material) MaterialInterface		BillboardMaterial;

// Wind variables
var(Wind) float						WindStrength;
var(Wind) vector					WindDirection;

/** Unique ID for this speed tree, used for caching during distributed lighting */
var private const Guid LightingGuid;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
	void StaticConstructor(void);

	virtual void BeginDestroy();
	virtual UBOOL IsReadyForFinishDestroy();
	virtual void FinishDestroy();
	
	virtual void PreEditChange(UProperty* PropertyAboutToChange);
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void Serialize(FArchive& Ar);
	virtual void PostLoad();

	virtual	INT	GetResourceSize(void);
	virtual	FString	GetDetailedDescription( INT InIndex );
	virtual FString	GetDesc(void);
	
	UBOOL IsInitialized() const;
	UBOOL IsLegacySpeedTree() const { return bLegacySpeedTree; }

}


defaultproperties
{
   LeafStaticShadowOpacity=0.500000
   WindStrength=0.200000
   WindDirection=(X=1.000000,Y=0.000000,Z=0.000000)
   Name="Default__SpeedTree"
   ObjectArchetype=Object'Core.Default__Object'
}
