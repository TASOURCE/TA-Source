/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionAntialiasedTextureMask extends MaterialExpressionTextureSampleParameter2D
	native(Material);

var() float	Threshold <UIMin=0.0 | UIMax=1.0 | ClampMin=0.0 | ClampMax=1.0>;
var() enum ETextureColorChannel
{
	TCC_Red,
	TCC_Green,
	TCC_Blue,
	TCC_Alpha
} Channel;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
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
	virtual FString GetCaption() const;
	virtual void GetOutputs(TArray<FExpressionOutput>& Outputs) const;
	virtual UBOOL TextureIsValid( UTexture* InTexture );
	virtual const TCHAR* GetRequirements();
	virtual void SetDefaultTexture();

	/**
	 * Replaces references to the passed in expression with references to a different expression or NULL.
	 * @param	OldExpression		Expression to find reference to.
	 * @param	NewExpression		Expression to replace reference with.
	 */
	virtual void SwapReferenceTo(UMaterialExpression* OldExpression,UMaterialExpression* NewExpression = NULL);

}


defaultproperties
{
   Threshold=0.500000
   Channel=TCC_Alpha
   MenuCategories(0)="HighLevel"
   MenuCategories(1)=()
   Name="Default__MaterialExpressionAntialiasedTextureMask"
   ObjectArchetype=MaterialExpressionTextureSampleParameter2D'Engine.Default__MaterialExpressionTextureSampleParameter2D'
}
