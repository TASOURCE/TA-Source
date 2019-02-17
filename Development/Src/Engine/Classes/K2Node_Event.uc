/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Node_Event extends K2Node_Code
	native(K2);

var string      EventName;
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

cpptext
{
#if WITH_EDITOR
	virtual void CreateAutoConnectors();

	virtual FString GetDisplayName();
	virtual FColor GetBorderColor();

	void GetEventText(FK2CodeGenContext& Context, TArray<struct FK2CodeLine>& OutCode);
#endif

}


defaultproperties
{
   Name="Default__K2Node_Event"
   ObjectArchetype=K2Node_Code'Engine.Default__K2Node_Code'
}
