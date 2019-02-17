/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class StaticMeshComponentFactory extends MeshComponentFactory
	native
	hidecategories(Object)
	collapsecategories
	editinlinenew;

var() StaticMesh	StaticMesh;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual UBOOL FactoryIsValid() { return StaticMesh != NULL && Super::FactoryIsValid(); }
	virtual UPrimitiveComponent* CreatePrimitiveComponent(UObject* InOuter);

}


defaultproperties
{
   CollideActors=True
   BlockActors=True
   BlockZeroExtent=True
   BlockNonZeroExtent=True
   BlockRigidBody=True
   Name="Default__StaticMeshComponentFactory"
   ObjectArchetype=MeshComponentFactory'Engine.Default__MeshComponentFactory'
}
