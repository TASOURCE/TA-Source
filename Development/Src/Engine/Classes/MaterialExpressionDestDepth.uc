/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionDestDepth extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** 
 * MaterialExpressionDestDepth: 
 * Gives the depth value at the current screen position destination
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
   MenuCategories(0)="Destination"
   MenuCategories(1)="Depth"
   Name="Default__MaterialExpressionDestDepth"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
