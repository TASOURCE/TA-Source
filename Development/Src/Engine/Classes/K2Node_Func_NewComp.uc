/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Node_Func_NewComp extends K2Node_Func
	native(K2);

/** Template object used by this function (duplicated) to create a new component. */
var     ActorComponent      ComponentTemplate;

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

	virtual FString GetCodeFromParamInput(const FString& InputName, struct FK2CodeGenContext& Context);	
#endif

}


defaultproperties
{
   Name="Default__K2Node_Func_NewComp"
   ObjectArchetype=K2Node_Func'Engine.Default__K2Node_Func'
}
