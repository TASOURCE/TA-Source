/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionScalarParameter extends MaterialExpressionParameter
	native(Material)
	collapsecategories
	hidecategories(Object);

var() float	DefaultValue;

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
   Name="Default__MaterialExpressionScalarParameter"
   ObjectArchetype=MaterialExpressionParameter'Engine.Default__MaterialExpressionParameter'
}
