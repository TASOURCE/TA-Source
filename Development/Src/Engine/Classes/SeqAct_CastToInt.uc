/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_CastToInt extends SeqAct_SetSequenceVariable
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

/** If TRUE, the float value will be truncated into the integer rather than rounded into it. */
var() bool bTruncate;

var float Value;
var int IntResult;

cpptext
{
	void Activated()
	{
		OutputLinks(0).bHasImpulse = TRUE;
		
		if( bTruncate )
		{
			IntResult = (INT)Value;
		}
		else
		{
			IntResult = appRound( Value );
		}
	}

}


defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Int",PropertyName="Value")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Result",PropertyName="IntResult",bWriteable=True)
   ObjName="Cast To Int"
   ObjCategory="Math"
   Name="Default__SeqAct_CastToInt"
   ObjectArchetype=SeqAct_SetSequenceVariable'Engine.Default__SeqAct_SetSequenceVariable'
}
