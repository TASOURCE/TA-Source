/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class LandscapeHeightfieldCollisionComponent extends PrimitiveComponent
	native(Terrain);

/** The collision height values. */
var native const UntypedBulkData_Mirror	CollisionHeightData{FWordBulkData};


/** Offset of component in landscape quads */
var const int SectionBaseX;
var const int SectionBaseY;

/** Size of component in collision quads */
var int CollisionSizeQuads;

/** Collision scale: (ComponentSizeQuads+1) / (CollisionSizeQuads+1) */
var float CollisionScale;

/** The flags for each collision quad. See ECollisionQuadFlags. */
var const array<byte> CollisionQuadFlags;

var const array<PhysicalMaterial> PhysicalMaterials;

/** Physics engine version of heightfield data. */
var const native pointer RBHeightfield{class NxHeightField};

/** Cached bounds, created at heightmap update time */
var const BoxSphereBounds CachedBoxSphereBounds;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
	enum ECollisionQuadFlags
	{
		QF_PhysicalMaterialMask = 63,	// Mask value for the physical material index, stored in the lower 6 bits.
		QF_EdgeTurned = 64,				// This quad's diagonal has been turned.
		QF_NoCollision = 128,			// This quad has no collision.
	};

	// UActorComponent interface.
	virtual void Attach();
	virtual void Detach(UBOOL bWillReattach);

	// UPrimitiveComponent interface.
	virtual void UpdateBounds();
	virtual void SetParentToWorld(const FMatrix& ParentToWorld);
	virtual void InitComponentRBPhys(UBOOL bFixed);
	virtual UBOOL PointCheck(FCheckResult& Result,const FVector& Location,const FVector& Extent,DWORD TraceFlags);
	virtual UBOOL LineCheck(FCheckResult& Result,const FVector& End,const FVector& Start,const FVector& Extent,DWORD TraceFlags);

	// UObject Interface
	virtual void Serialize(FArchive& Ar);
	virtual void PostLoad();
	virtual void BeginDestroy();

	/** Return's the landscape actor associated with this component. */
	class ALandscape* GetLandscapeActor() const
	{
		return CastChecked<ALandscape>(GetOuter());
	}

	/** Recreate heightfield and restart physics */
	void RecreateHeightfield();

}


defaultproperties
{
   ReplacementPrimitive=None
   bAllowCullDistanceVolume=False
   bUseAsOccluder=True
   bAcceptsDecals=True
   bAcceptsStaticDecals=True
   CastShadow=True
   bAcceptsLights=True
   bUsePrecomputedShadows=True
   CollideActors=True
   BlockActors=True
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   BlockRigidBody=True
   Name="Default__LandscapeHeightfieldCollisionComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
