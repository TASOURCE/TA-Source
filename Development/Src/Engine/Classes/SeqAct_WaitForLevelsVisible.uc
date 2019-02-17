/**
 * SeqAct_WaitForLevelsVisible
 *
 * Kismet action exposing associating/ dissociating of levels.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_WaitForLevelsVisible extends SeqAct_Latent
	native(Sequence);

/** Names of levels to wait for visibility. */
var() array<Name> LevelNames;

/** If TRUE engine will request blocking load if level is in process of being loaded. */
var() bool bShouldBlockOnLoad;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	UBOOL UpdateOp(FLOAT DeltaTime);

}


defaultproperties
{
   bShouldBlockOnLoad=True
   InputLinks(0)=(LinkDesc="Wait")
   ObjName="Wait for Levels to be visible"
   ObjCategory="Level"
   Name="Default__SeqAct_WaitForLevelsVisible"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
