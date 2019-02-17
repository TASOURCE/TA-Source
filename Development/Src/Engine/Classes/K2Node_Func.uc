/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Node_Func extends K2Node_FuncBase
	native(K2);

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
#if WITH_EDITOR
	virtual void GetCodeText(struct FK2CodeGenContext& Context, TArray<struct FK2CodeLine>& OutCode);
	virtual FColor GetBorderColor();

	virtual void CreateAutoConnectors();
#endif

}


defaultproperties
{
   Name="Default__K2Node_Func"
   ObjectArchetype=K2Node_FuncBase'Engine.Default__K2Node_FuncBase'
}
