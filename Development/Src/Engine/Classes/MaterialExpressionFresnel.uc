/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Allows the artists to quickly set up a Fresnel term. Returns:
 *
 *		pow(1 - max(Normal dot Camera,0),Exponent)
 */
class MaterialExpressionFresnel extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** The exponent to pass into the pow() function */
var() float Exponent;

/** The normal to dot with the camera vector */
var ExpressionInput	Normal;

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
	virtual FString GetCaption() const
	{
		return FString(TEXT("Fresnel"));
	}

	/**
	 * Replaces references to the passed in expression with references to a different expression or NULL.
	 * @param	OldExpression		Expression to find reference to.
	 * @param	NewExpression		Expression to replace reference with.
	 */
	virtual void SwapReferenceTo(UMaterialExpression* OldExpression,UMaterialExpression* NewExpression = NULL);

}


defaultproperties
{
   Exponent=3.000000
   MenuCategories(0)="VectorOps"
   Name="Default__MaterialExpressionFresnel"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
