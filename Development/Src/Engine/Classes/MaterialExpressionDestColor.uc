/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionDestColor extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 * MaterialExpressionDestColor: 
 * Gives the color value at the current screen position destination
 * for use in a material
 */

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual INT Compile(FMaterialCompiler* Compiler);
	virtual void GetOutputs(TArray<FExpressionOutput>& Outputs) const;
	virtual FString GetCaption() const;

}


defaultproperties
{
   MenuCategories(0)="Destination"
   MenuCategories(1)="Color"
   Name="Default__MaterialExpressionDestColor"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
