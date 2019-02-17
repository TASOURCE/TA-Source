/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MeshComponentFactory extends PrimitiveComponentFactory
	native
	abstract;

var(Rendering) array<MaterialInterface>	Materials;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual UPrimitiveComponent* CreatePrimitiveComponent(UObject* InOuter) { return NULL; }

}


defaultproperties
{
   CastShadow=True
   Name="Default__MeshComponentFactory"
   ObjectArchetype=PrimitiveComponentFactory'Engine.Default__PrimitiveComponentFactory'
}
