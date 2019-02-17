/**
* Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
*/
class MaterialExpressionMeshSubUVBlend extends MaterialExpressionMeshSubUV
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
   Name="Default__MaterialExpressionMeshSubUVBlend"
   ObjectArchetype=MaterialExpressionMeshSubUV'Engine.Default__MaterialExpressionMeshSubUV'
}
