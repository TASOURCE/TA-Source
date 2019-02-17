//=============================================================================
// Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
//=============================================================================
class InteractiveFoliageActor extends StaticMeshActor
	native(Foliage)
	placeable;

/** Collision cylinder */
var private{private} CylinderComponent CylinderComponent;

/**
 * Position of the last actor to enter the collision cylinder.
 * This currently does not handle multiple actors affecting the foliage simultaneously.
 */
var private{private} transient vector TouchingActorEntryPosition;

/** Simulated physics state */
var private{private} transient vector FoliageVelocity;
var private{private} transient vector FoliageForce;
var private{private} transient vector FoliagePosition;

/** Scales forces applied from damage events. */
var(FoliagePhysics) float FoliageDamageImpulseScale;

/** Scales forces applied from touch events. */
var(FoliagePhysics) float FoliageTouchImpulseScale;

/** Determines how strong the force that pushes toward the spring's center will be. */
var(FoliagePhysics) float FoliageStiffness;

/**
 * Same as FoliageStiffness, but the strength of this force increases with the square of the distance to the spring's center.
 * This force is used to prevent the spring from extending past a certain point due to touch and damage forces.
 */
var(FoliagePhysics) float FoliageStiffnessQuadratic;

/**
 * Determines the amount of energy lost by the spring as it oscillates.
 * This force is similar to air friction.
 */
var(FoliagePhysics) float FoliageDamping;

/** Clamps the magnitude of each damage force applied. */
var(FoliagePhysics) float MaxDamageImpulse;

/** Clamps the magnitude of each touch force applied. */
var(FoliagePhysics) float MaxTouchImpulse;

/** Clamps the magnitude of combined forces applied each update. */
var(FoliagePhysics) float MaxForce;

//@todo - hook this up
var float Mass;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

native simulated event TakeDamage(int Damage, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser);
native simulated event Touch( Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal );

cpptext
{
protected:
	void SetupCollisionCylinder();
public:
	virtual void TickSpecial(FLOAT DeltaSeconds);
	virtual void Spawned();
	virtual void PostLoad();

}


defaultproperties
{
   Begin Object Class=CylinderComponent Name=CollisionCylinder
      CollisionHeight=200.000000
      CollisionRadius=60.000000
      ReplacementPrimitive=None
      CollideActors=True
      BlockZeroExtent=False
      Name="CollisionCylinder"
      ObjectArchetype=CylinderComponent'Engine.Default__CylinderComponent'
   End Object
   CylinderComponent=CollisionCylinder
   FoliageDamageImpulseScale=20.000000
   FoliageTouchImpulseScale=10.000000
   FoliageStiffness=10.000000
   FoliageStiffnessQuadratic=0.300000
   FoliageDamping=2.000000
   MaxDamageImpulse=100000.000000
   MaxTouchImpulse=1000.000000
   MaxForce=100000.000000
   Mass=1.000000
   Begin Object Class=InteractiveFoliageComponent Name=FoliageMeshComponent0
      ReplacementPrimitive=None
      bAllowApproximateOcclusion=True
      bAcceptsStaticDecals=False
      bAcceptsDynamicDecals=False
      bForceDirectLightMap=True
      bUsePrecomputedShadows=True
      Name="FoliageMeshComponent0"
      ObjectArchetype=InteractiveFoliageComponent'Engine.Default__InteractiveFoliageComponent'
   End Object
   StaticMeshComponent=FoliageMeshComponent0
   Components(0)=FoliageMeshComponent0
   Components(1)=CollisionCylinder
   TickGroup=TG_DuringAsyncWork
   bStatic=False
   bNoDelete=True
   bWorldGeometry=False
   bBlockActors=False
   bProjTarget=True
   CollisionComponent=CollisionCylinder
   Name="Default__InteractiveFoliageActor"
   ObjectArchetype=StaticMeshActor'Engine.Default__StaticMeshActor'
}
