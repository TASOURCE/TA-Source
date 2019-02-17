/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionConstant extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

var() float	R;

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
   Name="Default__MaterialExpressionConstant"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
