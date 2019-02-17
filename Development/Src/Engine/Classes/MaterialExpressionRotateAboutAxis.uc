/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionRotateAboutAxis extends MaterialExpression
	native(Material);

var ExpressionInput	NormalizedRotationAxisAndAngle;
var ExpressionInput	PositionOnAxis;
var ExpressionInput	Position;

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
   MenuCategories(0)="Math"
   MenuCategories(1)="Utility"
   Name="Default__MaterialExpressionRotateAboutAxis"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
