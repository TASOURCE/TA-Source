/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionRotator extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

var ExpressionInput	Coordinate;
var ExpressionInput	Time;

var() float	CenterX,
			CenterY,
			Speed;

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
	virtual INT Compile(FMaterialCompiler* Compiler);
	virtual FString GetCaption() const;

	/**
	 * Replaces references to the passed in expression with references to a different expression or NULL.
	 * @param	OldExpression		Expression to find reference to.
	 * @param	NewExpression		Expression to replace reference with.
	 */
	virtual void SwapReferenceTo(UMaterialExpression* OldExpression,UMaterialExpression* NewExpression = NULL);

	/**
	 * @return TRUE if the expression preview needs realtime update
     */
	virtual UBOOL NeedsRealtimePreview() { return Time.Expression==NULL && Speed != 0.f; }

}


defaultproperties
{
   CenterX=0.500000
   CenterY=0.500000
   Speed=0.250000
   MenuCategories(0)="Coordinates"
   Name="Default__MaterialExpressionRotator"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
