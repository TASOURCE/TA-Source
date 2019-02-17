/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Output_Object extends K2Output
	native(K2);

var class<object>  ObjClass;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
#if WITH_EDITOR
	virtual FString GetTypeAsCodeString();
#endif

}


defaultproperties
{
   Name="Default__K2Output_Object"
   ObjectArchetype=K2Output'Engine.Default__K2Output'
}
