/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTwoSidedSign extends MaterialExpression
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
   MenuCategories(0)="Constants"
   Name="Default__MaterialExpressionTwoSidedSign"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
