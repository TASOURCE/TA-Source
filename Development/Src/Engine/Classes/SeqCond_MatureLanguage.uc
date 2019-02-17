/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SeqCond_MatureLanguage extends SequenceCondition
	native(Sequence);

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
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Activated()
	{
		if( GEngine && GEngine->bAllowMatureLanguage )
		{
			OutputLinks(0).bHasImpulse = TRUE;
		}
		else
		{
			OutputLinks(1).bHasImpulse = TRUE;
		}
	}

}


defaultproperties
{
   OutputLinks(0)=(LinkDesc="Allowed")
   OutputLinks(1)=(LinkDesc="Disallowed")
   ObjName="Mature Language Allowed"
   Name="Default__SeqCond_MatureLanguage"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
