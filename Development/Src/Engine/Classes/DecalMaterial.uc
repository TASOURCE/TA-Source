/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class DecalMaterial extends Material
	native(Decal);

// (cpptext)
// (cpptext)
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
	// UMaterial interface.
	virtual FMaterialResource* AllocateResource();

	// UObject interface.
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	virtual void PreSave();
	virtual void PostLoad();
	virtual void Serialize(FArchive& Ar);

}


defaultproperties
{
   bUsedWithSkeletalMesh=True
   bUsedWithFracturedMeshes=True
   bUsedWithStaticLighting=True
   bUsedWithFluidSurfaces=True
   bUsedWithDecals=True
   bUsedWithMorphTargets=True
   Name="Default__DecalMaterial"
   ObjectArchetype=Material'Engine.Default__Material'
}
