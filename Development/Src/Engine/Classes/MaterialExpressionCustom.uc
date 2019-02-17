/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class MaterialExpressionCustom extends MaterialExpression
	native(Material)
	collapsecategories
	hidecategories(Object);

enum ECustomMaterialOutputType
{
	CMOT_Float1,
	CMOT_Float2,
	CMOT_Float3,
	CMOT_Float4,
};

struct native CustomInput
{
	var() string InputName;
	var edithide ExpressionInput Input;
};

var() edittextbox string Code;
var() ECustomMaterialOutputType OutputType;
var() string Description;
var() array<CustomInput> Inputs;

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
	// UObject interface
	virtual void PostEditChangeProperty(FPropertyChangedEvent& PropertyChangedEvent);
	
	// UMaterialExpression interface
	virtual INT Compile(FMaterialCompiler* Compiler);
	virtual FString GetCaption() const;
	void SwapReferenceTo( UMaterialExpression* OldExpression, UMaterialExpression* NewExpression );
	virtual const TArray<FExpressionInput*> GetInputs();
	virtual FExpressionInput* GetInput(INT InputIndex);
	virtual FString GetInputName(INT InputIndex) const;

}


defaultproperties
{
   OutputType=CMOT_Float3
   Description="Custom"
   MenuCategories(0)="Custom"
   Name="Default__MaterialExpressionCustom"
   ObjectArchetype=MaterialExpression'Engine.Default__MaterialExpression'
}
