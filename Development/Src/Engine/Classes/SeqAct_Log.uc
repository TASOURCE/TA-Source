/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_Log extends SequenceAction
	native(Sequence);

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/** Should this message be drawn on the screen as well as placed in the log? */
var() bool bOutputToScreen;

/** Should ObjComment be included in the log? */
var() bool bIncludeObjComment;

/** Time to leave text floating above Target actor */
var() float TargetDuration;

/** Offset to apply to the Target actor location when positioning debug text */
var() vector TargetOffset;

/** Cached log message to display */
var string LogMessage;


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
	return Super.GetObjClassVersion() + 2;
}

cpptext
{
	void Activated();
	virtual void PostLoad();

}


defaultproperties
{
   bOutputToScreen=True
   bIncludeObjComment=True
   TargetDuration=-1.000000
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="String",PropertyName=,bHidden=True,MinVars=0)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Float',LinkDesc="Float",bHidden=True,MinVars=0)
   VariableLinks(2)=(ExpectedType=Class'Engine.SeqVar_Bool',LinkDesc="Bool",bHidden=True,MinVars=0)
   VariableLinks(3)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Object",bHidden=True,MinVars=0)
   VariableLinks(4)=(ExpectedType=Class'Engine.SeqVar_Int',LinkDesc="Int",bHidden=True,MinVars=0)
   VariableLinks(5)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Target",PropertyName="Targets")
   VariableLinks(6)=(ExpectedType=Class'Engine.SeqVar_ObjectList',LinkDesc="Obj List",bHidden=True,MinVars=0)
   ObjName="Log"
   ObjCategory="Misc"
   Name="Default__SeqAct_Log"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
