/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Input extends K2Connector
	native;

var K2Output FromOutput;


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
	void Break();

	virtual FString GetValueCodeString();
	virtual FString GetValueString();
	virtual void SetDefaultFromString(const FString& InString) {}
#endif

}


defaultproperties
{
   Name="Default__K2Input"
   ObjectArchetype=K2Connector'Engine.Default__K2Connector'
}
