/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class RB_ConstraintDrawComponent extends PrimitiveComponent
	native(Physics);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var()	MaterialInterface	LimitMaterial;

cpptext
{
	// Primitive Component interface
	virtual FPrimitiveSceneProxy* CreateSceneProxy();
	
	/**
	 * Update the bounds of the component.
	 */
	virtual void UpdateBounds(); 

	/** 
	 * Retrieves the materials used in this component 
	 * 
	 * @param OutMaterials	The list of used materials.
	 */
	virtual void GetUsedMaterials( TArray<UMaterialInterface*>& OutMaterials ) const; 

}


defaultproperties
{
   ReplacementPrimitive=None
   Name="Default__RB_ConstraintDrawComponent"
   ObjectArchetype=PrimitiveComponent'Engine.Default__PrimitiveComponent'
}
