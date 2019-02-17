/**
 * SeqAct_LevelStreamingBase
 *
 * Base Kismet action exposing loading and unloading of levels.
 *
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class SeqAct_LevelStreamingBase extends SeqAct_Latent
	abstract
	native(Sequence);

/** Whether to make the level immediately visible after it finishes loading	*/
var() bool							bMakeVisibleAfterLoad;

/** Whether we want to force a blocking load								*/
var() bool							bShouldBlockOnLoad;

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
// (cpptext)

cpptext
{
	/**
	 * Handles "Activated" for single ULevelStreaming object.
	 *
	 * @param	LevelStreamingObject	LevelStreaming object to handle "Activated" for.
	 */
	void ActivateLevel( ULevelStreaming* LevelStreamingObject );

	/**
	 * Handles "UpdateOp" for single ULevelStreaming object.
	 *
	 * @param	LevelStreamingObject	LevelStreaming object to handle "UpdateOp" for.
	 *
	 * @return TRUE if operation has completed, FALSE if still in progress
	 */
	UBOOL UpdateLevel( ULevelStreaming* LevelStreamingObject );

}


defaultproperties
{
   bMakeVisibleAfterLoad=True
   InputLinks(0)=(LinkDesc="Load")
   InputLinks(1)=(LinkDesc="Unload")
   ObjCategory="Level"
   Name="Default__SeqAct_LevelStreamingBase"
   ObjectArchetype=SeqAct_Latent'Engine.Default__SeqAct_Latent'
}
