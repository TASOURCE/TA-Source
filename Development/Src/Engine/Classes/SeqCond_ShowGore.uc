/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SeqCond_ShowGore extends SequenceCondition
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
// (cpptext)

cpptext
{
	virtual void Activated()
	{
		if( GWorld && GWorld->GetWorldInfo() && GWorld->GetWorldInfo()->GRI && 
			GWorld->GetWorldInfo()->GRI->eventShouldShowGore() )
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
   ObjName="Show Gore"
   Name="Default__SeqCond_ShowGore"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
