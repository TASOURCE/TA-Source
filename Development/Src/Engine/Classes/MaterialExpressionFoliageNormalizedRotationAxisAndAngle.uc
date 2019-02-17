/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionFoliageNormalizedRotationAxisAndAngle extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual INT Compile(FMaterialCompiler* Compiler);
	virtual FString GetCaption() const;

}


defaultproperties
{
   MenuCategories(0)="Vectors"
   MenuCategories(1)="Coordinates"
   Name="Default__MaterialExpressionFoliageNormalizedRotationAxisAndAngle"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
