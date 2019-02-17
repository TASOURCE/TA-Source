/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionVertexColor extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual INT Compile(FMaterialCompiler* Compiler);
	virtual FString GetCaption() const;
	virtual void GetOutputs(TArray<FExpressionOutput>& Outputs) const;

}


defaultproperties
{
   MenuCategories(0)="Particles"
   MenuCategories(1)="Constants"
   Name="Default__MaterialExpressionVertexColor"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
