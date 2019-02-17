/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Input_Bool extends K2Input
	native(K2);

var bool    bDefaultBool;

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
   Name="Default__K2Input_Bool"
   ObjectArchetype=K2Input'Engine.Default__K2Input'
}
