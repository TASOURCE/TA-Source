/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTransformPosition extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** input expression for this transform */
var ExpressionInput	Input;

/** type of transform to apply to the input expression */
var() const enum EMaterialPositionTransform
{
	// transform from post projection to world space
	TRANSFORMPOS_World<DisplayName=World>

} TransformType<DisplayName=Destination>;

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
   MenuCategories(0)="VectorOps"
   Name="Default__MaterialExpressionTransformPosition"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
