/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UTSeqCond_IsConsole extends SequenceCondition;

event Activated()
{
	OutputLinks[ (Class'WorldInfo'.Static.IsConsoleBuild()) ? 0 : 1].bHasImpulse = true;
}

defaultproperties
{
   OutputLinks(0)=(LinkDesc="Console Game")
   OutputLinks(1)=(LinkDesc="PC Game")
   ObjName="UTIsConsole"
   Name="Default__UTSeqCond_IsConsole"
   ObjectArchetype=SequenceCondition'Engine.Default__SequenceCondition'
}
