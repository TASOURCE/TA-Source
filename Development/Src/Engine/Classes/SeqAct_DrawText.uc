/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_DrawText extends SequenceAction
	dependson(HUD)
	native(Sequence);


var() float DisplayTimeSeconds;	
var() bool	bDisplayOnObject;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

var() HUD.KismetDrawTextInfo DrawTextInfo;

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
	return Super.GetObjClassVersion() + 1;
}

cpptext
{
	UBOOL UpdateOp(FLOAT deltaTime);
	virtual void Activated();

}


defaultproperties
{
   DisplayTimeSeconds=-1.000000
   DrawTextInfo=(MessageFont=Font'EngineFonts.SmallFont',MessageFontScale=(X=1.000000,Y=1.000000),MessageColor=(B=255,G=255,R=255,A=255),MessageEndTime=-1.000000)
   bLatentExecution=True
   bAutoActivateOutputLinks=False
   InputLinks(0)=(LinkDesc="Show")
   InputLinks(1)=(LinkDesc="Hide")
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="String",bHidden=True,MinVars=0)
   ObjName="Draw Text"
   ObjCategory="Misc"
   Name="Default__SeqAct_DrawText"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
