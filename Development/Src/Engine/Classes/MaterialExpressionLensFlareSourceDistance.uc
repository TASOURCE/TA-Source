/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionLensFlareSourceDistance extends MaterialExpression
	native(Material);

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/**
	 *	Compile this expression with the given compiler.
	 *	
	 *	@return	INT			The code index for this expression.
	 */
	virtual INT Compile(FMaterialCompiler* Compiler);
	
	/**
	 *	Get the outputs supported by this expression.
	 *
	 *	@param	Outputs		The TArray of outputs to fill in.
	 */
	virtual void GetOutputs(TArray<FExpressionOutput>& Outputs) const;
	
	/**
	 *	Get the width required by this expression (in the material editor).
	 *
	 *	@return	INT			The width in pixels.
	 */
	virtual INT GetWidth() const;
	
	/**
	 *	Returns the text to display on the material expression (in the material editor).
	 *
	 *	@return	FString		The text to display.
	 */
	virtual FString GetCaption() const;
	
	/**
	 *	Returns the amount of padding to use for the label.
	 *
	 *	@return INT			The padding (in pixels).
	 */
	virtual INT GetLabelPadding() { return 8; }

}


defaultproperties
{
   MenuCategories(0)="LensFlare"
   Name="Default__MaterialExpressionLensFlareSourceDistance"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
