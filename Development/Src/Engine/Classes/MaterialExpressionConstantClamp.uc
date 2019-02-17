/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionConstantClamp extends MaterialExpression
	native(Material);

var ExpressionInput	Input;

var() float Min;
var() float Max;

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
   Max=1.000000
   MenuCategories(0)="Utility"
   Name="Default__MaterialExpressionConstantClamp"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
