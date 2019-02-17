/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTextureSampleParameterSubUV extends MaterialExpressionTextureSampleParameter2D
	native(Material)
	collapsecategories
	hidecategories(Object);

// (cpptext)
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
	virtual UBOOL TextureIsValid( UTexture* InTexture );
	virtual const TCHAR* GetRequirements();

}


defaultproperties
{
   MenuCategories(2)="Particles"
   Name="Default__MaterialExpressionTextureSampleParameterSubUV"
   ObjectArchetype=MaterialExpressionTextureSampleParameter2D'Engine.Default__MaterialExpressionTextureSampleParameter2D'
}
