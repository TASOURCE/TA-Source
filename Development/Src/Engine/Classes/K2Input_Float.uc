/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Input_Float extends K2Input
	native(K2);

var float   DefaultFloat;

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
	virtual FString GetValueString();
	virtual void SetDefaultFromString(const FString& InString);
#endif

}


defaultproperties
{
   Type=K2CT_Float
   Name="Default__K2Input_Float"
   ObjectArchetype=K2Input'Engine.Default__K2Input'
}
