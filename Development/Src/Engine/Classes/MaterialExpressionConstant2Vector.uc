/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionConstant2Vector extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

var() float	R,
			G;

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
   MenuCategories(1)="Vectors"
   Name="Default__MaterialExpressionConstant2Vector"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
