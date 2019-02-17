/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Output extends K2Connector
	native;

var array<K2Input>  ToInputs;



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
	void BreakConnectionTo(UK2Input* ToInput);

	void BreakAllConnections();
#endif

}


defaultproperties
{
   Name="Default__K2Output"
   ObjectArchetype=K2Connector'Engine.Default__K2Connector'
}
