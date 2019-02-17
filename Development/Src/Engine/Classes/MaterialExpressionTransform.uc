/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTransform extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** input expression for this transform */
var ExpressionInput	Input;

/** Source coordinate space of the vector */
var() const enum EMaterialVectorCoordTransformSource
{
	TRANSFORMSOURCE_World<DisplayName=World>,
	TRANSFORMSOURCE_Local<DisplayName=Local>,
	TRANSFORMSOURCE_Tangent<DisplayName=Tangent>
} TransformSourceType<DisplayName=Source>;

/** Destination coordinate space of the vector */
var() const enum EMaterialVectorCoordTransform
{
	TRANSFORM_World<DisplayName=World>,
	TRANSFORM_View<DisplayName=View>,
	TRANSFORM_Local<DisplayName=Local>,
	TRANSFORM_Tangent<DisplayName=Tangent>
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
   TransformSourceType=TRANSFORMSOURCE_Tangent
   MenuCategories(0)="VectorOps"
   Name="Default__MaterialExpressionTransform"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
