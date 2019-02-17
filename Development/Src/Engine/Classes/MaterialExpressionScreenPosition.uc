/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionScreenPosition extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

/** applies the divide by w as well as [-1,1]->[1,1] mapping for screen alignment */
var() bool ScreenAlign;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual INT Compile(FMaterialCompiler* Compiler);
	virtual FString GetCaption() const;

}


defaultproperties
{
   MenuCategories(0)="Coordinates"
   Name="Default__MaterialExpressionScreenPosition"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
