/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionFlipBookSample extends MaterialExpressionTextureSample
	native(Material);

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
   Name="Default__MaterialExpressionFlipBookSample"
   ObjectArchetype=MaterialExpressionTextureSample'Engine.Default__MaterialExpressionTextureSample'
}
