/**
* Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
*/
class MaterialExpressionMeshEmitterDynamicParameter extends MaterialExpressionDynamicParameter
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
   Name="Default__MaterialExpressionMeshEmitterDynamicParameter"
   ObjectArchetype=MaterialExpressionDynamicParameter'Engine.Default__MaterialExpressionDynamicParameter'
}
