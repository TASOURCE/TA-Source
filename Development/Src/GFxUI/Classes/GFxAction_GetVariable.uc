/**********************************************************************

Copyright   :   (c) 2006-2007 Scaleform Corp. All Rights Reserved.

Portions of the integration code is from Epic Games as identified by Perforce annotations.
Copyright 2010 Epic Games, Inc. All rights reserved.

Licensees may use this file in accordance with the valid Scaleform
Commercial License Agreement provided with the software.

This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING 
THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR ANY PURPOSE.

**********************************************************************/
class GFxAction_GetVariable extends SequenceAction
	native(UISequence)
	dependson(GFxMoviePlayer);

var GFxMoviePlayer                  Movie;
var() string                    Variable;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

event bool IsValidLevelSequenceObject() { return true; }

defaultproperties
{
   VariableLinks(0)=(ExpectedType=Class'Engine.SequenceVariable',LinkDesc="Result",PropertyName=,bWriteable=True)
   VariableLinks(1)=(ExpectedType=Class'Engine.SeqVar_Object',LinkDesc="Movie Player")
   ObjName="GFx GetVariable"
   ObjCategory="GFx UI"
   Name="Default__GFxAction_GetVariable"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
