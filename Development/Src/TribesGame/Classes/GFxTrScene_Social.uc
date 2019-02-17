/**
 * GFxTrScene_Social
 * 
 * This scene handles the social buttons for driving the party and
 * chat windows.
 * 
 * Loaded on the front movie and ingame movie
 */

class GFxTrScene_Social extends GFxTrScene;

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();
    
    bSceneCreated = true;
}

defaultproperties
{
   Name="Default__GFxTrScene_Social"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
