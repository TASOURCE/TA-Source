/**********************************************************************

Copyright   :   (c) 2006-2007 Scaleform Corp. All Rights Reserved.

Portions of the integration code is from Epic Games as identified by Perforce annotations.
Copyright 2010 Epic Games, Inc. All rights reserved.

Licensees may use this file in accordance with the valid Scaleform
Commercial License Agreement provided with the software.

This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING 
THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR ANY PURPOSE.

**********************************************************************/
class GFxEvent_FSCommand extends SequenceEvent
	dependson(GFxFSCmdHandler_Kismet)
	native(UISequence);

/** Swf Movie data to use. */
var() SwfMovie              Movie;

// name of fscommand to trigger on
var()   string              FsCommand;

/**Command handler to route events through*/
var		GFxFSCmdHandler_Kismet				Handler;

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

defaultproperties
{
   MaxTriggerCount=0
   bPlayerOnly=False
   VariableLinks(0)=(ExpectedType=Class'Engine.SeqVar_String',LinkDesc="Argument",bWriteable=False)
   ObjName="FsCommand"
   ObjCategory="GFx UI"
   Name="Default__GFxEvent_FSCommand"
   ObjectArchetype=SequenceEvent'Engine.Default__SequenceEvent'
}
