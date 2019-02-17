/**********************************************************************

Copyright   :   (c) 2006-2007 Scaleform Corp. All Rights Reserved.

Portions of the integration code is from Epic Games as identified by Perforce annotations.
Copyright 2010 Epic Games, Inc. All rights reserved.

Licensees may use this file in accordance with the valid Scaleform
Commercial License Agreement provided with the software.

This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING 
THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR ANY PURPOSE.

**********************************************************************/
class GFxAction_SetCaptureKeys extends SequenceAction
	native(UISequence);

var GFxMoviePlayer              Movie;
var() array<name>           CaptureKeys;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

defaultproperties
{
   InputLinks(0)=(LinkDesc="Activate")
   InputLinks(1)=(LinkDesc="DeActivate")
   VariableLinks(0)=(LinkDesc="Movie Player",PropertyName=)
   ObjName="Set Gfx Captured Keys"
   ObjCategory="GFx UI"
   Name="Default__GFxAction_SetCaptureKeys"
   ObjectArchetype=SequenceAction'Engine.Default__SequenceAction'
}
