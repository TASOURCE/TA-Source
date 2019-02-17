/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionVectorParameter extends MaterialExpressionParameter
	native(Material)
	collapsecategories
	hidecategories(Object);

var() LinearColor	DefaultValue;

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
   DefaultValue=(R=0.000000,G=0.000000,B=0.000000,A=1.000000)
   Name="Default__MaterialExpressionVectorParameter"
   ObjectArchetype=MaterialExpressionParameter'Engine.Default__MaterialExpressionParameter'
}
