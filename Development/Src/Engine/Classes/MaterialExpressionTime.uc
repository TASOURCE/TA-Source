/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionTime extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** This time continues advancing regardless of whether the game is paused. */
var() bool bIgnorePause;

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
	 * @return TRUE if the expression preview needs realtime update
     */
	virtual UBOOL NeedsRealtimePreview() { return TRUE; }

}


defaultproperties
{
   MenuCategories(0)="Utility"
   Name="Default__MaterialExpressionTime"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
