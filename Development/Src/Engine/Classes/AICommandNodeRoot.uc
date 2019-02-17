/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class AICommandNodeRoot extends AICommandNodeBase
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() Name RootName;

cpptext
{
#if WITH_EDITOR
	virtual FString GetDisplayName();
	virtual void CreateAutoConnectors();
#endif

}


defaultproperties
{
   RootName="AITree"
   Name="Default__AICommandNodeRoot"
   ObjectArchetype=AICommandNodeBase'Engine.Default__AICommandNodeBase'
}
