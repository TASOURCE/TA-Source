/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class K2Input_Object extends K2Input
	native(K2);

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
   Type=K2CT_Vector
   Name="Default__K2Input_Object"
   ObjectArchetype=K2Input'Engine.Default__K2Input'
}
