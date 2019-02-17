/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionParticleSubUV extends MaterialExpressionTextureSample
	native(Material);

// (cpptext)
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
	virtual void GetOutputs(TArray<FExpressionOutput>& Outputs) const;
	virtual INT GetWidth() const;
	virtual FString GetCaption() const;
	virtual INT GetLabelPadding() { return 8; }

}


defaultproperties
{
   MenuCategories(1)="Particles"
   Name="Default__MaterialExpressionParticleSubUV"
   ObjectArchetype=MaterialExpressionTextureSample'Engine.Default__MaterialExpressionTextureSample'
}
