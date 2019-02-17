/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */

class UDKGameInteraction extends UIInteraction
	native;

/** Semaphore for blocking UI input. */
var int		BlockUIInputSemaphore;

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
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

/**
 * @return Whether or not we should process input.
 */
native final function bool ShouldProcessUIInput() const;

/**
 * Calls all of the UI input blocks and sees if we can unblock ui input.
 */
event ClearUIInputBlocks()
{
	BlockUIInputSemaphore = 0;
}

/** Tries to block the input for the UI. */
event BlockUIInput(bool bBlock)
{
	if(bBlock)
	{
		BlockUIInputSemaphore++;
	}
	else if(BlockUIInputSemaphore > 0)
	{
		BlockUIInputSemaphore--;
	}
}

/* === Interaction interface === */

/**
 * Called when the current map is being unloaded.  Cleans up any references which would prevent garbage collection.
 */
function NotifyGameSessionEnded()
{
	Super.NotifyGameSessionEnded();

	// if a scene is closed before its opening animation completes, it can result in unmatched calls to BlockUIInput
	// which will prevent the game from processing any input; so if we don't have any scenes open, make sure the
	// semaphore is reset to 0
	if ( !SceneClient.IsUIActive() )
	{
		ClearUIInputBlocks();
	}
}

defaultproperties
{
   Name="Default__UDKGameInteraction"
   ObjectArchetype=UIInteraction'Engine.Default__UIInteraction'
}
