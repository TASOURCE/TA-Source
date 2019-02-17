/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionPixelDepth extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 * MaterialExpressionPixelDepth: 
 * Gives the depth of the current pixel being drawn
 * for use in a material
 */

/** normalize the depth values to [near,far] -> [0,1] */
var() bool bNormalize;

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
   MenuCategories(0)="Depth"
   Name="Default__MaterialExpressionPixelDepth"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
