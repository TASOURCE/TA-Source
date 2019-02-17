/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionConstantBiasScale extends MaterialExpression
	native(Material);

var ExpressionInput	Input;

var() float Bias;
var() float Scale;

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

	/**
	 * Replaces references to the passed in expression with references to a different expression or NULL.
	 * @param	OldExpression		Expression to find reference to.
	 * @param	NewExpression		Expression to replace reference with.
	 */
	virtual void SwapReferenceTo(UMaterialExpression* OldExpression,UMaterialExpression* NewExpression = NULL);

}


defaultproperties
{
   Bias=1.000000
   Scale=0.500000
   MenuCategories(0)="Utility"
   Name="Default__MaterialExpressionConstantBiasScale"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
