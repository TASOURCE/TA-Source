/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Input_String extends K2Input
	native(K2);

var string  DefaultString;

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
	virtual FString GetValueString();
	virtual FString GetValueCodeString();
	virtual void SetDefaultFromString(const FString& InString);
#endif

}


defaultproperties
{
   Type=K2CT_String
   Name="Default__K2Input_String"
   ObjectArchetype=K2Input'Engine.Default__K2Input'
}
