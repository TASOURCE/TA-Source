/**
 * GFxTrScene_Header
 * 
 * This scene shows the Play Now/Exit buttons as well as scene button
 * drivers depending on whether you're in game or at the front.
 * 
 * Loaded on the front movie and ingame movie
 */

class GFxTrScene_Header extends GFxTrScene;

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();
    
    bSceneCreated = true;
}

defaultproperties
{
   Name="Default__GFxTrScene_Header"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
