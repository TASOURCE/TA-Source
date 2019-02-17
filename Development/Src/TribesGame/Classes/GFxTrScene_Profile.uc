/**
 * GFxTrScene_Profile
 * 
 * This scene is responsible for retrieving and sending the data associated with
 * a player's profile - current classes, rank, avatar, currencies, etc.
 * 
 * Loaded on the front movie and ingame movie
 */

class GFxTrScene_Profile extends GFxTrScene;

var array<int> ChosenClasses;

function Initialize()
{
    if (bSceneCreated) return;

    super.Initialize();
    
    bSceneCreated = true;
}

defaultproperties
{
   Name="Default__GFxTrScene_Profile"
   ObjectArchetype=GFxTrScene'TribesGame.Default__GFxTrScene'
}
