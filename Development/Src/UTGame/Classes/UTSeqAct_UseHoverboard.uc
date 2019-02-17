/**
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */


class UTSeqAct_UseHoverboard extends SequenceAction;

/** reference to the hoverboard that was spawned, so that the scripter can access it */
var UTVehicle Hoverboard;

/**
 * Return the version number for this class.  Child classes should increment this method by calling Super then adding
 * a individual class version to the result.  When a class is first created, the number should be 0; each time one of the
 * link arrays is modified (VariableLinks, OutputLinks, InputLinks, etc.), the number that is added to the result of
 * Super.GetObjClassVersion() should be incremented by 1.
 *
 * @return	the version number for this specific class.
 */
static event int GetObjClassVersion()
{
	return Super.GetObjClassVersion() + 0;
}

defaultproperties
{
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Hoverboard",PropertyName="Hoverboard",bWriteable=True)
   ObjName="Use Hoverboard"
   ObjCategory="Pawn"
   Name="Default__UTSeqAct_UseHoverboard"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
