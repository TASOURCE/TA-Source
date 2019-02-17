/**
 * GFxTrScene_Container
 * 
 * This scene merely creates a background for the other scenes to
 * load on top. May eventually integrate with other scenes.
 * 
 * Loaded on the front movie and ingame movie
 */

class GFxTrScene_Container extends GFxTrScene;

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();
    
    bSceneCreated = true;
}

defaultproperties
{
   Name="Default__GFxTrScene_Container"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
