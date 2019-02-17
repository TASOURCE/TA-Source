/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class SeqCond_IsConsole extends SequenceCondition
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
// (cpptext)
// (cpptext)

cpptext
{
	virtual void Activated()
	{
		AWorldInfo* WorldInfo = GWorld->GetWorldInfo();

		// Trigger the output based upon meeting the num logged in criteria
		if( WorldInfo && WorldInfo->IsConsoleBuild() )
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
   OutputLinks(0)=(LinkDesc="True")
   OutputLinks(1)=(LinkDesc="False")
   ObjName="Is Console"
   Name="Default__SeqCond_IsConsole"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
