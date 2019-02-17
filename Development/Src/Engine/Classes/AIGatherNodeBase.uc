/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class AIGatherNodeBase extends K2NodeBase
	native(AI);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Last time this gather node was updated */
var() transient float LastUpdateTime;
/** Name of the gather node, so we can search by node name from the utility functions of command nodes */
var() String NodeName;

cpptext
{
#if WITH_EDITOR
	virtual FString GetDisplayName();
	virtual void CreateAutoConnectors();
#endif

	virtual void UpdateNodeValue() {}

}


defaultproperties
{
   Name="Default__AIGatherNodeBase"
   ObjectArchetype=K2NodeBase'Engine.Default__K2NodeBase'
}
