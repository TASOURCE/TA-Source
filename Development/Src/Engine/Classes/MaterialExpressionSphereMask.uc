/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionSphereMask extends MaterialExpression
	native(Material);

var ExpressionInput	A;
var ExpressionInput	B;
var() float AttenuationRadius;
var() float HardnessPercent <UIMin=0.0 | UIMax=100.0 | ClampMin=0.0 | ClampMax=100.0>;

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
   AttenuationRadius=256.000000
   HardnessPercent=100.000000
   MenuCategories(0)="HighLevel"
   Name="Default__MaterialExpressionSphereMask"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
