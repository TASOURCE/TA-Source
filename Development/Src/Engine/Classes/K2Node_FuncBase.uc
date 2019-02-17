/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Node_FuncBase extends K2Node_Code
	native(K2);

/** Pointer to the function that this node will generate a call to */
var function    Function;

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
#if WITH_EDITOR
	// K2NodeBase
	virtual FString GetDisplayName();

	// K2Node_Code
	virtual void GetCodeText(struct FK2CodeGenContext& Context, TArray<struct FK2CodeLine>& OutCode);

	// K2Node_FuncBase

	/** Gets the name of the function currently being used by this node */
	FString GetFunctionName();
#endif

}


defaultproperties
{
   Name="Default__K2Node_FuncBase"
   ObjectArchetype=K2Node_Code'Engine.Default__K2Node_Code'
}
