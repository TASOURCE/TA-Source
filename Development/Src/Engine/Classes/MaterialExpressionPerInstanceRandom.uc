/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionPerInstanceRandom extends MaterialExpression
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
   MenuCategories(0)="Utility"
   Name="Default__MaterialExpressionPerInstanceRandom"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
